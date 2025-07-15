USE [master]
GO
/****** Object:  Database [Marofh]    Script Date: 11/19/2021 1:19:53 AM ******/
CREATE DATABASE [Marofh]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Marofh', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\Marofh.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Marofh_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.SQL2016\MSSQL\DATA\Marofh_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Marofh] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Marofh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Marofh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Marofh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Marofh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Marofh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Marofh] SET ARITHABORT OFF 
GO
ALTER DATABASE [Marofh] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Marofh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Marofh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Marofh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Marofh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Marofh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Marofh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Marofh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Marofh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Marofh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Marofh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Marofh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Marofh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Marofh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Marofh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Marofh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Marofh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Marofh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Marofh] SET  MULTI_USER 
GO
ALTER DATABASE [Marofh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Marofh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Marofh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Marofh] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Marofh] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Marofh] SET QUERY_STORE = OFF
GO
USE [Marofh]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Marofh]
GO
/****** Object:  Table [dbo].[__MigrationHistory]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__MigrationHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ContextKey] [nvarchar](300) NOT NULL,
	[Model] [varbinary](max) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK_dbo.__MigrationHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC,
	[ContextKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](128) NOT NULL,
	[Name] [nvarchar](256) NOT NULL,
	[NameAR] [nvarchar](256) NOT NULL,
	[IsShow] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](128) NOT NULL,
	[ProviderKey] [nvarchar](128) NOT NULL,
	[UserId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC,
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](128) NOT NULL,
	[RoleId] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_dbo.AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](128) NOT NULL,
	[ShortID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEndDateUtc] [datetime] NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[UserName] [nvarchar](256) NOT NULL,
	[FName] [nvarchar](256) NULL,
	[LName] [nvarchar](256) NULL,
	[Mobile] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[NationalityID] [int] NULL,
	[WhatsAppNo] [nvarchar](20) NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
	[HRLicenseNo] [nvarchar](20) NULL,
	[HRLicenseExpiryDate] [date] NULL,
	[OfficeName] [nvarchar](50) NULL,
	[OfficeAddress] [nvarchar](256) NULL,
	[EmployeeFName] [nvarchar](256) NULL,
	[EmployeeLName] [nvarchar](256) NULL,
	[EmployeeEmail] [nvarchar](256) NULL,
	[EmployeeMobile] [nvarchar](20) NULL,
	[ImageUrl] [nvarchar](max) NULL,
	[RoleID] [int] NULL,
	[CommercialRegisterNO] [nvarchar](20) NULL,
	[CommercialRegisterExpirationDate] [date] NULL,
	[LicenseNo] [nvarchar](50) NULL,
	[LicenseNoExpirationDate] [date] NULL,
	[Gender] [bit] NULL,
	[DOB] [date] NULL,
	[BirthCountryID] [int] NULL,
	[JobsID] [int] NULL,
	[ChildernsCount] [int] NULL,
	[ExperienceYearsCount] [int] NULL,
	[OfficeID] [nvarchar](128) NULL,
	[Religion] [nvarchar](10) NULL,
	[MaritalStatus] [nvarchar](10) NULL,
	[HasDrivingLicense] [bit] NULL,
	[Age] [int] NULL,
	[Salary] [decimal](18, 2) NULL,
	[Weight] [decimal](18, 2) NULL,
	[Height] [decimal](18, 2) NULL,
	[IsRoomShared] [bit] NULL,
	[PassportNo] [nvarchar](20) NULL,
	[PassportRealseDate] [date] NULL,
	[PassportExpirationDate] [date] NULL,
	[PassportRealseCountryID] [int] NULL,
	[VideoUrl] [nvarchar](max) NULL,
	[Brief] [nvarchar](max) NULL,
	[LastLoggedInDate] [date] NULL,
	[ViewCount] [int] NULL,
	[ContractUrl] [nvarchar](max) NULL,
	[IsVerifed] [bit] NULL,
	[RequestAmount] [decimal](18, 2) NULL,
	[District] [nvarchar](250) NULL,
	[Longitude] [nvarchar](50) NULL,
	[Latitude] [nvarchar](50) NULL,
	[NID] [nvarchar](10) NULL,
	[IsBlocked] [bit] NOT NULL,
	[IsActivated] [bit] NOT NULL,
	[Status] [nvarchar](50) NULL,
 CONSTRAINT [PK_dbo.AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attachment]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attachment](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FileUrl] [nvarchar](max) NOT NULL,
	[OwnershipTransferID] [int] NOT NULL,
	[FileTypeID] [int] NOT NULL,
 CONSTRAINT [PK_Attachment] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BlokedUsers]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BlokedUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OfficeID] [nvarchar](128) NOT NULL,
	[KafilID] [nvarchar](128) NOT NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_BlokedUsers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Branches]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Branches](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Mobile] [nvarchar](15) NULL,
	[OfficeID] [nvarchar](128) NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_OfficeBranches] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[City]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NOT NULL,
	[CountryID] [int] NOT NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contact]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contact](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Facebook] [nvarchar](max) NULL,
	[Twitter] [nvarchar](max) NULL,
	[Youtube] [nvarchar](max) NULL,
	[LinkedIn] [nvarchar](max) NULL,
	[Instagram] [nvarchar](max) NULL,
	[Phone] [nvarchar](100) NULL,
	[Mobile] [nvarchar](100) NULL,
	[Address] [nvarchar](250) NULL,
	[Email] [nvarchar](250) NULL,
	[MAP] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ContactUsMessages]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ContactUsMessages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[From] [nvarchar](50) NULL,
	[Message] [nvarchar](max) NULL,
	[IsRead] [bit] NOT NULL,
 CONSTRAINT [PK_ContactUsMessages_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
IF COL_LENGTH('Country', 'IsGulf') IS NULL
BEGIN
    ALTER TABLE [dbo].[Country]
    ADD IsGulf BIT NOT NULL DEFAULT 0;
END

-- ✅ إضافة العمود IsGulf إن لم يكن موجودًا
IF COL_LENGTH('Country', 'IsGulf') IS NULL
BEGIN
    ALTER TABLE [dbo].[Country]
    ADD IsGulf BIT NOT NULL DEFAULT 0;
END

-- ✅ تحديث السعودية (ID = 9 أو بالاسم)
UPDATE Country
SET IsGulf = 1
WHERE ID = 9 OR NameAR = N'السعودية';

-- ✅ تحديث باقي دول الخليج
UPDATE Country
SET IsGulf = 1
WHERE NameAR IN (
    N'الإمارات',
    N'الكويت',
    N'قطر',
    N'البحرين',
    N'عمان'
);

-- ✅ الإمارات
IF NOT EXISTS (SELECT 1 FROM Country WHERE NameAR = N'الإمارات')
BEGIN
    INSERT INTO Country (NameAR, NameEN, IsGulf)
    VALUES (N'الإمارات', N'UAE', 1)
END
ELSE
BEGIN
    UPDATE Country SET IsGulf = 1 WHERE NameAR = N'الإمارات'
END

-- ✅ الكويت
IF NOT EXISTS (SELECT 1 FROM Country WHERE NameAR = N'الكويت')
BEGIN
    INSERT INTO Country (NameAR, NameEN, IsGulf)
    VALUES (N'الكويت', N'Kuwait', 1)
END
ELSE
BEGIN
    UPDATE Country SET IsGulf = 1 WHERE NameAR = N'الكويت'
END

-- ✅ قطر
IF NOT EXISTS (SELECT 1 FROM Country WHERE NameAR = N'قطر')
BEGIN
    INSERT INTO Country (NameAR, NameEN, IsGulf)
    VALUES (N'قطر', N'Qatar', 1)
END
ELSE
BEGIN
    UPDATE Country SET IsGulf = 1 WHERE NameAR = N'قطر'
END

-- ✅ البحرين
IF NOT EXISTS (SELECT 1 FROM Country WHERE NameAR = N'البحرين')
BEGIN
    INSERT INTO Country (NameAR, NameEN, IsGulf)
    VALUES (N'البحرين', N'Bahrain', 1)
END
ELSE
BEGIN
    UPDATE Country SET IsGulf = 1 WHERE NameAR = N'البحرين'
END

-- ✅ عمان
IF NOT EXISTS (SELECT 1 FROM Country WHERE NameAR = N'عمان')
BEGIN
    INSERT INTO Country (NameAR, NameEN, IsGulf)
    VALUES (N'عمان', N'Oman', 1)
END
ELSE
BEGIN
    UPDATE Country SET IsGulf = 1 WHERE NameAR = N'عمان'
END


/****** Object:  Table [dbo].[District]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[District](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](500) NULL,
	[NameEN] [nvarchar](500) NULL,
	[CityID] [int] NULL,
	[Latitude] [nvarchar](50) NULL,
	[Longitude] [nvarchar](50) NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FAQ]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FAQ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[QuestionAR] [nvarchar](500) NOT NULL,
	[QuestionEN] [nvarchar](500) NOT NULL,
	[AnswerAR] [nvarchar](max) NOT NULL,
	[AnswerEN] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_FAQ] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FavoriteList]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FavoriteList](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KafilID] [nvarchar](128) NULL,
	[WorkerID] [nvarchar](128) NULL,
 CONSTRAINT [PK_FavoriteList] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FileType]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FileType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](150) NOT NULL,
	[NameEN] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_FileType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gallery]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gallery](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[WorkerID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_Gallery] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Languages]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Languages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Languages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mail]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mail](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[OfficeID] [nvarchar](128) NOT NULL,
	[OperatorID] [nvarchar](128) NULL,
	[Message] [nvarchar](max) NOT NULL,
	[MailID] [int] NULL,
	[Date] [datetime] NOT NULL,
	[IsRead] [bit] NOT NULL,
	[FileUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_Mail] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Nationality]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Nationality](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Nationality] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsLetter]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsLetter](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[IsSubscribed] [bit] NULL,
 CONSTRAINT [PK_NewsLetter] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notifications]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notifications](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Message] [nvarchar](max) NOT NULL,
	[OfficeID] [nvarchar](128) NULL,
	[KafilID] [nvarchar](128) NULL,
	[AdminID] [nvarchar](128) NULL,
	[IsRead] [bit] NOT NULL,
	[RequestID] [int] NULL,
	[Type] [nvarchar](20) NULL,
	[Date] [datetime] NULL,
 CONSTRAINT [PK_Notifications] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeDocuments]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeDocuments](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[FileUrl] [nvarchar](max) NULL,
	[Date] [date] NULL,
	[OfficeID] [nvarchar](128) NULL,
 CONSTRAINT [PK_OfficeDocuments] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OfficeServices]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OfficeServices](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[OfficeID] [nvarchar](128) NULL,
	[Price] [decimal](18, 2) NULL,
 CONSTRAINT [PK_OfficeServices] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Page]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Page](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](500) NOT NULL,
	[NameEN] [nvarchar](500) NOT NULL,
	[DescriptionAR] [nvarchar](max) NOT NULL,
	[DescriptionEN] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Page] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ReportedWorkers]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ReportedWorkers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkerID] [nvarchar](128) NOT NULL,
	[OfficeID] [nvarchar](128) NOT NULL,
	[KafilID] [nvarchar](128) NOT NULL,
	[ReportDate] [date] NOT NULL,
	[HasFakeData] [bit] NOT NULL,
	[HasInappropriateImages] [bit] NOT NULL,
	[Status] [nvarchar](50) NULL,
	[OtherReason] [bit] NULL,
	[Notes] [nvarchar](max) NULL,
 CONSTRAINT [PK_ReportedWorkers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Service]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Service](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](500) NOT NULL,
	[NameEN] [nvarchar](500) NOT NULL,
	[ImageUrl] [nvarchar](max) NOT NULL,
	[DescriptionAR] [nvarchar](max) NOT NULL,
	[DescriptionEN] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Service] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ServiceType]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ServiceType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](100) NOT NULL,
	[NameEN] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ServiceType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Setting]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Setting](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ExpiryDuration] [int] NOT NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Skills]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Skills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](50) NOT NULL,
	[NameEN] [nvarchar](50) NULL,
 CONSTRAINT [PK_Skills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[NameAR] [nvarchar](25) NOT NULL,
	[NameEN] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserFamily]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserFamily](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[RealationshipTypeID] [int] NOT NULL,
	[UserID] [nvarchar](128) NOT NULL,
 CONSTRAINT [PK_UserFamily] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerCertificates]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerCertificates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[University] [nvarchar](150) NULL,
	[WorkerID] [nvarchar](128) NULL,
	[From] [date] NULL,
	[To] [date] NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_WorkerCertificates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerCourses]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerCourses](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](150) NULL,
	[CenterName] [nvarchar](150) NULL,
	[WorkerID] [nvarchar](128) NULL,
	[Date] [date] NULL,
 CONSTRAINT [PK_WorkerCourses] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerExpertises]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerExpertises](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CompanyName] [nvarchar](150) NULL,
	[KafilName] [nvarchar](150) NULL,
	[WorkerID] [nvarchar](128) NULL,
	[From] [date] NULL,
	[To] [date] NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
 CONSTRAINT [PK_WorkerExpertises] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerLanguages]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerLanguages](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LanguageID] [int] NULL,
	[WorkerID] [nvarchar](128) NULL,
	[Level] [nvarchar](10) NULL,
	[Method] [nvarchar](30) NULL,
 CONSTRAINT [PK_WorkerLanguages] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerRequests]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerRequests](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[KafilID] [nvarchar](128) NULL,
	[WorkerID] [nvarchar](128) NULL,
	[OfficeID] [nvarchar](128) NULL,
	[RequestStatus] [nvarchar](50) NULL,
	[RequestDate] [date] NULL,
	[Balance] [decimal](18, 2) NOT NULL,
	[PaidStatus] [nvarchar](50) NULL,
	[PaidDate] [date] NULL,
	[RefundDate] [date] NULL,
	[ReceiptUrl] [nvarchar](max) NULL,
 CONSTRAINT [PK_KafilWorkers] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerSkills]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerSkills](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[WorkerID] [nvarchar](128) NULL,
	[SkillID] [int] NULL,
	[Level] [nvarchar](10) NULL,
 CONSTRAINT [PK_WorkerSkills] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WorkerWorkingPlaces]    Script Date: 11/19/2021 1:19:53 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WorkerWorkingPlaces](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CountryID] [int] NULL,
	[CityID] [int] NULL,
	[WorkerID] [nvarchar](128) NULL,
 CONSTRAINT [PK_WorkerWorkingPlaces] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NameAR], [IsShow]) VALUES (N'1', N'Administrators', N'مدير النظام', 0)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NameAR], [IsShow]) VALUES (N'2', N'Kafil', N'صاحب عمل', 1)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NameAR], [IsShow]) VALUES (N'3', N'Office', N'مكتب استقدام', 1)
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NameAR], [IsShow]) VALUES (N'4', N'Worker', N'عامل او عاملة', 1)
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'02d8967a-8751-474d-9220-05d518ece80b', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'07b1835a-40e6-4aca-a396-d5b86186a090', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'0ce25aae-e337-4cf2-9ec5-5634b0cd8be2', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'100add50-0658-4fbb-98ed-1f1e47d07919', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'13446944-5c9e-4e73-9476-ea90543ccb47', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'1aec668a-5a4f-49e2-bf30-45dc5a290e9d', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2bd3db8c-9dc7-4483-bc48-928e211a9637', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'3112b554-0ca3-4687-b0bc-18095ce76660', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'33e182d2-47b3-456b-95da-358ac6b80512', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'42a41d57-8902-407e-97ab-f9e7d759a08d', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'513ef363-f71d-4813-b2fa-a37ad8fbd156', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'552ef57f-82c0-4df1-8f2c-2222f479e862', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'5f9f7380-27c6-4464-88f9-fda16b13c214', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'64457400-592d-48d3-8f97-07c23c2482de', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'64533536-1a5a-4dd2-b6bb-d18610e9633a', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'676c153a-7b6d-448b-8211-f7d2f04d5f35', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6eab231d-d3eb-4acc-aedb-bc31befaf594', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'726252af-8301-4975-849b-5c5c909e2979', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'76ab3525-6e40-4fd8-91ba-d3e8df9c297a', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'7845eef4-24cd-46dd-a5ed-71c39bbf634d', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8894b5a6-e47e-4887-969a-a3d168b869d0', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'88e179f7-a748-4765-b7a4-138b2334141b', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'88ebaf31-b172-4189-acbf-9e366c96b38c', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'8da916e3-7f28-449a-bef0-a43f74ab4448', N'1')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'91e9e598-6440-43ce-83bd-afc0c4181cf4', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9300b561-ac3c-47cb-a524-d7eec660dd53', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9b82f3b4-f888-4d0f-a461-052e3396bf35', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a2b7ab60-edbb-42cd-88e3-a5bde20035bb', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'a3c20d01-bb00-401d-9abc-fc286724bb7e', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b0ccdf23-cd5d-4f78-8985-bbcea53078c2', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b18de13d-9d12-44bf-9b6a-41f836ab7d50', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b504e1a9-c046-4c30-a14a-fcae22e74501', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'b71eec66-7132-424b-9c36-da714d0eeb50', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bb22ce4c-0c63-4bdd-a853-42f96380845c', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'bf971309-fb39-4d0d-bf70-64e2f6116f50', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'd5e91be5-d318-47c5-b6f2-517bdd46c227', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'de0dad01-3610-42c9-b7f5-2f050a55f481', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'de9578d3-5d2a-41dd-871b-39945462fd91', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f05e5e86-a663-4728-83aa-4eb52bfbdaeb', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f24c5533-0ced-4063-936c-a596b84e2441', N'2')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f344d465-a0e5-47f0-a265-b446806de748', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'f7aa4990-7f56-4b16-ba67-68987669c073', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fb1c7af1-f99e-47f4-a225-dc9d368de107', N'4')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', N'3')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', N'4')
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] ON 
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'02d8967a-8751-474d-9220-05d518ece80b', 11, N'578c7113-61f2-4199-8be6-fb685469a2ff@temp.com', 0, N'AO5yyt7CYVP4Sr2ieari+kaysG7NbGTdxKbYtcSGrT/q8R2dnKxugPkgo9QMrSMKtQ==', N'5a1b9762-1df7-414c-9ca9-df9cc3662787', NULL, 0, 0, NULL, 1, 0, N'578c7113-61f2-4199-8be6-fb685469a2ff@temp.com', N'السيد ', N'محمد ', NULL, N'H8}xiI5TRUw!', NULL, NULL, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/cd4a368d-6435-45fa-8fc8-a7668585b3f4.jfif', 4, NULL, NULL, NULL, NULL, 1, CAST(N'2000-01-01' AS Date), NULL, 5, 0, 61, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, CAST(80.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/XZ4d2HhdjHE', N'لدى الكثير من الخبرات فى مجالات متعددة مثل اللغة الانجليزية والعربية والسواقة ومعاملة كبار السن ومعاملة الاطفال                                                   ', NULL, 36, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'07b1835a-40e6-4aca-a396-d5b86186a090', 38, N'19e14eb0-27cb-4f5b-a263-32493fc85045@temp.com', 0, N'AJ/JnREJ+yUuLaPT+4rz61TiW8TY7HAESiB5jf/NnWp2/spIFgD9RuM5P3NHcCxzvg==', N'03599846-b51a-45bf-8734-3ead63724c7d', NULL, 0, 0, NULL, 1, 0, N'19e14eb0-27cb-4f5b-a263-32493fc85045@temp.com', N'بهدور', N'دانى ', NULL, N'&)$N-d396MTt', 11, NULL, 19, 418, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/5604d9b4-08f5-4f35-9bc1-2d1d8cad2d30.jpg', 4, NULL, NULL, NULL, NULL, 0, CAST(N'1994-01-01' AS Date), 19, 8, 0, 13, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'اعزب', NULL, 27, NULL, CAST(80.00 AS Decimal(18, 2)), CAST(162.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, NULL, N'   أرجو زيارة الملف الشخصى لى للتعرف على المزيد من المعلومات للتعرف على.                     
                                                            ', NULL, 0, NULL, 0, CAST(17000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', 22, N'2caf3c51-ee5f-448c-bb59-94d60f9b7d54@temp.com', 0, N'ALG9Qf8JC29Q0lLX6UYFm8W+Yrf9HSEkoeKQ/Fx7siGMHzd3KUa4CUdnlhJ+jsVbvw==', N'f159d99b-b175-4bb9-8208-88611944312f', NULL, 0, 0, NULL, 1, 0, N'2caf3c51-ee5f-448c-bb59-94d60f9b7d54@temp.com', N'طاهر ', N'على ', NULL, N'}Q^.C0dYE%L@', NULL, NULL, 10, 90, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/ae2206fe-4e9c-4546-8c65-085a6e2631d6.png', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1975-01-01' AS Date), NULL, 2, 0, 22, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسيحي', N'مطلق', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/2r-qZNsZnQ0', N'امتلك  خبرة 22 عام فى الطبخ المنزلي. وسبق لى العمل فى منطقة الخليج واجيد  جميع انواع الطبخ (العربى - الشرقى - الهندي - الخليجى) ايضا اجيد عمل الكثير من انواع الحلويات. فضلا ارجو التفضل بزيارة الملف الشخصي لى لمشاهدة المزيد من مهاراتى.                         
                                                            ', NULL, 6, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', 17, N'b9f47df4-84dc-4c88-a893-9ff5ef8136ec@temp.com', 0, N'ANbuxS1svx2xLL7RkusN3ikI2LE7B1kcgwJaMlBjB/NCGYBMMfiPfxHBjvKH4aMmQw==', N'd74a5914-20d3-406f-95f0-fa0cef1e1add', NULL, 0, 0, NULL, 1, 0, N'b9f47df4-84dc-4c88-a893-9ff5ef8136ec@temp.com', N'محمد ', N'القحطاني', NULL, N'e9&81>i&LQSJ', NULL, NULL, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/03ad0dd2-5082-4e91-bb9e-a63b7306027b.jpg', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, 0, 10, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/EuLrIVL9SmM&ab_channel=%D9%85%D8%AD%D9%85%D8%AF%D8%A3%D8%A8%D9%88%D8%B1%D9%8A%D8%A7', N'لدى  رخصة  خاصة  وعامة  واجيد  السواقة  فى  منطقة الخليج بصفة  عامة  لدى  رخصة  خاصة  وعامة  واجيد  السواقة  فى  منطقة الخليج بصفة  عامة  لدى  رخصة  خاصة  وعامة  واجيد  السواقة  فى  منطقة الخليج بصفة  عامة  لدى  رخصة  خاصة  وعامة  واجيد  
', NULL, 7, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'0ce25aae-e337-4cf2-9ec5-5634b0cd8be2', 42, N'c5494df3-94d1-451a-861b-fe78ebddae16@temp.com', 0, N'AGXaoj47ctSLBxMprUVGtDsRmiyLM9ddFi7aVuJqQOA5skCgHr7MqKrrUnGRQknDbg==', N'3e1cd1c4-9b81-46e4-9131-9c08634dabd6', NULL, 0, 0, NULL, 1, 0, N'c5494df3-94d1-451a-861b-fe78ebddae16@temp.com', N'فرح ', N'معاذ', NULL, N':9oy-@LMCAV!', 3, NULL, 11, 117, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/71e0cc69-6333-48d2-b07b-1a4c75ee12ff.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1988-01-01' AS Date), 11, 11, 0, 20, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'متزوج', NULL, 33, NULL, CAST(79.00 AS Decimal(18, 2)), CAST(182.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/4zUxGioBCxw', NULL, NULL, 0, NULL, 0, CAST(7000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'13446944-5c9e-4e73-9476-ea90543ccb47', 7, N'f.tewfiq@gmail.com', 0, N'AOTXhmuBDfQDY/L6dEq9bA2lDt04KwJvHKjq0w4CDaK9XxY/cp978ftay4T5G4G8Bg==', N'79bfb608-a5ee-4216-9b94-3553efae05ab', NULL, 0, 0, NULL, 1, 0, N'f.tewfiq@gmail.com', N'Fathy', N'Tawfik', N'0562580734', N'P@55w0rd%15', NULL, N'056342321212111', 9, 5, N'123123', NULL, N'مكتب الرياض (العليا)', N'شارع العليا', N'Fahd', N'Fathy', N'f.tewfiq1@gmail.com', N'+966 562581734', N'/uploads/office/4098f9fb-35f0-4285-9bb9-4a66eb389571.jpg', 3, N'123123', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18' AS Date), 0, N'/uploads/contracts/6d6ee1ea-b744-4a6a-9257-ef247462e822.docx', 1, NULL, NULL, N'42.164159192187476', N'23.771200581622207', N'3222222222', 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'1aec668a-5a4f-49e2-bf30-45dc5a290e9d', 43, N'fathy@gmail.com', 0, N'AMphT3RiZP0Pdjx9EK7bLWMZ5Ug3sE+ByVDagCc3k3B/SoiL0PG+ZsOysSMZUVFd3A==', N'76ee0352-6115-43c1-838c-5768496d2e0b', NULL, 0, 0, NULL, 1, 0, N'fathy@gmail.com', N'مطيري ', N'على ', N'0562580298', N'P@55w0rd%15', NULL, N'0562580301', 9, 5, N'9876123455', NULL, NULL, NULL, N'سعد ', N'عوكل ', N'fathy1@gmail.com', N'0562580819', N'/uploads/office/11d743c2-f2a1-4664-adbe-77d8610c71e0.jpeg', 3, N'7654319877', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, N'/uploads/contracts/6a5e0b93-c95a-4271-ad59-a28e18bb8afb.jpeg', 0, NULL, N'المربع ', N'42.4992422', N'24.0499066', N'5431876981', 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', 21, N'2d3b93b8-181b-4c09-9f8a-e64039c9404b@temp.com', 0, N'AFrTHQG5BHPWkd6p8urEuRmPRw4cCse62QOSxzFL4qe5kRsHUkYQU/jgTXmpymqy7A==', N'eca415fc-ddf7-4c8a-9e8e-764b310827da', NULL, 0, 0, NULL, 1, 0, N'2d3b93b8-181b-4c09-9f8a-e64039c9404b@temp.com', N'وليد ', N'عبد الجليل ', NULL, N'Kcs-N%SIKNYM', NULL, NULL, 10, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/353469af-eb3a-46a9-9179-6e7661f207f4.jfif', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1980-01-01' AS Date), 10, 4, 1, 18, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'متزوج', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/MhmE_h7GJoE', N'امتلك  10 سنوات من الخبرة فى مناطق عدة فى مصر واجيد التعامل بلغات عديدة وامتك الكثير من المهارات ارجو زيارة الملف الشخصي حتى تستطيع المعرفة عن سيرتى الذاتية                        
                                                            ', NULL, 6, NULL, 0, CAST(22000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'3112b554-0ca3-4687-b0bc-18095ce76660', 18, N'd4f5a275-9abf-4da9-acdf-119363964859@temp.com', 0, N'AH3j46CDMJQ9Acqio2x3gwA3cJgKT8rMgCI/pBS7PdA3UMJnKNrtiJ1lZ4eH0BdsUg==', N'c26ddf9b-954d-429e-8259-1297abdec0ed', NULL, 0, 0, NULL, 1, 0, N'd4f5a275-9abf-4da9-acdf-119363964859@temp.com', N'فاتي', N'على ', NULL, N'chpGks251F$0', NULL, NULL, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/43a46392-cf27-4cfa-911f-63c8a6af154a.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'2000-01-01' AS Date), NULL, 7, NULL, 5, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, N'لدى الكثير من الخبرات فى مجالات متعددة مثل اللغة الانجليزية والعربية والسواقة ومعاملة كبار السن ومعاملة الاطفال

', NULL, 13, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', 10, N'fahd@gmail.com', 0, N'AKhWvsSJvyfj//teegfdPlq6D+a+W3gDmlW2rVs3TjXXr4pIXnz2Q/QoSbzE+smLAw==', N'd9fc62c3-bd85-41d5-a87c-dc36d6e60bf6', NULL, 0, 0, NULL, 1, 0, N'fahd@gmail.com', N'Fahd', N'Fathy', N'0562580735', N'P@55w0rd%15', NULL, NULL, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/kafil/3441b928-eea8-4d57-9b57-498e1735fec0.jfif', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18' AS Date), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'33e182d2-47b3-456b-95da-358ac6b80512', 24, N'Tamem@gmail.com', 0, N'AJvT/dwNk7sIW10KWnxaz99K1Wj/PDFw6vxr2KX+tWDz2t2WPiy4g8TNpHuwFd7Y9w==', N'4f7c0308-60cb-45b4-bb04-3e9402922437', NULL, 0, 0, NULL, 1, 0, N'Tamem@gmail.com', N'محمد ', N'المطيري', N'0562580738', N'P@55w0rd%15', NULL, N'بسم الله ', 9, 5, N'بسم الله ', NULL, N'مكتب تميم', NULL, N'123456', N'98765', N'Tamem1@gmail.com', N'بسم الله ', NULL, 3, N'بسم الله  ', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-03' AS Date), 0, NULL, 0, NULL, N'حى الصحافة  ', N'42.4992422', N'24.0499066', NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'42a41d57-8902-407e-97ab-f9e7d759a08d', 1, N'temp@temp.com', 0, N'ANGTq6kRm5G8RI3L/yXVexamjb+VhN9wu1zUJu3hWHtwY2QuVJrjWcr/YR+oXYyC7Q==', N'2fd95e5a-58b1-454e-9c9f-6d0cb1448e81', NULL, 0, 0, NULL, 1, 0, N'temp@temp.com', N'فادى', N'خفاجى', NULL, N'D?mQyOc(e36T', NULL, NULL, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/35be03e9-5b66-4c06-84b0-14d6a0aa693d.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1980-03-05' AS Date), 9, 1, 0, 10, N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'مسلم', N'اعزب', NULL, 40, CAST(2500.00 AS Decimal(18, 2)), CAST(70.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), 1, N'2152455656', CAST(N'2018-01-01' AS Date), CAST(N'2025-12-31' AS Date), 9, N'https://www.youtube.com/embed/vSfpLQJbIrc', N'fgggggfgfgfgf ftggfggfgfg                                                            
                                                            ', NULL, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'552ef57f-82c0-4df1-8f2c-2222f479e862', 26, N'suliman_966@hotmail.com', 0, N'AAwmESwnskfWtUW8gE+R1GGbnIO7dFLjCjiKFhSwPTtACTg33PktjmvRVdDUbkTHBA==', N'f38aabe7-1d5e-4577-9ac9-a8af02478048', NULL, 0, 0, NULL, 1, 0, N'suliman_966@hotmail.com', N'سليمان', N'اختبار', N'0557774426', N'Info@123123', NULL, NULL, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-14' AS Date), 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'5f9f7380-27c6-4464-88f9-fda16b13c214', 56, N'fady.khafagy@gmail.com', 0, N'AHOdLlnqspqsoVt2kPpxxd53vGHJ1WR1edQpJFWgUZWpKLWVtKIa4WFGC/AFN8cUcw==', N'b8351736-423d-42f1-88d4-e5ced340214d', NULL, 0, 0, NULL, 1, 0, N'fady.khafagy@gmail.com', N'FADY', N'Khafagy', NULL, N'@Google@2021@', NULL, NULL, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-16' AS Date), 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 1, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'64457400-592d-48d3-8f97-07c23c2482de', 6, N'6bece6e5-84b9-4d85-a15b-33e6459d6c7d@temp.com', 0, N'AEsVNOUcb+ExnMritKakOKk3OKU9Jro4SCZxOGUbAgtKiCBhu6UnaHOsetez7eFNDQ==', N'8404604c-82fb-4c3f-858e-34d2b55eca2d', NULL, 0, 0, NULL, 1, 0, N'6bece6e5-84b9-4d85-a15b-33e6459d6c7d@temp.com', N'Ahmed', N'ali', NULL, N'#d>.9V!OT&cr', NULL, NULL, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, 2, NULL, NULL, N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'مسلم', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'64533536-1a5a-4dd2-b6bb-d18610e9633a', 8, N'c507c147-d54b-47f8-b48e-885e6a9032e8@temp.com', 0, N'ACAkLp0m+RHqATi82nD67gYIX40iSiCI52x9+2fkCUSzXPpCbGIkdMS1SQg5A9GV0A==', N'93e6f004-c2c4-46eb-9941-f808cbf7e4ad', NULL, 0, 0, NULL, 1, 0, N'c507c147-d54b-47f8-b48e-885e6a9032e8@temp.com', N'مها ', N'احمد', NULL, N'5pZ9)P_P+:Ug', NULL, NULL, 9, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/45132f02-cd2d-42d4-8f50-89e794142f23.jfif', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, 5, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسيحي', N'اعزب', NULL, 30, NULL, NULL, CAST(180.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/J_dlOuiaS24&ab_channel=AhmedRafat', N' خبرة  20 سنة فى مجال الطبخ 2l', NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'676c153a-7b6d-448b-8211-f7d2f04d5f35', 33, N'7989ab6b-7fb4-45bd-8664-7e525fc99fe2@temp.com', 0, N'AFsTQW8NbQCWxU20f+fyrL/KHNqVNqkFGt5mjGWHi1a0+/No3VExGek+gZGdjtT1Kg==', N'f1ba804b-5935-4de8-86d0-901c200ada4b', NULL, 0, 0, NULL, 1, 0, N'7989ab6b-7fb4-45bd-8664-7e525fc99fe2@temp.com', N'اريج ', N'عبدو ', NULL, N':kNt|fA:6|(e', 5, NULL, 13, 277, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/04e065ac-9341-49c7-b061-9428116421da.jfif', 4, NULL, NULL, NULL, NULL, 0, CAST(N'1990-01-01' AS Date), 13, 6, 0, 5, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'متزوج', NULL, 31, NULL, CAST(65.00 AS Decimal(18, 2)), CAST(177.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/2r-qZNsZnQ0&ab_channel=ITCOURSES%7CUT', N'    اعمل كممرضة . ارجو زيارة الملف  الشخصى لى للتعرف  على  المزيد  من  المعلومات  الخاصة بحياتى المهنية                     
                                                            ', NULL, 1, NULL, 0, CAST(13000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', 9, N'800e9e5b-14df-48cd-b11d-4bb1dc3efbd0@temp.com', 0, N'AEtBW2/eAN9Nw0/lHkZCFdpNgKpdce5lv/F0SUeFWU2GX0yw6PT1CbM/9ilMhY0u8Q==', N'd144d77c-7c5e-4938-9a36-2024e9c77ff0', NULL, 0, 0, NULL, 1, 0, N'800e9e5b-14df-48cd-b11d-4bb1dc3efbd0@temp.com', N'خالد ', N'السيد', NULL, N'nLSFy_H(ub@F', NULL, NULL, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/1bb40dbd-8199-4b76-9c4c-fe3429e1db9e.jfif', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1986-01-01' AS Date), 10, 1, 0, 10, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, 35, NULL, CAST(75.00 AS Decimal(18, 2)), CAST(175.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/XXNFDOYNTuU', N'   ارجو زيارة الملف الشخصي للتعرف على المزيد من المعلومات الخاصة بي                     
                                                            ', NULL, 1, NULL, NULL, CAST(20000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'6eab231d-d3eb-4acc-aedb-bc31befaf594', 14, N'1b05868c-610d-4f8b-a5ee-8e46be386ab1@temp.com', 0, N'AHoPWlV9Le1ZclGKprpS/XGf9wjRO+aZcmRY1kbASnOQTGByM68A91GObnztJTlmIg==', N'4705fb37-145f-4193-8c45-9166a6b6b879', NULL, 0, 0, NULL, 1, 0, N'1b05868c-610d-4f8b-a5ee-8e46be386ab1@temp.com', N'العكراوى  ', N'محمد', NULL, N'%s9x|B)2Utj*', NULL, NULL, 10, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/fa7a24b4-273c-4a53-bdfa-67287c8417b4.jfif', 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, 6, NULL, 5, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'6eadf14b-527e-419a-92ab-8f128362e0a5', 2, N'fady.khafagy1@gmail.com', 0, N'ABmHo+abKQeDFJpH2AYULBgSZ3TwYnnsxganvMxE2b+4yBgZFzuFEf9mBk9J71Kr/w==', N'a5c63e15-947c-4e33-bd13-533ee5a6001b', NULL, 0, 0, NULL, 1, 0, N'fady.khafagy1@gmail.com', N'FADY', N'Khafagy', N'01224240777', N'@Google@2021@', NULL, NULL, 9, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/kafil/739de2fb-5811-4741-8d18-8eaaa56077a3.jpg', 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'مسلم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-14' AS Date), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'726252af-8301-4975-849b-5c5c909e2979', 13, N'5a6f7e5d-efdb-4fdf-9388-44ff797f1b9e@temp.com', 0, N'AJxJ//tpsAYdhJ7MyzvsuE+nhrPmzAFvQAoCnlpbOa3cHcF14KI0unw3yTqrWmfDxQ==', N'0857d171-ceff-4f91-820a-fa77d204ddc8', NULL, 0, 0, NULL, 1, 0, N'5a6f7e5d-efdb-4fdf-9388-44ff797f1b9e@temp.com', N'سلوى ', N'محمد', NULL, N'ykOUw9;XYD[4', NULL, NULL, 9, 18, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/5792ec2a-1c87-452e-861d-ce6cb345738d.jfif', 4, NULL, NULL, NULL, NULL, 1, CAST(N'2000-01-01' AS Date), NULL, 6, 0, 15, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'يهودي', N'متزوج', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'76ab3525-6e40-4fd8-91ba-d3e8df9c297a', 12, N'94022b78-d28f-429f-86d8-167cb6ab6db3@temp.com', 0, N'AMns1oeonrSPCI42AMRjm5yQ3LOEDKU2hClWZbwPWABJ5oT3PlTHNQiFyfThMfHw1Q==', N'd23e9e6f-c863-485c-9603-905267ce6cab', NULL, 0, 0, NULL, 1, 0, N'94022b78-d28f-429f-86d8-167cb6ab6db3@temp.com', N'محمد ', N'ابراهيم ', NULL, N'^G_])rn?+l]/', NULL, NULL, 9, 22, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/56e39932-e03b-4485-a3e0-af953b5fe9b4.jfif', 4, NULL, NULL, NULL, NULL, 1, CAST(N'2000-01-01' AS Date), 10, 4, 0, 5, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, CAST(75.00 AS Decimal(18, 2)), CAST(180.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/VRqFaX71rbg', N'  لدى خبرة 20 عام فى منطقة الخليج فى اعمال المنزل (النظافة - الزراعة - الحراسة) واجيد استقبال الضيوف والتعامل مع كبار العمر والاطفال .                      
                                                            ', NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'8894b5a6-e47e-4887-969a-a3d168b869d0', 5, N'50e9880a-1bd0-47b5-8a30-a2d1559ccfbf@temp.com', 0, N'ADsM8bfL4JR8aeRpmNtBgw+1W0KfJhB3yK6UM7N56kzUmTKj8m0+n228jxYz5cUNuQ==', N'b8f5ba60-b112-41ff-8dcc-303733aecd2d', NULL, 0, 0, NULL, 1, 0, N'50e9880a-1bd0-47b5-8a30-a2d1559ccfbf@temp.com', N'Ahmed', N'Ibrahim', NULL, N'FukoKpxT;MlR', NULL, NULL, 9, 6, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, 1, NULL, 10, N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'مسلم', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'88e179f7-a748-4765-b7a4-138b2334141b', 39, N'f7daa15e-a0bc-4968-838f-f34a9167f99b@temp.com', 0, N'AGXuBCHu3HV4mtLTl4Iq6MW4pOaBYnrWj/T4Yd1Fp3lgZcKUw5PFPTXfCVv4uf+xzw==', N'793b719e-232e-4610-b0ce-e6f88a995dbe', NULL, 0, 0, NULL, 1, 0, N'f7daa15e-a0bc-4968-838f-f34a9167f99b@temp.com', N'يييي', N'يييييي', NULL, N'H/8x&gV*t=|N', 4, NULL, NULL, 8, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 0, NULL, NULL, 3, 0, NULL, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'88ebaf31-b172-4189-acbf-9e366c96b38c', 45, N'7f307e69-ccd5-48e7-9718-9cf12fd556be@temp.com', 0, N'AJt3O9h0309bfXNKqV7JvaQpxYxkYB9cFLRRgp3hs0C6jX3oInLcxtjUMw8lE7sSdA==', N'ebec8120-78cf-44ec-bd80-f890a430fca0', NULL, 0, 0, NULL, 1, 0, N'7f307e69-ccd5-48e7-9718-9cf12fd556be@temp.com', N'سيف  ', N'طربوش  ', NULL, N'?u^:r#mxy(bn', 2, NULL, 10, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/3a2c955d-864c-41e3-adac-20682a209057.jfif', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1981-02-08' AS Date), 10, 4, 5, 22, N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', N'مسلم', N'متزوج', NULL, 41, NULL, CAST(79.00 AS Decimal(18, 2)), CAST(183.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/BKOMz36ySa8', N'    ارجو زيارة ملفى التشخصي للتعرف على المزيد من معلوماتى المهنية والعملية                    
                                                            ', NULL, 3, NULL, 0, CAST(12000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'8da916e3-7f28-449a-bef0-a43f74ab4448', 3, N'admin@marofh.com', 1, N'ABmHo+abKQeDFJpH2AYULBgSZ3TwYnnsxganvMxE2b+4yBgZFzuFEf9mBk9J71Kr/w==', N'a5c63e15-947c-4e33-bd13-533ee5a6001b', NULL, 0, 0, NULL, 1, 0, N'admin@marofh.com', N'admin', NULL, N'+20124240777', N'@Google@2021@', NULL, N'0124240777', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/Content/front/assets/img/user.png', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'مسلم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-18' AS Date), 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'9b82f3b4-f888-4d0f-a461-052e3396bf35', 34, N'fd19b78b-1f0e-4cff-85c0-654f3aec183d@temp.com', 0, N'AHGUbmYnObDe/M+nlP8PXScOAz2NPfvQRpOVxYFYiSj3Kx72fB/3JWmVUxEcMm5Pow==', N'fab64321-ae5a-4916-81d3-87daba08fc6b', NULL, 0, 0, NULL, 1, 0, N'fd19b78b-1f0e-4cff-85c0-654f3aec183d@temp.com', N'زكريا ', N'عبدالكريم ', NULL, N'5QX+JxoI3#Ld', 9, NULL, 17, 368, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/fa6296c4-f502-4c1e-b74b-08b18c9417a3.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1979-01-01' AS Date), 17, 7, 0, 17, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, 42, NULL, CAST(72.00 AS Decimal(18, 2)), CAST(182.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/eT8uKoMYlqs', N'اعمل كممرض ولدى خبرة تزيد عن 15 عام فى منطقة الخليج . فضلا ارجو زيارة ملفى الشخصي للتعرف على المزيدمن المعلومات الخاصة عن حياتى المهنية .                         
                                                            ', NULL, 0, NULL, 0, CAST(12000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'مرشح_الى_كفيل')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'a202e4a9-b890-478b-a934-a928a0d2b49f', 4, N'office1@gmail.com', 0, N'AOngRSdrfWQMXaEWxmttMdva4sjpTM8sijngsu5oyMeh1lK143u9l8iTu+GeYLfCYw==', N'3e4bfd48-fdad-4a07-b20e-67df688da49d', NULL, 0, 0, NULL, 1, 0, N'office1@gmail.com', N'Ahmed', N'Kamel', N'+201224240777', N'@Google@2021@', NULL, N'0123456789', 9, 8, N'123456', CAST(N'0001-01-01' AS Date), N'مكتب رقم  01', N'شارع الضباب', N'FADY', N'Khafagy', N'fady.khafagy@gmail.com', N'+201224240777', N'/uploads/office/916b6609-ec48-4550-b8b7-63665cd9c85e.jpg', 3, N'987654', CAST(N'0001-01-01' AS Date), NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, N'مسلم', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-22' AS Date), 0, N'/uploads/contracts/2ac50c99-e851-4642-a9ac-c84783c9c899.pdf', 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'a2b7ab60-edbb-42cd-88e3-a5bde20035bb', 28, N'bdb1c1b2-66af-4ee8-9cca-5eea750c06a8@temp.com', 0, N'ABrzlqNxT0/+pCZ3GpA4t+OQeAojGdxtpBYvXliPi5HNr56mgprukiC3W206GQiR9g==', N'82f76c1e-ca22-4a2b-a5f3-82b7a6c011c9', NULL, 0, 0, NULL, 1, 0, N'bdb1c1b2-66af-4ee8-9cca-5eea750c06a8@temp.com', N'سليمان', N'اختبار مكتب', NULL, N'gq3z=H2ybx@s', 2, NULL, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, 0, NULL, N'de9578d3-5d2a-41dd-871b-39945462fd91', N'مسلم', N'اعزب', NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 5, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 32, N'53b07275-c914-431f-a4c0-a8e5b0abd780@temp.com', 0, N'ABzJ4lMvVPCdJgzxHc+IAUFntlOgKpeUHJSfAv1kbc+C3BYgZilV1fYGlM9F7fwFGg==', N'fd0b7b51-9c68-45b0-9061-05cfc1c1f95c', NULL, 0, 0, NULL, 1, 0, N'53b07275-c914-431f-a4c0-a8e5b0abd780@temp.com', N'أنجيلا ', N'عباس', NULL, N'G&)N)-uNFjp_', 4, NULL, 12, 141, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/c19dae1d-c7af-429c-a6c8-a5c46de0c061.jpg', 4, NULL, NULL, NULL, NULL, 0, CAST(N'1980-01-01' AS Date), 12, 3, 0, 8, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'اعزب', NULL, 41, NULL, CAST(90.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/7iLPyw9n8Ao', N'أرجو زيارة الملف الشخصى لى للتعرف على المزيد من المعلومات للتعرف  على.                         
                                                            ', NULL, 3, NULL, 0, CAST(15000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'b18de13d-9d12-44bf-9b6a-41f836ab7d50', 25, N'FATHY2@GMAIL.COM', 0, N'AB96Kh6Yoh7G9Qbzzx6+mW7wXMTQrXNOXaFj7vqkCuThwN/VTBivioljgVxGQ7e20Q==', N'213a3034-39fa-413a-b28a-3fd05926d57c', NULL, 0, 0, NULL, 1, 0, N'FATHY2@GMAIL.COM', N'خالد', N'على ', N'0563478984', N'P@55w0rd%15', NULL, NULL, 9, 5, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 2, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-23' AS Date), 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'b504e1a9-c046-4c30-a14a-fcae22e74501', 40, N'95b03b9a-3937-4ecb-8dc0-b0f465725541@temp.com', 0, N'AJpLsIE6rZFU0xFPuhjoehJK3lL82OKWM+m/Gu7yF5N3Mgwvt1fumWcdsESeioUhHQ==', N'198af525-3682-4cbd-ad42-b864f22c11be', NULL, 0, 0, NULL, 1, 0, N'95b03b9a-3937-4ecb-8dc0-b0f465725541@temp.com', N'ميكى ', N'دادو ', NULL, N'UsP.{@)CAz-T', 10, NULL, 18, 393, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/3812e30f-6530-4b5a-b417-b9923bf0b2c5.jpg', 4, NULL, NULL, NULL, NULL, 0, CAST(N'1974-01-01' AS Date), 18, 3, 0, 4, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'اعزب', NULL, NULL, NULL, CAST(75.00 AS Decimal(18, 2)), CAST(173.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, NULL, N'  ارجو زيارة ملفى التشخصي للتعرف على المزيد من معلوماتى المهنية والعملية                                 
                                                            ', NULL, 0, NULL, 0, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'bb22ce4c-0c63-4bdd-a853-42f96380845c', 29, N'office2@gmail.com', 0, N'AB846RQVMp4I1OD98I+NdafjjC84wNwWvY/Wicw1xYOg/lYGVDbWFU5UXIcsmhoAYA==', N'dae13110-e737-4696-88c6-9fa7184b59af', NULL, 0, 0, NULL, 1, 0, N'office2@gmail.com', N'FADY', N'Khafagy', NULL, N'@Google@2021@', NULL, N'966011111111111', 9, 6, N'123456', NULL, N'مكتب رقم  02', NULL, N'FADY', N'Khafagy', N'fady.khafagy@gmail.com', N'966011111111111', NULL, 3, N'987654', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'bf971309-fb39-4d0d-bf70-64e2f6116f50', 46, N'office3@gmail.com', 0, N'ABIBsqxd+rn3bG5IK/k5hrAoXcyCrf+e4C63UIrmoNkt9zKuCatBpc1NnPXHdj4PHQ==', N'924ab1e7-e2ae-413a-bd6f-27527f2297ae', NULL, 0, 0, NULL, 1, 0, N'office3@gmail.com', N'Fady', N'Khafagy', N'0561111111', N'@Googl@2021@', NULL, N'0563333333', 9, 7, N'123456789', NULL, N'مكتب رقم  03', N'شارع كذا', N'محمد', N'الديب', N'mohamed@gmail.com', N'0562222222', NULL, 3, N'0123456789', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 0, NULL, 0, NULL, NULL, NULL, NULL, N'1234567899', 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'd5e91be5-d318-47c5-b6f2-517bdd46c227', 41, N'1ab6884a-1994-4b18-8e2b-5cab4c0b2dff@temp.com', 0, N'AJ2yYB4mZD87xnYnPliLE+wlaSabP1AxnVPwn90cJbn9sYccTUNe1VeYX6M0bmab+g==', N'60963e28-22b5-46c3-9f58-6888f891150f', NULL, 0, 0, NULL, 1, 0, N'1ab6884a-1994-4b18-8e2b-5cab4c0b2dff@temp.com', N'عبدالله ', N'محمد', NULL, N'C={yvxKF;I*o', 7, NULL, 12, 148, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/1b7697f6-53b9-403b-817c-de939005f570.jpeg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1998-01-01' AS Date), 12, 7, 3, 15, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'متزوج', NULL, NULL, NULL, CAST(85.00 AS Decimal(18, 2)), CAST(168.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, NULL, N' ارجو زيارة ملفى التشخصي للتعرف على المزيد من معلوماتى المهنية والعملية                        
                                                            ', NULL, 6, NULL, 0, CAST(9000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'de0dad01-3610-42c9-b7f5-2f050a55f481', 30, N'9a1de803-bbd0-425e-adc4-b51c488a2164@temp.com', 0, N'AAAPX0QKNW749+FhJyIbIzFWjUabvWpA18KemoBzt4F9HBIrG3wvhf7x7qBaOOFAIA==', N'70f148f5-fc49-4cb4-a83e-bc3258f8f028', NULL, 0, 0, NULL, 1, 0, N'9a1de803-bbd0-425e-adc4-b51c488a2164@temp.com', N'معاذ', N'على ', NULL, N'^5]q]({r_u)K', 3, NULL, 11, 131, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/9e9970ee-9ef4-4cb9-a56e-357180a93ef1.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1997-01-01' AS Date), 11, 4, 0, 15, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, 24, NULL, CAST(80.00 AS Decimal(18, 2)), CAST(182.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/890qmzPioEM', N'لدى  خبرة  تفوق  10  سنوات واعمل  كعامل  ولقد عملت  من  قبل  فى  منطقة  الخليج  . لذالك  تفضلا  ارجو زيارة الملف  الشخصي للتعرف على  المزيد  من  مهاراتى  وشهاداتى  والمزيد.                         
                                                            ', NULL, 2, NULL, 0, CAST(18000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'de9578d3-5d2a-41dd-871b-39945462fd91', 27, N'suliman_966@hotma.com', 0, N'AP9yRX8Y2Ucc2jSdFPZqf+5dqRsSKAqM7XoU9GhdtWgfddl9GnzN9QFVHrjUo5AQBQ==', N'11bb97a4-066e-4c78-8bf0-3de245976d11', NULL, 0, 0, NULL, 1, 0, N'suliman_966@hotma.com', N'سليمان', N'اختبار مكتب', N'0557774426', N'Info@123123', NULL, N'0557774426', 9, 5, N'123123', NULL, N'تجربة مكتب', NULL, N'سليمان', N'تجربة مكتب', N'suliman_966@hotm.com', N'0557774426', NULL, 3, N'111', NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-10-14' AS Date), 0, N'/uploads/contracts/41a2abdc-aa75-4479-9ccf-8db61afb505c.pdf', 1, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'f05e5e86-a663-4728-83aa-4eb52bfbdaeb', 19, N'f.tewfiq1@gmail.com', 0, N'AGdyM9sEI9EdHFEvzmjkaTT2AJzfBS8oP6635sQtGJUqgaOesH8ZcMgcynYPrkLksA==', N'bc2d0093-1785-45ca-a18d-158023d11268', NULL, 0, 0, NULL, 1, 0, N'f.tewfiq1@gmail.com', N'Hasn', N'Fathy', N'0562580735', N'P@55w0rd%15', NULL, N'056342321212111', 9, 5, N'123123', CAST(N'2020-01-10' AS Date), N'مكتب ام حسن ', NULL, N'Khalid', N'Fathy', N'fathy.tewfiq2@gmail.com', N'0562580736', NULL, 3, N'123123', CAST(N'2022-01-10' AS Date), NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-03' AS Date), 0, N'/uploads/contracts/3bf03743-03ea-4fb8-8eaa-e0c287cf82ad.pdf', 1, NULL, NULL, NULL, NULL, NULL, 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', 20, N'a84e331e-a4ad-49d4-9002-205c13701ff9@temp.com', 0, N'AJTwvhsZpWhzeLUmRdYFwhzJ3CeerajuPZT0MnY+ZWdNSZQeeASoyc+557tQKiHpFw==', N'd0aa6799-a5c6-4aba-85f2-a76a131735f2', NULL, 0, 0, NULL, 1, 0, N'a84e331e-a4ad-49d4-9002-205c13701ff9@temp.com', N'احمد ', N'الطيب', NULL, N'(ySv24ZsmL[6', NULL, NULL, 27, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/09e6470b-473d-46de-a6b5-3b0e136de41b.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1996-01-01' AS Date), 27, 1, 0, 10, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, CAST(80.00 AS Decimal(18, 2)), CAST(185.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/-by6bsarIA0', N' اعمل كسائق خاص فى السعودية من عام 2010 ولعملت فى مدن  عدة كالرياض والدمام ومكة والمدينة وجدة  ولدى رخصة قيادة سارية                       
                                                            ', NULL, 6, NULL, 0, CAST(12000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'f344d465-a0e5-47f0-a265-b446806de748', 36, N'f0b68280-166f-4bd9-bd49-a9b2e79be71d@temp.com', 0, N'AMM32fS8Qor/M+6XO+I0Pf6UDnEOmuTUcpw1YAzP+4LyXCVVa6CxkCQ/4x6nWQQfBA==', N'6147b8e9-ce62-4adf-a2e0-6eb8d504553b', NULL, 0, 0, NULL, 1, 0, N'f0b68280-166f-4bd9-bd49-a9b2e79be71d@temp.com', N'ريتا ', N'اسحاق ', NULL, N't$(L4PXE20=d', 13, NULL, 21, 516, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/9694de58-10de-43fa-b418-da3e2607323a.jfif', 4, NULL, NULL, NULL, NULL, 0, CAST(N'1989-01-01' AS Date), 21, 3, 0, 6, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'اعزب', NULL, 32, NULL, CAST(88.00 AS Decimal(18, 2)), CAST(174.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/ZA-rLyXCZoM', N'أرجو زيارة الملف الشخصى لى للتعرف على المزيد من المعلومات للتعرف على.                        
                                                            ', NULL, 17, NULL, 0, CAST(21000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'f7aa4990-7f56-4b16-ba67-68987669c073', 37, N'b236173c-b4bc-4e65-89ab-5a05e450eaa9@temp.com', 0, N'ANBbvnMk9aQzUrFixmLO3e3eLK8knFAGK8dKosILtIlqlyQ90WefQWXNtPGFZDPtNQ==', N'f266d0a2-f38f-41ef-93a7-1d6540b15fb5', NULL, 0, 0, NULL, 1, 0, N'b236173c-b4bc-4e65-89ab-5a05e450eaa9@temp.com', N'بيرسي ', N'تاو ', NULL, N'RA%tYnSHq81I', 19, NULL, 27, 611, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/b1b6a327-95a7-492f-b308-a02d2aa70bdc.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1993-01-01' AS Date), 27, 11, 0, 11, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'غير', N'اعزب', NULL, NULL, NULL, CAST(72.00 AS Decimal(18, 2)), CAST(188.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, NULL, N'مرحبا  بالجميع  انى  اعمل  كسفرجى . ارجو  زيارة  ملفى  الشخصى  للتعرف على  المزيد من المعلومات  الاضافية  عنى.                        
                                                            ', NULL, 0, NULL, 0, CAST(10000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 0, 1, N'متاح')
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', 44, N'fathy4@gmail.com', 0, N'AG3dPzgZiwJgQVbzLWHz10Cyy4MQocua2avsm1wJDD/3icgvliyB2b+nwoJJrUw/IA==', N'edcb63f4-de5a-45a9-a4b5-1c111c556b6e', NULL, 0, 0, NULL, 1, 0, N'fathy4@gmail.com', N'احمد', N'السيد ', N'0562580739', N'ح@55ص0قي%15', NULL, NULL, 9, 5, N'147852369', NULL, N'مكتب  المستقبل  ', NULL, N'تامر ', N'مصطفى ', N'fathy5@gmail.com', N'0562580741', NULL, 3, N'147852369', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2021-11-04' AS Date), 0, N'/uploads/contracts/f664537d-b385-4126-9edc-850d748fa662.bmp', 1, NULL, NULL, NULL, NULL, N'0147963258', 0, 1, NULL)
GO
INSERT [dbo].[AspNetUsers] ([Id], [ShortID], [Email], [EmailConfirmed], [PasswordHash], [SecurityStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEndDateUtc], [LockoutEnabled], [AccessFailedCount], [UserName], [FName], [LName], [Mobile], [Password], [NationalityID], [WhatsAppNo], [CountryID], [CityID], [HRLicenseNo], [HRLicenseExpiryDate], [OfficeName], [OfficeAddress], [EmployeeFName], [EmployeeLName], [EmployeeEmail], [EmployeeMobile], [ImageUrl], [RoleID], [CommercialRegisterNO], [CommercialRegisterExpirationDate], [LicenseNo], [LicenseNoExpirationDate], [Gender], [DOB], [BirthCountryID], [JobsID], [ChildernsCount], [ExperienceYearsCount], [OfficeID], [Religion], [MaritalStatus], [HasDrivingLicense], [Age], [Salary], [Weight], [Height], [IsRoomShared], [PassportNo], [PassportRealseDate], [PassportExpirationDate], [PassportRealseCountryID], [VideoUrl], [Brief], [LastLoggedInDate], [ViewCount], [ContractUrl], [IsVerifed], [RequestAmount], [District], [Longitude], [Latitude], [NID], [IsBlocked], [IsActivated], [Status]) VALUES (N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', 23, N'a1003c2c-9b7b-4315-94ae-c0ea45ed30f3@temp.com', 0, N'AAg9KdDCUPuNyxqQWHYaUHlWhMtQikOk94aaRClFQ8WCVUnVqkI+8rO+/8Wd1f+WtA==', N'92a9fdab-32be-4fd2-9d6e-1b2bdfe6b659', NULL, 0, 0, NULL, 1, 0, N'a1003c2c-9b7b-4315-94ae-c0ea45ed30f3@temp.com', N'ملاواني', N'محمد ', NULL, N'is05:Ee1BpL1', 2, NULL, 10, 88, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, N'/uploads/worker/4baa181f-0d9d-4960-aaf4-260d6935d63f.jpg', 4, NULL, NULL, NULL, NULL, 1, CAST(N'1976-01-01' AS Date), 10, 5, 0, 25, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'مسلم', N'اعزب', NULL, NULL, NULL, CAST(75.00 AS Decimal(18, 2)), CAST(170.00 AS Decimal(18, 2)), 1, NULL, NULL, NULL, NULL, N'https://www.youtube.com/embed/5X5LWcLtkzg', N'ممرض منزلى اجيد التعامل مع كبار السن والاطفال ولدى خبرة اكثر من 20 عام فى مجال التمريض                        
                                                            ', NULL, 0, NULL, 0, CAST(15000.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL, 1, 1, N'متاح')
GO
SET IDENTITY_INSERT [dbo].[AspNetUsers] OFF
GO
SET IDENTITY_INSERT [dbo].[Branches] ON 
GO
INSERT [dbo].[Branches] ([ID], [Name], [Mobile], [OfficeID], [CountryID], [CityID]) VALUES (1, N'فرع جدة 1', N'0666662222', N'a202e4a9-b890-478b-a934-a928a0d2b49f', 9, 20)
GO
INSERT [dbo].[Branches] ([ID], [Name], [Mobile], [OfficeID], [CountryID], [CityID]) VALUES (2, N'فرع البطحة ', N'0562580739', N'13446944-5c9e-4e73-9476-ea90543ccb47', 9, 5)
GO
SET IDENTITY_INSERT [dbo].[Branches] OFF
GO
SET IDENTITY_INSERT [dbo].[City] ON 
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (5, N'الرياض', N'Riyadh', 9, N'24.774265', N'46.738586')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (6, N'مكة المكرمة', N'Makkah', 9, N'21.422510', N'39.826168
')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (7, N'الطائف', N'At Taif', 9, N'21.437273', N'40.512714')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (8, N'تبوك', N'Tabuk', 9, N'28.392151', N'36.57399')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (9, N'حائل', N'Hail', 9, N'27.53414', N'41.69812')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (10, N'بريدة', N'Buraydah', 9, N'26.3298', N'43.9729')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (11, N'الهفوف', N'Al Hufuf', 9, N'25.38039', N'49.565')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (12, N'الدمام', N'Dammam', 9, N'26.43928', N'50.09446')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (13, N'المدينة المنورة', N'Al Madinah', 9, N'24.4676', N'39.605438')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (14, N'ابها', N'Abha', 9, N'18.217051', N'42.499481')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (15, N'جازان', N'Jazan', 9, N'16.89672', N'42.5536')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (16, N'جدة', N'Jeddah', 9, N'21.485811', N'39.192505')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (17, N'المجمعة', N'Al Majmaah', 9, N'25.91474', N'45.36385')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (18, N'الخبر', N'Al Khubar', 9, N'26.313589', N'50.206001')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (19, N'حفر الباطن', N'Hafar Al Batin', 9, N'28.4375', N'45.98047')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (20, N'خميس مشيط', N'Khamis Mushayt', 9, N'18.30628', N'42.71405')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (21, N'القطيف', N'Al Qatif', 9, N'26.56847', N'50.011131')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (22, N'عنيزة', N'Unayzah', 9, N'26.09154', N'43.98764')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (23, N'الجبيل', N'Al Jubail', 9, N'26.95977', N'49.568741')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (24, N'النعيرية', N'An Nuayriyah', 9, N'27.479', N'48.49641')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (25, N'الظهران', N'Dhahran', 9, N'26.3025', N'50.14597')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (26, N'الوجه', N'Al Wajh', 9, N'26.232', N'36.46376')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (27, N'بقيق', N'Buqayq', 9, N'25.94144', N'49.68644')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (28, N'الزلفي', N'Az Zulfi', 9, N'26.29491', N'44.804489')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (29, N'خيبر', N'Khaybar', 9, N'25.68495', N'39.28604')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (30, N'الغاط', N'Al Ghat', 9, N'26.02906', N'44.949211')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (31, N'املج', N'Umluj', 9, N'25.04', N'37.26')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (32, N'رابغ', N'Rabigh', 9, N'22.8', N'39.0333')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (33, N'عفيف', N'Afif', 9, N'23.91', N'42.92028')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (34, N'ثادق', N'Thadiq', 9, N'25.73111102', N'42.84583295')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (35, N'سيهات', N'Sayhat', 9, N'26.478603', N'50.0432')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (36, N'تاروت', N'Tarut', 9, N'21.664019', N'39.157597')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (37, N'ينبع', N'Yanbu', 9, N'24.106188', N'38.02877')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (38, N'شقراء', N'Shaqra', 9, N'21.25555606', N'40.35027794')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (39, N'الدوادمي', N'Ad Duwadimi', 9, N'24.557644', N'44.473484')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (40, N'الدرعية', N'Ad Diriyah', 9, N'24.74833302', N'46.57222199')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (41, N'القويعية', N'Quwayiyah', 9, N'24.07250007', N'45.44333294')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (42, N'المزاحمية', N'Al Muzahimiyah', 9, N'24.476524', N'46.286602')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (43, N'بدر', N'Badr', 9, N'24.54583306', N'46.70805593')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (44, N'الخرج', N'Al Kharj', 9, N'24.16666703', N'47.49999993')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (45, N'الدلم', N'Ad Dilam', 9, N'23.989209', N'47.145381')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (46, N'الشنان', N'Ash Shinan', 9, N'27.186721', N'42.441217')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (47, N'الخرمة', N'Al Khurmah', 9, N'21.934587', N'42.04627')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (48, N'الجموم', N'Al Jumum', 9, N'21.589489', N'39.672906')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (49, N'المجاردة', N'Al Majardah', 9, N'19.11621', N'41.921704')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (50, N'السليل', N'As Sulayyil', 9, N'20.475219', N'45.586055')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (51, N'تثليث', N'Tathilith', 9, N'19.526341', N'43.511595')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (52, N'بيشة', N'Bishah', 9, N'19.99327', N'42.595036')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (53, N'الباحة', N'Al Baha', 9, N'20.028283', N'41.466656')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (54, N'القنفذة', N'Al Qunfidhah', 9, N'19.167377', N'41.068958')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (55, N'محايل', N'Muhayil', 9, N'18.553487', N'42.055943')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (56, N'ثول', N'Thuwal', 9, N'22.309132', N'39.119097')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (57, N'ضبا', N'Duba', 9, N'19.883615', N'40.998568')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (58, N'تربه', N'Turbah', 9, N'21.218857', N'41.636386')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (59, N'صفوى', N'Safwa', 9, N'26.64799', N'49.903531')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (60, N'عنك', N'Inak', 9, N'26.519581', N'50.007356')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (61, N'طريف', N'Turaif', 9, N'31.674572', N'38.693418')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (62, N'عرعر', N'Arar', 9, N'30.947445', N'41.055952')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (63, N'القريات', N'Al Qurayyat', 9, N'31.334358', N'37.34287')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (64, N'سكاكا', N'Sakaka', 9, N'29.901713', N'40.136152')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (65, N'رفحاء', N'Rafha', 9, N'29.630005', N'43.525899')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (66, N'دومة الجندل', N'Dawmat Al Jandal', 9, N'29.812394', N'39.869644')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (67, N'الرس', N'Ar Rass', 9, N'25.863052', N'43.509325')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (68, N'المذنب', N'Al Midhnab', 9, N'25.866331', N'44.218584')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (69, N'الخفجي', N'Al Khafji', 9, N'28.422677', N'48.484003')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (70, N'رياض الخبراء', N'Riyad Al Khabra', 9, N'26.052366', N'43.542465')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (71, N'البدائع', N'Al Badai', 9, N'25.982204', N'43.733313')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (72, N'رأس تنورة', N'Ras Tannurah', 9, N'26.775121', N'50.002478')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (73, N'البكيرية', N'Al Bukayriyah', 9, N'26.159935', N'43.655369')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (74, N'الشماسية', N'Ash Shimasiyah', 9, N'26.318864', N'44.254217')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (75, N'الحريق', N'Al Hariq', 9, N'23.623919', N'46.512658')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (76, N'حوطة بني تميم', N'Hawtat Bani Tamim', 9, N'23.490244', N'46.874422')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (77, N'ليلى', N'Layla', 9, N'22.29083', N'46.720732')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (78, N'بللسمر', N'Billasmar', 9, N'18.79034', N'42.255678')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (79, N'شرورة', N'Sharurah', 9, N'17.487104', N'47.117142')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (80, N'نجران', N'Najran', 9, N'17.562706', N'44.227215')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (81, N'صبيا', N'Sabya', 9, N'17.155019', N'42.626512')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (82, N'ابو عريش', N'Abu Arish', 9, N'16.968354', N'42.846168')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (83, N'صامطة', N'Samtah', 9, N'16.596712', N'42.939569')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (84, N'احد المسارحة', N'Ahad Al Musarihah', 9, N'16.706489', N'42.953495')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (85, N'مدينة الملك عبدالله الاقتصادية', N'King Abdullah Economic City', 9, N'22.44122', N'39.128552')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (86, N'قرية العليا', N'Qaryat Al Ulya', 9, N'27.55615', N'47.69081')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (87, N'احد رفيده', N'Ahad Rifaydah', 9, N'21.59567', N'39.21804')
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (88, N'الإسكندرية', N'Alexandria', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (89, N'الإسماعيلية', N'Ismailia', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (90, N'أسوان', N'Aswan', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (91, N'أسيوط', N'Asyut', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (92, N'الأقصر', N'Luxor', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (93, N'البحر الأحمر', N'The Red Sea', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (94, N'البحيرة', N'Buhaira', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (95, N'بني سويف', N'Bani Sweif', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (96, N'بورسعيد', N'Port Said', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (97, N'جنوب سيناء', N'South of Sinaa', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (98, N'الجيزة', N'Giza', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (99, N'الدقهلية', N'Dakahlia', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (100, N'دمياط', N'Damietta', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (101, N'سوهاج', N'Sohag', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (102, N'السويس', N'Suez', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (103, N'الشرقية', N'Sharkia', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (104, N'شمال سيناء', N'North Sinai', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (105, N'الغربية', N'Gharbiya', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (106, N'الفيوم', N'Fayoum', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (107, N'القاهرة', N'Cairo', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (108, N'القليوبية', N'Qalyubia', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (109, N'قنا', N'qana', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (110, N'كفر الشيخ', N'Kafr El-Sheikh', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (111, N'مطروح', N'Matrouh', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (112, N'المنوفية', N'Menoufia', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (113, N'المنيا', N'Minya', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (114, N'الوادي الجديد', N'New Valley', 10, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (115, N'الفاشر', N'El Fasher', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (116, N'القضارف', N'Gedaref', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (117, N'عطبرة', N'Atbara', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (118, N'بابنوسة', N'Baboon', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (119, N'خرطوم بحري', N'marine hose', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (120, N'دلقو', N'Dalgo', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (121, N'دنقلا', N'Dongola', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (122, N'دمازين', N'Damazin', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (123, N'الدويم', N'Aldoem', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (124, N'الأبيض', N'El abyad', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (125, N'الجنينة', N'El Geneina', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (126, N'كسلا', N'Kassala', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (127, N'الخرطوم', N'Khartoum', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (128, N'كوستي', N'costi', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (129, N'حلفا الجديدة', N'New Halfa', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (130, N'نيالا (مدينة)', N'Nyala', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (131, N'أم درمان', N'Omdurman', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (132, N'بورتسودان', N'Port Sudan', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (133, N'ربك', N'Rabak', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (134, N'سنار', N'snar', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (135, N'شندي', N'Shendi', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (136, N'سواكن', N'Suakin', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (137, N'طابت', N'Tabt', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (138, N'ود مدني', N'Wad Madani', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (139, N'وادي حلفا', N'Wadi Halfa', 11, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (140, N'ألامينوس', N'Alaminos', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (141, N'أنغيليس', N'angeles', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (142, N'أنتيبولو', N'Antipolo', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (143, N'باكولود', N'bacolod', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (144, N'باكور', N'Bakor', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (145, N'باجو', N'baju', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (146, N'باجيو', N'Baguio', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (147, N'بيز', N'Biz', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (148, N'بالانجا', N'Palanga', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (149, N'باتاك', N'Batak', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (150, N'باتانغاس', N'Batangas', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (151, N'باياوان', N'Bayawan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (152, N'بايباي', N'bye Bye', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (153, N'بايوجان', N'Byugan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (154, N'بينان', N'Binan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (155, N'بيسليغ', N'Bisleg', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (156, N'بوغو', N'Pogo', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (157, N'بورونجان', N'Borongan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (158, N'بوتوان', N'Butuan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (159, N'كابابدران', N'cappadran', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (160, N'تشابانتوان', N'Chapantoan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (161, N'كابوياو', N'Capuyao', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (162, N'قادس', N'Cadiz', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (163, N'كاغايان دي  أورور', N'Cagayan de Auror', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (164, N'كالامبا', N'Calamba', 9, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (165, N'كالابان', N'calaban', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (166, N'كالبايوج', N'Calbayog', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (167, N'كالوكان', N'Calokan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (168, N'كاندون', N'candon', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (169, N'كانلاون ', N'canlawn', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (170, N'كاركار', N'Karkar', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (171, N'كاتبالوجان', N'clerk', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (172, N'كاوايان', N'Kauyan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (173, N'مدينة كاويتة', N'Kuwait City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (174, N'مدينة سيبو', N'Cebu City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (175, N'مدينة كوتاباتو', N'Cotabato City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (176, N'داغوبان', N'Dagoban', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (177, N'داناو', N'Danao', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (178, N'دابيتان', N'Dabitan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (179, N'داسماريناس', N'Dasmarinas', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (180, N'دافاو سيتس', N'Davao City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (181, N'ديغوس', N'degus', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (182, N'ديبولوج', N'Dipolog', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (183, N'دوماغويت', N'Dumaguete', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (184, N'سالفادور', N'Salvador', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (185, N'إسكالانتي', N'Escalante', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (186, N'غابان', N'Japan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (187, N'جينيرال سانتوس', N'General Santos', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (188, N'جينيرال ترياس', N'General Trias', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (189, N'غينغون', N'GINGON', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (190, N'غويهولانغان', N'Guihulangan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (191, N'هيمامايلان', N'Himalayan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (192, N'إيلاغان', N'ellagan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (193, N'إيليغان', N'elegan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (194, N'إلويلو سيتي', N'Iloilo City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (195, N'إيموس', N'emus', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (196, N'إيريغا', N'Iriga', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (197, N'إيزابيلا', N'Isabella', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (198, N'كابانكلان', N'Kabanklan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (199, N'كيداباوان', N'Kidapawan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (200, N'كورونادال', N'Coronadal', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (201, N'لا كارلوتا', N'La Carlotta', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (202, N'لاميتان', N'Lamitan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (203, N'لاواغ', N'Laoag', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (204, N'لابو', N'Labo', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (205, N'لاس بيناس', N'Las Pinas', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (206, N'ليغازبي', N'Legazpi', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (207, N'ليغاو', N'lego', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (208, N'ليبا', N'Lipa', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (209, N'ليوسينا', N'leucina', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (210, N'ماسين', N'Massin', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (211, N'مابالاكت', N'mabalact', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (212, N'مكاتي', N'Makati', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (213, N'مالابون', N'Malabon', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (214, N'مالايبالاي', N'malaypalai', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (215, N'مالولوس', N'Malolos', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (216, N'مانالويونغ', N'Manaluyong', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (217, N'مانداوي', N'Mandaue', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (218, N'مانيلا', N'Manila', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (219, N'مارواي', N'Marwai', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (220, N'ماريكينا', N'Marikina', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (221, N'ماسبات سيتي', N'Masbate City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (222, N'ماتي', N'matte', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (223, N'ميكويان', N'Mikoyan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (224, N'مونوز', N'Munoz', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (225, N'مونتنلوبا', N'mountainloba', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (226, N'ناغا', N'naga', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (227, N'نافوتاس', N'Navotas', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (228, N'أولونغابو', N'Olongapo', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (229, N'أورموك', N'Ormoc', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (230, N'أوروكويتا', N'Urukita', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (231, N'أوزاميز', N'Ozamiz', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (232, N'باغاديان', N'Pagadian', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (233, N'بالايان', N'Balayan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (234, N'باندابو', N'Bandabu', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (235, N'باراناك', N'Paranac', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (236, N'باساي', N'Pasay', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (237, N'باسيج', N'pasig', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (238, N'باسي', N'Basi', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (239, N'بويرتو برنسيسا', N'Puerto Princesa', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (240, N' كيزون', N'Quezon', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (241, N'روكساس', N'Roxas', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (242, N'ساجاي', N'sagai', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (243, N'سامال', N'samal', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (244, N'سان كارلوس', N'San Carlos', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (245, N'سان خوسي', N'San Jose', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (246, N'سان خوسيه ديل منوتو', N'San Jose del Menoto', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (247, N'سان خوان', N'San Juan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (248, N'سان بابلو', N'San Pablo', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (249, N'سان بيردو', N'San Purdu', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (250, N'سانتا روزا', N'Santa Rosa', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (251, N'سانتياغو', N'Santiago', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (252, N'سيلالي', N'occlusal', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (253, N'سيبالاي', N'Sipalay', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (254, N'سورسوغون سيتي', N'Sorsogon City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (255, N'سورياغو', N'Soriago', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (256, N'تاباكو', N'tabaco', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (257, N'تابوك', N'tabuk', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (258, N'تاكولبان', N'Takulpan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (259, N'تاكورونغ', N'tacurong', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (260, N'تاغاي تاي', N'Tagaytay', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (261, N'تاغبيلاران', N'Tagbilaran', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (262, N'تاغويغ', N'Taguig', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (263, N'تاغوم', N'Tagum', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (264, N'تاليساي', N'Talisay', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (265, N'تانوان', N'tanwan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (266, N'تانداج', N'tandaj', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (267, N'تانغوب', N'Tangobe', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (268, N'تانجاي', N'Tangay', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (269, N'تارلاك سيتي', N'Tarlac City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (270, N'تاياباس', N'Tayapas', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (271, N'توليدو', N'Toledo', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (272, N'تريس مارتيريس', N'Tres Martires', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (273, N'تيغيغيوراو', N'Tegueguerau', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (274, N'اوردانيتا', N'Urdaneta', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (275, N'فالنسيا', N'Valencia', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (276, N'فالنزويلا', N'Venezuela', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (277, N'فيكتورياس', N'Victorias', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (278, N'فيغان', N'vegan', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (279, N'زامبوانغا سيتي', N'Zamboanga City', 12, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (280, N'نيامي', N'Niamey', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (281, N'مرادي', N'Moradi', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (282, N'زيندر', N'Zinder', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (283, N'طاوة', N'tawa', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (284, N'أجاديز', N'Agadez', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (285, N'أرليت', N'Arlette', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (286, N'بيرني نكوني', N'Bernie Nkoni', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (287, N'دوسو', N'doso', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (288, N'غايا', N'Gaya', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (289, N'تيساوا', N'Tissawa', 13, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (290, N'أندرا پرادش', N'Andhra Pradesh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (291, N'أروناچل پرادش', N'Arunachal Pradesh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (292, N'أسام', N'Assam', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (293, N'بيهار', N'Bihar', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (294, N'چهاتيس‌گره', N'Chhattisgarh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (295, N'گوا', N'Guang', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (296, N'گجرات', N'Gujarat', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (297, N'هاريانا', N'Haryana', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (298, N'هيماچـَل پرادِش', N'Himachal Pradesh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (299, N'جامو وكشمير', N'Jammu and Kashmir', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (300, N'جهارخند', N'Jharkhand', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (301, N'كرناتاكا', N'Karnataka', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (302, N'كرلا', N'kerala', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (303, N'ماديا پرادش', N'Madhya Pradesh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (304, N'مهارشترا', N'Maharashtra', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (305, N'مني‌پور', N'Miniburg', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (306, N'مغلايا', N'Meghalaya', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (307, N'ميزورام', N'Mizoram', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (308, N'ناگالاند', N'Nagaland', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (309, N'أوديشا', N'Odisha', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (310, N'پنجاب', N'Punjab', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (311, N'راجستان', N'Rajasthan', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (312, N'سكم', N'Skeem', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (313, N'تاميل نادو', N'Tamil Nadu', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (314, N'تلنگانة', N'Telangana', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (315, N'تريپورا', N'Tripurag', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (316, N'اوتار پرادش', N'Uttar Pradesh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (317, N'اوتاراخند', N'Uttarakhand', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (318, N'البنغال الغربية', N'West Bengal', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (319, N'أندمان وجزر نيكوبار', N'Andaman and Nicobar Islands', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (320, N'چندي‌گره', N'Chandigarh', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (321, N'ددرة و نگر هولي', N'Dora and Nagar Holi', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (322, N'دمن وديو', N'dam and duo', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (323, N'دلهي', N'Delhi', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (324, N'اكشادويپ', N'Lakshadweep', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (325, N'پودوچري', N'Puducherz', 14, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (326, N'فيصل آباد', N'Faisalabad', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (327, N'كويته', N'Kuwait', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (328, N'كوادر', N'cadres', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (329, N'كراتشي', N'Karachi', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (330, N'لندي كوتال', N'Lindy Kotal', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (331, N'لاهور', N'Lahore', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (332, N'لاركانا', N'Larkana', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (333, N'مينجورا', N'Mingora', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (334, N'ميران شاه', N'Miran Shah', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (335, N'ملتان', N'Multan', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (336, N'مدينة', N'Madina', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (337, N'أبوت آباد', N'Abbottabad', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (338, N'إسلام آباد', N'Islamabad', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (339, N'بيشاور', N'Peshawar', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (340, N'باكستان', N'Pakistan', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (341, N'جوجرانوالا', N'Gujranwala', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (342, N'حيدر آباد (السند)', N'Hyderabad (Sindh)', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (343, N'خوزدار', N'Khuzdar', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (344, N'راولبندي', N'Rawalpindi', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (345, N'سيالكوت', N'Sialkot', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (346, N'سرغودها', N'Sargodha', 15, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (347, N'دكا', N'Dhaka', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (348, N'شيتاغونغ', N'Chittagong', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (349, N'كولنا', N'kolna', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (350, N'نارايانجانج', N'Narayangang', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (351, N'سيلهت', N'Sylhet', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (352, N'تونجي', N'Tonji', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (353, N'راجشاهي', N'Rajshahi', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (354, N'بوجرا', N'Bojra', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (355, N'باريسال', N'Barisal', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (356, N'كوميلا', N'comilla', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (357, N'رانجبور', N'Rangpur', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (358, N'ميمينسينغ', N'Mymensingh', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (359, N'غازيبور', N'Gazipur', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (360, N'جيسور', N'Jessore', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (361, N'ديناجبور', N'Dinajpur', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (362, N'ناوابجانج', N'nawabjang', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (363, N'براهمانباريا', N'Brahmanbariya', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (364, N'كوكس بازار', N'Cox''s Bazar', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (365, N'تانجيل', N'tangel', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (366, N'تشاندبور', N'Chandpur', 16, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (367, N'أروشا', N'Arusha', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (368, N'دار السلام', N'Dar AISalaam', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (369, N'دودوما', N'dodoma', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (370, N'إرنگا', N'eranga', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (371, N'كاگـِرا', N'kakarang', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (372, N'كيگوما', N'Kigoma', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (373, N'كيليمانجارو', N'Kilimanjaro', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (374, N'لندي', N'lindy', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (375, N'مانيارا', N'manyara', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (376, N'مارا', N'Mara', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (377, N'مبيا', N'Mpia', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (378, N'موروگورو', N'Morogoro', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (379, N'متوارا', N'Mtwara', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (380, N'موانزا', N'Mwanza', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (381, N'پمبا الشمالية', N'North Pemba', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (382, N'پمبا الجنوبية', N'South Pemba', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (383, N'پواني', N'poining', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (384, N'روكوا', N'Roqua', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (385, N'روڤوما', N'Rovuma', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (386, N'شينيانگا', N'Shenyang', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (387, N'سنگيدا', N'singed', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (388, N'طابورا', N'Tabora', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (389, N'تانگا', N'Tanga', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (390, N'زنزبار الوسطى/الجنوبية', N'Central/South Zanzibar', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (391, N'زنزبار الشمالية', N'Northern Zanzibar', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (392, N'زنزبار الحضرية/الغربية', N'Urban/Western Zanzibar', 17, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (393, N'أمپارا', N'Amparag', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (394, N'أنوراداپورا', N'Anuradhapura', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (395, N'بادولا', N'Badula', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (396, N'باتيكالوا', N'Batticaloa', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (397, N'كلومبو', N'colombo', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (398, N'گال', N'gal', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (399, N'گامپاها', N'gampah', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (400, N'هامبانتوتا', N'Hambantota', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (401, N'جافنا', N'Jaffna', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (402, N'كالوتارا', N'Kalutara', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (403, N'كاندي', N'Candy', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (404, N'كاگال', N'Kagal', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (405, N'كيلينوچچي', N'Kilinochchi', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (406, N'كورونگالا', N'Kurongala', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (407, N'منار', N'Manar', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (408, N'متال', N'Metal', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (409, N'متارا', N'matara', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (410, N'موناراگالا', N'Munaragala', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (411, N'مولايتيڤو', N'Mullaitivu', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (412, N'نوارا إليا', N'Nuwara Eliya', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (413, N'پولوناروا', N'Polonnaruj', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (414, N'پوتالام', N'Putalam', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (415, N'راتناپورا', N'Ratnapura', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (416, N'ترينكومالي', N'Trincomalee', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (417, N'ڤايونيا', N'Vayonya', 18, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (418, N'باك زانغ', N'Pak Zang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (419, N'باك كان ', N'back can', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (420, N'كاو بانغ', N'Kao Bang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (421, N'ها زانغ ', N'ha zhang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (422, N'لانغ سون', N'Lang Son', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (423, N'فو تاه', N'fu tah', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (424, N'كوانغ ننه', N'Quang Ninh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (425, N'تهاي غوين ', N'Thai Gwyn', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (426, N'توين كوانغ ', N'Twin Kwang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (427, N'لاو كاي', N'Lao Kai', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (428, N'ين باي', N'yen bay', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (429, N'دين بين', N'Din Bin', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (430, N'هوا بنه ', N'Hoa Binh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (431, N'لا تشاو', N'La Chao', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (432, N'سون لا', N'Son La', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (433, N'باك ننه ', N'Buck Ninh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (434, N'ها نام ', N'Ha Nam', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (435, N'هاي ديونغ', N'hye deung', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (436, N'هونغ اين ', N'Hong In', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (437, N'نام دنه', N'Nam Dinh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (438, N'ننه بنه ', N'Ninh Binh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (439, N'تهاي بنه', N'thai binh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (440, N'فين فوك ', N'Vin Fuc', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (441, N'هانوي', N'Hanoi', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (442, N'ها فونغ ', N'Ha Fong', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (443, N'ها تنه ', N'Ha Tinh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (444, N'ني أن', N'ni an', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (445, N'كوانغ بنه', N'Quang Binh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (446, N'كوانغ تشي', N'Kwang Chi', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (447, N'تان هوا ', N'Tan Hua', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (448, N'تهوا تهين هويه ', N'Tahoua', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (449, N'داك لاك ', N'Duck Luck', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (450, N'داك نونغ', N'Dak Nong', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (451, N'زا لاي', N'za ly', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (452, N'كون توم ', N'Kon Tom', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (453, N'لام دونغ ', N'Lam Dong', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (454, N'بنه دنه', N'banh danh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (455, N'بنه توان', N'Binh Tawan', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (456, N'كان هوا ', N'Can Hua', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (457, N'ننه توان ', N'Ninh Toan', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (458, N'فو أين', N'phoen', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (459, N'كوانغ نام', N'kwangnam', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (460, N'كوانغ ناي ', N'Kwang Nae', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (461, N'دا نانغ', N'Da Nang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (462, N'با ريا فنغ تاو', N'Ba Ria Feng Tau', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (463, N'بنه ديونغ ', N'Binh Diong', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (464, N'بنه فوك', N'Binh Phuc', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (465, N'دونغ ناي ', N'Dong Nae', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (466, N'تاي ننه ', N'Tae Ninh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (467, N'هو تشي منه', N'Ho Chi Minh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (468, N'أن زانغ', N'An Xang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (469, N'باك ليو ', N'Buck Leo', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (470, N'بن تشي ', N'Ben Chi', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (471, N'كا ماو ', N'Ka Mao', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (472, N'مدينة دون تاب ', N'Don Tap', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (473, N'هو زانغ ', N'He Zhang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (474, N'كن زانغ', N'Qin Zhang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (475, N'لونغ أن ', N'Long An', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (476, N'سوك تشانغ', N'Seok Chang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (477, N'تين زانغ ', N'Tin Zhang', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (478, N'تشا فينه ', N'Cha Vinh', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (479, N'فين لونغ ', N'Fen Long', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (480, N'كن تاه ', N'Kun lost', 19, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (481, N'نواكشوط', N'Nouakchott', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (482, N'نواديبو', N'Nouadhibou', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (483, N'روصو', N'Rosso', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (484, N'عدل بكرو', N'Adel Bagrou', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (485, N'بوغي', N'Boghé', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (486, N'كيفة', N'Kiffa', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (487, N'الزويرات', N'Zouérat', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (488, N'كيهيدي', N'Kaédi', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (489, N'بوكادوم', N'Boû Gâdoûm', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (490, N'بوتلميت', N'Boutilimit', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (491, N'أطار', N'Atar', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (492, N'برينة', N'Bareina', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (493, N'غابو', N'Ghabou', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (494, N'حمود', N'Hamoud', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (495, N'مال', N'Mâl', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (496, N'نبيكا', N'Nbeika', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (497, N'جوراي', N'Gouraye', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (498, N'تمبدغة', N'Timbedra', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (499, N'مقطع الحجار', N'Magta-Lahjar', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (500, N'كرو', N'Guerou', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (501, N'سودود', N'Soudoud', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (502, N'سيليبابي', N'Sélibaby', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (503, N'فوم ليكليت', N'Voum Legleite', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (504, N'لقصيبة', N'Legceïba', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (505, N'بوصطيلة', N'Boû Steïlé', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (506, N'صنكرافة', N'Sangrave', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (507, N'طينطان', N'Tintane', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (508, N'النعمة', N'Néma', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (509, N'ألاك', N'Aleg', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (510, N'تجكجة', N'Tidjikdja', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (511, N'ولاتة', N'Oualata', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (512, N'العيون', N'Ayoûn el-Atroûs', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (513, N'بابابى', N'Bababé', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (514, N'أكجوجت', N'Akjoujt', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (515, N'شكار', N'Chagar', 20, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (516, N'كامبالا', N'Kampala', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (517, N'غولو', N'Gulu', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (518, N'ليرة', N'lira', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (519, N'مبارارا', N'Mbarara', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (520, N'جينجا', N'jenga', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (521, N'بويزيبويرا', N'Boiseboyra', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (522, N'مبالي', N'Mbale', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (523, N'موكونو', N'Mukono', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (524, N'كاسيس', N'Cassis', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (525, N'ماساكا', N'Masaka', 21, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (526, N'أسمرة', N'Asmara', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (527, N'كرن', N'kern', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (528, N'مصوع', N'Massawa', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (529, N'عصب', N'Assab', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (530, N'مندفيرا', N'Mendefera', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (531, N'بارنتو', N'Barento', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (532, N'عدي قيه', N'Uday Qiah', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (533, N' إد', N'Ed', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (534, N'دقمحري', N'Duqmahri', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (535, N'أغوردات', N'Agordat', 22, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (536, N'أنتاناناريفو', N'Antananarivo', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (537, N'تواماسينا', N'Toamasina', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (538, N'أنتسيرابي', N'Antsirabe', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (539, N'فيانارانتسوا', N'Fianarantswa', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (540, N'ماهاجانجا', N'Mahajanga', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (541, N'توليارا', N'Toliara', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (542, N'أنتسيرانانا', N'Antsiranana', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (543, N'أنتانيفوتسي', N'Antanyfutsy', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (544, N'أمبوفومبي', N'Ambofombia', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (545, N'امبيلوبي', N'Ambilobe', 23, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (546, N'طشقند', N'Tashkent', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (547, N'أنديجان', N'Andijan', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (548, N'بخارى', N'Bukhara', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (549, N'فرغانة', N'Ferghana', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (550, N'جيزك', N'JIZK', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (551, N'نمنغان', N'Namangan', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (552, N'نواوي', N'Nawawi', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (553, N'قشقداريا', N'Qashqedaria', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (554, N'سمرقند', N'Samarkand', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (555, N'سرداريا', N'Sardaria', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (556, N'صرخنداريا', N'Sarkandaria', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (557, N'خوارزم', N'Khwarazm', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (558, N'قرقل باغستان', N'qarqal pakstan', 24, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (559, N'بنوم بنه', N'Phnom Penh', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (560, N'تاكيو', N'takeo', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (561, N'سفاي رينغ', N'Svy Ring', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (562, N'ستونغ ترينغ', N'Stung Tring', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (563, N'سيام ريب', N'Siem Reap', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (564, N'راتاناكيري', N'Ratanakiri', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (565, N'بري فينغ', N'Prey Feng', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (566, N'بورسات', N'Borsat', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (567, N'بريا فيار', N'Priya Viar', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (568, N'سيانوكفيل', N'cyanophilic', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (569, N'بايلين', N'Bailin', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (570, N'اودار ميا نتشياي', N'Odar Mia Nchiayi', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (571, N'موندولكيري', N'Mondulkiri', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (572, N'كراتييه', N'karate', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (573, N'كو كونغ', N'Ko Kong', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (574, N'كِب', N'cup', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (575, N'كاندال', N'kandal', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (576, N'كامبوت', N'Kampot', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (577, N'كامبونغ توم', N'kampong tom', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (578, N'كامبونغ سبو', N'Kampong Sp', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (579, N'كامبونغ تشينانغ', N'Kampong Chenang', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (580, N'كامبونغ تشام', N'kampong cham', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (581, N'باتامبانغ', N'Battambang', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (582, N'بانتياي مينتشي', N'Pantai Menchi', 25, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (583, N'باماكو', N'Bamako', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (584, N'سيكاسو', N'sicasu', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (585, N'كالبانكرو', N'Calpancro', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (586, N'كوتيالا', N'Kotiala', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (587, N'سيكو', N'sico', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (588, N'كايس', N'Case', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (589, N'كاتي', N'Katie', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (590, N'موبتي', N'Mopti', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (591, N'نيونو', N'neon', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (592, N'غاو', N'gao', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (593, N'سان', N'San', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (594, N'كورو', N'koro', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (595, N'بلا', N'pla', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (596, N'بوغوني', N'begoni', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (597, N'ماندي', N'mandy', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (598, N'مخيم باغويندا', N'Baguinda camp', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (599, N'كولونديبا', N'kolundipa', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (600, N'كولوكاني', N'Kolokany', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (601, N'بيلينغانا', N'Bilingana', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (602, N'تمبكتو', N'Timbuktu', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (603, N'وري', N'Lori', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (604, N'ماسيغوي', N'masegwe', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (605, N'تونكا', N'Tonka', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (606, N'كاديولو', N'kadiolu', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (607, N'واسولو بال', N'Wassolo', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (608, N'كالادوغو', N'Caladogo', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (609, N'كومانتو', N'Komanto', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (610, N'ويليسيبوغو', N'Willispogo', 26, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (611, N'جوهانسبرغ', N'Johannesburg', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (612, N'كيب تاون', N'Cape town', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (613, N'ديربان', N'Durban', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (614, N'بريتوريا', N'Pretoria', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (615, N'بورت إليزابيث', N'Port Elizabeth', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (616, N'سوشانغوف', N'Sochangov', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (617, N'إيفاتون', N'Evaton', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (618, N'بيترماريتزبرغ', N'Pietermaritzburg', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (619, N'بلومفونتين', N'Bloemfontein', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (620, N'فيرينيجينغ', N'Firinging', 27, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (621, N'نيروبي', N'Nairobi', 28, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (622, N'مومباسا', N'Mombasa', 28, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (623, N'كيسومو', N'Kisumu', 28, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (624, N'ناكورو', N'Nakuru', 28, NULL, NULL)
GO
INSERT [dbo].[City] ([ID], [NameAR], [NameEN], [CountryID], [Latitude], [Longitude]) VALUES (625, N'إلدوريت', N'Eldoret', 28, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[City] OFF
GO
SET IDENTITY_INSERT [dbo].[Contact] ON 
GO
INSERT [dbo].[Contact] ([ID], [Facebook], [Twitter], [Youtube], [LinkedIn], [Instagram], [Phone], [Mobile], [Address], [Email], [MAP]) VALUES (1, N'#', N'#', N'#', N'#', N'#', N'00966557774426', NULL, N' الصحافة - الرياض -  المملكة العربية السعودية', N'info@marofh.com', N'https://maps.google.com/maps?hl=en&amp;q=Dhaka+()&amp;ie=UTF8&amp;t=&amp;z=10&amp;iwloc=B&amp;output=embed')
GO
SET IDENTITY_INSERT [dbo].[Contact] OFF
GO
SET IDENTITY_INSERT [dbo].[ContactUsMessages] ON 
GO
INSERT [dbo].[ContactUsMessages] ([ID], [Name], [From], [Message], [IsRead]) VALUES (1, N'فتحى توفيق ', N'f.tewfiq@gmail.com', N'بسم الله الرحمن الرحيم  ', 1)
GO
INSERT [dbo].[ContactUsMessages] ([ID], [Name], [From], [Message], [IsRead]) VALUES (2, N'فتحى توفيق ', N'f.tewfiq@gmail.com', N'بسم الله الرحمن الرحيم  ', 1)
GO
INSERT [dbo].[ContactUsMessages] ([ID], [Name], [From], [Message], [IsRead]) VALUES (7, NULL, NULL, NULL, 0)
GO
SET IDENTITY_INSERT [dbo].[ContactUsMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[Country] ON 
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (9, N' السعودية', N'Saudi Arabia')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (10, N'مصر', N'Egypt')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (11, N'السودان', N'Sudan')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (12, N'الفلبين', N'Philippines')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (13, N'النيجر', N'Niger')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (14, N'الهند', N'India')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (15, N'باكستان', N'Pakistan')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (16, N'بنجلاديش', N'Bangladesh')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (17, N'تنزانيا', N'Tanzania')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (18, N'سري لنكا', N'Sri Lanka')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (19, N'فيتنام', N'Vietnam')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (20, N'موريتانيا', N'Mauritania')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (21, N'اوغندة', N'Uganda')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (22, N'ارتيريا', N'Eritrea')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (23, N'مدغشقر', N'Madagascar')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (24, N'ازبكستان', N'Uzbekistan')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (25, N'كمبوديا', N'Cambodia')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (26, N'مالي', N'Mali')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (27, N'جنوب افريقيا', N'South Africa')
GO
INSERT [dbo].[Country] ([ID], [NameAR], [NameEN]) VALUES (28, N'كينيا', N'Kenya')
GO
SET IDENTITY_INSERT [dbo].[Country] OFF
GO
SET IDENTITY_INSERT [dbo].[District] ON 
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1, N'حي الزهراء', N'حي الزهراء', 5, N'24.686354000000001', N'46.730117999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (2, N'حي الصفا', N'حي الصفا', 5, N'24.669505000000001', N'46.767634999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (3, N'حي الضباط', N'حي الضباط', 5, N'24.675957', N'46.722003000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (4, N'حي الملز', N'حي الملز', 5, N'24.662388', N'46.731425000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (5, N'حي الوزارات', N'حي الوزارات', 5, N'24.674372999999999', N'46.715015000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (6, N'حي الفاروق', N'حي الفاروق', 5, N'24.657319999999999', N'46.775486000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (7, N'حي العمل', N'حي العمل', 5, N'24.640831925261399', N'46.734853501449102')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (8, N'حي ثليم', N'حي ثليم', 5, N'24.641342000000002', N'46.728298000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (9, N'حي المربع', N'حي المربع', 5, N'24.662572999999998', N'46.705916999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (10, N'حي الفوطة', N'حي الفوطة', 5, N'24.641206', N'46.711402999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (11, N'حي الرفيعة', N'حي الرفيعة', 5, N'24.639281', N'46.662410000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (12, N'حي الهدا', N'حي الهدا', 5, N'24.456807999999999', N'46.270434000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (13, N'حي الشرقية', N'حي الشرقية', 5, N'24.659806', N'46.669134999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (14, N'حي الناصرية', N'حي الناصرية', 5, N'24.650742000000001', N'46.679281000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (15, N'حي صياح', N'حي صياح', 5, N'24.606556999999999', N'46.702831000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (16, N'حي الوشام', N'حي الوشام', 5, N'24.642581', N'46.698566')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (17, N'حي النموذجية', N'حي النموذجية', 5, N'24.654876000000002', N'46.694164999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (18, N'حي المعذر', N'حي المعذر', 5, N'24.667988999999999', N'46.675122999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (19, N'حي المؤتمرات', N'حي المؤتمرات', 5, N'24.66939', N'46.685380000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (20, N'حي البديعة', N'حي البديعة', 5, N'24.593225', N'46.668771')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (21, N'حي أم سليم', N'حي أم سليم', 5, N'24.634513999999999', N'46.699027000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (22, N'حي الشميسي', N'حي الشميسي', 5, N'24.627521000000002', N'46.698706999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (23, N'حي الجرادية', N'حي الجرادية', 5, N'24.615812999999999', N'46.698295000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (24, N'حي الفاخرية', N'حي الفاخرية', 5, N'24.641812000000002', N'46.680672000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (25, N'حي عليشة', N'حي عليشة', 5, N'24.632186000000001', N'46.684474000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (26, N'هجرة وادي لبن', N'هجرة وادي لبن', 5, N'24.628893000000001', N'46.616053999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (27, N'حي العريجاء', N'حي العريجاء', 5, N'24.592841', N'46.599473000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (28, N'حي العريجاء الوسطى', N'حي العريجاء الوسطى', 5, N'24.609587999999999', N'46.641357999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (29, N'حي العريجاء الغربية', N'حي العريجاء الغربية', 5, N'24.599748000000002', N'46.604717999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (30, N'حي الدريهمية', N'حي الدريهمية', 5, N'24.591037', N'46.668621999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (31, N'حي شبرا', N'حي شبرا', 5, N'24.580925000000001', N'46.672839000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (32, N'حي السويدي', N'حي السويدي', 5, N'24.592638000000001', N'46.664248000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (33, N'حي السويدي الغربي', N'حي السويدي الغربي', 5, N'24.573556', N'46.620240000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (34, N'حي ظهرة البديعة', N'حي ظهرة البديعة', 5, N'24.600372', N'46.650041000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (35, N'حي سلطانة', N'حي سلطانة', 5, N'24.605340000000002', N'46.689683000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (36, N'حي الزهرة', N'حي الزهرة', 5, N'24.578738999999999', N'46.644091000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (37, N'حي ظهرة نمار', N'حي ظهرة نمار', 5, N'24.558520000000001', N'46.622250000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (38, N'حي ديراب', N'حي ديراب', 5, N'24.517033999999999', N'46.619224000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (39, N'حي نمار', N'حي نمار', 5, N'24.576640999999999', N'46.688574000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (40, N'حي الحزم', N'حي الحزم', 5, N'24.529993999999999', N'46.645696999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (41, N'حي أحد', N'حي أحد', 5, N'24.492601000000001', N'46.633429999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (42, N'حي عكاظ', N'حي عكاظ', 5, N'24.510981000000001', N'46.660961999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (43, N'حي الشفاء', N'حي الشفاء', 5, N'24.565837999999999', N'46.691561')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (44, N'حي المروة', N'حي المروة', 5, N'24.538339000000001', N'46.674056')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (45, N'حي بدر', N'حي بدر', 5, N'24.662715885696901', N'46.877224476864498')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (46, N'حي المصانع', N'حي المصانع', 5, N'24.560237999999998', N'46.754244999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (47, N'حي المنصورية', N'حي المنصورية', 5, N'24.608854000000001', N'46.742780000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (48, N'حي عريض', N'حي عريض', 5, N'24.429832999999999', N'46.743461000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (49, N'حي العماجية', N'حي العماجية', 5, N'24.447448000000001', N'46.984765000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (50, N'حي خشم العان', N'حي خشم العان', 5, N'24.681332999999999', N'46.89311')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (51, N'حي الدفاع', N'حي الدفاع', 5, N'24.588550000000001', N'46.832842999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (52, N'حي المناخ', N'حي المناخ', 5, N'24.612113999999998', N'46.799084999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (53, N'حي السلي', N'حي السلي', 5, N'24.647508999999999', N'46.848927000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (54, N'حي النور (الرياض)', N'حي النور (الرياض)', 5, N'24.633970999999999', N'46.819476000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (55, N'حي الإسكان', N'حي الإسكان', 5, N'24.572258999999999', N'46.844515000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (56, N'حي الصناعية الجديدة', N'حي الصناعية الجديدة', 5, N'24.540355000000002', N'46.910665000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (57, N'حي الفيحاء', N'حي الفيحاء', 5, N'24.682984999999999', N'46.812089999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (58, N'حي الجزيرة', N'حي الجزيرة', 5, N'24.080538000000001', N'45.287013000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (59, N'حي السعادة', N'حي السعادة', 5, N'24.695007', N'46.835737999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (60, N'حي هيت', N'حي هيت', 5, N'24.478701999999998', N'46.982213000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (61, N'حي البرية', N'حي البرية', 5, N'24.560721000000001', N'46.959043000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (62, N'حي المشاعل', N'حي المشاعل', 5, N'24.614819000000001', N'46.878787000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (63, N'حي العليا', N'حي العليا', 5, N'24.700647', N'46.683743')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (64, N'حي السليمانية', N'حي السليمانية', 5, N'24.702195', N'46.714084999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (65, N'حي الملك عبد العزيز', N'حي الملك عبد العزيز', 5, N'24.716273999999999', N'46.725203')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (66, N'حي الملك عبد الله', N'حي الملك عبد الله', 5, N'24.739457000000002', N'46.740296000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (67, N'حي الورود', N'حي الورود', 5, N'24.064753', N'45.298220999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (68, N'حي صلاح الدين', N'حي صلاح الدين', 5, N'24.735963000000002', N'46.701132999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (69, N'حي الملك فهد', N'حي الملك فهد', 5, N'23.533843999999998', N'45.530648999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (70, N'حي المرسلات', N'حي المرسلات', 5, N'24.749034999999999', N'46.690024999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (71, N'حي النزهة', N'حي النزهة', 5, N'22.006893999999999', N'39.366667')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (72, N'حي المغرزات', N'حي المغرزات', 5, N'24.765197000000001', N'46.727896000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (73, N'حي المروج', N'حي المروج', 5, N'26.275932999999998', N'43.983874')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (74, N'حي المصيف', N'حي المصيف', 5, N'24.763303000000001', N'46.680118999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (75, N'حي التعاون', N'حي التعاون', 5, N'24.771508000000001', N'46.700136000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (76, N'حي الإزدهار', N'حي الإزدهار', 5, N'24.782423000000001', N'46.718645000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (77, N'حي المعذر', N'حي المعذر', 5, N'24.668067000000001', N'46.675457000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (78, N'حي المحمدية', N'حي المحمدية', 5, N'24.735253', N'46.653446000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (79, N'حي الرحمانية', N'حي الرحمانية', 5, N'24.719156999999999', N'46.660429999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (80, N'حي الرائد', N'حي الرائد', 5, N'24.706277', N'46.639505')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (81, N'حي النخيل', N'حي النخيل', 5, N'24.748995000000001', N'46.630758')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (82, N'حي أم الحمام الشرقي', N'حي أم الحمام الشرقي', 5, N'24.687222999999999', N'46.655887999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (83, N'حي أم الحمام الغربي', N'حي أم الحمام الغربي', 5, N'24.691427000000001', N'46.643388999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (84, N'حي السفارات', N'حي السفارات', 5, N'24.679037000000001', N'46.620269999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (85, N'حي المهدية', N'حي المهدية', 5, N'24.655709999999999', N'46.512635000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (86, N'حي عرقة', N'حي عرقة', 5, N'24.691041999999999', N'46.591033000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (87, N'حي ظهرة لبن', N'حي ظهرة لبن', 5, N'24.633502', N'46.544061999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (88, N'حي الخزامى', N'حي الخزامى', 5, N'24.716649', N'46.593029999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (89, N'حي النسيم الشرقي', N'حي النسيم الشرقي', 5, N'24.738223000000001', N'46.844762000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (90, N'حي النسيم الغربي', N'حي النسيم الغربي', 5, N'24.730632', N'46.818137')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (91, N'حي السلام', N'حي السلام', 5, N'24.706897999999999', N'46.811788999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (92, N'حي الريان', N'حي الريان', 5, N'24.713799999999999', N'46.778056999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (93, N'حي الروابي', N'حي الروابي', 5, N'24.697443', N'46.787120000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (94, N'حي النظيم', N'حي النظيم', 5, N'24.867439000000001', N'46.975887')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (95, N'حي المنار', N'حي المنار', 5, N'24.725722000000001', N'46.799540999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (96, N'حي الندوة', N'حي الندوة', 5, N'24.802156', N'46.897447')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (97, N'حي جرير', N'حي جرير', 5, N'24.679161000000001', N'46.749806')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (98, N'حي الربوة', N'حي الربوة', 5, N'24.699241000000001', N'46.755498000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (99, N'حي الربيع', N'حي الربيع', 5, N'24.798169999999999', N'46.663372000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (100, N'حي الندى', N'حي الندى', 5, N'24.807307999999999', N'46.682977000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (101, N'حي الصحافة', N'حي الصحافة', 5, N'24.8034', N'46.638030000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (102, N'حي النرجس', N'حي النرجس', 5, N'24.898959000000001', N'46.63973')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (103, N'حي العارض', N'حي العارض', 5, N'24.911883', N'46.594822999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (104, N'حي النفل', N'حي النفل', 5, N'24.781717', N'46.672651000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (105, N'حي العقيق', N'حي العقيق', 5, N'24.777059999999999', N'46.627961999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (106, N'حي الوادي', N'حي الوادي', 5, N'24.788965000000001', N'46.69191')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (107, N'حي الغدير', N'حي الغدير', 5, N'24.775341000000001', N'46.654780000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (108, N'حي الياسمين', N'حي الياسمين', 5, N'24.828388', N'46.645459000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (109, N'حي الفلاح', N'حي الفلاح', 5, N'24.797436999999999', N'46.708353000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (110, N'حي بنبان', N'حي بنبان', 5, N'25.004162000000001', N'46.524827999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (111, N'حي القيروان', N'حي القيروان', 5, N'24.881841000000001', N'46.565044')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (112, N'حي حطين', N'حي حطين', 5, N'24.7666', N'46.601016999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (113, N'حي الملقا', N'حي الملقا', 5, N'24.800681000000001', N'46.594392999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (114, N'حي الروضة', N'حي الروضة', 5, N'24.735119000000001', N'46.766348999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (115, N'حي الرمال', N'حي الرمال', 5, N'24.906300000000002', N'46.818840000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (116, N'حي المونسية', N'حي المونسية', 5, N'24.834672999999999', N'46.768610000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (117, N'حي قرطبة', N'حي قرطبة', 5, N'24.815673', N'46.736055999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (118, N'حي الجنادرية', N'حي الجنادرية', 5, N'24.885463999999999', N'46.917802000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (119, N'حي القادسية', N'حي القادسية', 5, N'24.822749999999999', N'46.819901000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (120, N'حي اليرموك', N'حي اليرموك', 5, N'24.808807999999999', N'46.784179000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (121, N'حي غرناطة', N'حي غرناطة', 5, N'24.793748000000001', N'46.743926000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (122, N'حي أشبيلية', N'حي أشبيلية', 5, N'24.793913', N'46.790683999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (123, N'حي الحمراء', N'حي الحمراء', 5, N'24.777073999999999', N'46.751542999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (124, N'حي المعيزلية', N'حي المعيزلية', 5, N'24.797971', N'46.842270999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (125, N'حي الخليج', N'حي الخليج', 5, N'24.776876999999999', N'46.801484000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (126, N'حي الملك فيصل', N'حي الملك فيصل', 5, N'24.764011', N'46.776234000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (127, N'حي القدس', N'حي القدس', 5, N'24.755596000000001', N'46.754539000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (128, N'حي النهضة', N'حي النهضة', 5, N'24.763372', N'46.816240000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (129, N'حي الأندلس', N'حي الأندلس', 5, N'24.742705000000001', N'46.785732000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (130, N'حي الدوبية', N'حي الدوبية', 5, N'24.621625999999999', N'46.711734')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (131, N'حي البطحاء', N'حي البطحاء', 5, N'24.621707000000001', N'46.720162000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (132, N'حي القرى', N'حي القرى', 5, N'24.628214', N'46.715975999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (133, N'حي الصناعية', N'حي الصناعية', 5, N'24.641096000000001', N'46.746574000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (134, N'حي الوسيطاء', N'حي الوسيطاء', 5, N'24.624109000000001', N'46.715854999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (135, N'حي معكال', N'حي معكال', 5, N'24.622626', N'46.714365999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (136, N'حي الفيصلية', N'حي الفيصلية', 5, N'24.637732', N'46.778621999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (137, N'حي منفوحة', N'حي منفوحة', 5, N'24.600344', N'46.728492000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (138, N'حي المنصورة', N'حي المنصورة', 5, N'24.60671', N'46.745683')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (139, N'حي اليمامة', N'حي اليمامة', 5, N'24.597684999999998', N'46.716402000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (140, N'حي سلام', N'حي سلام', 5, N'24.622223999999999', N'46.708629000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (141, N'حي جبرة', N'حي جبرة', 5, N'24.625748999999999', N'46.718474000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (142, N'حي عتيقة', N'حي عتيقة', 5, N'24.600894', N'46.707053999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (143, N'حي غبيراء', N'حي غبيراء', 5, N'24.620875999999999', N'46.736700999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (144, N'حي البطيحا', N'حي البطيحا', 5, N'24.561997999999999', N'46.639118000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (145, N'حي الخالدية', N'حي الخالدية', 5, N'24.625589000000002', N'46.755837')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (146, N'حي الديرة', N'حي الديرة', 5, N'24.633469000000002', N'46.710680000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (147, N'حي العود', N'حي العود', 5, N'24.627987000000001', N'46.727620000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (148, N'حي المرقب', N'حي المرقب', 5, N'24.636683000000001', N'46.722650000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (149, N'حي منفوحة الجديدة', N'حي منفوحة الجديدة', 5, N'24.612437', N'46.718389000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (150, N'حي العزيزية', N'حي العزيزية', 5, N'24.590713000000001', N'46.771174000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (151, N'حي طيبة[10]', N'حي طيبة[10]', 5, N'24.54618', N'46.827803000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (152, N'حي المصفاة', N'حي المصفاة', 5, N'24.520334999999999', N'46.864443000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (153, N'حي الدار البيضاء', N'حي الدار البيضاء', 5, N'24.569465999999998', N'46.794994000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (154, N'حي الحاير', N'حي الحاير', 5, N'24.441737', N'46.849108999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (155, N'حي الغنامية', N'حي الغنامية', 5, N'24.485489000000001', N'46.831924000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (156, N'الزاهر ', N'الزاهر ', 6, N'21.448989000000001', N'39.795834999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (157, N'الحفاير ', N'الحفاير ', 6, N'21.275089999999999', N'42.961601000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (158, N'العوالي', N'العوالي', 6, N'21.310378', N'39.937199')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (159, N'الهجرة ', N'الهجرة ', 6, N'21.376352000000001', N'39.856611999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (160, N'الشبيكة ', N'الشبيكة ', 6, N'21.419540999999999', N'39.820951999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (161, N'أجياد', N'أجياد', 6, N'21.418398', N'39.830885000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (162, N'الشامية', N'الشامية', 6, N'21.840916', N'39.519871000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (163, N'السليمانية', N'السليمانية', 6, N'21.432202', N'39.834193999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (164, N'المسفلة', N'المسفلة', 6, N'21.4055', N'39.824157')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (165, N'حارة الكدوة', N'حارة الكدوة', 6, N'18.641707', N'41.310949000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (166, N'الجودرية', N'الجودرية', 6, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (167, N'القشلة', N'القشلة', 6, N'21.430032076841599', N'39.809896161124897')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (168, N'ملقية', N'ملقية', 6, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (169, N'النقا', N'النقا', 6, N'21.430209999999999', N'39.825161000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (170, N'الراقوبة', N'الراقوبة', 6, N'21.445773543827499', N'39.814295480625702')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (171, N'جرول', N'جرول', 6, N'21.431163999999999', N'39.819321000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (172, N'حارة الباب', N'حارة الباب', 6, N'21.424996', N'39.819488')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (173, N'شعب عامر', N'شعب عامر', 6, N'21.427219000000001', N'39.832980999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (174, N'القرارة', N'القرارة', 6, N'21.430098999999998', N'39.825125')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (175, N'المعابدة', N'المعابدة', 6, N'21.436885', N'39.846319999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (176, N'سوق الليل', N'سوق الليل', 6, N'17.666955773020799', N'41.632906162294603')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (177, N'القشاشية', N'القشاشية', 6, N'21.575903373253499', N'39.175929532194601')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (178, N'المعلاة', N'المعلاة', 6, N'21.4353771796807', N'39.828748514676199')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (179, N'الخالدية', N'الخالدية', 6, N'21.402508000000001', N'39.799433999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (180, N'وادي جليل', N'وادي جليل', 6, N'21.490563000000002', N'39.852691')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (181, N'الكعكية', N'الكعكية', 6, N'21.379041000000001', N'39.812274000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (182, N'بطحاء قريش', N'بطحاء قريش', 6, N'21.355682999999999', N'39.837856000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (183, N'برحة الرشيدي', N'برحة الرشيدي', 6, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (184, N'الشافعي', N'الشافعي', 6, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (185, N'السبهاني', N'السبهاني', 6, N'21.359983881146999', N'39.786283289371802')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (186, N'ساحة إسلام ', N'ساحة إسلام ', 6, N'21.435924', N'39.805532999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (187, N'الشرائع', N'الشرائع', 6, N'21.500230999999999', N'39.920546999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (188, N'العتيبية', N'العتيبية', 6, N'21.452522999999999', N'39.817354000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (189, N'الحجون', N'الحجون', 6, N'21.436810999999999', N'39.820180999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (190, N'الشوقيه', N'الشوقيه', 6, N'21.384906000000001', N'39.799407000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (191, N'الشرايع', N'الشرايع', 6, N'21.498984', N'39.920212999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (192, N'الخضراء', N'الخضراء', 6, N'21.444019999999998', N'39.956437000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (193, N'الحمراء', N'الحمراء', 6, N'21.423718999999998', N'39.771326000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (194, N'العزيزيه', N'العزيزيه', 6, N'21.417280999999999', N'39.853332000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (195, N'الكعكيه', N'الكعكيه', 6, N'21.382709999999999', N'39.814610999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (196, N'الهنداويه', N'الهنداويه', 6, N'21.415828000000001', N'39.800145000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (197, N'الروضة', N'الروضة', 6, N'21.428241', N'39.850411999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (198, N'النزهة', N'النزهة', 6, N'21.539408000000002', N'39.642462000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (199, N'السداد', N'السداد', 7, N'21.229050000000001', N'40.413297')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (200, N'مسره', N'مسره', 7, N'21.301051000000001', N'40.408324')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (201, N'المثناه', N'المثناه', 7, N'21.262307', N'40.383240000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (202, N'عودة', N'عودة', 7, N'21.252153', N'40.395149000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (203, N'الوهط', N'الوهط', 7, N'21.234259000000002', N'40.357925999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (204, N'القمرية', N'القمرية', 7, N'21.278016999999998', N'40.429541999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (205, N'مخطط بدر', N'مخطط بدر', 7, N'21.439789000000001', N'40.480158000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (206, N'بن باين', N'بن باين', 7, N'21.440778999999999', N'40.475355999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (207, N'مخطط الدهاس', N'مخطط الدهاس', 7, N'21.448830999999998', N'40.507644999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (208, N'وادي ديرة', N'وادي ديرة', 7, N'21.207463000000001', N'40.626711999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (209, N'الحمادين', N'الحمادين', 7, N'21.209178999999999', N'40.594453000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (210, N'الخالدية', N'الخالدية', 7, N'21.288080000000001', N'40.386118000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (211, N'قروى', N'قروى', 7, N'21.274128000000001', N'40.380803')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (212, N'شبرا', N'شبرا', 7, N'21.281794999999999', N'40.415104999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (213, N'الوسام', N'الوسام', 7, N'21.221622', N'40.376548')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (214, N'الجال', N'الجال', 7, N'21.291618500928401', N'40.435010873968103')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (215, N'الريان', N'الريان', 7, N'21.284558000000001', N'40.422275999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (216, N'العقيق', N'العقيق', 7, N'21.287185999999998', N'40.408507')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (217, N'الرميدة', N'الرميدة', 7, N'21.357406000000001', N'40.559097999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (218, N'مخطط البيعة', N'مخطط البيعة', 7, N'21.283073000000002', N'40.441904000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (219, N'حوايا', N'حوايا', 7, N'21.265236999999999', N'40.412291000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (220, N'مخطط البساتين', N'مخطط البساتين', 7, N'21.443676', N'40.481375999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (221, N'لقطبية', N'لقطبية', 7, N'21.282708', N'40.444434000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (222, N'الشرقية', N'الشرقية', 7, N'21.274457000000002', N'40.416468999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (223, N'بدر', N'بدر', 7, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (224, N'البيعة', N'البيعة', 7, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (225, N'الدهاس', N'الدهاس', 7, N'21.449021999999999', N'40.507055999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (226, N'الامام تركي بن عبدالله', N'الامام تركي بن عبدالله', 7, N'21.436289479229099', N'40.459049618703503')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (227, N'جليل', N'جليل', 7, N'21.401236999999998', N'40.605316999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (228, N'الفيصلية', N'الفيصلية', 7, N'21.307642999999999', N'40.423689000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (229, N'الوكيف', N'الوكيف', 7, N'21.224038', N'40.341951999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (230, N'الشهداء الجنوبية', N'الشهداء الجنوبية', 7, N'21.260028999999999', N'40.422463999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (231, N'الوشحاء', N'الوشحاء', 7, N'21.251809000000002', N'40.433503999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (232, N'شهار', N'شهار', 7, N'21.251823999999999', N'40.411596000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (233, N'معشي', N'معشي', 7, N'21.285587', N'40.400438999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (234, N'الوسام', N'الوسام', 7, N'21.220683999999999', N'40.377737000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (235, N'مخطط بن باين', N'مخطط بن باين', 7, N'21.440308000000002', N'40.475786999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (236, N'الشرفية', N'الشرفية', 7, N'21.360855999999998', N'40.417929999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (237, N'الجال', N'الجال', 7, N'21.293296000000002', N'40.436017999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (238, N'المهلب بن صفرة', N'المهلب بن صفرة', 7, N'21.266102142745702', N'40.432794615009698')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (239, N'الطويرات', N'الطويرات', 7, N'21.209499000000001', N'40.596933999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (240, N'جبرة', N'جبرة', 7, N'21.301907', N'40.452514000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (241, N'القطبية', N'القطبية', 7, N'21.282032999999998', N'40.444167999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (242, N'ام العراد', N'ام العراد', 7, N'21.246741', N'40.406916000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (243, N'العزيزية', N'العزيزية', 7, N'21.280228999999999', N'40.407778999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (244, N'الوكف', N'الوكف', 7, N'21.217379000000001', N'40.340715000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (245, N'نخب', N'نخب', 7, N'21.254894', N'40.454555999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (246, N'حي قرطبة', N'حي قرطبة', 8, N'28.3928313475582', N'36.596785101361498')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (247, N'حي الأخضر', N'حي الأخضر', 8, N'28.361093798647499', N'36.510406501916698')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (248, N'حي النزهة الصناعي ', N'حي النزهة الصناعي ', 8, N'28.384523000000002', N'36.546477000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (249, N'حي الروضة ', N'حي الروضة ', 8, N'28.405044', N'36.522368999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (250, N'حي المصيف', N'حي المصيف', 8, N'28.447431999999999', N'36.533683000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (251, N'حي الفيصلية الشمالية', N'حي الفيصلية الشمالية', 8, N'28.406203999999999', N'36.551389')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (252, N'حي العزيزية الجديدة ', N'حي العزيزية الجديدة ', 8, N'28.384129999999999', N'36.573132999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (253, N'مغيضة', N'مغيضة', 9, N'27.528735999999999', N'41.717078000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (254, N'النسية', N'النسية', 9, N'27.627189000000001', N'41.693753000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (255, N'الوسيطاء', N'الوسيطاء', 9, N'26.704708', N'41.719760999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (256, N'المنتزه الغربي', N'المنتزه الغربي', 9, N'27.549282000000002', N'41.682487999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (257, N'السويفلة', N'السويفلة', 9, N'27.600373999999999', N'41.762132999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (258, N'الرصف', N'الرصف', 9, N'27.445374999999999', N'41.616545000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (259, N'البدنة', N'البدنة', 9, N'27.454225999999998', N'41.713697000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (260, N'البحيرة', N'البحيرة', 9, N'27.485523000000001', N'41.698428999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (261, N'صبابة', N'صبابة', 9, N'27.522304999999999', N'41.647438999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (262, N'سماح', N'سماح', 9, N'27.519552000000001', N'41.698770000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (263, N'المحطة', N'المحطة', 9, N'27.517923', N'41.689193000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (264, N'المزعبر', N'المزعبر', 9, N'27.532558999999999', N'41.705247')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (265, N'العزيزية', N'العزيزية', 9, N'27.167026', N'43.411883000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (266, N'السمراء', N'السمراء', 9, N'27.496417999999998', N'41.719043999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (267, N'الخماشية', N'الخماشية', 9, N'27.476946999999999', N'41.716383999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (268, N'المطار', N'المطار', 9, N'27.497928999999999', N'41.690744000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (269, N'برزان', N'برزان', 9, N'27.525645000000001', N'41.702835999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (270, N'الوادي', N'الوادي', 9, N'27.488952999999999', N'41.699191999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (271, N'المنتزه الشرقي', N'المنتزه الشرقي', 9, N'27.546253', N'41.712336999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (272, N'السويفلة', N'السويفلة', 9, N'27.597833999999999', N'41.773014000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (273, N'الزبارة', N'الزبارة', 9, N'27.508261000000001', N'41.707276999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (274, N'الخريمي', N'الخريمي', 9, N'27.522031999999999', N'41.762588999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (275, N'لبدة', N'لبدة', 9, N'27.519801999999999', N'41.708035000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (276, N'حدري البلاد', N'حدري البلاد', 9, N'27.543745999999999', N'41.767856999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (277, N'النقرة', N'النقرة', 9, N'27.487389', N'41.645367999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (278, N'المصيف', N'المصيف', 9, N'27.585609000000002', N'41.689718999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (279, N'اللقيطة', N'اللقيطة', 9, N'27.645731999999999', N'41.697999000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (280, N'الزهراء', N'الزهراء', 9, N'27.560977999999999', N'41.714260000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (281, N'الخزامى', N'الخزامى', 9, N'27.577847999999999', N'41.719616000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (282, N'الملك فهد', N'الملك فهد', 11, N'25.355430999999999', N'49.633251999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (283, N'المباركية', N'المباركية', 11, N'25.369206999999999', N'49.61392')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (284, N'الخالدية', N'الخالدية', 11, N'25.336494999999999', N'49.587721000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (285, N'الجامعين', N'الجامعين', 11, N'25.315745', N'49.586461999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (286, N'الرابية', N'الرابية', 11, N'25.295642999999998', N'49.589635999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (287, N'المحمدية', N'المحمدية', 11, N'25.376028999999999', N'49.559735000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (288, N'الحفيرة', N'الحفيرة', 11, N'25.355478000000002', N'49.563305999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (289, N'الهدى', N'الهدى', 11, N'25.291270999999998', N'49.556565999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (290, N'النسيم', N'النسيم', 11, N'25.331545999999999', N'49.608500999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (291, N'الرفعة', N'الرفعة', 11, N'25.378209999999999', N'49.591765000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (292, N'المزروعية', N'المزروعية', 11, N'25.371677999999999', N'49.571176999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (293, N'العويمرية', N'العويمرية', 11, N'25.354915999999999', N'49.585388000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (294, N'السنيدية', N'السنيدية', 11, N'25.355723999999999', N'49.577275')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (295, N'المزروعية', N'المزروعية', 11, N'25.370199', N'49.570973000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (296, N'البندرية', N'البندرية', 11, N'25.340968', N'49.573419999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (297, N'الإسكان الأول', N'الإسكان الأول', 11, N'25.321511000000001', N'49.596860999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (298, N'جوبا', N'جوبا', 11, N'25.346774', N'49.583547000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (299, N'الصيهد', N'الصيهد', 11, N'25.367625', N'49.558045')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (300, N'النايفية', N'النايفية', 11, N'25.333318999999999', N'49.554175999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (301, N'الفيصلية', N'الفيصلية', 11, N'25.390128000000001', N'49.592939999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (302, N'السلمانية القديمة', N'السلمانية القديمة', 11, N'25.350469', N'49.540219999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (303, N'عين علي', N'عين علي', 11, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (304, N'الرقيقة', N'الرقيقة', 11, N'25.351046', N'49.574987999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (305, N'الشهابية', N'الشهابية', 11, N'25.360669000000001', N'49.614400000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (306, N'المربدية', N'المربدية', 11, N'25.354236', N'49.582687')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (307, N'الروضة', N'الروضة', 11, N'25.353127000000001', N'49.606158000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (308, N'العزيزية', N'العزيزية', 11, N'25.330072000000001', N'49.573743999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (309, N'منسوبي التعليم', N'منسوبي التعليم', 11, N'25.297839', N'49.601866000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (310, N'جوبا', N'جوبا', 11, N'25.346623000000001', N'49.583354999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (311, N'المعلمين الشرقية', N'المعلمين الشرقية', 11, N'25.365113000000001', N'49.573110999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (312, N'النايفية', N'النايفية', 11, N'25.333625000000001', N'49.555368999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (313, N'مجمع الدوائر الحكومية', N'مجمع الدوائر الحكومية', 11, N'25.322986', N'49.559987')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (314, N'الكوت', N'الكوت', 11, N'25.377669999999998', N'49.581054999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (315, N'عين موسى', N'عين موسى', 11, N'25.368065999999999', N'49.601238000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (316, N'الثليثية', N'الثليثية', 11, N'25.361266000000001', N'49.587032999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (317, N'الفاضلية', N'الفاضلية', 11, N'25.390125000000001', N'49.593601999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (318, N'البصيرة', N'البصيرة', 11, N'25.369579000000002', N'49.614187999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (319, N'السلام', N'السلام', 11, N'25.297737382551599', N'49.604018347460503')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (320, N'المثلث', N'المثلث', 11, N'25.351020999999999', N'49.600588999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (321, N'الزهرة', N'الزهرة', 11, N'25.325923', N'49.583095999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (322, N'الحوراء', N'الحوراء', 11, N'25.349083', N'49.621115000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (323, N'المرقاب', N'المرقاب', 11, N'25.350517', N'49.583381000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (324, N'السلمانية', N'السلمانية', 11, N'25.365435999999999', N'49.550764999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (325, N'المهندسين', N'المهندسين', 11, N'25.324362000000001', N'49.536957999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (326, N'الفيصلية', N'الفيصلية', 11, N'25.391894000000001', N'49.602657999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (327, N'الصالحية', N'الصالحية', 11, N'25.369910999999998', N'49.594552999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (328, N'النعاثل', N'النعاثل', 11, N'25.377079999999999', N'49.581766000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (329, N'العسيلة', N'العسيلة', 11, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (330, N'الشاطئ الشرقي', N'الشاطئ الشرقي', 12, N'26.473056', N'50.128965000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (331, N'الأثير', N'الأثير', 12, N'26.435314000000002', N'50.058875999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (332, N'النخيل', N'النخيل', 12, N'26.438635999999999', N'50.088496999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (333, N'البادية', N'البادية', 12, N'26.428552', N'50.090577000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (334, N'الزهور', N'الزهور', 12, N'26.455027000000001', N'50.088945000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (335, N'العزيزية', N'العزيزية', 12, N'26.457363000000001', N'50.071382')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (336, N'الغدير', N'الغدير', 12, N'26.493176999999999', N'50.049497000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (337, N'المريكبات', N'المريكبات', 12, N'26.411349000000001', N'50.104272000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (338, N'النسيم', N'النسيم', 12, N'26.444786000000001', N'50.164351000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (339, N'مدينة العمال', N'مدينة العمال', 12, N'26.423345000000001', N'50.109318000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (340, N'الجامعيين', N'الجامعيين', 12, N'26.394673999999998', N'50.098509')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (341, N'الروضة', N'الروضة', 12, N'26.403411999999999', N'50.077384000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (342, N'الصدفة', N'الصدفة', 12, N'26.374307999999999', N'50.216762000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (343, N'الفنار', N'الفنار', 12, N'26.408085', N'50.200695000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (344, N'النور', N'النور', 12, N'26.429523', N'50.022891000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (345, N'أحد', N'أحد', 12, N'26.413573', N'50.041567999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (346, N'الأمانة', N'الأمانة', 12, N'26.384847000000001', N'49.966090000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (347, N'أبراج السيف', N'أبراج السيف', 12, N'26.384094000000001', N'50.205074000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (348, N'الغنام', N'الغنام', 12, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (349, N'الحمراء', N'الحمراء', 12, N'26.470586000000001', N'50.090857')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (350, N'غرناطة', N'غرناطة', 12, N'26.424474', N'50.079452000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (351, N'المحمدية', N'المحمدية', 12, N'26.459471000000001', N'50.054377000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (352, N'البديع', N'البديع', 12, N'26.451125000000001', N'50.112468')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (353, N'السلام', N'السلام', 12, N'26.451981', N'50.102640000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (354, N'العمامرة', N'العمامرة', 12, N'26.444457', N'50.112938')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (355, N'المنار', N'المنار', 12, N'26.378271000000002', N'50.038477')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (356, N'المزروعية', N'المزروعية', 12, N'26.444566999999999', N'50.123387000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (357, N'النهضة', N'النهضة', 12, N'26.377426', N'50.144125000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (358, N'ابن خلدون', N'ابن خلدون', 12, N'26.420159999999999', N'50.097738999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (359, N'الحسام', N'الحسام', 12, N'26.390218999999998', N'50.171272999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (360, N'الريان', N'الريان', 12, N'26.405249999999999', N'50.092210000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (361, N'الصفا', N'الصفا', 12, N'26.389151999999999', N'50.182955')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (362, N'بدر', N'بدر', 12, N'26.404219000000001', N'50.023533999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (363, N'الضباب', N'الضباب', 12, N'26.424168000000002', N'50.052906')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (364, N'الفرسان', N'الفرسان', 12, N'26.357679999999998', N'49.963822999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (365, N'النسيم العالي', N'النسيم العالي', 12, N'26.444194', N'50.160279000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (366, N'الشاطئ الغربي', N'الشاطئ الغربي', 12, N'26.475567000000002', N'50.118102999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (367, N'الخليج', N'الخليج', 12, N'26.446142999999999', N'50.088695000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (368, N'الربيع', N'الربيع', 12, N'26.440795000000001', N'50.115434999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (369, N'النهضة', N'النهضة', 12, N'26.377610000000001', N'50.143005000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (370, N'الدواسر', N'الدواسر', 12, N'26.445596999999999', N'50.101661999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (371, N'العدامة', N'العدامة', 12, N'26.432666999999999', N'50.103752999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (372, N'القادسية', N'القادسية', 12, N'26.418274', N'50.071682000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (373, N'المروج', N'المروج', 12, N'26.3165283255655', N'50.204942887918101')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (374, N'الناصرية', N'الناصرية', 12, N'26.427268000000002', N'50.120576')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (375, N'الواحة', N'الواحة', 12, N'26.38259', N'50.098207000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (376, N'البساتين', N'البساتين', 12, N'26.391805999999999', N'50.124146000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (377, N'الخالدية الشمالية', N'الخالدية الشمالية', 12, N'26.411380000000001', N'50.146044000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (378, N'الشفاء', N'الشفاء', 12, N'26.405873', N'50.118741')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (379, N'الفردوس', N'الفردوس', 12, N'26.380282999999999', N'50.117713000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (380, N'الندي', N'الندي', 12, N'26.373214999999998', N'50.077170000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (381, N'طيبة', N'طيبة', 12, N'26.355564000000001', N'50.047573999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (382, N'الفيصلية', N'الفيصلية', 12, N'26.393623999999999', N'50.070334000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (383, N'الشروق', N'الشروق', 12, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (384, N'المطار', N'المطار', 12, N'26.379971999999999', N'49.945430999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (385, N'جوهرة المطار', N'جوهرة المطار', 12, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (386, N'الجوهرة', N'الجوهرة', 12, N'26.464735999999998', N'50.081192999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (387, N'الزهور', N'الزهور', 12, N'26.454744999999999', N'50.088985000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (388, N'السوق', N'السوق', 12, N'26.440218999999999', N'50.102325')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (389, N'الدانة', N'الدانة', 12, N'26.465755999999999', N'50.043446000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (390, N'الجلوية', N'الجلوية', 12, N'26.435314000000002', N'50.074246000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (391, N'الطبيشي', N'الطبيشي', 12, N'26.435496000000001', N'50.122853999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (392, N'العنود', N'العنود', 12, N'26.447704000000002', N'50.071078999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (393, N'الراكة الشمالية', N'الراكة الشمالية', 12, N'26.368659999999998', N'50.192784000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (394, N'المنتزه', N'المنتزه', 12, N'26.377196999999999', N'50.129269000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (395, N'النورس', N'النورس', 12, N'26.411736999999999', N'50.184586000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (396, N'الأتصالات', N'الأتصالات', 12, N'26.413466', N'50.084952999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (397, N'الخالدية الجنوبية', N'الخالدية الجنوبية', 12, N'26.402595999999999', N'50.163035999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (398, N'السيف', N'السيف', 12, N'26.384091999999999', N'50.205568')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (399, N'الإسكان', N'الإسكان', 12, N'26.415061000000001', N'50.123241999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (400, N'المنار', N'المنار', 12, N'26.369351000000002', N'50.035215000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (401, N'ضاحية الملك فهد', N'ضاحية الملك فهد', 12, N'26.417321999999999', N'50.000281999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (402, N'الفيحاء', N'الفيحاء', 12, N'26.438237999999998', N'50.039219000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (403, N'المطار', N'المطار', 12, N'26.377168000000001', N'49.944431000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (404, N'درة الكورنيش', N'درة الكورنيش', 12, N'26.457761999999999', N'50.101740999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (405, N'السكة الحديدية', N'السكة الحديدية', 13, N'24.453073', N'39.483685999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (406, N'شوران', N'شوران', 13, N'24.388636000000002', N'39.623961999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (407, N'نبلاء', N'نبلاء', 13, N'24.382394000000001', N'39.665184000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (408, N'المبعوث', N'المبعوث', 13, N'24.488291', N'39.679752999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (409, N'السد', N'السد', 13, N'24.398402999999998', N'39.645009999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (410, N'خاخ', N'خاخ', 13, N'24.365508999999999', N'39.542547999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (411, N'الزهرة', N'الزهرة', 13, N'24.518291000000001', N'39.565696000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (412, N'الجابرة', N'الجابرة', 13, N'24.401771', N'39.586613')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (413, N'الرمانة', N'الرمانة', 13, N'24.401678', N'39.685367999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (414, N'المنطقة المركزية', N'المنطقة المركزية', 13, N'24.469345000000001', N'39.613936000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (415, N'الفتح', N'الفتح', 13, N'24.479892', N'39.594631999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (416, N'الاصيفرين', N'الاصيفرين', 13, N'24.460197999999998', N'39.591495000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (417, N'المغيسلة', N'المغيسلة', 13, N'24.454180000000001', N'39.605003000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (418, N'القبلتين', N'القبلتين', 13, N'24.479721000000001', N'39.577942')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (419, N'الراية', N'الراية', 13, N'24.488144999999999', N'39.597607000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (420, N'بني عبدالاشهل', N'بني عبدالاشهل', 13, N'24.480743', N'39.620452')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (421, N'سيد الشهداء', N'سيد الشهداء', 13, N'24.506599999999999', N'39.612315000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (422, N'ذو الحليفة', N'ذو الحليفة', 13, N'24.428208000000001', N'39.569932000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (423, N'القلعة', N'القلعة', 13, N'24.500125000000001', N'39.643520000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (424, N'ام خالد', N'ام خالد', 13, N'24.426480000000002', N'39.544612999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (425, N'جبل جمة وغرابة', N'جبل جمة وغرابة', 13, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (426, N'السقيا', N'السقيا', 13, N'24.463234', N'39.596611000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (427, N'العصبة', N'العصبة', 13, N'24.430315', N'39.616709999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (428, N'عروة', N'عروة', 13, N'24.446808000000001', N'39.589312999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (429, N'الشهباء', N'الشهباء', 13, N'24.381961', N'39.552346')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (430, N'الدفاع', N'الدفاع', 13, N'24.449556000000001', N'39.514679000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (431, N'قلعة مخيط', N'قلعة مخيط', 13, N'24.487348000000001', N'39.4908')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (432, N'السلام', N'السلام', 13, N'24.464393999999999', N'39.542287999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (433, N'البلقاء', N'البلقاء', 13, N'24.535181999999999', N'39.450952999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (434, N'السكب', N'السكب', 13, N'24.355311', N'39.565300999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (435, N'مهزور', N'مهزور', 13, N'24.441967999999999', N'39.651232999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (436, N'الروابي', N'الروابي', 13, N'24.424189999999999', N'39.652557999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (437, N'بئر عثمان', N'بئر عثمان', 13, N'24.493483999999999', N'39.585366999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (438, N'الغابة', N'الغابة', 13, N'24.561301', N'39.602231000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (439, N'الغراء', N'الغراء', 13, N'24.405664000000002', N'39.663595000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (440, N'العانبس', N'العانبس', 13, N'24.475213', N'39.586416')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (441, N'الجامعة', N'الجامعة', 13, N'24.483436000000001', N'39.559856000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (442, N'الجمعة', N'الجمعة', 13, N'24.45335', N'39.616005999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (443, N'كتانة', N'كتانة', 13, N'24.560155000000002', N'39.554031999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (444, N'مسجد الدرع', N'مسجد الدرع', 13, N'24.490290999999999', N'39.609617')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (445, N'المصانع', N'المصانع', 13, N'24.478095', N'39.607214999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (446, N'الشريبات', N'الشريبات', 13, N'24.449558', N'39.640073000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (447, N'وعيرة', N'وعيرة', 13, N'24.550349000000001', N'39.669302999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (448, N'العهن', N'العهن', 13, N'24.434564000000002', N'39.634298999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (449, N'السيح', N'السيح', 13, N'23.63327', N'39.737281000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (450, N'جبل احد', N'جبل احد', 13, N'24.524180000000001', N'39.626184000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (451, N'القصواء', N'القصواء', 13, N'24.429112', N'39.585262999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (452, N'شظاة', N'شظاة', 13, N'24.493285', N'39.656607000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (453, N'بني ظفر', N'بني ظفر', 13, N'24.461328000000002', N'39.629247999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (454, N'بني معاوية', N'بني معاوية', 13, N'24.472709999999999', N'39.627544999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (455, N'الجماوات', N'الجماوات', 13, N'24.468381000000001', N'39.550325000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (456, N'ابو بريقاء', N'ابو بريقاء', 13, N'24.416888', N'39.565423000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (457, N'الحديقة', N'الحديقة', 13, N'24.415789', N'39.614471000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (458, N'الخاتم', N'الخاتم', 13, N'24.432324000000001', N'39.624172999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (459, N'العيون', N'العيون', 13, N'24.513342999999999', N'39.587074999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (460, N'الملك فهد', N'الملك فهد', 13, N'24.506526999999998', N'39.694285000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (461, N'العزيزية', N'العزيزية', 13, N'23.375048', N'40.869007000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (462, N'العريض', N'العريض', 13, N'24.477104000000001', N'39.647024000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (463, N'ورقان', N'ورقان', 13, N'24.380801000000002', N'39.520100999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (464, N'الخالدية', N'الخالدية', 13, N'24.458877999999999', N'39.66189')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (465, N'البركة', N'البركة', 13, N'23.817720999999999', N'38.858499000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (466, N'حثم', N'حثم', 13, N'24.464511999999999', N'39.679200999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (467, N'الدويخلة', N'الدويخلة', 13, N'24.505374', N'39.680923')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (468, N'عين الخيف', N'عين الخيف', 13, N'24.446172000000001', N'39.691187999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (469, N'بني حارثة', N'بني حارثة', 13, N'24.490594000000002', N'39.631346999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (470, N'النخيل', N'النخيل', 13, N'25.094498999999999', N'40.487237999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (471, N'قربان', N'قربان', 13, N'24.458962', N'39.619531000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (472, N'الظاهرة', N'الظاهرة', 13, N'24.448150999999999', N'39.599294')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (473, N'النقس', N'النقس', 13, N'24.553543999999999', N'39.623175000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (474, N'الدويمة', N'الدويمة', 13, N'24.444783000000001', N'39.609887999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (475, N'رهط', N'رهط', 13, N'24.376072000000001', N'39.630310999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (476, N'الصادقية', N'الصادقية', 13, N'24.550450999999999', N'39.582149000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (477, N'الجصة', N'الجصة', 13, N'24.361376', N'39.611466')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (478, N'الوبرة', N'الوبرة', 13, N'24.458735999999998', N'39.579841000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (479, N'الدار', N'الدار', 13, N'24.526896000000001', N'39.647452000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (480, N'جبل عير', N'جبل عير', 13, N'24.393498999999998', N'39.575029000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (481, N'الرانوناء', N'الرانوناء', 13, N'24.390518', N'39.603427000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (482, N'مذينب', N'مذينب', 13, N'24.442098999999999', N'39.676986999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (483, N'المطار', N'المطار', 13, N'24.548428999999999', N'39.684266999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (484, N'طيبة', N'طيبة', 13, N'24.492832', N'39.526583000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (485, N'الاسكان', N'الاسكان', 13, N'24.463698999999998', N'39.645274999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (486, N'بني بياضة', N'بني بياضة', 13, N'24.382168', N'39.590598')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (487, N'ابو كبير', N'ابو كبير', 13, N'24.388283000000001', N'39.532564000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (488, N'الهدراء', N'الهدراء', 13, N'24.441309', N'39.699458999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (489, N'العرين', N'العرين', 14, N'18.567236223834801', N'43.390522868532202')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (490, N'الخشع', N'الخشع', 14, N'18.214068999999999', N'42.504987')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (491, N'النسيم', N'النسيم', 14, N'18.206184', N'42.542999000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (492, N'الأمير سلطان', N'الأمير سلطان', 14, N'18.311299999999999', N'42.597394999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (493, N'القرير', N'القرير', 14, N'18.24821', N'42.556373000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (494, N'الضباب', N'الضباب', 14, N'18.199954000000002', N'42.509062')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (495, N'الهضبة', N'الهضبة', 14, N'18.172643000000001', N'42.572166000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (496, N'القابل', N'القابل', 14, N'18.224070000000001', N'42.497638999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (497, N'المنسك', N'المنسك', 14, N'18.217780000000001', N'42.538328999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (498, N'المطار', N'المطار', 14, N'18.234362999999998', N'42.657910000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (499, N'الشرف', N'الشرف', 14, N'18.247061159203', N'42.511699776938102')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (500, N'المروج', N'المروج', 14, N'18.211866000000001', N'42.558605999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (501, N'الوردتين', N'الوردتين', 14, N'18.228751211999199', N'42.494845336721703')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (502, N'الخشع', N'الخشع', 14, N'18.214074', N'42.505291')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (503, N'الموظفين', N'الموظفين', 14, N'18.203831976292999', N'42.596972713491702')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (504, N'الخالدية', N'الخالدية', 14, N'18.230053999999999', N'42.477034000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (505, N'البديع', N'البديع', 14, N'18.215170000000001', N'42.575310999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (506, N'العزيزية', N'العزيزية', 14, N'18.211939000000001', N'42.500447999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (507, N'الوردتين', N'الوردتين', 14, N'18.228935', N'42.494674000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (508, N'السروات', N'السروات', 14, N'18.199574999999999', N'42.488790999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (509, N'شمسان', N'شمسان', 14, N'18.229998999999999', N'42.509841000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (510, N'السد', N'السد', 14, N'18.21686', N'42.491328000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (511, N'الربوة', N'الربوة', 14, N'18.206143000000001', N'42.527717000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (512, N'مخطط 8 ', N'مخطط 8 ', 15, N'16.947928000000001', N'42.548271')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (513, N'مخطط 5', N'مخطط 5', 15, N'16.922884', N'42.559645000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (514, N'الشامية ', N'الشامية ', 15, N'16.896383', N'42.545251999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (515, N'الروضة', N'الروضة', 15, N'16.898069', N'42.560245000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (516, N'الجبل', N'الجبل', 15, N'16.893025999999999', N'42.552622999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (517, N'المطار', N'المطار', 15, N'16.891249999999999', N'42.573411')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (518, N'مخطط الورود', N'مخطط الورود', 15, N'16.925986000000002', N'42.578575999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (519, N'مخطط 6 ', N'مخطط 6 ', 15, N'16.931654999999999', N'42.556786000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (520, N'الصفا', N'الصفا', 15, N'16.884568999999999', N'42.563378999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (521, N'السهيلية', N'السهيلية', 15, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (522, N'البشائر', N'البشائر', 15, N'16.862583999999998', N'42.620882999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (523, N'القعارية', N'القعارية', 15, N'16.924399999999999', N'42.603453999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (524, N'المعبوج', N'المعبوج', 15, N'16.898858000000001', N'42.597327999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (525, N'القلعة', N'القلعة', 15, N'16.883883999999998', N'42.550342999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (526, N'الشاطئ', N'الشاطئ', 15, N'16.935483999999999', N'42.557761999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (527, N'الروابي', N'الروابي', 15, N'16.958608000000002', N'42.586658')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (528, N'الزهور', N'الزهور', 15, N'16.906537', N'42.635821999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (529, N'المنطقة الصناعية', N'المنطقة الصناعية', 15, N'16.833489', N'42.608001999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (530, N'الاراك', N'الاراك', 15, N'16.869693000000002', N'42.640476')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (531, N'مخطط 7 ', N'مخطط 7 ', 15, N'16.947883999999998', N'42.559736000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (532, N'النور', N'النور', 15, N'16.942762999999999', N'42.626837000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (533, N'السويس', N'السويس', 15, N'16.859718000000001', N'42.594023')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (534, N'النسيم', N'النسيم', 15, N'16.906790999999998', N'42.597780999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (535, N'الشامية', N'الشامية', 15, N'16.897069999999999', N'42.545718999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (536, N'النسيم', N'النسيم', 15, N'16.907257000000001', N'42.596260999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (537, N'حي المحمدية', N'حي المحمدية', 16, N'21.648039657920901', N'39.125378020229597')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (538, N'حي الحمراء', N'حي الحمراء', 16, N'21.529158971077798', N'39.1612293926908')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (539, N'حي الفيصلية', N'حي الفيصلية', 16, N'21.568218999999999', N'39.182043')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (540, N'حي المروة', N'حي المروة', 16, N'21.620301999999999', N'39.196202999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (541, N'حي الزهراء', N'حي الزهراء', 16, N'21.591768999999999', N'39.132050999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (542, N'حي النهضة', N'حي النهضة', 16, N'21.617488999999999', N'39.129421000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (543, N'حي العزيزية', N'حي العزيزية', 16, N'21.552106999999999', N'39.192633000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (544, N'حي الصحيفة', N'حي الصحيفة', 16, N'21.486681000000001', N'39.195248999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (545, N'حي التوفيق', N'حي التوفيق', 16, N'21.577895000000002', N'39.248784000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (546, N'حي مدائن ال فهد', N'حي مدائن ال فهد', 16, N'21.464562000000001', N'39.239640000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (547, N'حي المدينة الصناعية', N'حي المدينة الصناعية', 16, N'21.408072000000001', N'39.236460999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (548, N'حي الثغر', N'حي الثغر', 16, N'21.481030000000001', N'39.221499999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (549, N'حي المنتزهات 2', N'حي المنتزهات 2', 16, N'21.456285000000001', N'39.290590000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (550, N'حي حارة المظلوم', N'حي حارة المظلوم', 16, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (551, N'حي أبحر الشمالية', N'حي أبحر الشمالية', 16, N'21.750416000000001', N'39.117359999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (552, N'حي النزهة', N'حي النزهة', 16, N'21.620180999999999', N'39.170138000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (553, N'حي الخالدية', N'حي الخالدية', 16, N'21.559650999999999', N'39.133696')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (554, N'حي الربوة', N'حي الربوة', 16, N'21.603686', N'39.183011999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (555, N'حي الروضة', N'حي الروضة', 16, N'21.559778999999999', N'39.153297999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (556, N'حي الصفا', N'حي الصفا', 16, N'21.582906000000001', N'39.208444999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (557, N'حي الرويس', N'حي الرويس', 16, N'21.516152999999999', N'39.169970999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (558, N'حي الكندرة', N'حي الكندرة', 16, N'21.493729999999999', N'39.201860000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (559, N'حي الشرفية', N'حي الشرفية', 16, N'21.521713999999999', N'39.191017000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (560, N'حي الهنداوية', N'حي الهنداوية', 16, N'21.473980000000001', N'39.188057999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (561, N'حي المحجر', N'حي المحجر', 16, N'21.427907000000001', N'39.218485999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (562, N'حي النزلة الشرقية', N'حي النزلة الشرقية', 16, N'21.473775', N'39.221276000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (563, N'حي مدينة السلطان', N'حي مدينة السلطان', 16, N'21.693086999999998', N'39.240769999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (564, N'حي المنتزهات 1', N'حي المنتزهات 1', 16, N'21.456567', N'39.290461000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (565, N'حي حارة الشام', N'حي حارة الشام', 16, N'21.4880055663806', N'39.184943249845603')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (566, N'حي الشاطئ', N'حي الشاطئ', 16, N'21.604044999999999', N'39.113615000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (567, N'حي المرجان', N'حي المرجان', 16, N'21.68206', N'39.102257000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (568, N'حي النعيم', N'حي النعيم', 16, N'21.620401999999999', N'39.147229000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (569, N'حي السامر', N'حي السامر', 16, N'21.590384', N'39.244539000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (570, N'حي السلامة', N'حي السلامة', 16, N'21.587683999999999', N'39.151297')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (571, N'حي الكورنيش الشمالي', N'حي الكورنيش الشمالي', 16, N'21.5805996378655', N'39.109041747034901')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (572, N'حي البغدادية الشرقية', N'حي البغدادية الشرقية', 16, N'21.498381999999999', N'39.189079')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (573, N'حي العمارية', N'حي العمارية', 16, N'21.490442000000002', N'39.191695000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (574, N'حي المطار القديم', N'حي المطار القديم', 16, N'21.497716417440198', N'39.220037716854002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (575, N'حي البلد', N'حي البلد', 16, N'21.481596', N'39.187283999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (576, N'حي غليل', N'حي غليل', 16, N'21.453056', N'39.206798999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (577, N'حي السالمية الشرقية', N'حي السالمية الشرقية', 16, N'21.549396999999999', N'39.190584999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (578, N'حي الاسكان الجنوبي', N'حي الاسكان الجنوبي', 16, N'21.427169193586298', N'39.278672474526203')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (579, N'حي بترومين', N'حي بترومين', 16, N'21.446380999999999', N'39.194307000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (580, N'حي عبيد', N'حي عبيد', 16, N'21.4552220763306', N'39.195468216854799')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (581, N'حي حارة اليمن', N'حي حارة اليمن', 16, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (582, N'حي أبحر الجنوبية', N'حي أبحر الجنوبية', 16, N'21.753087000000001', N'39.145225000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (583, N'حي البساتين', N'حي البساتين', 16, N'21.693204999999999', N'39.115029999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (584, N'حي البوادي', N'حي البوادي', 16, N'21.599584', N'39.164763000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (585, N'حي الحمدانية', N'حي الحمدانية', 16, N'21.750820999999998', N'39.195439')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (586, N'حي الاندلس', N'حي الاندلس', 16, N'21.539452000000001', N'39.127645999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (587, N'حي بريمان', N'حي بريمان', 16, N'21.651562999999999', N'39.230739999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (588, N'حي البغدادية الغربية', N'حي البغدادية الغربية', 16, N'21.497589999999999', N'39.181804')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (589, N'حي العين العزيزية', N'حي العين العزيزية', 16, N'21.457349000000001', N'39.318190000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (590, N'حي بني مالك', N'حي بني مالك', 16, N'21.529458000000002', N'39.218426000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (591, N'حي السبيل', N'حي السبيل', 16, N'21.481254', N'39.201236000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (592, N'حي الثعالبة', N'حي الثعالبة', 16, N'21.464742999999999', N'39.186248999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (593, N'حي النزلة اليمانية', N'حي النزلة اليمانية', 16, N'21.467110000000002', N'39.212229000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (594, N'حي القريات', N'حي القريات', 16, N'21.464102', N'39.198352999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (595, N'حي قويزة', N'حي قويزة', 16, N'21.471743', N'39.281159000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (596, N'حي حارة البحر', N'حي حارة البحر', 16, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (597, N'روضه سدير', N'روضه سدير', 17, N'25.601789', N'45.472287000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (598, N'الفروثى', N'الفروثى', 17, N'25.778068483639501', N'45.161693963689999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (599, N'ام رجوم', N'ام رجوم', 17, N'26.151433999999998', N'46.159134999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (600, N'الجنوبية بسدير', N'الجنوبية بسدير', 17, N'25.579511', N'45.621082999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (601, N'الحصون', N'الحصون', 17, N'25.605257999999999', N'45.595376000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (602, N'الخطامه', N'الخطامه', 17, N'25.588956', N'45.695732999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (603, N'الحاير بسدير', N'الحاير بسدير', 17, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (604, N'حويمضه', N'حويمضه', 17, N'26.469764000000001', N'45.165888000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (605, N'الشحمه', N'الشحمه', 17, N'26.112272999999998', N'45.803513000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (606, N'جلاجل', N'جلاجل', 17, N'25.683062', N'45.459009000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (607, N'حرمه', N'حرمه', 17, N'25.972449999999998', N'45.363979999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (608, N'القاعيه بسدير', N'القاعيه بسدير', 17, N'26.429203000000001', N'45.584028000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (609, N'العطار', N'العطار', 17, N'25.567540000000001', N'45.640146000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (610, N'الخيس', N'الخيس', 17, N'25.874887999999999', N'45.110574999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (611, N'الداخله', N'الداخله', 17, N'25.625903999999998', N'45.566113000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (612, N'المعشبه', N'المعشبه', 17, N'25.561990000000002', N'45.386322')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (613, N'الشعب', N'الشعب', 17, N'25.912960999999999', N'45.903153000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (614, N'ام سدير', N'ام سدير', 17, N'26.863873999999999', N'45.241112000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (615, N'المجمعه', N'المجمعه', 17, N'25.878388000000001', N'45.378258000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (616, N'الارطاويه', N'الارطاويه', 17, N'26.500343000000001', N'45.347441000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (617, N'جراب', N'جراب', 17, N'26.765339000000001', N'44.990262999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (618, N'عوده سدير', N'عوده سدير', 17, N'25.553129999999999', N'45.684739999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (619, N'عشيرة سدير', N'عشيرة سدير', 17, N'25.600473000000001', N'45.796551999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (620, N'العمار بسدير', N'العمار بسدير', 17, N'25.838763', N'45.129617000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (621, N'مبايض', N'مبايض', 17, N'25.827649000000001', N'45.804298000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (622, N'وشي', N'وشي', 17, N'25.801214999999999', N'45.266936000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (623, N'البرزه', N'البرزه', 17, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (624, N'مشذوبه', N'مشذوبه', 17, N'27.344953', N'45.020504000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (625, N'حوطه سدير', N'حوطه سدير', 17, N'25.594930000000002', N'45.634511000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (626, N'تمير', N'تمير', 17, N'25.711051999999999', N'45.873508999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (627, N'ام الجماجم', N'ام الجماجم', 17, N'26.881186', N'45.319620999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (628, N'مشاش عوض', N'مشاش عوض', 17, N'26.422825', N'45.150350000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (629, N'التويم', N'التويم', 17, N'25.646984', N'45.556431000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (630, N'الرويضه بسدير', N'الرويضه بسدير', 17, N'25.875893000000001', N'45.142121000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (631, N'الجنيفى', N'الجنيفى', 17, N'25.574245999999999', N'45.642958')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (632, N'بوضاء بسدير', N'بوضاء بسدير', 17, N'25.826430999999999', N'45.690016')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (633, N'مصده', N'مصده', 17, N'26.641435999999999', N'45.246054999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (634, N'الإسكان-الخبر', N'الإسكان-الخبر', 18, N'26.256792999999998', N'50.207735999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (635, N'الراكة الجنوبية', N'الراكة الجنوبية', 18, N'26.351519', N'50.198571000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (636, N'الهدا', N'الهدا', 18, N'26.311204', N'50.182772999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (637, N'الجسر', N'الجسر', 18, N'26.210121999999998', N'50.207749999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (638, N'البستان-الخبر', N'البستان-الخبر', 18, N'26.321750000000002', N'50.211205999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (639, N'الشراع', N'الشراع', 18, N'26.167255000000001', N'50.146985000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (640, N'الحمراء-الخبر', N'الحمراء-الخبر', 18, N'26.227038', N'50.203879000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (641, N'الكوثر-العزيزية', N'الكوثر-العزيزية', 18, N'26.152045999999999', N'50.120418000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (642, N'المدينة الرياضية', N'المدينة الرياضية', 18, N'26.358156000000001', N'50.185574000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (643, N'صناعية الفوازية', N'صناعية الفوازية', 18, N'26.246316', N'50.214525000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (644, N'العقربية', N'العقربية', 18, N'26.296437000000001', N'50.193931999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (645, N'مدينة العمال-الخبر', N'مدينة العمال-الخبر', 18, N'26.295005', N'50.204273999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (646, N'قرطبة-الخبر', N'قرطبة-الخبر', 18, N'26.344383000000001', N'50.186424000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (647, N'الروابى-الخبر', N'الروابى-الخبر', 18, N'26.331392000000001', N'50.20937')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (648, N'الأندلس-الخبر', N'الأندلس-الخبر', 18, N'26.321249000000002', N'50.185588000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (649, N'التحلية', N'التحلية', 18, N'26.181329000000002', N'50.197198')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (650, N'الخزامى', N'الخزامى', 18, N'26.209351000000002', N'50.187457999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (651, N'الرجاء', N'الرجاء', 18, N'26.171631999999999', N'50.128836')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (652, N'صناعية الثقبة', N'صناعية الثقبة', 18, N'26.254494999999999', N'50.199350000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (653, N'أشبيليا', N'أشبيليا', 18, N'26.194527000000001', N'50.215670000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (654, N'الثقبة', N'الثقبة', 18, N'26.275872', N'50.192526000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (655, N'الخبر الجنوبية', N'الخبر الجنوبية', 18, N'26.274981', N'50.205305000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (656, N'العليا', N'العليا', 18, N'26.298162000000001', N'50.177594999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (657, N'الكورنيش', N'الكورنيش', 18, N'26.324885999999999', N'50.222589999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (658, N'الجوهرة', N'الجوهرة', 18, N'26.325987000000001', N'50.195501')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (659, N'الصوارى', N'الصوارى', 18, N'26.187038999999999', N'50.157235')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (660, N'البحيرة', N'البحيرة', 18, N'26.19013', N'50.177926999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (661, N'اللؤلؤ', N'اللؤلؤ', 18, N'26.123552', N'50.142313999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (662, N'الأمواج', N'الأمواج', 18, N'26.145132', N'50.143549999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (663, N'ابن سيناء', N'ابن سيناء', 18, N'26.241569999999999', N'50.199758000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (664, N'الخبر الشمالية', N'الخبر الشمالية', 18, N'26.291053999999999', N'50.213863000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (665, N'الحزام الأخضر', N'الحزام الأخضر', 18, N'26.309246999999999', N'50.198822999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (666, N'الحزام الذهبى', N'الحزام الذهبى', 18, N'26.317616000000001', N'50.197896999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (667, N'اليرموك', N'اليرموك', 18, N'26.310966000000001', N'50.220571')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (668, N'البندرية', N'البندرية', 18, N'26.307708999999999', N'50.214027999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (669, N'التعاون', N'التعاون', 18, N'26.222383000000001', N'50.186188999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (670, N'الخور', N'الخور', 18, N'26.219939', N'50.235070999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (671, N'العقيق', N'العقيق', 18, N'26.095281', N'50.144831000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (672, N'المرجان', N'المرجان', 18, N'26.120504', N'50.117466999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (673, N'الشعيل', N'الشعيل', 18, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (674, N'الفيحاء', N'الفيحاء', 19, N'28.449560999999999', N'46.023771000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (675, N'النخيل', N'النخيل', 19, N'28.357375000000001', N'45.989238999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (676, N'الواحة', N'الواحة', 19, N'28.403737', N'45.973235000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (677, N'الخليج', N'الخليج', 19, N'28.438016999999999', N'46.07152')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (678, N'السليمانية', N'السليمانية', 19, N'28.400856000000001', N'45.932732999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (679, N'الصفاء', N'الصفاء', 19, N'28.376297000000001', N'45.995984')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (680, N'المروج', N'المروج', 19, N'28.393757999999998', N'45.992359999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (681, N'الفيصلية', N'الفيصلية', 19, N'28.393180999999998', N'45.954698999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (682, N'الرائد', N'الرائد', 19, N'28.356069999999999', N'46.002898000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (683, N'غرناطة', N'غرناطة', 19, N'28.277899999999999', N'45.941684000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (684, N'الخالدية', N'الخالدية', 19, N'28.422789999999999', N'45.960495999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (685, N'الربيع', N'الربيع', 19, N'28.396978000000001', N'46.046981000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (686, N'المحمدية', N'المحمدية', 19, N'28.387646', N'45.975307000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (687, N'التلال', N'التلال', 19, N'28.448107', N'45.934780000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (688, N'الروضة', N'الروضة', 19, N'28.446905000000001', N'46.044508999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (689, N'الإسكان', N'الإسكان', 19, N'28.333850999999999', N'45.977260000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (690, N'اليرموك', N'اليرموك', 19, N'28.277398000000002', N'45.951723999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (691, N'الربوة', N'الربوة', 19, N'28.415717000000001', N'45.943384999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (692, N'الصناعية', N'الصناعية', 19, N'28.431127', N'46.036656000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (693, N'المصيف', N'المصيف', 19, N'28.406528999999999', N'45.988717000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (694, N'الريان', N'الريان', 19, N'28.345725999999999', N'45.957282999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (695, N'الوادي', N'الوادي', 19, N'28.356536999999999', N'45.971685999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (696, N'الباطن', N'الباطن', 19, N'28.454103', N'45.998939')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (697, N'النزهة', N'النزهة', 19, N'28.413167999999999', N'45.926498000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (698, N'الشفاء', N'الشفاء', 19, N'28.249765', N'45.927052000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (699, N'البلدية', N'البلدية', 19, N'28.421619', N'45.982909999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (700, N'النايفية', N'النايفية', 19, N'27.933185000000002', N'45.381410000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (701, N'فليج', N'فليج', 19, N'28.434275', N'46.003951000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (702, N'قرطبة', N'قرطبة', 19, N'28.301134000000001', N'45.954678000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (703, N'النهضة', N'النهضة', 19, N'28.438057000000001', N'45.92089')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (704, N'الجامعة', N'الجامعة', 19, N'28.239898', N'45.938420000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (705, N'ابوموسى الاشعري', N'ابوموسى الاشعري', 19, N'28.449179000000001', N'45.977322000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (706, N'الربيع', N'الربيع', 20, N'18.312815000000001', N'42.689951999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (707, N'اللواء الرابع عشر', N'اللواء الرابع عشر', 20, N'18.238952000000001', N'42.833094000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (708, N'المنتزه', N'المنتزه', 20, N'18.303260999999999', N'42.720253999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (709, N'العزيزية', N'العزيزية', 20, N'18.312885999999999', N'42.750008000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (710, N'المعمورة', N'المعمورة', 20, N'18.325593000000001', N'42.722327999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (711, N'الهرير', N'الهرير', 20, N'18.309573658041', N'42.766264689920703')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (712, N'البوادي', N'البوادي', 20, N'18.300488000000001', N'42.755558999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (713, N'الاسكان', N'الاسكان', 20, N'18.1952945274953', N'42.7629187304032')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (714, N'الرصراص', N'الرصراص', 20, N'18.250062', N'42.776539999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (715, N'ذلالة', N'ذلالة', 20, N'18.241416000000001', N'42.760821999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (716, N'السد', N'السد', 20, N'18.289113', N'42.716774999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (717, N'طيب الاسم', N'طيب الاسم', 20, N'18.314813000000001', N'42.704591999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (718, N'الواحة', N'الواحة', 20, N'18.333893', N'42.698889999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (719, N'النهضة', N'النهضة', 20, N'18.325177', N'42.741827000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (720, N'المثناة', N'المثناة', 20, N'18.293516', N'42.732326')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (721, N'سكن القاعدة الجوية', N'سكن القاعدة الجوية', 20, N'18.272749000000001', N'42.803849')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (722, N'الشرفية', N'الشرفية', 20, N'18.305802', N'42.741698999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (723, N'الراقي', N'الراقي', 20, N'18.331434999999999', N'42.751530000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (724, N'شباعة', N'شباعة', 20, N'18.319469999999999', N'42.725042000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (725, N'شكر', N'شكر', 20, N'18.288803000000001', N'42.748725')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (726, N'المعزاب', N'المعزاب', 20, N'18.312061', N'42.712567')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (727, N'الشفاء', N'الشفاء', 20, N'18.262004000000001', N'42.733379999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (728, N'النسيم', N'النسيم', 20, N'18.291740999999998', N'42.760088000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (729, N'القافلة', N'القافلة', 20, N'18.316414999999999', N'42.694091999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (730, N'ال قصال', N'ال قصال', 20, N'18.302697999999999', N'42.731665')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (731, N'الموسى', N'الموسى', 20, N'18.330991999999998', N'42.770609999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (732, N'عتود', N'عتود', 20, N'18.303598000000001', N'42.709096000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (733, N'الصقور', N'الصقور', 20, N'18.302731999999999', N'42.763736999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (734, N'سكن المدينة العسكرية', N'سكن المدينة العسكرية', 20, N'18.229658000000001', N'42.779673000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (735, N'ضمك', N'ضمك', 20, N'18.288429000000001', N'42.727913000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (736, N'الدوحة', N'الدوحة', 20, N'18.312245999999998', N'42.739336999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (737, N'الهميلة', N'الهميلة', 20, N'18.308434999999999', N'42.718550999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (738, N'البوادي', N'البوادي', 21, N'26.586849000000001', N'49.968325')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (739, N'الجواهر', N'الجواهر', 21, N'26.586122', N'50.008054999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (740, N'الروضة', N'الروضة', 21, N'26.577601000000001', N'50.041051000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (741, N'الريف', N'الريف', 21, N'26.594721', N'49.977271000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (742, N'الساحل', N'الساحل', 21, N'26.550912', N'50.045301000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (743, N'الفتح', N'الفتح', 21, N'26.570775000000001', N'50.042437')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (744, N'المروج', N'المروج', 21, N'26.587147999999999', N'50.047902000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (745, N'الواحة', N'الواحة', 21, N'26.576727000000002', N'50.02684')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (746, N'الريحان', N'الريحان', 21, N'26.508399000000001', N'49.938395')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (747, N'المزروع', N'المزروع', 21, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (748, N'المنيرة', N'المنيرة', 21, N'26.575848000000001', N'50.027289000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (749, N'البديعة', N'البديعة', 21, N'26.533225000000002', N'49.968533000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (750, N'الجميمة', N'الجميمة', 21, N'26.584686999999999', N'49.977513000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (751, N'الخزامي', N'الخزامي', 21, N'26.565370999999999', N'50.014637')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (752, N'الروابي', N'الروابي', 21, N'26.557486999999998', N'49.886020000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (753, N'الزهراء', N'الزهراء', 21, N'26.603128999999999', N'50.014394000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (754, N'الصناعية', N'الصناعية', 21, N'26.585895000000001', N'50.037883999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (755, N'المرجان', N'المرجان', 21, N'26.550201000000001', N'50.06315')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (756, N'النرجس', N'النرجس', 21, N'26.590356', N'49.988629000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (757, N'الياقوت', N'الياقوت', 21, N'26.539635000000001', N'49.976889')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (758, N'المناطق البحرية', N'المناطق البحرية', 21, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (759, N'الدخل المحدود', N'الدخل المحدود', 21, N'26.570969999999999', N'50.044065000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (760, N'الأزدهار', N'الأزدهار', 21, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (761, N'الثريا', N'الثريا', 21, N'26.600639000000001', N'49.983618999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (762, N'الحسين', N'الحسين', 21, N'26.576136000000002', N'49.998426000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (763, N'الرحاب', N'الرحاب', 21, N'26.564292204316999', N'49.997935984057399')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (764, N'الزارة', N'الزارة', 21, N'26.584368000000001', N'49.993091999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (765, N'الشاطيء', N'الشاطيء', 21, N'26.562897', N'50.045867999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (766, N'القلعة', N'القلعة', 21, N'26.560929999999999', N'50.006191000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (767, N'المشتل', N'المشتل', 21, N'26.569519', N'49.973564000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (768, N'الورود', N'الورود', 21, N'26.581999', N'50.02543')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (769, N'المستودعات', N'المستودعات', 21, N'26.542090999999999', N'50.020198000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (770, N'المشاري', N'المشاري', 21, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (771, N'البحر', N'البحر', 21, N'26.565840000000001', N'50.007682000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (772, N'الجزيرة', N'الجزيرة', 21, N'26.553414', N'50.012748000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (773, N'الخامسة', N'الخامسة', 21, N'26.557319', N'50.016590000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (774, N'الرضا', N'الرضا', 21, N'26.567136999999999', N'50.030638000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (775, N'الزمردة', N'الزمردة', 21, N'26.547872999999999', N'49.998806999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (776, N'الشهباء', N'الشهباء', 21, N'26.560929999999999', N'49.988669000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (777, N'المجيدية', N'المجيدية', 21, N'26.544119999999999', N'50.023812')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (778, N'الناصرة', N'الناصرة', 21, N'26.574567999999999', N'50.010485000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (779, N'الياسمين', N'الياسمين', 21, N'26.5755698890713', N'50.031386630241101')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (780, N'الرابعة', N'الرابعة', 21, N'26.559429000000002', N'50.011152000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (781, N'التركية', N'التركية', 21, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (782, N'الصالحية', N'الصالحية', 22, N'26.098652000000001', N'43.988365000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (783, N'المنتزه', N'المنتزه', 22, N'26.1059144069933', N'43.990624403265002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (784, N'البديعة', N'البديعة', 22, N'26.082298999999999', N'43.973951999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (785, N'القادسية', N'القادسية', 22, N'26.112181', N'44.004322999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (786, N'الصناعية', N'الصناعية', 22, N'26.079242721615', N'44.021111759965798')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (787, N'الريان', N'الريان', 22, N'26.080656999999999', N'43.977806000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (788, N'المطار', N'المطار', 22, N'26.079049000000001', N'43.996459999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (789, N'مريبده', N'مريبده', 22, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (790, N'العيارية', N'العيارية', 22, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (791, N'الوفاء', N'الوفاء', 22, N'26.068838', N'44.018073000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (792, N'الملك فهد', N'الملك فهد', 22, N'26.107956000000001', N'44.034246000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (793, N'وسط المدينة', N'وسط المدينة', 22, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (794, N'النسيم', N'النسيم', 22, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (795, N'السلام', N'السلام', 22, N'26.082598000000001', N'43.952112999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (796, N'المنار', N'المنار', 22, N'26.087510999999999', N'44.022936000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (797, N'الخليج', N'الخليج', 22, N'26.088001999999999', N'44.026471000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (798, N'المروج', N'المروج', 22, N'26.129277999999999', N'44.013291000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (799, N'الفيحاء', N'الفيحاء', 22, N'26.052157000000001', N'43.997064999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (800, N'العليا', N'العليا', 22, N'26.110503000000001', N'43.962834999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (801, N'مليحة', N'مليحة', 22, N'26.091923999999999', N'43.950602000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (802, N'السلمانية', N'السلمانية', 22, N'26.086663000000001', N'44.010693000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (803, N'الملك خالد', N'الملك خالد', 22, N'26.085815', N'44.039532000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (804, N'صناعية العريفي', N'صناعية العريفي', 23, N'27.009879507558399', N'49.6250973013953')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (805, N'الواحة', N'الواحة', 23, N'27.018837000000001', N'49.638869999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (806, N'الجوهرة', N'الجوهرة', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (807, N'الصفاة', N'الصفاة', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (808, N'السلام 1', N'السلام 1', 23, N'27.166229743704498', N'49.546040572556002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (809, N'الدانة', N'الدانة', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (810, N'عبد اللطيف جميل', N'عبد اللطيف جميل', 23, N'27.017428086989099', N'49.638092753787198')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (811, N'المرقاب', N'المرقاب', 23, N'27.0447109380524', N'49.652520822957001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (812, N'البستان', N'البستان', 23, N'27.143473005962001', N'49.560831432076')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (813, N'العزيزية', N'العزيزية', 23, N'26.960028517578198', N'49.568703894406902')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (814, N'التعاون', N'التعاون', 23, N'27.167300021484799', N'49.572802658535203')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (815, N'طيبة', N'طيبة', 23, N'27.165790000000001', N'49.546905000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (816, N'مخطط غرب المزارع', N'مخطط غرب المزارع', 23, N'27.019877000000001', N'49.630800000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (817, N'الخالدية', N'الخالدية', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (818, N'الروضة', N'الروضة', 23, N'27.1585050320706', N'49.557287689746602')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (819, N'قرطبة', N'قرطبة', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (820, N'الضباب', N'الضباب', 23, N'27.020385999999998', N'49.630643999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (821, N'اليرموك 7', N'اليرموك 7', 23, N'27.134007524739999', N'49.537745103240702')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (822, N'الحمراء', N'الحمراء', 23, N'26.925170000000001', N'49.721321000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (823, N'الذهب', N'الذهب', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (824, N'غرناطة', N'غرناطة', 23, N'27.137519072438', N'49.531903703240701')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (825, N'اشبيلية', N'اشبيلية', 23, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (826, N'الطوية', N'الطوية', 23, N'27.012946825629399', N'49.636895659066198')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (827, N'حي التشاليح', N'حي التشاليح', 24, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (828, N'حي الخليج', N'حي الخليج', 24, N'27.469273000000001', N'48.524493999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (829, N'حي الربيع', N'حي الربيع', 24, N'27.477878', N'48.508837999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (830, N'حي الصناعية', N'حي الصناعية', 24, N'27.466498000000001', N'48.488968')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (831, N'حي الفيصلية', N'حي الفيصلية', 24, N'27.474578999999999', N'48.472355999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (832, N'حي العزيزية', N'حي العزيزية', 24, N'27.469308999999999', N'48.494959999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (833, N'حي المحمدية', N'حي المحمدية', 24, N'27.476735999999999', N'48.483488999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (834, N'الدوحة الجنوبية', N'الدوحة الجنوبية', 25, N'26.317067999999999', N'50.163919999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (835, N'جامعة الملك فهد للبترول', N'جامعة الملك فهد للبترول', 25, N'26.306609000000002', N'50.150376999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (836, N'التهامة', N'التهامة', 25, N'26.353444', N'50.130862')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (837, N'الدوحة الشمالية', N'الدوحة الشمالية', 25, N'26.336386000000001', N'50.167476999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (838, N'الترجى-الظهران', N'الترجى-الظهران', 25, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (839, N'السلمانية', N'السلمانية', 25, N'26.319624137470399', N'50.170699801858497')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (840, N'الدانة الشمالية', N'الدانة الشمالية', 25, N'26.337250000000001', N'50.147331000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (841, N'الجامعة', N'الجامعة', 25, N'26.344307000000001', N'50.132789000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (842, N'القشلة', N'القشلة', 25, N'26.365152999999999', N'50.175184000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (843, N'هجر', N'هجر', 25, N'26.368279999999999', N'50.120215999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (844, N'الدانة الجنوبية', N'الدانة الجنوبية', 25, N'26.327466000000001', N'50.150137999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (845, N'غرب الظهران', N'غرب الظهران', 25, N'26.313006999999999', N'50.120623000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (846, N'القصور', N'القصور', 25, N'26.348220999999999', N'50.152465999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (847, N'الحرس الوطني', N'الحرس الوطني', 25, N'26.362921', N'50.164177000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (848, N'حي الساحل', N'حي الساحل', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (849, N'الحي الشمالي', N'الحي الشمالي', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (850, N'حي النهضة', N'حي النهضة', 26, N'26.268450999999999', N'36.435583999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (851, N'حي اليرموك،', N'حي اليرموك،', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (852, N' حي الخالدية', N' حي الخالدية', 26, N'26.245791000000001', N'36.455731999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (853, N'حي الربوة', N'حي الربوة', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (854, N'حي الفريعة', N'حي الفريعة', 26, N'26.235287', N'36.462905999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (855, N'حي التلفزيون', N'حي التلفزيون', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (856, N'حي العزيزية', N'حي العزيزية', 26, N'26.236643000000001', N'36.468721000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (857, N'حي القرفاء،', N'حي القرفاء،', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (858, N'حي الروضة', N'حي الروضة', 26, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (859, N'النخيل', N'النخيل', 27, N'25.930299999999999', N'49.631318')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (860, N'النزهة', N'النزهة', 27, N'25.920558', N'49.647986000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (861, N'غرنطة', N'غرنطة', 27, N'25.924451000000001', N'49.618231999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (862, N'قرطبة', N'قرطبة', 27, N'25.934276000000001', N'49.616528000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (863, N'الربوة', N'الربوة', 27, N'25.921973999999999', N'49.592139000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (864, N'المطار', N'المطار', 27, N'25.928661000000002', N'49.649692999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (865, N'البساتين', N'البساتين', 27, N'25.914921', N'49.618364999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (866, N'الروضة', N'الروضة', 27, N'25.922165', N'49.642229')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (867, N'الصناعية', N'الصناعية', 27, N'25.922069', N'49.654497999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (868, N'الفردوس', N'الفردوس', 27, N'25.936391', N'49.645915000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (869, N'ارامكو', N'ارامكو', 27, N'25.943224838730298', N'49.676498270031701')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (870, N'اشبيلية', N'اشبيلية', 27, N'25.911277999999999', N'49.602128999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (871, N'الاندلس', N'الاندلس', 27, N'25.941611000000002', N'49.651471999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (872, N'المدينة', N'المدينة', 27, N'25.926337', N'49.662041000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (873, N'حي الفيصليه', N'حي الفيصليه', 28, N'26.289255000000001', N'44.790075999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (874, N'حي الخالديه', N'حي الخالديه', 28, N'26.290946999999999', N'44.817095000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (875, N'حي السلام', N'حي السلام', 28, N'26.317895', N'44.828249')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (876, N'حي عريعره', N'حي عريعره', 28, N'26.335134', N'44.818365')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (877, N'حي سمنان', N'حي سمنان', 28, N'26.289788999999999', N'44.833395000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (878, N'حي علقة', N'حي علقة', 28, N'26.340848000000001', N'44.786244000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (879, N'حي الصديق', N'حي الصديق', 28, N'26.299223999999999', N'44.825626')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (880, N'حي الفالح', N'حي الفالح', 28, N'26.278597999999999', N'44.834848000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (881, N'حي السلام', N'حي السلام', 28, N'26.317440999999999', N'44.82864')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (882, N'حي الريان', N'حي الريان', 28, N'26.309272', N'44.890216000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (883, N'حي القدس', N'حي القدس', 28, N'26.296787999999999', N'44.796953000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (884, N'حي اليرموك', N'حي اليرموك', 28, N'26.313033000000001', N'44.815773')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (885, N'حي اليمامة', N'حي اليمامة', 28, N'26.323703999999999', N'44.794116000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (886, N'حي السيح', N'حي السيح', 28, N'26.327323', N'44.809235999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (887, N'حي الصناعية', N'حي الصناعية', 28, N'26.296571', N'44.874732000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (888, N'حي العزيزية', N'حي العزيزية', 28, N'26.303647999999999', N'44.806438')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (889, N'حي الفاروق', N'حي الفاروق', 28, N'26.305495000000001', N'44.820650000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (890, N'الشدخ', N'الشدخ', 31, N'24.705912000000001', N'37.603492000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (891, N'الحرة', N'الحرة', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (892, N'النصبة', N'النصبة', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (893, N'القرص', N'القرص', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (894, N'الشبعان', N'الشبعان', 31, N'24.763331487444201', N'37.212658787952897')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (895, N'الحسي', N'الحسي', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (896, N'البوانة', N'البوانة', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (897, N'السهلة', N'السهلة', 31, N'24.9730884508283', N'37.8078231897967')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (898, N'المقرح', N'المقرح', 31, N'25.048083999999999', N'37.332830999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (899, N'الحائل', N'الحائل', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (900, N'الشبحة', N'الشبحة', 31, N'24.807727', N'37.728107000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (901, N'مرخ', N'مرخ', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (902, N'عمق', N'عمق', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (903, N'ذرفي', N'ذرفي', 31, N'25.650496128948301', N'37.232418616768797')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (904, N'الرويضات', N'الرويضات', 31, N'25.001861000000002', N'37.663080000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (905, N'صروم', N'صروم', 31, N'24.8250391197863', N'37.4723275533674')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (906, N'العنبجه', N'العنبجه', 31, N'25.658727797247401', N'37.537435856969303')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (907, N'شثاث', N'شثاث', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (908, N'المنزلة', N'المنزلة', 31, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (909, N'الصبوح', N'الصبوح', 32, N'22.804017999999999', N'39.043731000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (910, N'الصليب الغربي', N'الصليب الغربي', 32, N'22.827919999999999', N'39.022435999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (911, N'الصليب الشرقي', N'الصليب الشرقي', 32, N'22.830362000000001', N'39.036267000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (912, N'الجود', N'الجود', 32, N'22.771000000000001', N'39.032682999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (913, N'الصمد', N'الصمد', 32, N'22.795102', N'39.030467999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (914, N'السوق', N'السوق', 32, N'22.807236', N'39.034129')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (915, N'الفرنيسية الشرقية', N'الفرنيسية الشرقية', 32, N'22.793392000000001', N'39.055489999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (916, N'حي المفنوحة', N'حي المفنوحة', 33, N'23.908321000000001', N'42.921438000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (917, N'حي الملك خالد', N'حي الملك خالد', 33, N'23.910129999999999', N'42.913924999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (918, N'حي المعارض', N'حي المعارض', 33, N'23.883343', N'42.886937000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (919, N'حي الملز', N'حي الملز', 33, N'23.887674000000001', N'42.910910000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (920, N'حي الخزان', N'حي الخزان', 33, N'23.912391', N'42.929003000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (921, N'حي الاصفر', N'حي الاصفر', 33, N'23.902695999999999', N'42.907003000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (922, N'حي النهضة', N'حي النهضة', 33, N'23.903227000000001', N'42.898615999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (923, N'حي الصالحية', N'حي الصالحية', 33, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (924, N'حي العود', N'حي العود', 33, N'23.917033', N'42.928901000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (925, N'حي السليمانية', N'حي السليمانية', 33, N'23.924075999999999', N'42.914878000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (926, N'حي الصناعية', N'حي الصناعية', 33, N'23.922058', N'42.921903')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (927, N'حي الملك فيصل', N'حي الملك فيصل', 33, N'23.900153', N'42.916137999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (928, N'حي الاذاعة', N'حي الاذاعة', 33, N'23.867799000000002', N'42.902208000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (929, N'حي الخالدية', N'حي الخالدية', 34, N'25.285550000000001', N'45.863852000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (930, N'حي الفيصلية', N'حي الفيصلية', 34, N'25.282354000000002', N'45.859181999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (931, N'حي الجنادرية', N'حي الجنادرية', 34, N'25.269507999999998', N'45.864493000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (932, N'طريق الملك عبد العزيز', N'طريق الملك عبد العزيز', 34, N'25.267195250726701', N'45.867417789790302')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (933, N'حي الديرة القديمة', N'حي الديرة القديمة', 34, N'25.296241999999999', N'45.869183')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (934, N'حي ثادق', N'حي ثادق', 34, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (935, N'حي الرويضة', N'حي الرويضة', 34, N'25.206091000000001', N'45.854076999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (936, N'حي الجامعة', N'حي الجامعة', 34, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (937, N' حي الديرة', N' حي الديرة', 35, N'26.485596000000001', N'50.035935000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (938, N' حي النقا الغربي', N' حي النقا الغربي', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (939, N' حي الحالة', N' حي الحالة', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (940, N' حي النقا الخيال', N' حي النقا الخيال', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (941, N' حي النور', N' حي النور', 35, N'26.483661999999999', N'50.042219000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (942, N' حي الخصاب', N' حي الخصاب', 35, N'26.491624999999999', N'50.035684000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (943, N' حي الطف', N' حي الطف', 35, N'26.492294999999999', N'50.030951000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (944, N' حي الدولاب', N' حي الدولاب', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (945, N'حي قرطبة', N'حي قرطبة', 35, N'26.499527', N'50.035490000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (946, N' حي النمر الشمالي', N' حي النمر الشمالي', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (947, N' حي المنتزة ', N' حي المنتزة ', 35, N'26.492442', N'50.043097000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (948, N' حي غرناطة ', N' حي غرناطة ', 35, N'26.474471999999999', N'50.052197999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (949, N' حي الفردوس', N' حي الفردوس', 35, N'26.475196', N'50.045523000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (950, N'حي الخليج ', N'حي الخليج ', 35, N'26.470243', N'50.032226999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (951, N' حي السلام', N' حي السلام', 35, N'26.474795', N'50.038761000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (952, N' حي الزهور ', N' حي الزهور ', 35, N'26.469835', N'50.038423000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (953, N'حي الدانة', N'حي الدانة', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (954, N' حي الكوثر', N' حي الكوثر', 35, N'26.478598000000002', N'50.061793999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (955, N'حي الغدير', N'حي الغدير', 35, N'26.488427000000001', N'50.051468999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (956, N' حي النسيم ', N' حي النسيم ', 35, N'26.505845999999998', N'50.039270000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (957, N' حي الصاروخ', N' حي الصاروخ', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (958, N'حي الجمعية', N'حي الجمعية', 35, N'26.4936389517366', N'50.042160032592598')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (959, N'حي البدر', N'حي البدر', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (960, N' حي الفيحاء', N' حي الفيحاء', 35, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (961, N'التاخي', N'التاخي', 37, N'24.096306999999999', N'38.098562000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (962, N'االبحيرة', N'االبحيرة', 37, N'24.079139000000001', N'38.079154000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (963, N'الواحة', N'الواحة', 37, N'24.077976', N'38.105556')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (964, N'الصواري', N'الصواري', 37, N'24.067336999999998', N'38.110917000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (965, N'الفلاح', N'الفلاح', 37, N'24.131429000000001', N'38.011386000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (966, N'الصبح', N'الصبح', 37, N'23.991889', N'38.195242999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (967, N'الشروق', N'الشروق', 37, N'24.089845', N'38.078195000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (968, N'الصاعدية', N'الصاعدية', 37, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (969, N'البثنة', N'البثنة', 37, N'24.002655000000001', N'38.167206')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (970, N'المحارة', N'المحارة', 37, N'24.047799999999999', N'38.127265000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (971, N'الديار', N'الديار', 37, N'24.103031000000001', N'38.081915000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (972, N'الجار', N'الجار', 37, N'24.034130999999999', N'38.153219')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (973, N'الصهاريج', N'الصهاريج', 37, N'24.091989999999999', N'38.060350999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (974, N'النخيل', N'النخيل', 37, N'24.016769', N'38.189033999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (975, N'البهجة', N'البهجة', 37, N'24.127117999999999', N'38.005235999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (976, N'المشهد', N'المشهد', 37, N'24.124863000000001', N'38.047958999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (977, N'المجد', N'المجد', 37, N'24.067475999999999', N'38.098911999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (978, N'اللؤلؤ', N'اللؤلؤ', 37, N'24.05808', N'38.127322999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (979, N'الشاطئ', N'الشاطئ', 37, N'24.094621', N'38.014513000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (980, N'الربيع', N'الربيع', 37, N'24.073819', N'38.123199')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (981, N'السميري', N'السميري', 37, N'24.018846', N'38.216437999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (982, N'السميري 2', N'السميري 2', 37, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (983, N'الاضواء', N'الاضواء', 37, N'24.07375', N'38.135531999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (984, N'الشربتلي', N'الشربتلي', 37, N'24.088086000000001', N'38.052728000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (985, N'الحدائق', N'الحدائق', 37, N'24.087009999999999', N'38.059564000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (986, N'الفيصل', N'الفيصل', 37, N'24.027519000000002', N'38.203792999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (987, N'الصريف', N'الصريف', 37, N'24.083717', N'38.043435000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (988, N'المهن', N'المهن', 37, N'24.031656999999999', N'38.229000999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (989, N'رضوى النقادي', N'رضوى النقادي', 37, N'24.130022', N'38.151744000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (990, N'رضوى', N'رضوى', 37, N'24.005549999999999', N'38.203552000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (991, N'الجامعة العربية', N'الجامعة العربية', 37, N'24.091545', N'38.086705000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (992, N'النزهة', N'النزهة', 37, N'24.150058000000001', N'37.953029000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (993, N'العصبلي', N'العصبلي', 37, N'24.106428999999999', N'38.068370000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (994, N'العيون', N'العيون', 37, N'24.010552000000001', N'38.179603')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (995, N'الجابرية ', N'الجابرية ', 37, N'24.018218999999998', N'38.201360000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (996, N'الصواري ', N'الصواري ', 37, N'24.067239000000001', N'38.109543000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (997, N'الخريق', N'الخريق', 37, N'24.083480999999999', N'38.061663000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (998, N'النهضة', N'النهضة', 37, N'24.120274999999999', N'38.023868999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (999, N'السويق', N'السويق', 37, N'24.041844999999999', N'38.22025')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1000, N'الريان', N'الريان', 37, N'24.123256999999999', N'38.112808000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1001, N'المبارك', N'المبارك', 37, N'24.116887999999999', N'38.094428000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1002, N'النهضة ', N'النهضة ', 37, N'24.120031000000001', N'38.024039999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1003, N'البندر', N'البندر', 37, N'24.103448', N'38.019542000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1004, N'التعاون', N'التعاون', 37, N'24.136158999999999', N'37.994517999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1005, N'الجابرية', N'الجابرية', 37, N'24.018711', N'38.202371999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1006, N'السلام', N'السلام', 37, N'24.141714', N'38.001705000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1007, N'الامارة', N'الامارة', 37, N'24.087579999999999', N'38.037050000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1008, N'الياقوت', N'الياقوت', 37, N'24.064726', N'38.120933000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1009, N'الخالد', N'الخالد', 37, N'24.005146', N'38.187556000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1010, N'المسرة', N'المسرة', 37, N'24.072776000000001', N'38.113039000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1011, N'الزهور', N'الزهور', 37, N'24.084629', N'38.054530999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1012, N'النواة', N'النواة', 37, N'24.000225', N'38.218798')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1013, N'العزيزية', N'العزيزية', 37, N'24.028942000000001', N'38.186078999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1014, N'السور', N'السور', 37, N'24.080174', N'38.059451000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1015, N'المنتزه', N'المنتزه', 37, N'24.108332999999998', N'38.113587000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1016, N'شجوى', N'شجوى', 37, N'24.126355', N'38.117569000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1017, N'حي الأندلس', N'حي الأندلس', 38, N'25.217178000000001', N'45.241528000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1018, N'حي الاسكان', N'حي الاسكان', 38, N'25.249822000000002', N'45.217846000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1019, N'حي القارة', N'حي القارة', 38, N'25.227959999999999', N'45.253892999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1020, N'حي الخالدية', N'حي الخالدية', 39, N'24.514115', N'44.379930000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1021, N'حي الحرمين', N'حي الحرمين', 39, N'24.518464999999999', N'44.409678')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1022, N'حي الخليج', N'حي الخليج', 39, N'24.493955', N'44.373845000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1023, N'حي النزهة', N'حي النزهة', 39, N'24.548739999999999', N'44.455449999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1024, N'حي وسط الروضة', N'حي وسط الروضة', 39, N'24.494698065391098', N'44.365616274465097')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1025, N'حي الدرع', N'حي الدرع', 39, N'24.534697999999999', N'44.434542')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1026, N'حي بدر', N'حي بدر', 39, N'24.533577999999999', N'44.412675')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1027, N'حي مشرفة', N'حي مشرفة', 39, N'24.927123999999999', N'43.788977000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1028, N'حي عريدة', N'حي عريدة', 39, N'24.355045', N'44.501843000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1029, N'حي الفيصلية', N'حي الفيصلية', 39, N'24.502799', N'44.378864999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1030, N'حي الديرة', N'حي الديرة', 39, N'24.497115000000001', N'44.382505000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1031, N'حي الريان', N'حي الريان', 39, N'24.554099999999998', N'44.442695000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1032, N'حي القدس', N'حي القدس', 39, N'24.512326000000002', N'44.409069000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1033, N'حي النهضة', N'حي النهضة', 39, N'24.520482999999999', N'44.421743999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1034, N'حي الملك فهد', N'حي الملك فهد', 39, N'24.538518', N'44.420234999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1035, N'حي حطين', N'حي حطين', 39, N'24.544245', N'44.427824999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1036, N'حي السلام', N'حي السلام', 39, N'24.512018000000001', N'44.395046000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1037, N'حي العزيزية', N'حي العزيزية', 39, N'24.525486999999998', N'44.405920999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1038, N'حي الطريف', N'حي الطريف', 40, N'24.733986999999999', N'46.574826999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1039, N'حي غصيبة ', N'حي غصيبة ', 40, N'24.746445474295601', N'46.561662889801703')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1040, N'حي البجيري ', N'حي البجيري ', 40, N'24.737338000000001', N'46.575079000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1041, N'حي السريحه', N'حي السريحه', 40, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1042, N'أم سريحة ', N'أم سريحة ', 41, N'23.712716', N'44.594002000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1043, N'أم نخلة ', N'أم نخلة ', 41, N'23.859877954482901', N'44.8212113051625')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1044, N'الأمار ', N'الأمار ', 41, N'23.774408000000001', N'45.076855999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1045, N'البدع ', N'البدع ', 41, N'23.557917', N'44.840322')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1046, N'الجفارة ', N'الجفارة ', 41, N'23.986516999999999', N'45.184246000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1047, N'الحرملية', N'الحرملية', 41, N'24.273119000000001', N'45.183781000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1048, N'الخاصرة ', N'الخاصرة ', 41, N'23.407599000000001', N'43.956958999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1049, N'حلبان ', N'حلبان ', 41, N'23.488386999999999', N'44.392158000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1050, N'الفويلق الشمالي ', N'الفويلق الشمالي ', 41, N'24.4220412240483', N'45.311502386111698')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1051, N'القتلة ', N'القتلة ', 41, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1052, N'المليحات', N'المليحات', 41, N'23.626919000000001', N'45.892183000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1053, N'الخروعية', N'الخروعية', 41, N'23.838380000000001', N'45.641928')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1054, N'الخروعية القديمة ', N'الخروعية القديمة ', 41, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1055, N'الخنيقية ', N'الخنيقية ', 41, N'24.262625', N'45.097450000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1056, N'الرفايع ', N'الرفايع ', 41, N'23.569278000000001', N'45.566079999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1057, N'الرويضة ', N'الرويضة ', 41, N'23.772117999999999', N'44.771397')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1058, N'
طحي
', N'
طحي
', 41, N'23.712016999999999', N'44.678542')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1059, N'العجيج بالرين ', N'العجيج بالرين ', 41, N'23.539057', N'45.509444000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1060, N'الفهيدات ', N'الفهيدات ', 41, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1061, N'الفويسة ', N'الفويسة ', 41, N'23.945463', N'45.555385000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1062, N'الفويلق ', N'الفويلق ', 41, N'24.407189124884798', N'45.309827032138102')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1063, N' شخيب', N' شخيب', 42, N'24.485296999999999', N'46.265076000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1064, N'الجفير', N'الجفير', 42, N'24.027180999999999', N'46.298113000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1065, N' الحفيرة', N' الحفيرة', 42, N'24.180416999999998', N'46.361868000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1066, N' الحويره', N' الحويره', 42, N'24.158147', N'46.273859999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1067, N' البخراء', N' البخراء', 42, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1068, N' المشاعله', N' المشاعله', 42, N'24.499148000000002', N'46.035815999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1069, N' الزباير', N' الزباير', 42, N'24.4317703104829', N'46.203185703301997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1070, N' الفيصليه', N' الفيصليه', 42, N'24.493169000000002', N'46.335073000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1071, N'
اللغفية
', N'
اللغفية
', 42, N'24.162299000000001', N'46.222830999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1072, N' الصدر الأعلى', N' الصدر الأعلى', 42, N'23.995073000000001', N'46.113714999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1073, N' مركز الرايس', N' مركز الرايس', 43, N'23.575417999999999', N'38.606679999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1074, N' مركز القاحة', N' مركز القاحة', 43, N'23.64378', N'39.292566000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1075, N' مركز المسيجيد', N' مركز المسيجيد', 43, N'24.090637999999998', N'39.09843')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1076, N' مركز الواسطة', N' مركز الواسطة', 43, N'23.879054', N'38.908439000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1077, N' مركز بئر الروحاء', N' مركز بئر الروحاء', 43, N'24.073601', N'39.166701000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1078, N' مركز الشفيه', N' مركز الشفيه', 43, N'23.828997999999999', N'39.147401000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1079, N' مركز طاشا', N' مركز طاشا', 43, N'24.223611999999999', N'38.856757999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1080, N' مركز أم البرك', N' مركز أم البرك', 43, N'23.430195000000001', N'39.228793000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1081, N' مركز الحسنية', N' مركز الحسنية', 43, N'23.848258999999999', N'38.897727000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1082, N' مركز الفارعة', N' مركز الفارعة', 43, N'23.813023000000001', N'38.881044000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1083, N'مقبولة', N'مقبولة', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1084, N'البركة', N'البركة', 44, N'24.108142000000001', N'47.238703000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1085, N'المنتزه', N'المنتزه', 44, N'24.163820999999999', N'47.325943000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1086, N'المحمدية', N'المحمدية', 44, N'24.176557452450499', N'47.303682574471999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1087, N'المروة', N'المروة', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1088, N'النهضة', N'النهضة', 44, N'24.156872', N'47.333506999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1089, N'اللؤلؤة', N'اللؤلؤة', 44, N'24.1618240922963', N'47.320604016801198')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1090, N'السلمية', N'السلمية', 44, N'24.1998619744253', N'47.282689645635898')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1091, N'الأندلس', N'الأندلس', 44, N'24.150504000000002', N'47.345891000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1092, N'المنيفية', N'المنيفية', 44, N'24.176582', N'47.292993000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1093, N'الرفيعة', N'الرفيعة', 44, N'24.186909', N'47.271290999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1094, N'السليمانية', N'السليمانية', 44, N'24.150677999999999', N'47.305568000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1095, N'الاخوين', N'الاخوين', 44, N'24.2389679572948', N'47.494183072918702')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1096, N'الوسيطاء', N'الوسيطاء', 44, N'22.331849999999999', N'46.632899999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1097, N'الريان', N'الريان', 44, N'24.149377999999999', N'47.324708000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1098, N'السلام', N'السلام', 44, N'24.157125000000001', N'47.317373000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1099, N'العزيزة', N'العزيزة', 44, N'24.148298', N'47.296118')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1100, N'الخزامى ', N'الخزامى ', 44, N'24.133488', N'47.273156999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1101, N'الخالدية ', N'الخالدية ', 44, N'24.125606000000001', N'47.279874999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1102, N'المنصورة', N'المنصورة', 44, N'24.181156000000001', N'47.332369999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1103, N'اليمامه', N'اليمامه', 44, N'24.181511', N'47.323915999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1104, N'الحمراء', N'الحمراء', 44, N'24.166281735440499', N'47.3136227149527')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1105, N'الورود', N'الورود', 44, N'24.170712614964799', N'47.314630842927698')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1106, N'البرج', N'البرج', 44, N'24.168641000000001', N'47.310710999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1107, N'جوهرة البرج', N'جوهرة البرج', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1108, N'الجامعة', N'الجامعة', 44, N'24.153572415017099', N'47.271700478138499')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1109, N'حطين', N'حطين', 44, N'24.147295329504601', N'47.304061861059701')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1110, N'الناصفة', N'الناصفة', 44, N'24.195143000000002', N'47.286020000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1111, N'البديعة', N'البديعة', 44, N'24.187035000000002', N'47.298957999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1112, N'السعادة', N'السعادة', 44, N'24.188400000000001', N'47.397742000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1113, N'السهباء', N'السهباء', 44, N'24.193204000000001', N'47.388258999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1114, N'المصيف', N'المصيف', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1115, N'الثقافة', N'الثقافة', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1116, N'الصفوة الأول', N'الصفوة الأول', 44, N'24.147345999999999', N'47.383659999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1117, N'اليرموك', N'اليرموك', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1118, N'السحاب', N'السحاب', 44, N'24.145708185940801', N'47.382655589814497')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1119, N'الزاهر', N'الزاهر', 44, N'24.146391000000001', N'47.359459999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1120, N'الفيصلية', N'الفيصلية', 44, N'24.160019999999999', N'47.353574000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1121, N'الاندلس', N'الاندلس', 44, N'24.150112', N'47.345253')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1122, N'النزهة', N'النزهة', 44, N'24.162872', N'47.343986999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1123, N'النهضة', N'النهضة', 44, N'24.157119000000002', N'47.333485000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1124, N'العاصمية', N'العاصمية', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1125, N'العالية', N'العالية', 44, N'24.173321999999999', N'47.345460000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1126, N'النزهة', N'النزهة', 44, N'24.163046999999999', N'47.343417000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1127, N'البركة', N'البركة', 44, N'24.104545000000002', N'47.235039999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1128, N'الدانة', N'الدانة', 44, N'24.234912419367401', N'47.222009258710202')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1129, N'فرزان', N'فرزان', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1130, N'الحي', N'الحي', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1131, N'الروضة', N'الروضة', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1132, N'البدع', N'البدع', 44, N'24.949000999999999', N'43.717775000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1133, N'الفيحاء', N'الفيحاء', 44, N'25.068632000000001', N'43.809978999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1134, N'غرناطة', N'غرناطة', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1135, N'العيون', N'العيون', 44, N'24.113351821399501', N'47.259141522347598')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1136, N'مشرف ', N'مشرف ', 44, N'24.100603', N'47.268369999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1137, N'الروابي', N'الروابي', 44, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1138, N'الهدا', N'الهدا', 44, N'24.107327491171102', N'47.285259476321798')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1139, N'قرطبة', N'قرطبة', 44, N'23.986283733168499', N'47.117521751149198')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1140, N'الراشدية', N'الراشدية', 44, N'24.093997000000002', N'47.237144000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1141, N'الصفا', N'الصفا', 44, N'24.181239000000001', N'47.275036999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1142, N'العدامة', N'العدامة', 44, N'24.0920201580712', N'47.226893249026503')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1143, N'الصفوة الثاني', N'الصفوة الثاني', 44, N'24.168745000000001', N'47.366976000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1144, N'حي الديرة', N'حي الديرة', 45, N'23.993027999999999', N'47.160151999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1145, N'حي الصحنة', N'حي الصحنة', 45, N'23.988530000000001', N'47.135443000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1146, N'حي الناصرية', N'حي الناصرية', 45, N'23.987767999999999', N'47.166201999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1147, N'حي الخالدية', N'حي الخالدية', 45, N'24.015124', N'47.171014')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1148, N'حي العذار', N'حي العذار', 45, N'23.983839', N'47.148971000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1149, N'حي زميقة', N'حي زميقة', 45, N'23.950620000000001', N'47.167783999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1150, N'حي النخيل', N'حي النخيل', 45, N'23.984775348133901', N'47.147719845640601')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1151, N'حي الوادي', N'حي الوادي', 45, N'23.942201021902701', N'47.113337721895')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1152, N'حي بدر', N'حي بدر', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1153, N'حي الصناعية', N'حي الصناعية', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1154, N'حي السلام', N'حي السلام', 45, N'24.0175109834388', N'47.137640745639899')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1155, N'حي الازدهار', N'حي الازدهار', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1156, N'حي الياسمين', N'حي الياسمين', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1157, N'حي سدير', N'حي سدير', 45, N'23.984629999999999', N'47.122656999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1158, N'حي الفلاح', N'حي الفلاح', 45, N'24.018511231125199', N'47.135074909795499')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1159, N'حي العليا', N'حي العليا', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1160, N'حي المزرعة', N'حي المزرعة', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1161, N'حي السلمانية', N'حي السلمانية', 45, N'23.961206000000001', N'47.117784')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1162, N'حي الفيصلية', N'حي الفيصلية', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1163, N'الحي النهضة', N'الحي النهضة', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1164, N'حي الريان', N'حي الريان', 45, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1165, N'حي الحمراء', N'حي الحمراء', 46, N'27.168510000000001', N'42.421317999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1166, N'حي الازدهار', N'حي الازدهار', 46, N'27.190339999999999', N'42.431519000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1167, N'حي الورود', N'حي الورود', 46, N'27.180281999999998', N'42.424311000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1168, N'حي الصناعية', N'حي الصناعية', 46, N'27.145379999999999', N'42.423485999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1169, N'حي السلام', N'حي السلام', 46, N'27.194271000000001', N'42.457230000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1170, N'حي العزيزية', N'حي العزيزية', 46, N'27.199926999999999', N'42.480258999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1171, N'حي النهضة', N'حي النهضة', 46, N'27.183374000000001', N'42.444029999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1172, N'حي العليا', N'حي العليا', 46, N'27.158446999999999', N'42.421782')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1173, N'حي الخليج', N'حي الخليج', 46, N'27.166906999999998', N'42.445099999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1174, N'حي الصالحية', N'حي الصالحية', 46, N'27.175719999999998', N'42.464995999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1175, N'حي النزهة', N'حي النزهة', 47, N'21.912837', N'42.027484999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1176, N'حي المحمدية', N'حي المحمدية', 47, N'21.930332', N'42.028621000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1177, N'حي الحزم', N'حي الحزم', 47, N'21.911984', N'42.020439000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1178, N'حي السوق القديم', N'حي السوق القديم', 47, N'21.908332999999999', N'42.037354999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1179, N'حي الدغمية', N'حي الدغمية', 47, N'21.964414999999999', N'42.051121000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1180, N'حي الروضة', N'حي الروضة', 47, N'21.920452999999998', N'42.023144000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1181, N'حي السليمية', N'حي السليمية', 47, N'21.956412', N'42.059005999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1182, N'حي الخالدية', N'حي الخالدية', 47, N'21.905304999999998', N'42.016655')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1183, N'حي الحديقة', N'حي الحديقة', 47, N'21.913008999999999', N'42.032195000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1184, N'حي الفيصلية', N'حي الفيصلية', 47, N'21.920200000000001', N'42.030267000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1185, N'حي الهجرة', N'حي الهجرة', 47, N'21.897570000000002', N'42.030675000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1186, N'حي الحارثية', N'حي الحارثية', 47, N'21.903030000000001', N'42.037574999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1187, N'حي النخيل', N'حي النخيل', 48, N'21.611270999999999', N'39.692354000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1188, N'حي العزيزية', N'حي العزيزية', 48, N'21.623529999999999', N'39.700809')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1189, N'حي الخالدية', N'حي الخالدية', 48, N'21.610496999999999', N'39.699199999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1190, N'حي النسيم', N'حي النسيم', 48, N'21.620619000000001', N'39.704346000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1191, N'حي النقابة', N'حي النقابة', 48, N'21.629989999999999', N'39.673403999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1192, N'حي الصفاء', N'حي الصفاء', 48, N'21.624307999999999', N'39.693629999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1193, N'حي الفيصلية', N'حي الفيصلية', 48, N'21.616071000000002', N'39.685758999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1194, N'حي النقابة', N'حي النقابة', 48, N'21.630002999999999', N'39.674458999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1195, N'حي أبو عروة', N'حي أبو عروة', 48, N'21.647268', N'39.697712000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1196, N'حي عين شمس', N'حي عين شمس', 48, N'21.648482999999999', N'39.759644999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1197, N'حي سدر', N'حي سدر', 48, N'21.621825999999999', N'39.668042')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1198, N'حي مدركة', N'حي مدركة', 48, N'21.991295999999998', N'40.009231')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1199, N'حي النزهة', N'حي النزهة', 48, N'21.538446', N'39.642194000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1200, N'حي الريان', N'حي الريان', 48, N'21.680402999999998', N'39.902098000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1201, N' القريات', N' القريات', 48, N'21.653796', N'39.632801000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1202, N' السلامة', N' السلامة', 48, N'21.654724000000002', N'39.670574000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1203, N' أبو شعيب', N' أبو شعيب', 48, N'21.582256999999998', N'39.703114999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1204, N' وادي فاطمة', N' وادي فاطمة', 48, N'21.609091606103', N'39.707656988016502')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1205, N' النهضة', N' النهضة', 49, N'19.123878000000001', N'41.914189')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1206, N' الخالدية', N' الخالدية', 49, N'19.126878999999999', N'41.926999000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1207, N' الصناعية', N' الصناعية', 49, N'19.108255', N'41.909030999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1208, N' الاندلس', N' الاندلس', 49, N'19.103867000000001', N'41.945540000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1209, N' الخليج', N' الخليج', 49, N'19.087513999999999', N'41.938692000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1210, N' الفيصلية', N' الفيصلية', 49, N'19.09571', N'41.929361999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1211, N' الشرق', N' الشرق', 49, N'19.105136000000002', N'41.925086999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1212, N' التقدم', N' التقدم', 49, N'19.134744999999999', N'41.916673000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1213, N' الربيع', N' الربيع', 49, N'19.134437999999999', N'41.905599000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1214, N' النسيم', N' النسيم', 49, N'19.127210000000002', N'41.939025000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1215, N' العدالة', N' العدالة', 49, N'19.114688999999998', N'41.931507000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1216, N'عسيلة', N'عسيلة', 50, N'23.694559999999999', N'45.342978000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1217, N'ساجر', N'ساجر', 50, N'25.185500999999999', N'44.602606999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1218, N'نفي', N'نفي', 50, N'25.008357', N'43.815474000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1219, N'شبيرمة', N'شبيرمة', 50, N'24.674423000000001', N'43.543294000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1220, N'عروى', N'عروى', 50, N'23.907129000000001', N'44.631284999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1221, N'أوضاخ', N'أوضاخ', 50, N'25.246433', N'43.919234000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1222, N'رفائع الجمش', N'رفائع الجمش', 50, N'24.678061', N'43.689194000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1223, N'منيفة جلوي', N'منيفة جلوي', 50, N'24.577503', N'43.551048999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1224, N'النهضة', N'النهضة', 52, N'20.127151000000001', N'42.615589999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1225, N'التضامن', N'التضامن', 52, N'20.053076999999998', N'42.556843999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1226, N'الصفا', N'الصفا', 52, N'20.022621999999998', N'42.654778999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1227, N'الفيحاء', N'الفيحاء', 52, N'20.110154999999999', N'42.631948999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1228, N'الربيع', N'الربيع', 52, N'19.974119000000002', N'42.681871000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1229, N'الامير سلطان', N'الامير سلطان', 52, N'19.928899000000001', N'42.598886999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1230, N'الخزامي', N'الخزامي', 52, N'20.017752999999999', N'42.616571')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1231, N'الروضة', N'الروضة', 52, N'20.073958000000001', N'42.636966000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1232, N'النخيل', N'النخيل', 52, N'20.020894999999999', N'42.592815000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1233, N'الربوة', N'الربوة', 52, N'20.060307000000002', N'42.659598000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1234, N'الملك عبدالله', N'الملك عبدالله', 52, N'19.973879', N'42.595381000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1235, N'النزهة', N'النزهة', 52, N'19.883775', N'42.600467999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1236, N'الخزان', N'الخزان', 52, N'20.053014000000001', N'42.698048')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1237, N'المطار', N'المطار', 52, N'19.977247999999999', N'42.626545999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1238, N'المروج', N'المروج', 52, N'19.961245000000002', N'42.572245000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1239, N'الريان', N'الريان', 52, N'20.015785000000001', N'42.698399999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1240, N'الفهد', N'الفهد', 52, N'19.999661', N'42.607069000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1241, N'الوادي', N'الوادي', 52, N'19.887449', N'42.560912000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1242, N'البوادي', N'البوادي', 52, N'19.997461000000001', N'42.544240000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1243, N'الزهور', N'الزهور', 52, N'20.107191', N'42.670861000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1244, N'النسيم', N'النسيم', 52, N'20.032589999999999', N'42.634476999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1245, N'الورود', N'الورود', 52, N'20.090450000000001', N'42.687897999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1246, N'الحاني', N'الحاني', 53, N'20.027760000000001', N'41.450048000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1247, N'القرون', N'القرون', 53, N'20.022635999999999', N'41.454163000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1248, N'البشير', N'البشير', 53, N'20.029398430503701', N'41.485291968150001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1249, N' الشامية ', N' الشامية ', 54, N'19.129954999999999', N'41.080609000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1250, N' الناعمية ', N' الناعمية ', 54, N'19.125423000000001', N'41.079203999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1251, N' الرتبة', N' الرتبة', 54, N'19.126180999999999', N'41.076179000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1252, N' الخالدية ', N' الخالدية ', 54, N'19.143739', N'41.077325999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1253, N' الشرقية', N' الشرقية', 54, N'19.128236999999999', N'41.087193999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1254, N' الغربي ', N' الغربي ', 54, N'19.1313', N'41.077615999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1255, N'مخطط البرج', N'مخطط البرج', 54, N'19.118077', N'41.096074999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1256, N' الأزهار', N' الأزهار', 54, N'19.122729', N'41.083697000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1257, N' الشاطئ', N' الشاطئ', 54, N'19.166397', N'41.069631999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1258, N' الإسكان', N' الإسكان', 54, N'19.180243138701201', N'41.082600487563298')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1259, N'محايل', N'محايل', 55, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1260, N'بحر أبو سكينة', N'بحر أبو سكينة', 55, N'18.336189000000001', N'41.916806000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1261, N'قنا', N'قنا', 55, N'18.337109000000002', N'41.992381999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1262, N'تهامة بللسمر وبللحمر', N'تهامة بللسمر وبللحمر', 55, N'18.682522226008899', N'42.107864295597402')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1263, N'حميد العلايا', N'حميد العلايا', 55, N'18.775544004534702', N'41.910082387734597')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1264, N'سعيدة الصوالحة', N'سعيدة الصوالحة', 55, N'18.594714', N'41.437618000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1265, N'أخلال', N'أخلال', 55, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1266, N'حبطن', N'حبطن', 55, N'18.676905919883001', N'41.8387628322441')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1267, N'الساحل', N'الساحل', 57, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1268, N'القرفاء', N'القرفاء', 57, N'27.254496', N'42.307985000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1269, N'الصمدة', N'الصمدة', 57, N'27.353694000000001', N'35.690762999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1270, N'المطار', N'المطار', 57, N'27.351168999999999', N'35.685023999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1271, N'المقيطع', N'المقيطع', 57, N'27.342876', N'35.704343000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1272, N'أرامكو', N'أرامكو', 57, N'27.329991194151201', N'35.736711330722002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1273, N'الضاحية', N'الضاحية', 57, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1274, N'الورود', N'الورود', 57, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1275, N'القادسية', N'القادسية', 57, N'27.337135115206699', N'35.727060101387501')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1276, N'المروج', N'المروج', 57, N'27.343514484515701', N'35.729566010552801')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1277, N'عيانة', N'عيانة', 57, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1278, N'برزان  ', N'برزان  ', 59, N'27.526071000000002', N'41.702942999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1279, N' الرفاع ', N' الرفاع ', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1280, N'المعامرة', N'المعامرة', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1281, N'الدبدابة', N'الدبدابة', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1282, N'الديرة', N'الديرة', 59, N'26.572172999999999', N'50.065261')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1283, N'الشريا', N'الشريا', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1284, N'القوع', N'القوع', 59, N'26.654886444127602', N'49.962887261248603')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1285, N'المسبحية', N'المسبحية', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1286, N'الحزم', N'الحزم', 59, N'26.641966', N'49.910105000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1287, N'البدرية', N'البدرية', 59, N'25.316333', N'49.521121000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1288, N'مدينة الزهراء ', N'مدينة الزهراء ', 59, N'26.162019000000001', N'44.021349999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1289, N'المدينة الزينبية', N'المدينة الزينبية', 59, N'25.410037614891401', N'49.5976480533771')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1290, N'حي الرضا', N'حي الرضا', 59, N'26.566887999999999', N'50.031229000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1291, N'الصولية', N'الصولية', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1292, N'الخياطية', N'الخياطية', 59, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1293, N' مدينة العمال', N' مدينة العمال', 59, N'26.422995', N'50.109586')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1294, N' العقيق', N' العقيق', 60, N'26.530352000000001', N'50.019793')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1295, N' الأنوار', N' الأنوار', 60, N'26.524173000000001', N'50.004724000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1296, N' الإسكان', N' الإسكان', 60, N'26.519943000000001', N'49.973177')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1297, N' الراية', N' الراية', 60, N'26.516013999999998', N'49.985574')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1298, N' عنك', N' عنك', 60, N'26.520087', N'50.024740999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1299, N' الرمال', N' الرمال', 60, N'26.500557000000001', N'49.987878000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1300, N' البدر', N' البدر', 60, N'26.511455999999999', N'50.031213000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1301, N' البستان', N' البستان', 60, N'26.52205', N'50.022145000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1302, N' المحار', N' المحار', 60, N'26.525732000000001', N'50.030233000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1303, N'لعزيزية', N'لعزيزية', 61, N'31.681232999999999', N'38.655611')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1304, N'الخالدية', N'الخالدية', 61, N'31.676271', N'38.652925000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1305, N'المساعديه', N'المساعديه', 61, N'31.670966', N'38.649797999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1306, N'الروابي', N'الروابي', 61, N'31.666060999999999', N'38.646337000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1307, N'العروبة', N'العروبة', 61, N'31.669440000000002', N'38.64687')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1308, N'الفيصلية', N'الفيصلية', 61, N'31.671842000000002', N'38.682316')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1309, N'اليرموك', N'اليرموك', 61, N'31.674568000000001', N'38.672113000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1310, N'الصالحية', N'الصالحية', 61, N'31.662666000000002', N'38.665939999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1311, N'الخليج', N'الخليج', 61, N'31.660081999999999', N'38.678525')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1312, N'سلطانة', N'سلطانة', 61, N'31.668458999999999', N'38.670166000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1313, N'الورود', N'الورود', 61, N'31.661380000000001', N'38.690263000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1314, N'الشفاء ', N'الشفاء ', 61, N'31.651890999999999', N'38.668627000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1315, N'المطار', N'المطار', 62, N'30.985211', N'40.992780000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1316, N'الروضة', N'الروضة', 62, N'30.979538000000002', N'41.022742000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1317, N'جوهرة', N'جوهرة', 62, N'30.94885', N'41.007244999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1318, N'بدنة', N'بدنة', 62, N'30.993036', N'41.002885999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1319, N'النخيل', N'النخيل', 62, N'30.962858000000001', N'41.116857000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1320, N'غرناطة', N'غرناطة', 62, N'31.006879999999999', N'41.178832999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1321, N'المحمدية', N'المحمدية', 62, N'30.989079', N'41.027594000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1322, N'مشرف', N'مشرف', 62, N'30.966470999999999', N'41.004863999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1323, N'المنصورية', N'المنصورية', 62, N'30.986425000000001', N'41.061895')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1324, N'الضاحية', N'الضاحية', 62, N'30.929376999999999', N'41.094652000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1325, N'الصالحية', N'الصالحية', 62, N'30.978656999999998', N'41.048946000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1326, N'المساعدية', N'المساعدية', 62, N'30.971744999999999', N'41.009645999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1327, N'الفيصلية', N'الفيصلية', 62, N'30.984959', N'41.037689')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1328, N'الناصرية', N'الناصرية', 62, N'30.966221999999998', N'41.039048000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1329, N'الربوة', N'الربوة', 62, N'30.997713999999998', N'41.046503999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1330, N'المروج', N'المروج', 62, N'31.003958999999998', N'41.077862000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1331, N'الربوه', N'الربوه', 62, N'30.997719', N'41.046716000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1332, N'العزيزية', N'العزيزية', 62, N'30.990707', N'41.018582000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1333, N'الخالدية', N'الخالدية', 62, N'30.981625000000001', N'41.012143000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1334, N'الريان', N'الريان', 62, N'30.975207999999999', N'41.032007')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1335, N'القدس', N'القدس', 62, N'31.030709999999999', N'41.142229999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1336, N'الرفاع', N'الرفاع', 63, N'31.304511999999999', N'37.341980999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1337, N'العزيزية', N'العزيزية', 63, N'31.340624086087399', N'37.359690745460703')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1338, N'المروج', N'المروج', 63, N'31.310109000000001', N'37.371657999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1339, N'النسيم', N'النسيم', 63, N'31.310586000000001', N'37.349477')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1340, N'سعد بن زرارة', N'سعد بن زرارة', 63, N'31.332439834105202', N'37.350742644179597')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1341, N'مخطط 5', N'مخطط 5', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1342, N'معرض السيارات', N'معرض السيارات', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1343, N'الخزان', N'الخزان', 63, N'31.328808901641001', N'37.357812558954599')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1344, N'الصناعية', N'الصناعية', 63, N'31.341584999999998', N'37.351393999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1345, N'الفيصلية', N'الفيصلية', 63, N'31.344141', N'37.332059999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1346, N'الملك فهد', N'الملك فهد', 63, N'31.333313', N'37.313256000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1347, N'حصيده', N'حصيده', 63, N'31.326930999999998', N'37.374139999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1348, N'مخطط 4', N'مخطط 4', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1349, N'هجرة البلاعيس', N'هجرة البلاعيس', 63, N'31.351165999999999', N'37.30274')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1350, N'الحميدية', N'الحميدية', 63, N'31.329692999999999', N'37.348376000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1351, N'السديرية', N'السديرية', 63, N'31.330228000000002', N'37.336033999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1352, N'العليا', N'العليا', 63, N'31.328351999999999', N'37.327441')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1353, N'المطار', N'المطار', 63, N'31.322444999999998', N'37.336005')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1354, N'الورود', N'الورود', 63, N'31.406053749489502', N'37.258101648267598')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1355, N'مخطط 2', N'مخطط 2', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1356, N'مخطط 1', N'مخطط 1', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1357, N'الخالدية', N'الخالدية', 63, N'31.337658000000001', N'37.341234')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1358, N'الشفاء', N'الشفاء', 63, N'31.319731999999998', N'37.343992')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1359, N'الغزالي', N'الغزالي', 63, N'31.334923', N'37.326900999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1360, N'الملك عبد الله', N'الملك عبد الله', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1361, N'اليوسف', N'اليوسف', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1362, N'مخطط 3', N'مخطط 3', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1363, N'مخطط السديري', N'مخطط السديري', 63, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1364, N'الشهلوب', N'الشهلوب', 64, N'29.965257999999999', N'40.209476000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1365, N'الروابي ', N'الروابي ', 64, N'29.980523999999999', N'40.255316000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1366, N'الطوير', N'الطوير', 64, N'29.911588999999999', N'40.196202')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1367, N'المحمدية', N'المحمدية', 64, N'29.938559999999999', N'40.196477999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1368, N'المحمدية م', N'المحمدية م', 64, N'29.927415', N'40.199069000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1369, N'المروج', N'المروج', 64, N'29.980581999999998', N'40.241475999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1370, N'الحي الإداري', N'الحي الإداري', 64, N'29.958252000000002', N'40.19867')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1371, N'الهدا', N'الهدا', 64, N'29.948982999999998', N'40.151525999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1372, N'ج 18', N'ج 18', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1373, N'شمال سكاكا', N'شمال سكاكا', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1374, N'مخطط الصديق', N'مخطط الصديق', 64, N'29.973631999999998', N'40.230746000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1375, N'مخطط الفيصلي', N'مخطط الفيصلي', 64, N'29.927161000000002', N'40.184327000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1376, N'مخطط غرب الإقليمي', N'مخطط غرب الإقليمي', 64, N'30.002970000000001', N'40.218105000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1377, N'المعالقة', N'المعالقة', 64, N'29.981998000000001', N'40.205835999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1378, N'الروابي', N'الروابي', 64, N'29.980829', N'40.254002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1379, N'شمال قارا', N'شمال قارا', 64, N'29.892268999999999', N'40.220782')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1380, N'الفاروق', N'الفاروق', 64, N'29.985023000000002', N'40.185831')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1381, N'المحمدية د', N'المحمدية د', 64, N'29.947792', N'40.210776000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1382, N'حي المرازيق', N'حي المرازيق', 64, N'29.899870001513001', N'40.217982745499903')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1383, N'الإدارية 2', N'الإدارية 2', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1384, N'النقل', N'النقل', 64, N'30.013082000000001', N'40.237363000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1385, N'ج 17', N'ج 17', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1386, N'شمال النقل', N'شمال النقل', 64, N'29.966736368400401', N'40.200293254187798')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1387, N'مخطط الزهور', N'مخطط الزهور', 64, N'29.920462000000001', N'40.207929')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1388, N'مخطط الفياض', N'مخطط الفياض', 64, N'29.988084000000001', N'40.175679000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1389, N'مخطط شرق الإقليمي', N'مخطط شرق الإقليمي', 64, N'30.010128999999999', N'40.224741000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1390, N'السليمانية', N'السليمانية', 64, N'30.556179', N'41.146132000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1391, N'الربوة', N'الربوة', 64, N'29.951882000000001', N'40.175209000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1392, N'الروضة', N'الروضة', 64, N'29.986014000000001', N'40.252702999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1393, N'العزيزية', N'العزيزية', 64, N'29.948599999999999', N'40.183467')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1394, N'المحمدية ب', N'المحمدية ب', 64, N'29.948326999999999', N'40.198861999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1395, N'المحمدية و', N'المحمدية و', 64, N'29.938488', N'40.196129999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1396, N'المطر', N'المطر', 64, N'29.974657000000001', N'40.208295999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1397, N'الإدارية 4', N'الإدارية 4', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1398, N'الزهور', N'الزهور', 64, N'29.896225000000001', N'40.227828000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1399, N'سلطانة', N'سلطانة', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1400, N'قارا', N'قارا', 64, N'29.879564999999999', N'40.223429000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1401, N'مخطط الصناعية', N'مخطط الصناعية', 64, N'29.964787999999999', N'40.218049000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1402, N'الشفاء', N'الشفاء', 64, N'29.963775999999999', N'40.196893000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1403, N'مخطط كريم الدرزي', N'مخطط كريم الدرزي', 64, N'29.848956999999999', N'40.192310999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1404, N'الصالحية', N'الصالحية', 64, N'29.849771', N'40.192352')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1405, N'المحمدية أ', N'المحمدية أ', 64, N'29.954685000000001', N'40.202677000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1406, N'السوق', N'السوق', 64, N'29.985319', N'40.212031000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1407, N'العفاش', N'العفاش', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1408, N'المحمدية ن', N'المحمدية ن', 64, N'29.931812999999998', N'40.192279999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1409, N'المحمدية ه', N'المحمدية ه', 64, N'29.935134000000001', N'40.206569000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1410, N'الإدارية 1', N'الإدارية 1', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1411, N'النخيل', N'النخيل', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1412, N'امتداد الطوير', N'امتداد الطوير', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1413, N'شرق الصاحلية', N'شرق الصاحلية', 64, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1414, N'مخطط الأمل', N'مخطط الأمل', 64, N'29.888945', N'40.213667999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1415, N'مخطط العروبة', N'مخطط العروبة', 64, N'30.008700000000001', N'40.208973999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1416, N'مخطط المنح الخاصة', N'مخطط المنح الخاصة', 64, N'29.862282', N'40.219301000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1417, N'الطوير', N'الطوير', 64, N'29.911663999999998', N'40.196666')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1418, N'المحمدية', N'المحمدية', 65, N'29.631983000000002', N'43.527397000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1419, N'الادارية', N'الادارية', 65, N'29.633597999999999', N'43.517057000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1420, N'العزيزيه', N'العزيزيه', 65, N'29.624528999999999', N'43.520584999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1421, N'المساعدية', N'المساعدية', 65, N'29.626607', N'43.514226999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1422, N'الصناعية', N'الصناعية', 65, N'29.623187000000001', N'43.531951999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1423, N'الصناعية ', N'الصناعية ', 65, N'29.622972000000001', N'43.531151999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1424, N'الشمالي', N'الشمالي', 65, N'29.636351000000001', N'43.555878')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1425, N'الإسكان التنموي', N'الإسكان التنموي', 65, N'29.643303', N'43.518444000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1426, N'الورود', N'الورود', 65, N'29.601378', N'43.546469999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1427, N'الضاحية', N'الضاحية', 65, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1428, N'العمال', N'العمال', 65, N'29.637488000000001', N'43.500065999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1429, N'الفيصليه', N'الفيصليه', 65, N'29.633410999999999', N'43.497912999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1430, N'المدينة', N'المدينة', 65, N'29.63795', N'43.506968000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1431, N'الخالدية شمال', N'الخالدية شمال', 65, N'29.633908999999999', N'43.506321999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1432, N'الخالدية جنوب', N'الخالدية جنوب', 65, N'29.629269000000001', N'43.503419999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1433, N'القادسية', N'القادسية', 65, N'29.636652999999999', N'43.525866999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1434, N'النموذجية جنوب', N'النموذجية جنوب', 65, N'29.628546', N'43.508439000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1435, N'الروضة', N'الروضة', 65, N'29.643346000000001', N'43.528478')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1436, N'الملز', N'الملز', 65, N'29.641525999999999', N'43.542859')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1437, N'الجميماء', N'الجميماء', 65, N'29.627604999999999', N'43.551110000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1438, N'اليرموك', N'اليرموك', 65, N'29.619326000000001', N'43.546017999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1439, N' الدرع', N' الدرع', 66, N'29.812512000000002', N'39.868293999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1440, N'الروضة', N'الروضة', 67, N'25.856079999999999', N'43.489645000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1441, N'اليرموك', N'اليرموك', 67, N'25.849608', N'43.478482999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1442, N'الحزم', N'الحزم', 67, N'25.872669999999999', N'43.515752999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1443, N'الاحتفالات', N'الاحتفالات', 67, N'25.834865000000001', N'43.466209999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1444, N'المدينة', N'المدينة', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1445, N'المنار', N'المنار', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1446, N'النسيم', N'النسيم', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1447, N'التعليم', N'التعليم', 67, N'25.893191999999999', N'43.544657000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1448, N' الفيصلية الشمالية', N' الفيصلية الشمالية', 67, N'25.8699869569779', N'43.5006482167638')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1449, N'النهضة', N'النهضة', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1450, N'الواحة', N'الواحة', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1451, N'الدانه', N'الدانه', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1452, N'الشهداء', N'الشهداء', 67, N'25.864249999999998', N'43.509653')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1453, N'بهجة', N'بهجة', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1454, N'الملك خالد', N'الملك خالد', 67, N'25.876092', N'43.478197999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1455, N'الحي الغربي', N'الحي الغربي', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1456, N'القادسية', N'القادسية', 67, N'25.883486999999999', N'43.506318')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1457, N'المصيف', N'المصيف', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1458, N'المنتزة', N'المنتزة', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1459, N'الشنانة الجنوبية', N'الشنانة الجنوبية', 67, N'25.812307000000001', N'43.446407000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1460, N'السد', N'السد', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1461, N'الحمراء', N'الحمراء', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1462, N'سوق الماشية الجديد', N'سوق الماشية الجديد', 67, N'25.879984387774101', N'43.615518445599101')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1463, N'المطار', N'المطار', 67, N'25.87557', N'43.499876')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1464, N'الملك عبد العزيز', N'الملك عبد العزيز', 67, N'25.863686000000001', N'43.497808999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1465, N'وادي الرمة', N'وادي الرمة', 67, N'25.897449000000002', N'43.502084000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1466, N'الشفاء', N'الشفاء', 67, N'25.884028000000001', N'43.518165000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1467, N'الحوطة', N'الحوطة', 67, N'25.850213', N'43.508670000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1468, N'النخيل', N'النخيل', 67, N'25.847042838914899', N'43.505905616764302')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1469, N'العبيلة', N'العبيلة', 67, N'25.4396123435573', N'43.603958487938002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1470, N'الورود', N'الورود', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1471, N'الريان', N'الريان', 67, N'25.853925', N'43.505906000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1472, N'المروج', N'المروج', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1473, N'السلام', N'السلام', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1474, N'المطيه', N'المطيه', 67, N'25.788163999999998', N'43.457320000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1475, N'الجامعين', N'الجامعين', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1476, N'الزهرة', N'الزهرة', 67, N'25.870909999999999', N'43.491703999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1477, N'الملك فيصل', N'الملك فيصل', 67, N'25.882714', N'43.494916000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1478, N'السعادة', N'السعادة', 67, N'25.864623999999999', N'43.475884000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1479, N'الروابي', N'الروابي', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1480, N'الربوة', N'الربوة', 67, N'25.884550000000001', N'43.530296999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1481, N'الخليج', N'الخليج', 67, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1482, N'الاندلس', N'الاندلس', 67, N'25.857039', N'43.511797999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1483, N'الجندل', N'الجندل', 67, N'25.893533000000001', N'43.525457000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1484, N'الشنانة ', N'الشنانة ', 67, N'25.812346000000002', N'43.446851000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1485, N'القدس', N'القدس', 67, N'25.870972491371699', N'43.503634518612301')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1486, N'طيبه', N'طيبه', 67, N'25.993606', N'43.747957999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1487, N'الصناعيه', N'الصناعيه', 67, N'25.842247', N'43.446807')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1488, N'الجريف', N'الجريف', 67, N'25.8524820957964', N'43.497759103270603')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1489, N'الحسو الداخلي', N'الحسو الداخلي', 68, N'25.868449999999999', N'44.339824')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1490, N'الأندلس', N'الأندلس', 68, N'25.828334999999999', N'44.221055')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1491, N'روضة عتيق', N'روضة عتيق', 68, N'25.910925770997501', N'44.210214627638003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1492, N'الصناعية', N'الصناعية', 68, N'25.887986000000001', N'44.197766999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1493, N' السلام', N' السلام', 69, N'28.390923999999998', N'48.453983000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1494, N'المنطقة الصناعية الاولى', N'المنطقة الصناعية الاولى', 69, N'28.412289999999999', N'48.506160999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1495, N'المنطقة الصناعية الثانية', N'المنطقة الصناعية الثانية', 69, N'28.397507999999998', N'48.502598999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1496, N' ارامكو', N' ارامكو', 69, N'28.422325000000001', N'48.509950000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1497, N' الامل', N' الامل', 69, N'28.405653000000001', N'48.463222999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1498, N' العزيزية', N' العزيزية', 69, N'28.451233999999999', N'48.492255')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1499, N' الفيحاء', N' الفيحاء', 69, N'28.462873999999999', N'48.482323000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1500, N' الفيصلية', N' الفيصلية', 69, N'28.48516', N'48.489243000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1501, N' اللؤلؤة', N' اللؤلؤة', 69, N'28.418365000000001', N'48.491624999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1502, N' المحمدية', N' المحمدية', 69, N'28.422885000000001', N'48.499065999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1503, N' المروج', N' المروج', 69, N'28.487127999999998', N'48.478273999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1504, N' الملك فهد', N' الملك فهد', 69, N'28.409669999999998', N'48.472684000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1505, N' النزهة', N' النزهة', 69, N'28.473879', N'48.480108000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1506, N' النهضة', N' النهضة', 69, N'28.408369', N'48.486595999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1507, N' الياسمين', N' الياسمين', 69, N'28.447915999999999', N'48.487265999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1508, N' الامير فهد بن سلمان', N' الامير فهد بن سلمان', 69, N'28.425764999999998', N'48.477828000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1509, N' الامير نايف', N' الامير نايف', 69, N'28.401492000000001', N'48.469456999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1510, N' التعاون', N' التعاون', 69, N'28.412471', N'48.492981999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1511, N' الجوهرة', N' الجوهرة', 69, N'28.424596999999999', N'48.490144000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1512, N' الحمراء', N' الحمراء', 69, N'28.417978000000002', N'48.483477000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1513, N' الخالدية', N' الخالدية', 69, N'28.418289000000001', N'48.469199000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1514, N' الخزامى', N' الخزامى', 69, N'28.456783999999999', N'48.483559999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1515, N' الدوائر الحكومية', N' الدوائر الحكومية', 69, N'28.448736', N'48.498314999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1516, N' الروضة', N' الروضة', 69, N'28.397597000000001', N'48.462041999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1517, N' الريان', N' الريان', 69, N'28.438357', N'48.488736000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1518, N' الزهور', N' الزهور', 69, N'28.429760000000002', N'48.472968999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1519, N' الشاطيء', N' الشاطيء', 69, N'28.473258999999999', N'48.493012999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1520, N' السلاح', N' السلاح', 70, N'26.092299000000001', N'43.653118999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1521, N' الافراح', N' الافراح', 70, N'26.055261000000002', N'43.570659999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1522, N' الاندلس', N' الاندلس', 70, N'26.077565', N'43.598120999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1523, N' التعاون', N' التعاون', 70, N'26.053017000000001', N'43.562835')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1524, N' الحزم', N' الحزم', 70, N'26.043278999999998', N'43.555441999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1525, N' الخبراء القديمة', N' الخبراء القديمة', 70, N'26.090103838257502', N'43.554175218607099')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1526, N' الخزان', N' الخزان', 70, N'26.061364999999999', N'43.563685999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1527, N' الربوة', N' الربوة', 70, N'26.086345999999999', N'43.618051000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1528, N' النهضة', N' النهضة', 70, N'26.051407000000001', N'43.554861000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1529, N' النزهة', N' النزهة', 70, N'26.072523', N'43.552791999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1530, N' الياسمين', N' الياسمين', 70, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1531, N' الربيع', N' الربيع', 70, N'26.079955000000002', N'43.616075000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1532, N' الرفيعة', N' الرفيعة', 70, N'26.065794', N'43.636024999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1533, N' الروضة', N' الروضة', 70, N'26.056536999999999', N'43.629635')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1534, N' الريان', N' الريان', 70, N'26.078581', N'43.607036000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1535, N' السحابين الجنوبي', N' السحابين الجنوبي', 70, N'26.045932000000001', N'43.596570999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1536, N' السحابين الشمالي', N' السحابين الشمالي', 70, N'26.062453000000001', N'43.600453999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1537, N' الصناعية', N' الصناعية', 70, N'26.061001999999998', N'43.613638999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1538, N' القادسية', N' القادسية', 70, N'26.061347000000001', N'43.552616999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1539, N' القدس', N' القدس', 70, N'26.063095000000001', N'43.570005000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1540, N'المجد', N'المجد', 70, N'26.078506000000001', N'43.628633999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1541, N' الأصفر', N' الأصفر', 71, N'25.973372000000001', N'43.719791000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1542, N' الرواد', N' الرواد', 71, N'25.994758999999998', N'43.720734')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1543, N'الدحلة', N'الدحلة', 71, N'25.928927999999999', N'43.678733000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1544, N' الروضة', N' الروضة', 71, N'25.967936999999999', N'43.747293999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1545, N'الياسمين', N'الياسمين', 71, N'25.96022', N'43.749642000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1546, N'العبدلية', N'العبدلية', 71, N'25.913194000000001', N'43.668596999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1547, N' الريان', N' الريان', 71, N'26.003594', N'43.732059')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1548, N' الوسطي البلد', N' الوسطي البلد', 71, N'26.001624', N'43.724524000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1549, N' العثمانية', N' العثمانية', 71, N'26.007107000000001', N'43.735669000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1550, N' الشبرمي', N' الشبرمي', 71, N'25.999749000000001', N'43.736550999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1551, N' السلام', N' السلام', 71, N'25.990707', N'43.751131999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1552, N' الربوة', N' الربوة', 71, N'25.956398', N'43.688799000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1553, N' الروضة', N' الروضة', 72, N'26.709334999999999', N'50.070587000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1554, N' رضوى', N' رضوى', 72, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1555, N' نجمه', N' نجمه', 72, N'26.716201000000002', N'50.075566000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1556, N'الدانة', N'الدانة', 72, N'26.705674999999999', N'50.061356000000004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1557, N' المنتزه', N' المنتزه', 72, N'26.699034000000001', N'50.046422')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1558, N' قرطبة', N' قرطبة', 72, N'26.713649', N'50.044082000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1559, N' الزهور', N' الزهور', 72, N'26.708465', N'50.048679')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1560, N' الفيحاء', N' الفيحاء', 72, N'26.711701000000001', N'50.057827000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1561, N' الأندلس', N' الأندلس', 72, N'26.702086000000001', N'50.069248000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1562, N' البستان', N' البستان', 72, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1563, N' الروضة', N' الروضة', 73, N'26.144158999999998', N'43.659317000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1564, N' ابن خلدون', N' ابن خلدون', 73, N'26.129099', N'43.652459')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1565, N' البلد القديم', N' البلد القديم', 73, N'26.147551', N'43.66657')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1566, N' الخالدية', N' الخالدية', 73, N'26.148430000000001', N'43.655777')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1567, N' الزهرة', N' الزهرة', 73, N'26.134308000000001', N'43.660865999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1568, N' العزيزية', N' العزيزية', 73, N'26.140173999999998', N'43.654601999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1569, N' الفهد', N' الفهد', 73, N'26.151502000000001', N'43.661718999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1570, N' القادسية', N' القادسية', 73, N'26.123390000000001', N'43.607619')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1571, N' النهضة', N' النهضة', 73, N'26.134571999999999', N'43.672094999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1572, N' الاندلس', N' الاندلس', 74, N'26.316165999999999', N'44.256407000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1573, N' البدع', N' البدع', 74, N'26.319019000000001', N'44.261046')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1574, N' البلاد', N' البلاد', 74, N'26.333145999999999', N'44.258170999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1575, N' الجال', N' الجال', 74, N'26.325476999999999', N'44.264315000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1576, N' السلام', N' السلام', 74, N'26.298708999999999', N'44.257483000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1577, N' الشفاء', N' الشفاء', 74, N'26.325790000000001', N'44.244853999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1578, N' الصفاء', N' الصفاء', 74, N'26.305143999999999', N'44.267353')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1579, N' الصناعية', N' الصناعية', 74, N'26.340548999999999', N'44.246015')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1580, N' الفاروق', N' الفاروق', 74, N'26.307545000000001', N'44.263269999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1581, N' القادسية', N' القادسية', 74, N'26.311599000000001', N'44.238936000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1582, N' المتحف', N' المتحف', 74, N'26.335127', N'44.247222000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1583, N' المتوكل', N' المتوكل', 74, N'26.309166999999999', N'44.268625')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1584, N' الميدان', N' الميدان', 74, N'26.316918999999999', N'44.250776000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1585, N' النخيل', N' النخيل', 74, N'26.324622999999999', N'44.234814')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1586, N' الواسط', N' الواسط', 74, N'26.31429', N'44.265707999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1587, N' المدينة الجديدة', N' المدينة الجديدة', 75, N'23.640542', N'46.506419000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1588, N' الحزيمية', N' الحزيمية', 75, N'23.623363999999999', N'46.525629000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1589, N' الركية', N' الركية', 75, N'23.614736000000001', N'46.495672999999996')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1590, N' الصناعية', N' الصناعية', 75, N'23.6159', N'46.543695')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1591, N' العثمانية', N' العثمانية', 75, N'23.632285', N'46.525756000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1592, N' وسط المدنية', N' وسط المدنية', 75, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1593, N' الملك عبد الله', N' الملك عبد الله', 76, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1594, N' الورود', N' الورود', 76, N'23.490359999999999', N'46.877433000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1595, N' التضامن', N' التضامن', 76, N'23.492348', N'46.866810999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1596, N' المحمدية', N' المحمدية', 76, N'23.504373000000001', N'46.894644999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1597, N' النهضة', N' النهضة', 76, N'23.508018', N'46.850662999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1598, N' الحلة', N' الحلة', 76, N'23.490127000000001', N'46.856186999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1599, N' الباطن', N' الباطن', 76, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1600, N' زياد', N' زياد', 76, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1601, N' المنار', N' المنار', 76, N'23.479949999999999', N'46.873964999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1602, N' الصدر', N' الصدر', 76, N'23.470617000000001', N'46.839078000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1603, N' الشعيب', N' الشعيب', 76, N'23.512115999999999', N'46.794531999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1604, N' الفرعة', N' الفرعة', 76, N'23.498063999999999', N'46.812483999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1605, N' المجد', N' المجد', 76, N'23.491181999999998', N'46.885314000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1606, N' الدوائر', N' الدوائر', 77, N'22.291990184530601', N'46.718759545674402')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1607, N' السحاب', N' السحاب', 77, N'22.308212000000001', N'46.721800999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1608, N' الجو', N' الجو', 77, N'22.282714349166401', N'46.735507274510297')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1609, N' الفيصلية ', N' الفيصلية ', 77, N'22.275856000000001', N'46.714157999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1610, N' غصيبة', N' غصيبة', 77, N'22.288786999999999', N'46.735199000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1611, N' الصالحية', N' الصالحية', 77, N'22.289994', N'46.725189999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1612, N' الملك فهد', N' الملك فهد', 77, N'22.303397', N'46.705095')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1613, N'المبرز', N'المبرز', 77, N'22.297692999999999', N'46.734507000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1614, N'الوديعة', N'الوديعة', 79, N'17.061367000000001', N'47.122444999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1615, N' الأخاشيم', N' الأخاشيم', 79, N'17.727068403345299', N'47.212191038918199')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1616, N' تماني', N' تماني', 79, N'17.729966000000001', N'46.142217000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1617, N' أم الملح', N' أم الملح', 79, N'18.775546593375999', N'49.6369709187491')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1618, N'الفهد', N'الفهد', 80, N'17.568805999999999', N'44.226095999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1619, N'المفرق', N'المفرق', 80, N'17.552022999999998', N'44.23686')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1620, N'المخيم', N'المخيم', 80, N'17.560006999999999', N'44.218924999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1621, N'الضباط', N'الضباط', 80, N'17.530515000000001', N'44.204450000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1622, N'مخطط الاثايبة الشمالية ', N'مخطط الاثايبة الشمالية ', 80, N'17.564160999999999', N'44.253624000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1623, N'شرق المطار ج', N'شرق المطار ج', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1624, N'شعب رير', N'شعب رير', 80, N'17.465332412568898', N'44.164609183021199')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1625, N'شرق المطار ب', N'شرق المطار ب', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1626, N'زورد وادعة', N'زورد وادعة', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1627, N'رجلا ء', N'رجلا ء', 80, N'17.4988346522257', N'44.250049667613602')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1628, N'تصلال', N'تصلال', 80, N'17.587924788919601', N'44.504429874589498')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1629, N'النهضة', N'النهضة', 80, N'17.652821578887199', N'44.460630289930698')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1630, N'المشعلية ', N'المشعلية ', 80, N'17.756212999999999', N'44.473078999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1631, N'الغويلا ', N'الغويلا ', 80, N'17.593371000000001', N'44.470157999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1632, N'الصناعية', N'الصناعية', 80, N'17.582192229786799', N'44.342731391968897')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1633, N'الشرفة الغربية', N'الشرفة الغربية', 80, N'17.512840486535602', N'44.323087313148498')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1634, N'الرويكبة', N'الرويكبة', 80, N'17.568998233901102', N'44.453483174589799')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1635, N'الحصينية', N'الحصينية', 80, N'17.815045000000001', N'44.450195000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1636, N'الاخدود', N'الاخدود', 80, N'17.587858689465001', N'44.281032416068598')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1637, N'نهيقة', N'نهيقة', 80, N'17.479159757806801', N'44.1350328187686')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1638, N'الامير مشعل', N'الامير مشعل', 80, N'17.554701401057802', N'44.235210045754599')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1639, N'الخالدية', N'الخالدية', 80, N'17.543544000000001', N'44.231216000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1640, N'مخطط العريسة الشمالي', N'مخطط العريسة الشمالي', 80, N'17.563310000000001', N'44.310364999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1641, N'الاملاح', N'الاملاح', 80, N'17.535454000000001', N'44.193711999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1642, N'شرق الضباط', N'شرق الضباط', 80, N'17.544073999999998', N'44.218879000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1643, N'السكني', N'السكني', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1644, N'مخطط نهوفة الزراعي', N'مخطط نهوفة الزراعي', 80, N'17.445651999999999', N'44.121482999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1645, N'شعب بران', N'شعب بران', 80, N'17.488531987184199', N'44.082349561097502')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1646, N'شرق المطار ', N'شرق المطار ', 80, N'17.617293049682001', N'44.419476172740701')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1647, N'سقام', N'سقام', 80, N'17.488404796197599', N'44.206493037136902')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1648, N'ريمان', N'ريمان', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1649, N'جامعة نجران', N'جامعة نجران', 80, N'17.6344018746194', N'44.534118848886799')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1650, N'بئر أبين', N'بئر أبين', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1651, N'المطار القديم', N'المطار القديم', 80, N'17.556722956831599', N'44.242407089931902')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1652, N'المركب', N'المركب', 80, N'17.5278629864622', N'44.3395868169195')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1653, N'الغويلا ', N'الغويلا ', 80, N'17.589036', N'44.458933000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1654, N'العان', N'العان', 80, N'17.482300274574499', N'44.095626390391502')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1655, N'الشعبة الشرقية', N'الشعبة الشرقية', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1656, N'الشبهان', N'الشبهان', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1657, N'الخالدية', N'الخالدية', 80, N'17.543606', N'44.229793000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1658, N'الامير مشعل', N'الامير مشعل', 80, N'17.553647000000002', N'44.231757999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1659, N'مخطط الصهبان', N'مخطط الصهبان', 80, N'17.584413000000001', N'44.338743000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1660, N'شمال الفهد', N'شمال الفهد', 80, N'17.583845', N'44.230373999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1661, N'الشرفة', N'الشرفة', 80, N'17.5159342859418', N'44.320608030392499')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1662, N'الفيصلية', N'الفيصلية', 80, N'17.523419000000001', N'44.192340000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1663, N'دحضة', N'دحضة', 80, N'17.516541', N'44.156500000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1664, N'مخطط رجلا الجنوبية ', N'مخطط رجلا الجنوبية ', 80, N'17.489182', N'44.217233')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1665, N'شرق المطار د', N'شرق المطار د', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1666, N'صاغر', N'صاغر', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1667, N' الدارة', N' الدارة', 80, N'17.706833819774101', N'44.523327859245903')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1668, N'زور العماري', N'زور العماري', 80, N'17.4288911861128', N'44.059332545756398')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1669, N'مخطط رجلا الجنوبية', N'مخطط رجلا الجنوبية', 80, N'17.488168999999999', N'44.209955000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1670, N'بنى سلمان', N'بنى سلمان', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1671, N'الموفجة', N'الموفجة', 80, N'17.461599545697901', N'44.071533874591402')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1672, N'المشعلية ', N'المشعلية ', 80, N'17.748094999999999', N'44.463875999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1673, N'القابل', N'القابل', 80, N'17.490925000000001', N'44.176467000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1674, N'الصفا', N'الصفا', 80, N'17.541754717041002', N'44.214494631381498')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1675, N'الشرفة الشمالية', N'الشرفة الشمالية', 80, N'17.511300157555901', N'44.356963832261599')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1676, N'الخضراء ', N'الخضراء ', 80, N'17.449058999999998', N'44.722884000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1677, N'الحايرة', N'الحايرة', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1678, N'الابرقين', N'الابرقين', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1679, N'نهوقة', N'نهوقة', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1680, N'الحضن', N'الحضن', 80, N'17.465852999999999', N'44.102913999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1681, N'مخطط العريسة الجنوبي', N'مخطط العريسة الجنوبي', 80, N'17.553553999999998', N'44.313954000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1682, N'ابا السعود', N'ابا السعود', 80, N'17.487708999999999', N'44.131391999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1683, N'شمال الضباط', N'شمال الضباط', 80, N'17.536587999999998', N'44.206508999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1684, N'مخطط ابن جارالله', N'مخطط ابن جارالله', 80, N'17.559359000000001', N'44.240608999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1685, N'مخطط رجلا الشمالية ', N'مخطط رجلا الشمالية ', 80, N'17.506383', N'44.229638000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1686, N'شرق رجلا', N'شرق رجلا', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1687, N'مخطط صهبان', N'مخطط صهبان', 80, N'17.587074000000001', N'44.347250000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1688, N'سلوى', N'سلوى', 80, N'17.834231225915499', N'44.149828392001098')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1689, N'زور الحارث', N'زور الحارث', 80, N'17.470033000000001', N'44.060817999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1690, N' الجامعة', N' الجامعة', 80, N'17.634355364652802', N'44.532219436271497')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1691, N'برك', N'برك', 80, N'17.559791623055801', N'44.354523390232004')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1692, N'المعامر', N'المعامر', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1693, N'المسماة', N'المسماة', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1694, N'الـرمال', N'الـرمال', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1695, N'مخطط العريسة الجنوبي', N'مخطط العريسة الجنوبي', 80, N'17.554337', N'44.314120000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1696, N'الشعبة الغربية', N'الشعبة الغربية', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1697, N'الشرفة الجنوبية', N'الشرفة الجنوبية', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1698, N'الخرعاء', N'الخرعاء', 80, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1699, N'الجربة', N'الجربة', 80, N'17.473890000000001', N'44.145899')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1700, N'ابا الرشاش', N'ابا الرشاش', 80, N'17.624527194893599', N'44.223034005017801')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1701, N'فواز', N'فواز', 80, N'17.469279436197802', N'44.245998503426797')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1702, N'مخطط العريسة الشمالي', N'مخطط العريسة الشمالي', 80, N'17.564012000000002', N'44.312215000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1703, N'الحي الغربي', N'الحي الغربي', 81, N'17.393599606156101', N'42.377616347605297')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1704, N'الحي الشمالي', N'الحي الشمالي', 81, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1705, N'الحي الجنوبي', N'الحي الجنوبي', 81, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1706, N'الحي الشرقي', N'الحي الشرقي', 81, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1707, N' الخواجية', N' الخواجية', 81, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1708, N'حارة منامة', N'حارة منامة', 81, N'17.147766972946499', N'42.632494598440601')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1709, N'الورود', N'الورود', 82, N'16.963899000000001', N'42.855705')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1710, N'المهدج', N'المهدج', 82, N'17.008108', N'42.854683000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1711, N'العقدة', N'العقدة', 82, N'17.002405', N'42.806547999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1712, N'السلام', N'السلام', 82, N'16.97175', N'42.832562000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1713, N'الربيع', N'الربيع', 82, N'16.978769', N'42.828245000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1714, N'حاكمة ابي عريش', N'حاكمة ابي عريش', 82, N'17.01164', N'42.837899999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1715, N'النزهة', N'النزهة', 82, N'16.973777999999999', N'42.844365000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1716, N'القدس', N'القدس', 82, N'16.959085999999999', N'42.839641999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1717, N'الشاقة', N'الشاقة', 82, N'16.933243999999998', N'42.840282000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1718, N'الروضة', N'الروضة', 82, N'16.965432', N'42.815333000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1719, N'قويعية', N'قويعية', 82, N'16.976240000000001', N'42.795279000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1720, N'النهضة', N'النهضة', 82, N'16.981188', N'42.834792999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1721, N'الملك فهد', N'الملك فهد', 82, N'16.959500999999999', N'42.826366')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1722, N'الصناعية', N'الصناعية', 82, N'16.956945999999999', N'42.855764999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1723, N'السادلية', N'السادلية', 82, N'16.926500000000001', N'42.830545999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1724, N'الخالدية', N'الخالدية', 82, N'16.965188000000001', N'42.825485999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1725, N'قامرة', N'قامرة', 82, N'16.994546', N'42.800448000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1726, N'النسيم', N'النسيم', 82, N'16.969111000000002', N'42.823490999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1727, N'المريخية', N'المريخية', 82, N'16.947655000000001', N'42.793792000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1728, N'الصفا', N'الصفا', 82, N'16.977029999999999', N'42.814957')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1729, N'الزهور', N'الزهور', 82, N'16.978166999999999', N'42.837220000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1730, N'الاندلس', N'الاندلس', 82, N'16.979786000000001', N'42.822443999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1731, N' الصفا', N' الصفا', 84, N'16.715809', N'42.961424999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1732, N' العمارية', N' العمارية', 84, N'16.714725000000001', N'42.953645999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1733, N' الواسط', N' الواسط', 84, N'16.789021000000002', N'42.746791000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1734, N' العز', N' العز', 84, N'16.706714000000002', N'42.943888000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1735, N' المطلع', N' المطلع', 84, N'16.708081', N'42.952576000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1736, N' الملك عبد العزيز', N' الملك عبد العزيز', 84, NULL, NULL)
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1737, N' الغصينية', N' الغصينية', 84, N'16.703624999999999', N'42.963030000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1738, N' المنزم', N' المنزم', 84, N'16.710032999999999', N'42.956524000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1739, N' البلدية', N' البلدية', 84, N'16.702494000000002', N'42.949275999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1740, N' الامير محمد بن ناصر', N' الامير محمد بن ناصر', 84, N'16.6998797785546', N'42.950349745766601')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1741, N' الجروف', N' الجروف', 84, N'16.755727', N'42.954515999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1742, N' المنطقة الصناعية', N' المنطقة الصناعية', 84, N'16.730339000000001', N'42.934047')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1743, N' البيلسان', N' البيلسان', 85, N'22.414928', N'39.087719999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1744, N' التالة جاردنز', N' التالة جاردنز', 85, N'22.434382139214101', N'39.0989380168363')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1745, N' الواحة', N' الواحة', 85, N'22.469346000000002', N'39.104356000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1746, N' الشروق', N' الشروق', 85, N'22.489893381566901', N'39.105027732177199')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1747, N' المروج', N' المروج', 85, N'22.448250999999999', N'39.089438000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1748, N' الرفاع', N' الرفاع', 86, N'27.559774999999998', N'47.712124000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1749, N' الاندلس', N' الاندلس', 86, N'27.561647000000001', N'47.691989')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1750, N' الخالدية', N' الخالدية', 86, N'27.546218', N'47.693913999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1751, N' الربوة', N' الربوة', 86, N'27.567205000000001', N'47.709052')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1752, N' الربيع', N' الربيع', 86, N'27.568991', N'47.704599999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1753, N' الروضة', N' الروضة', 86, N'27.565935', N'47.701047000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1754, N' الزهور', N' الزهور', 86, N'27.562419999999999', N'47.704045000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1755, N' السلام', N' السلام', 86, N'27.551946000000001', N'47.689385999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1756, N' الصناعية', N' الصناعية', 86, N'27.557624000000001', N'47.681829999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1757, N' المروج', N' المروج', 86, N'27.555668000000001', N'47.693992000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1758, N' النزهة', N' النزهة', 86, N'27.580736000000002', N'47.711799999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1759, N' الواحة', N' الواحة', 86, N'27.555775000000001', N'47.709648999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1760, N' غرناطة', N' غرناطة', 86, N'27.559339000000001', N'47.706629')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1761, N' قرطبة', N' قرطبة', 86, N'27.550892999999999', N'47.701918999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1762, N' الخالدية', N' الخالدية', 87, N'18.170850999999999', N'42.830474000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1763, N'طريق الملك عبد الله', N'طريق الملك عبد الله', 87, N'18.1658174929706', N'42.806858359239001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1764, N' وسط البلد', N' وسط البلد', 87, N'18.173446999999999', N'42.835852000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1765, N' النهضة', N' النهضة', 87, N'18.185570999999999', N'42.843583000000002')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1766, N' الزيتون', N' الزيتون', 87, N'18.180005999999999', N'42.855182999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1767, N' العزيزية', N' العزيزية', 87, N'18.173302', N'42.814494000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1768, N' صفوان', N' صفوان', 87, N'18.209875', N'42.818786000000003')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1769, N' الرونة', N' الرونة', 87, N'18.226682', N'42.820799999999998')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1770, N' الخليج', N' الخليج', 87, N'18.180574', N'42.807592')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1771, N' السلامة', N' السلامة', 87, N'18.19444', N'42.832788000000001')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1772, N' الورود', N' الورود', 87, N'18.166920999999999', N'42.847175999999997')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1773, N' المدينة العسكرية', N' المدينة العسكرية', 87, N'18.203358999999999', N'42.801853999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1774, N' المصيف', N' المصيف', 87, N'18.211597000000001', N'42.827021999999999')
GO
INSERT [dbo].[District] ([ID], [NameAR], [NameEN], [CityID], [Latitude], [Longitude]) VALUES (1775, N' الصالحية', N' الصالحية', 87, N'18.213474999999999', N'42.838206999999997')
GO
SET IDENTITY_INSERT [dbo].[District] OFF
GO
SET IDENTITY_INSERT [dbo].[FavoriteList] ON 
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (1, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'42a41d57-8902-407e-97ab-f9e7d759a08d')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (10, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (17, N'552ef57f-82c0-4df1-8f2c-2222f479e862', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (21, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'676c153a-7b6d-448b-8211-f7d2f04d5f35')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (24, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (25, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'a2b7ab60-edbb-42cd-88e3-a5bde20035bb')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (26, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[FavoriteList] ([ID], [KafilID], [WorkerID]) VALUES (27, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'07b1835a-40e6-4aca-a396-d5b86186a090')
GO
SET IDENTITY_INSERT [dbo].[FavoriteList] OFF
GO
SET IDENTITY_INSERT [dbo].[Gallery] ON 
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (1, N'/uploads/worker/fa1d079f-c2ee-485c-ac65-3d120f4944fc.jpg', N'42a41d57-8902-407e-97ab-f9e7d759a08d')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (2, N'/uploads/worker/e8b63e78-f43d-43d0-a730-39512830c28b.jpg', N'42a41d57-8902-407e-97ab-f9e7d759a08d')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (3, N'/uploads/worker/3232d4a3-bcc5-4005-8c00-d49385afd700.jpg', N'42a41d57-8902-407e-97ab-f9e7d759a08d')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (4, N'/uploads/worker/b5ab09f0-2f37-4230-8d26-2092c92c8f62.jpg', N'42a41d57-8902-407e-97ab-f9e7d759a08d')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (15, N'/uploads/worker/94f68489-9202-418e-912d-64bd6c95ee79.jpg', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (16, N'/uploads/worker/25dd99f7-ace7-457e-bfd7-9c480c7239b3.jfif', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (17, N'/uploads/worker/39a1e968-a493-4aa7-888b-267ae55859a6.jfif', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (18, N'/uploads/worker/cecd243a-04bf-43dc-8436-5dc0d6b16cf5.jpeg', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (19, N'/uploads/worker/d5c97865-9012-48f6-929f-1ec58bf935cd.jpg', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (20, N'/uploads/worker/cf3da737-d9ac-4768-9533-90642fa22801.jpg', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (21, N'/uploads/worker/eb48b300-856b-446f-9e2a-bc20663394c6.jpg', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (22, N'/uploads/worker/cb198a52-7dff-46f9-b5da-760e82770341.jpg', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (23, N'/uploads/worker/cd26ede5-49ec-4a65-a14b-ca1ace35d919.jfif', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (24, N'/uploads/worker/a48c2657-cce3-4a60-912e-18b657e66d83.jfif', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (25, N'/uploads/worker/d0905478-ed30-4c50-bb9a-2f482b45c855.jfif', N'3112b554-0ca3-4687-b0bc-18095ce76660')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (26, N'/uploads/worker/880236c2-253e-4986-9b08-4f9f983755d2.jpg', N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (27, N'/uploads/worker/bdce49c4-18ce-44c0-a795-34413daed64d.jpg', N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (28, N'/uploads/worker/718bfd48-92a2-4b9e-999c-af2ec3e82066.jfif', N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (29, N'/uploads/worker/85aea034-156f-4561-8d83-02acacaa6212.jfif', N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (30, N'/uploads/worker/27348757-d2ba-4c0a-a335-9bbb6022fa21.jpg', N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (31, N'/uploads/worker/2a2afb23-cb1a-4153-a695-622326363fb8.jpg', N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (32, N'/uploads/worker/24cd30de-55bc-42ae-a696-5c545cf13a18.jpg', N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (33, N'/uploads/worker/7885acfc-72ff-45ff-a2df-f1dbc1561b6a.jpg', N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (34, N'/uploads/worker/00bd1098-fae1-456a-8fc3-186ace8aff26.jpg', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (35, N'/uploads/worker/a382e7ce-9774-4252-8068-5d8751e1932c.jpg', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (36, N'/uploads/worker/699e03e0-be7f-4be8-887e-0197d4c2041d.jpg', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (37, N'/uploads/worker/6790433c-db38-4961-b6e6-d369d5558539.jpg', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (38, N'/uploads/worker/be00bb09-07c4-418d-8337-4f8ce0599a8d.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (39, N'/uploads/worker/7d224c54-3612-4a52-b180-3a432be7ddce.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (40, N'/uploads/worker/c1b0f034-721a-45e4-82af-d6a3ddc66c95.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (41, N'/uploads/worker/cb6561da-451b-4b40-b4cf-bcde10913052.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (42, N'/uploads/worker/bb8a1468-78c5-41f1-bef9-26d98d55920d.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (43, N'/uploads/worker/5376ee0b-2dac-4544-9f51-f51077c1be64.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (44, N'/uploads/worker/3412ce05-f682-405b-9910-0195acc3d1ae.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (45, N'/uploads/worker/bc76662b-edb5-484d-95a4-5c13ef9648cb.jfif', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (46, N'/uploads/worker/762e3c83-3246-42a4-bd29-f7003f1c5f75.jfif', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (47, N'/uploads/worker/63a517cc-d077-4ef6-b783-cfdef0eff3c2.jfif', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (48, N'/uploads/worker/6814e26e-056d-4f6c-9b90-518c08b16e9c.jfif', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (49, N'/uploads/worker/cc718fe2-bcd4-4547-80ae-718fd38622dc.jpg', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (50, N'/uploads/worker/66012c52-efbc-40c2-ba7d-fe3d4e9db9b0.jpg', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (51, N'/uploads/worker/8c334de4-2cd4-4765-9eae-187e1760e01e.jpg', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (52, N'/uploads/worker/1cb83d7d-9118-44b2-a989-65f46e203a13.jpg', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (53, N'/uploads/worker/1cef6be8-7d59-4840-9043-6dda5e885502.jpeg', N'de0dad01-3610-42c9-b7f5-2f050a55f481')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (54, N'/uploads/worker/bb793544-7e10-430a-9753-5d1269db32f5.jpeg', N'de0dad01-3610-42c9-b7f5-2f050a55f481')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (55, N'/uploads/worker/f0fdc90a-6f6c-4c02-a75e-585ead99925a.jpg', N'de0dad01-3610-42c9-b7f5-2f050a55f481')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (56, N'/uploads/worker/7bf889e3-ff62-45fe-806b-38a41f265347.jpg', N'de0dad01-3610-42c9-b7f5-2f050a55f481')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (57, N'/uploads/worker/28881fe5-0dff-456f-9a75-95e42f569e01.jpg', N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (58, N'/uploads/worker/64aeb546-d6e3-4726-bfef-596b70c39f59.png', N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (59, N'/uploads/worker/6b94a59f-589c-4646-8887-cf12272f8384.jpg', N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (60, N'/uploads/worker/4c649696-1310-488a-8f8a-dee322baa8c6.jpg', N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (61, N'/uploads/worker/b3413f20-de40-47cd-ae27-f199dcc63ff0.jfif', N'676c153a-7b6d-448b-8211-f7d2f04d5f35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (62, N'/uploads/worker/7570ed5f-ef17-4642-9683-5daab5e0d7f7.jpg', N'676c153a-7b6d-448b-8211-f7d2f04d5f35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (63, N'/uploads/worker/0b0f4efb-c050-42db-8d8c-9e6c3688dae8.jpg', N'676c153a-7b6d-448b-8211-f7d2f04d5f35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (64, N'/uploads/worker/14c107f7-f383-4486-903f-cfd6dceb3c3f.jpg', N'676c153a-7b6d-448b-8211-f7d2f04d5f35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (66, N'/uploads/worker/7a63e8d7-b0b2-4ab7-9b8d-4f69892df53e.jfif', N'9b82f3b4-f888-4d0f-a461-052e3396bf35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (67, N'/uploads/worker/01f31235-70d9-4e15-9387-df1a208a96e1.jfif', N'9b82f3b4-f888-4d0f-a461-052e3396bf35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (68, N'/uploads/worker/62bc5565-b08c-4604-8ff9-934b8f899f9f.jfif', N'9b82f3b4-f888-4d0f-a461-052e3396bf35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (69, N'/uploads/worker/3b4ab052-e9ab-4b10-86c7-d33ac1b0ff01.jfif', N'9b82f3b4-f888-4d0f-a461-052e3396bf35')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (70, N'/uploads/worker/c4f917f0-5236-4b6a-9b5b-a5c1aff9e579.jpg', N'f344d465-a0e5-47f0-a265-b446806de748')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (71, N'/uploads/worker/868a1e42-8d08-4ff8-8247-48dc184880b1.bmp', N'f344d465-a0e5-47f0-a265-b446806de748')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (72, N'/uploads/worker/f7d4a56d-2469-46b5-91d1-fc438adb1145.bmp', N'f344d465-a0e5-47f0-a265-b446806de748')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (73, N'/uploads/worker/3c268078-e19c-43f6-a5e8-cdef84338693.jpg', N'f344d465-a0e5-47f0-a265-b446806de748')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (75, N'/uploads/worker/642796a0-1f8f-4059-acdb-3e8555dfb609.jpg', N'07b1835a-40e6-4aca-a396-d5b86186a090')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (76, N'/uploads/worker/b455c00c-d19b-446f-8370-44d882b71916.jpg', N'07b1835a-40e6-4aca-a396-d5b86186a090')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (77, N'/uploads/worker/099202e7-588c-49c5-b42e-be571323cda1.jpg', N'07b1835a-40e6-4aca-a396-d5b86186a090')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (78, N'/uploads/worker/ab6e199a-b0f4-4d77-b272-9917be1a29d7.jpg', N'07b1835a-40e6-4aca-a396-d5b86186a090')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (79, N'/uploads/worker/15ee6ac3-aa79-4988-82e5-085a61282358.jpg', N'd5e91be5-d318-47c5-b6f2-517bdd46c227')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (80, N'/uploads/worker/8e9d13b8-6dcd-446c-a9c1-957faf1d038c.jpg', N'd5e91be5-d318-47c5-b6f2-517bdd46c227')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (81, N'/uploads/worker/444c6293-8400-4f17-b052-a48cfc3b9699.jpg', N'd5e91be5-d318-47c5-b6f2-517bdd46c227')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (82, N'/uploads/worker/22bdaef8-c77c-4075-a0e5-f707083ce8c3.jpg', N'd5e91be5-d318-47c5-b6f2-517bdd46c227')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (83, N'/uploads/worker/ae22f51e-46cf-4b11-9244-395c8f11d161.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (84, N'/uploads/worker/79ff486d-e7a9-4c44-8045-3ef0039dfd10.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (85, N'/uploads/worker/b4af0151-bda0-410b-b4c4-ffdefc41d46b.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (86, N'/uploads/worker/4f35921b-5b9f-42fe-adb0-2df8b273ce01.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (87, N'/uploads/worker/d3292ba0-ae7d-40fc-a989-590815773ffd.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (88, N'/uploads/worker/a28ecc85-98ce-4e70-8b3f-aee2fbc26b5f.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
INSERT [dbo].[Gallery] ([ID], [ImageUrl], [WorkerID]) VALUES (89, N'/uploads/worker/a0a25f3b-91bc-4327-aad0-e677e81ac249.jfif', N'b504e1a9-c046-4c30-a14a-fcae22e74501')
GO
SET IDENTITY_INSERT [dbo].[Gallery] OFF
GO
SET IDENTITY_INSERT [dbo].[Jobs] ON 
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (1, N'سائق خاص', N'Personal Driver')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (2, N'طباخ ', N'Cooker (M)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (3, N'طباخة ', N'Cooker (F)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (4, N'عامل ', N'Worker (M)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (5, N'عاملة ', N' Worker (F)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (6, N'ممرضة ', N' Nurse (F)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (7, N'ممرض ', N'Nurse (M)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (8, N'مربية ', N'Nanny')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (9, N'أخصائي علاج طبيعي', N' (M) Physiotherapist ')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (10, N'أخصائية علاج طبيعي ', N'Physiotherapist (F)')
GO
INSERT [dbo].[Jobs] ([ID], [NameAR], [NameEN]) VALUES (11, N'سفرجي ', N'Sapphire')
GO
SET IDENTITY_INSERT [dbo].[Jobs] OFF
GO
SET IDENTITY_INSERT [dbo].[Languages] ON 
GO
INSERT [dbo].[Languages] ([ID], [NameAR], [NameEN]) VALUES (1, N'اللغة العربية', N'Arabic')
GO
INSERT [dbo].[Languages] ([ID], [NameAR], [NameEN]) VALUES (2, N'اللغة الانجليزية', N'English')
GO
INSERT [dbo].[Languages] ([ID], [NameAR], [NameEN]) VALUES (3, N'لغة البلد الاساسية ', N'Main language of Country')
GO
SET IDENTITY_INSERT [dbo].[Languages] OFF
GO
SET IDENTITY_INSERT [dbo].[Mail] ON 
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (8, N'13446944-5c9e-4e73-9476-ea90543ccb47', N'8da916e3-7f28-449a-bef0-a43f74ab4448', N'رجاء سداد مبلغ 3000 ريال', NULL, CAST(N'2021-10-25T03:37:08.870' AS DateTime), 1, NULL)
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (9, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'تم السداد', 8, CAST(N'2021-10-25T11:09:55.047' AS DateTime), 1, N'/uploads/receipts/6b27d97f-50d1-44bd-9269-146cc7be1ea7.jpg')
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (10, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'gfgfgffgfg', 8, CAST(N'2021-10-25T12:34:48.130' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (11, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'gfgfgffgfg', 8, CAST(N'2021-10-25T12:35:22.850' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (12, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'يسيسيسيسيسيس', 8, CAST(N'2021-10-25T12:51:32.477' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (13, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'بللللللللللللللللللللللللللللللل', 8, CAST(N'2021-10-25T12:52:04.790' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (14, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'يسيسيسيسيسي 222', 8, CAST(N'2021-10-25T12:57:45.057' AS DateTime), 0, NULL)
GO
INSERT [dbo].[Mail] ([ID], [OfficeID], [OperatorID], [Message], [MailID], [Date], [IsRead], [FileUrl]) VALUES (15, N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, N'333333333333333', 8, CAST(N'2021-10-25T12:59:30.163' AS DateTime), 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Mail] OFF
GO
SET IDENTITY_INSERT [dbo].[Nationality] ON 
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (2, N'مصرى', N'Egyptien')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (3, N'سوداني', N'Sudanese')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (4, N'فلبيني', N'Filipino')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (5, N'نيجري', N'Nigerian')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (6, N'هندي', N'Indian')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (7, N'باكستاني', N'Pakistani')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (8, N'بنجالي', N'Bengali')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (9, N'تنزاني', N'Tanzanian')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (10, N'سري لنكي', N'Sri Lankan')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (11, N'فيتنامي', N'Vietnamese')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (12, N'موريتاني', N'Mauritanian')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (13, N'اوغندي', N'Ugandan')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (14, N'ارتيري', N'Eritrean')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (15, N'مدغشقر', N'Madagascar')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (16, N'ازبكستاني', N'Uzbek')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (17, N'كمبودي', N'Cambodian')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (18, N'مالي', N'Mali')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (19, N'جنوب افريقي', N'South African')
GO
INSERT [dbo].[Nationality] ([ID], [NameAR], [NameEN]) VALUES (20, N'كيني', N'kenny')
GO
SET IDENTITY_INSERT [dbo].[Nationality] OFF
GO
SET IDENTITY_INSERT [dbo].[Notifications] ON 
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (1, N'فريق عمل معروفة يرحب بك', N'bb22ce4c-0c63-4bdd-a853-42f96380845c', NULL, NULL, 0, NULL, N'FirstLogin', CAST(N'2021-10-21T10:32:00.000' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (2, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 18, N'Requests', CAST(N'2021-10-23T01:10:39.240' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (3, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 19, N'Requests', CAST(N'2021-10-23T01:10:42.600' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (4, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 20, N'Requests', CAST(N'2021-10-23T01:10:46.193' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (5, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 21, N'Requests', CAST(N'2021-10-23T01:10:49.303' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (6, N'تم تعديل حالة طلبك بخصوص " وليد  عبد الجليل  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 23, N'Requests', CAST(N'2021-10-23T01:10:52.350' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (7, N'تم تعديل حالة طلبك بخصوص " طاهر  على  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 26, N'Requests', CAST(N'2021-10-23T01:10:56.333' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (8, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 18, N'Requests', CAST(N'2021-10-23T01:11:28.427' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (9, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 19, N'Requests', CAST(N'2021-10-23T01:11:35.740' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (10, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 20, N'Requests', CAST(N'2021-10-23T01:11:40.613' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (11, N'تم تعديل حالة طلبك بخصوص " محمد  القحطاني " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 21, N'Requests', CAST(N'2021-10-23T01:11:45.007' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (12, N'تم تعديل حالة طلبك بخصوص " وليد  عبد الجليل  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 23, N'Requests', CAST(N'2021-10-23T01:11:49.973' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (13, N'تم تعديل حالة طلبك بخصوص " طاهر  على  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 1, 26, N'Requests', CAST(N'2021-10-23T01:11:54.973' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (14, N'تم تعديل حالة طلبك بخصوص " وليد  عبد الجليل  " الى قبول أولى', NULL, N'552ef57f-82c0-4df1-8f2c-2222f479e862', NULL, 0, 24, N'Requests', CAST(N'2021-10-23T01:11:59.520' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (15, N'تم تعديل حالة طلبك بخصوص " احمد  الطيب " الى رفض أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 27, N'Requests', CAST(N'2021-10-26T22:03:15.390' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (16, N'تم تعديل حالة طلبك بخصوص " عبدالله  محمد " الى رفض أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 28, N'Requests', CAST(N'2021-10-29T21:18:27.717' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (17, N'تم تعديل حالة طلبك بخصوص " أنجيلا  عباس " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 29, N'Requests', CAST(N'2021-10-29T21:55:12.580' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (18, N'فريق عمل معروفة يرحب بك', N'1aec668a-5a4f-49e2-bf30-45dc5a290e9d', NULL, NULL, 0, NULL, N'FirstLogin', CAST(N'2021-11-01T18:32:13.340' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (19, N'فريق عمل معروفة يرحب بك', N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', NULL, NULL, 0, NULL, N'FirstLogin', CAST(N'2021-11-03T09:03:39.327' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (20, N'تم توثيق طلبك من خلال فريق عمل معروفة', N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', NULL, N'8da916e3-7f28-449a-bef0-a43f74ab4448', 0, NULL, N'VerifiyingOffice', CAST(N'2021-11-03T09:14:05.373' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (21, N'تم تعديل حالة طلبك بخصوص " سيف   طربوش   " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 32, N'Requests', CAST(N'2021-11-03T09:37:47.150' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (22, N'تم اضافة 300 ريال على محفظتك متعلقة بخصوص طللبك " سيف   طربوش   " ', N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', NULL, NULL, 0, 32, N'Requests', CAST(N'2021-11-03T09:40:14.783' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (23, N'فريق عمل معروفة يرحب بك', N'bf971309-fb39-4d0d-bf70-64e2f6116f50', NULL, NULL, 0, NULL, N'FirstLogin', CAST(N'2021-11-05T01:46:27.657' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (24, N'تم تعديل حالة طلبك بخصوص " أنجيلا  عباس " الى قبول أولى', NULL, N'6eadf14b-527e-419a-92ab-8f128362e0a5', NULL, 0, 34, N'Requests', CAST(N'2021-11-05T03:18:18.147' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (25, N'تم اضافة 300 ريال على محفظتك متعلقة بخصوص طللبك " أنجيلا  عباس " ', N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, NULL, 0, 34, N'Requests', CAST(N'2021-11-05T03:20:22.560' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (26, N'تم اضافة 300 ريال على محفظتك متعلقة بخصوص طللبك " أنجيلا  عباس " ', N'13446944-5c9e-4e73-9476-ea90543ccb47', NULL, NULL, 0, 29, N'Requests', CAST(N'2021-11-05T03:23:20.557' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (27, N'تم تعديل حالة طلبك بخصوص " اريج  عبدو  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 31, N'Requests', CAST(N'2021-11-09T01:53:42.503' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (28, N'تم تعديل حالة طلبك بخصوص " بهدور دانى  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 35, N'Requests', CAST(N'2021-11-09T04:32:19.063' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (29, N'تم تعديل حالة طلبك بخصوص " بهدور دانى  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 36, N'Requests', CAST(N'2021-11-09T04:34:48.527' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (30, N'تم تعديل حالة طلبك بخصوص " بهدور دانى  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 35, N'Requests', CAST(N'2021-11-09T04:48:34.097' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (31, N'تم اعتماد طلبك بخصوص " أنجيلا  عباس " ', NULL, N'6eadf14b-527e-419a-92ab-8f128362e0a5', NULL, 0, 34, N'Requests', CAST(N'2021-11-09T04:49:10.530' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (32, N'تم تعديل حالة طلبك بخصوص " بهدور دانى  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 36, N'Requests', CAST(N'2021-11-09T05:00:40.883' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (33, N'تم تعديل حالة طلبك بخصوص " بيرسي  تاو  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 37, N'Requests', CAST(N'2021-11-10T01:31:14.867' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (43, N'فريق عمل معروفة يرحب بك', NULL, N'5f9f7380-27c6-4464-88f9-fda16b13c214', NULL, 0, NULL, N'FirstLogin', CAST(N'2021-11-15T21:14:45.680' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (44, N'تم تعديل حالة طلبك بخصوص " ريتا  اسحاق  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 38, N'Requests', CAST(N'2021-11-18T20:30:56.060' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (45, N'تم اعتماد طلبك بخصوص " أنجيلا  عباس " ', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 29, N'Requests', CAST(N'2021-11-18T20:31:15.140' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (46, N'تم اعتماد طلبك بخصوص " اريج  عبدو  " ', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 31, N'Requests', CAST(N'2021-11-18T20:33:40.903' AS DateTime))
GO
INSERT [dbo].[Notifications] ([ID], [Message], [OfficeID], [KafilID], [AdminID], [IsRead], [RequestID], [Type], [Date]) VALUES (47, N'تم تعديل حالة طلبك بخصوص " زكريا  عبدالكريم  " الى قبول أولى', NULL, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', NULL, 0, 39, N'Requests', CAST(N'2021-11-18T20:33:57.540' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[OfficeDocuments] ON 
GO
INSERT [dbo].[OfficeDocuments] ([ID], [Name], [FileUrl], [Date], [OfficeID]) VALUES (1, N'office 2019', N'/uploads/files/3dcb32e8-97ce-43a6-97a8-846eba765bae.txt', CAST(N'2021-09-01' AS Date), N'a202e4a9-b890-478b-a934-a928a0d2b49f')
GO
INSERT [dbo].[OfficeDocuments] ([ID], [Name], [FileUrl], [Date], [OfficeID]) VALUES (5, N'شهادة  ادارة المخاطر ', N'/uploads/files/4690cb4c-3d14-4e5a-877a-57b668d0d857.jpg', CAST(N'2021-10-17' AS Date), N'13446944-5c9e-4e73-9476-ea90543ccb47')
GO
SET IDENTITY_INSERT [dbo].[OfficeDocuments] OFF
GO
SET IDENTITY_INSERT [dbo].[OfficeServices] ON 
GO
INSERT [dbo].[OfficeServices] ([ID], [Name], [OfficeID], [Price]) VALUES (1, N'خدمة 01', N'a202e4a9-b890-478b-a934-a928a0d2b49f', CAST(2000.00 AS Decimal(18, 2)))
GO
INSERT [dbo].[OfficeServices] ([ID], [Name], [OfficeID], [Price]) VALUES (2, N'خدمة استقدام عاملات ', N'13446944-5c9e-4e73-9476-ea90543ccb47', CAST(100.00 AS Decimal(18, 2)))
GO
SET IDENTITY_INSERT [dbo].[OfficeServices] OFF
GO
SET IDENTITY_INSERT [dbo].[Page] ON 
GO
INSERT [dbo].[Page] ([ID], [NameAR], [NameEN], [DescriptionAR], [DescriptionEN]) VALUES (1, N'عن معروفة', N'About', N'محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية ', N'Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details ')
GO
INSERT [dbo].[Page] ([ID], [NameAR], [NameEN], [DescriptionAR], [DescriptionEN]) VALUES (2, N'سياسية الخصوصية', N'privacy policiy', N'تعتبر سياسة وبنود الخصوصية المبينة أدناه جزءاً من شروط وأحكام استخدام الموقع الإلكتروني لخدمة "معروفة".
إن استخدامكم لهذا الموقع يعني موافقتكم على سياسة الخصوصية هذه.

لا يجمع موقع "معروفة" أية معلومات شخصية عن زواره، كالاسم، والعنوان، ورقم الهاتف، والبريد الإلكتروني، إلخ، إلا إذا قدموا هذه المعلومات له طواعية. وفي حال اختار الزائر تقديم المعلومات الشخصية، فنحن لن نستخدمها سوى لتلبية طلبه في الحصول على معلومات أو خدمات.

يحتفظ موقع "معروفة" بالحق في تعديل بنود سياسة الخصوصية دون حاجة إلى إخطار المتعاملين معه بذلك. ويعتبر استمرار المتعاملين باستخدام الموقع بعد إجراء التعديلات على سياسة الخصوصية بمثابة قبول لهذه التعديلات.

يتّبع موقع "معروفة" سياسة أمن شاملة لحماية المعلومات التي يتم تسجيلها في هذا الموقع. ولايمنح حق الوصول إلى المعلومات الشخصية التعريفية للمتعاملين معه سوى للموظفين المخولين، مع العلم أن هؤلاء الموظفين يوقعون على تعهد بتأمين سرية هذه المعلومات.

يُنفّذ موقع "معروفة" إجراءات صارمة لحماية المعلومات من الضياع أو إساءة الاستخدام أو التغيير. لكن الموقع لا يضمن سرية استخدامكم للموقع ولا يُعتبر مسؤولاً قانونياً عن أي ضرر قد تتعرضون له فيما لو حدث انتهاك لسرية هذه المعلومات، كما ولا يحق لكم المطالبة بأي تعويضات من جراء ذلك.', N'The privacy policy and terms set out below are part of the terms and conditions of use of the “Maroufeh” service website. Your use of this website constitutes your acceptance of this Privacy Policy. Maroufeh does not collect any personal information about its visitors, such as name, address, phone number, e-mail, etc., unless they provide this information to it voluntarily. If the visitor chooses to provide personal information, we will use it only to fulfill his request for information or services. Maroufeh reserves the right to amend the terms of the privacy policy without the need to notify its clients. Customers'' continued use of the site after making the modifications to the privacy policy constitutes acceptance of such modifications. Maroufeh website follows a comprehensive security policy to protect the information that is recorded on this website. Only authorized employees are granted the right to access the personally identifiable information of his clients, knowing that these employees sign a pledge to secure the confidentiality of this information. Maroofah implements strict measures to protect information from loss, misuse or alteration. But the site does not guarantee the confidentiality of your use of the site and is not considered legally responsible for any damage that you may suffer if there was a violation of the confidentiality of this information, and you are not entitled to claim any compensation as a result of that.')
GO
INSERT [dbo].[Page] ([ID], [NameAR], [NameEN], [DescriptionAR], [DescriptionEN]) VALUES (3, N'شروط الدفع', N'Payment policies', N'محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية ', N'Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details ')
GO
INSERT [dbo].[Page] ([ID], [NameAR], [NameEN], [DescriptionAR], [DescriptionEN]) VALUES (4, N'الشروط والأحكام', N'Terms & Conditions', N'محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية ', N'Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details ')
GO
INSERT [dbo].[Page] ([ID], [NameAR], [NameEN], [DescriptionAR], [DescriptionEN]) VALUES (5, N'خريطة الموقع', N'Sitemap', N'محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية ', N'Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details ')
GO
INSERT [dbo].[Page] ([ID], [NameAR], [NameEN], [DescriptionAR], [DescriptionEN]) VALUES (6, N'اتصل بنا', N'Contactus', N'محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية محتوى الصفحة باللغة العربية ', N'Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details Details ')
GO
SET IDENTITY_INSERT [dbo].[Page] OFF
GO
SET IDENTITY_INSERT [dbo].[ReportedWorkers] ON 
GO
INSERT [dbo].[ReportedWorkers] ([ID], [WorkerID], [OfficeID], [KafilID], [ReportDate], [HasFakeData], [HasInappropriateImages], [Status], [OtherReason], [Notes]) VALUES (1, N'3112b554-0ca3-4687-b0bc-18095ce76660', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'6eadf14b-527e-419a-92ab-8f128362e0a5', CAST(N'2021-10-06' AS Date), 0, 0, N'تحت_المراجعة_من_قبل_المكتب', NULL, NULL)
GO
INSERT [dbo].[ReportedWorkers] ([ID], [WorkerID], [OfficeID], [KafilID], [ReportDate], [HasFakeData], [HasInappropriateImages], [Status], [OtherReason], [Notes]) VALUES (2, N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', CAST(N'2021-10-08' AS Date), 0, 0, N'تحت_المراجعة_من_قبل_الادارة', NULL, NULL)
GO
INSERT [dbo].[ReportedWorkers] ([ID], [WorkerID], [OfficeID], [KafilID], [ReportDate], [HasFakeData], [HasInappropriateImages], [Status], [OtherReason], [Notes]) VALUES (3, N'64457400-592d-48d3-8f97-07c23c2482de', N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', CAST(N'2021-10-23' AS Date), 0, 0, N'تحت_المراجعة_من_قبل_المكتب', NULL, NULL)
GO
INSERT [dbo].[ReportedWorkers] ([ID], [WorkerID], [OfficeID], [KafilID], [ReportDate], [HasFakeData], [HasInappropriateImages], [Status], [OtherReason], [Notes]) VALUES (4, N'8894b5a6-e47e-4887-969a-a3d168b869d0', N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', CAST(N'2021-10-23' AS Date), 0, 0, N'حساب_معلق', NULL, NULL)
GO
INSERT [dbo].[ReportedWorkers] ([ID], [WorkerID], [OfficeID], [KafilID], [ReportDate], [HasFakeData], [HasInappropriateImages], [Status], [OtherReason], [Notes]) VALUES (5, N'88e179f7-a748-4765-b7a4-138b2334141b', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', CAST(N'2021-10-28' AS Date), 0, 0, N'تحت_المراجعة_من_قبل_الادارة', NULL, NULL)
GO
INSERT [dbo].[ReportedWorkers] ([ID], [WorkerID], [OfficeID], [KafilID], [ReportDate], [HasFakeData], [HasInappropriateImages], [Status], [OtherReason], [Notes]) VALUES (6, N'88ebaf31-b172-4189-acbf-9e366c96b38c', N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', CAST(N'2021-11-03' AS Date), 0, 0, N'تحت_المراجعة_من_قبل_المكتب', 1, N'تجريب 
')
GO
SET IDENTITY_INSERT [dbo].[ReportedWorkers] OFF
GO
SET IDENTITY_INSERT [dbo].[Skills] ON 
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (1, N'التنظيف', N'Cleaning')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (2, N'طبخ عام ', N'General Cooking')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (3, N'رخصة قيادة ', N'Driving License')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (4, N'اللغة الانجليزية ', N'English language')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (5, N'معاملة الاطفال', N'Treatment Children')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (6, N'اللغة العربية ', N'Arabic Language ')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (7, N'اسعافات أولية ', N'Band aid')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (8, N'الغسيل ', N'Laundry')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (9, N'الخياطة ', N'Sewing')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (10, N'الديكور ', N'Decoration')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (11, N'طبخ عربي', N'Arabic Cooking')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (12, N'طبخ هندي', N'Indian Cooking')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (13, N'طبخ أجنبي', N'English Cooking')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (14, N'حلويات', N'Sweets')
GO
INSERT [dbo].[Skills] ([ID], [NameAR], [NameEN]) VALUES (15, N'معاملة كبار السن', N'Elderly Care')
GO
SET IDENTITY_INSERT [dbo].[Skills] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 
GO
INSERT [dbo].[Status] ([ID], [NameAR], [NameEN]) VALUES (1, N'اعزب', N'Single')
GO
INSERT [dbo].[Status] ([ID], [NameAR], [NameEN]) VALUES (2, N'متزوج', N'Married')
GO
INSERT [dbo].[Status] ([ID], [NameAR], [NameEN]) VALUES (3, N'مطلق', N'Divorced')
GO
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerCertificates] ON 
GO
INSERT [dbo].[WorkerCertificates] ([ID], [Name], [University], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (1, N'بكالوريس حاسبات ومعلومات', N'القاهرة', N'42a41d57-8902-407e-97ab-f9e7d759a08d', CAST(N'2002-09-01' AS Date), CAST(N'2007-09-01' AS Date), 9, NULL)
GO
INSERT [dbo].[WorkerCertificates] ([ID], [Name], [University], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (2, N'بكالريوس ', N'جامعة القاهرة ', N'02d8967a-8751-474d-9220-05d518ece80b', CAST(N'2020-05-01' AS Date), CAST(N'2021-09-22' AS Date), 10, NULL)
GO
INSERT [dbo].[WorkerCertificates] ([ID], [Name], [University], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (3, N'دبلوم ', N'جامعة القاهرة ', N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', CAST(N'2015-01-11' AS Date), CAST(N'2016-01-01' AS Date), 10, NULL)
GO
INSERT [dbo].[WorkerCertificates] ([ID], [Name], [University], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (4, N'معهد تمريض ', N'عين شمس', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', CAST(N'2017-01-13' AS Date), CAST(N'2021-01-13' AS Date), 10, NULL)
GO
INSERT [dbo].[WorkerCertificates] ([ID], [Name], [University], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (5, N'بكالريوس حاسبات ومعلومات ', N'جامعة ام دورمان ', N'de0dad01-3610-42c9-b7f5-2f050a55f481', CAST(N'2017-01-01' AS Date), CAST(N'2021-01-01' AS Date), 11, NULL)
GO
INSERT [dbo].[WorkerCertificates] ([ID], [Name], [University], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (6, N'دبلومة فى الطبخ ', N'معهد اقتصاد منزلي ', N'a3c20d01-bb00-401d-9abc-fc286724bb7e', CAST(N'2010-01-01' AS Date), CAST(N'2011-01-01' AS Date), 12, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkerCertificates] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerCourses] ON 
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (1, N'Office 2019', N'IBM Center', N'42a41d57-8902-407e-97ab-f9e7d759a08d', CAST(N'2002-01-01' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (2, N'شهادة ادارة المشاريع ', N'المعهد الامريكى لادارة المشاريع ', N'02d8967a-8751-474d-9220-05d518ece80b', CAST(N'2021-09-22' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (3, N'شهادة معاملة أطفال', N'مركز ام  حسن  ', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', CAST(N'2021-10-08' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (4, N'شهادة  ادارة المخاطر ', N'معهد ادارة المشاريع  ', N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', CAST(N'2016-01-11' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (5, N'شهادة مزاولة مهنة ', N'مستشفى السلام ', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', CAST(N'2021-10-13' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (6, N'شهادة مزولة مهنة ', N'معهد ادارة المشاريع  ', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', CAST(N'2021-10-22' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (7, N'شهادة ادارة المخاطر ', N'جامعة الامام سعود', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', CAST(N'2020-01-22' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (8, N'شهادة مزولة مهنة ', N'معهد ادارة المشاريع  ', N'de0dad01-3610-42c9-b7f5-2f050a55f481', CAST(N'2017-01-02' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (9, N'شهادة معاملة أطفال', N'مركز ام  حسن  ', N'de0dad01-3610-42c9-b7f5-2f050a55f481', CAST(N'2021-10-06' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (10, N'شهادة جودة فى الطبخ  الخليجى ', N'معهد الاقتصاد المنزلي لتدريب العمالة ', N'a3c20d01-bb00-401d-9abc-fc286724bb7e', CAST(N'2021-10-01' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (11, N'شهادة مزولة مهنة ', N'مستشفى السلام ', N'676c153a-7b6d-448b-8211-f7d2f04d5f35', CAST(N'2021-10-13' AS Date))
GO
INSERT [dbo].[WorkerCourses] ([ID], [Name], [CenterName], [WorkerID], [Date]) VALUES (12, N'شهادة الصحة المهنية ', N'معهد تمريض دار السلام ', N'9b82f3b4-f888-4d0f-a461-052e3396bf35', CAST(N'2017-06-23' AS Date))
GO
SET IDENTITY_INSERT [dbo].[WorkerCourses] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerExpertises] ON 
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (1, N'كاش كول', N'كفيل اختبار', N'42a41d57-8902-407e-97ab-f9e7d759a08d', CAST(N'2020-01-01' AS Date), CAST(N'2021-12-31' AS Date), 9, 6)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (2, N'شركة ام حسن', N'ام  حسن ', N'64533536-1a5a-4dd2-b6bb-d18610e9633a', CAST(N'2021-09-18' AS Date), CAST(N'2022-09-18' AS Date), 9, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (3, N'شركة ام حسن', N'ام  حسن وابو حسن ', N'02d8967a-8751-474d-9220-05d518ece80b', CAST(N'2013-01-01' AS Date), CAST(N'2015-01-01' AS Date), 9, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (4, N'شركة عز للطبخ الشرقى ', NULL, N'76ab3525-6e40-4fd8-91ba-d3e8df9c297a', CAST(N'2010-01-01' AS Date), CAST(N'2012-01-01' AS Date), 10, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (5, N'شركة محمدين ', N'محمدين ', N'76ab3525-6e40-4fd8-91ba-d3e8df9c297a', CAST(N'2013-01-01' AS Date), CAST(N'2015-01-01' AS Date), 9, 13)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (6, N'شركة هالى ', N'محمد ', N'76ab3525-6e40-4fd8-91ba-d3e8df9c297a', CAST(N'2016-01-01' AS Date), CAST(N'2018-01-01' AS Date), 10, NULL)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (7, N'Dorr Company', N'سليمان ', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', CAST(N'2020-01-01' AS Date), CAST(N'2021-01-01' AS Date), 9, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (8, N'معروفة ', N'مشاري ', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', CAST(N'2018-01-01' AS Date), CAST(N'2019-01-01' AS Date), 10, 112)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (10, N'شركة الشمعدان ', N'عبدالله  شمعدان ', N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', CAST(N'2000-01-01' AS Date), CAST(N'2002-01-01' AS Date), 10, 90)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (11, N'شركة فيكتوريا ', N'محمد ', N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', CAST(N'2018-01-01' AS Date), CAST(N'2019-01-13' AS Date), 9, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (12, N'شركة ميتسوبيشي', NULL, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', CAST(N'2013-01-19' AS Date), CAST(N'2015-11-10' AS Date), 9, NULL)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (13, N'Dorr Company', N'سليمان ', N'de0dad01-3610-42c9-b7f5-2f050a55f481', CAST(N'2020-01-01' AS Date), CAST(N'2021-10-23' AS Date), 9, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (14, N'شركة فيكتوريا ', N'محمد ', N'a3c20d01-bb00-401d-9abc-fc286724bb7e', CAST(N'2016-01-01' AS Date), CAST(N'2019-01-23' AS Date), 9, 5)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (15, N'أبو على ', N'خالد المحمدى ', N'a3c20d01-bb00-401d-9abc-fc286724bb7e', CAST(N'2019-02-02' AS Date), CAST(N'2020-12-31' AS Date), 9, 6)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (16, N'ابو نايف ', NULL, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', CAST(N'2020-12-31' AS Date), CAST(N'2021-10-23' AS Date), 9, 12)
GO
INSERT [dbo].[WorkerExpertises] ([ID], [CompanyName], [KafilName], [WorkerID], [From], [To], [CountryID], [CityID]) VALUES (17, N'ابو مشاري ', NULL, N'676c153a-7b6d-448b-8211-f7d2f04d5f35', CAST(N'2020-01-01' AS Date), CAST(N'2021-10-23' AS Date), 9, 5)
GO
SET IDENTITY_INSERT [dbo].[WorkerExpertises] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerLanguages] ON 
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (0, NULL, N'42a41d57-8902-407e-97ab-f9e7d759a08d', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (1, NULL, N'02d8967a-8751-474d-9220-05d518ece80b', N'مقبول', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (2, NULL, N'02d8967a-8751-474d-9220-05d518ece80b', N'جيد', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (3, NULL, N'02d8967a-8751-474d-9220-05d518ece80b', N'جيد جدا', N'كتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (4, NULL, N'02d8967a-8751-474d-9220-05d518ece80b', N'جيد', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (5, 3, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', N'مقبول', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (6, 1, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', N'مقبول', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (7, NULL, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (8, NULL, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'جيد جدا', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (9, NULL, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'جيد', N'كتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (10, NULL, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'مقبول', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (11, 2, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', N'مقبول', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (12, 1, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (13, 2, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', N'جيد جدا', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (14, 1, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (15, 2, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', N'جيد جدا', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (16, 2, N'de0dad01-3610-42c9-b7f5-2f050a55f481', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (17, 1, N'de0dad01-3610-42c9-b7f5-2f050a55f481', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (18, 1, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', N'جيد', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (19, 2, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', N'جيد جدا', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (20, 2, N'676c153a-7b6d-448b-8211-f7d2f04d5f35', N'جيد جدا', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (21, 1, N'676c153a-7b6d-448b-8211-f7d2f04d5f35', N'مقبول', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (22, 1, N'9b82f3b4-f888-4d0f-a461-052e3396bf35', N'جيد', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (23, 2, N'9b82f3b4-f888-4d0f-a461-052e3396bf35', N'جيد جدا', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (24, 2, N'f344d465-a0e5-47f0-a265-b446806de748', N'جيد جدا', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (25, 2, N'07b1835a-40e6-4aca-a396-d5b86186a090', N'جيد', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (26, 3, N'07b1835a-40e6-4aca-a396-d5b86186a090', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (27, 2, N'd5e91be5-d318-47c5-b6f2-517bdd46c227', N'جيد', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (28, 3, N'd5e91be5-d318-47c5-b6f2-517bdd46c227', N'ممتاز', N'قراءة وكتابة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (29, 2, N'b504e1a9-c046-4c30-a14a-fcae22e74501', N'جيد', N'قراءة')
GO
INSERT [dbo].[WorkerLanguages] ([ID], [LanguageID], [WorkerID], [Level], [Method]) VALUES (30, 3, N'b504e1a9-c046-4c30-a14a-fcae22e74501', N'ممتاز', N'قراءة وكتابة')
GO
SET IDENTITY_INSERT [dbo].[WorkerLanguages] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerRequests] ON 
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (6, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'64533536-1a5a-4dd2-b6bb-d18610e9633a', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-21' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مسددة', CAST(N'2021-10-06' AS Date), NULL, N'/uploads/receipts/de373a90-f161-4f43-a022-8d1c4f35f09e.png')
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (7, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'64457400-592d-48d3-8f97-07c23c2482de', N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'تم_ارسال_الطلب', CAST(N'2021-09-21' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (8, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_رفض_الاعتماد', CAST(N'2021-09-21' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (9, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'02d8967a-8751-474d-9220-05d518ece80b', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'رفض_أولى', CAST(N'2021-09-22' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (10, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'726252af-8301-4975-849b-5c5c909e2979', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'رفض_أولى', CAST(N'2021-09-22' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (11, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'42a41d57-8902-407e-97ab-f9e7d759a08d', N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'تم_ارسال_الطلب', CAST(N'2021-09-23' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (12, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'76ab3525-6e40-4fd8-91ba-d3e8df9c297a', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-24' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (13, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'8894b5a6-e47e-4887-969a-a3d168b869d0', N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'تم_ارسال_الطلب', CAST(N'2021-09-24' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (14, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'6eab231d-d3eb-4acc-aedb-bc31befaf594', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-24' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (15, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'42a41d57-8902-407e-97ab-f9e7d759a08d', N'a202e4a9-b890-478b-a934-a928a0d2b49f', N'تم_ارسال_الطلب', CAST(N'2021-09-26' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (17, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'02d8967a-8751-474d-9220-05d518ece80b', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-26' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (18, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-27' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (19, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-27' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (20, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-27' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (21, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-09-27' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (22, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'3112b554-0ca3-4687-b0bc-18095ce76660', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-10-02' AS Date), CAST(300.00 AS Decimal(18, 2)), N'تحت_المراجعة', CAST(N'2021-10-06' AS Date), NULL, N'/uploads/receipts/8dd686bc-6f46-4e44-b936-7f289d53cd96.png')
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (23, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-10-10' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (24, N'552ef57f-82c0-4df1-8f2c-2222f479e862', N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-10-13' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (25, N'552ef57f-82c0-4df1-8f2c-2222f479e862', N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'رفض_أولى', CAST(N'2021-10-13' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (26, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'0b9c3dca-9960-46a9-ac8b-428a9bcd1261', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-10-20' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (27, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'رفض_أولى', CAST(N'2021-10-24' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (28, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'd5e91be5-d318-47c5-b6f2-517bdd46c227', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'رفض_أولى', CAST(N'2021-10-29' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (29, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'a3c20d01-bb00-401d-9abc-fc286724bb7e', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-10-29' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (30, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'a2b7ab60-edbb-42cd-88e3-a5bde20035bb', N'de9578d3-5d2a-41dd-871b-39945462fd91', N'تم_ارسال_الطلب', CAST(N'2021-11-03' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (31, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'676c153a-7b6d-448b-8211-f7d2f04d5f35', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-11-03' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (32, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'88ebaf31-b172-4189-acbf-9e366c96b38c', N'fcb0b5ec-7026-4f9a-bcd2-c64b24c14f2c', N'قبول_أولى', CAST(N'2021-11-03' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (33, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'a2b7ab60-edbb-42cd-88e3-a5bde20035bb', N'de9578d3-5d2a-41dd-871b-39945462fd91', N'تم_ارسال_الطلب', CAST(N'2021-11-05' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (34, N'6eadf14b-527e-419a-92ab-8f128362e0a5', N'a3c20d01-bb00-401d-9abc-fc286724bb7e', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_الاعتماد', CAST(N'2021-11-05' AS Date), CAST(300.00 AS Decimal(18, 2)), N'طلبات_مستحقة', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (35, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'07b1835a-40e6-4aca-a396-d5b86186a090', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'قبول_أولى', CAST(N'2021-11-05' AS Date), CAST(0.00 AS Decimal(18, 2)), N'قيمة_مبدئية', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (36, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'07b1835a-40e6-4aca-a396-d5b86186a090', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'قبول_أولى', CAST(N'2021-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), N'قيمة_مبدئية', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (37, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'f7aa4990-7f56-4b16-ba67-68987669c073', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'قبول_أولى', CAST(N'2021-11-09' AS Date), CAST(0.00 AS Decimal(18, 2)), N'قيمة_مبدئية', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (38, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'f344d465-a0e5-47f0-a265-b446806de748', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'قبول_أولى', CAST(N'2021-11-16' AS Date), CAST(0.00 AS Decimal(18, 2)), N'قيمة_مبدئية', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (39, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'9b82f3b4-f888-4d0f-a461-052e3396bf35', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'قبول_أولى', CAST(N'2021-11-18' AS Date), CAST(0.00 AS Decimal(18, 2)), N'قيمة_مبدئية', NULL, NULL, NULL)
GO
INSERT [dbo].[WorkerRequests] ([ID], [KafilID], [WorkerID], [OfficeID], [RequestStatus], [RequestDate], [Balance], [PaidStatus], [PaidDate], [RefundDate], [ReceiptUrl]) VALUES (40, N'31e5e701-4e78-40f0-af71-8a0f24fe7f73', N'0ce25aae-e337-4cf2-9ec5-5634b0cd8be2', N'13446944-5c9e-4e73-9476-ea90543ccb47', N'تم_ارسال_الطلب', CAST(N'2021-11-18' AS Date), CAST(0.00 AS Decimal(18, 2)), NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[WorkerRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerSkills] ON 
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (1, N'42a41d57-8902-407e-97ab-f9e7d759a08d', 2, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (5, N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', 6, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (6, N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', 7, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (7, N'0bc4f5e8-8e40-497b-aa11-96ce4e1dab44', 15, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (11, N'02d8967a-8751-474d-9220-05d518ece80b', 2, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (12, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', 4, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (13, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', 6, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (14, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', 7, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (15, N'2ca5f130-4f41-4df0-ad4d-26c0956b8f7b', 15, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (21, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', 1, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (22, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', 3, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (23, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203', 4, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (24, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', 1, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (25, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', 2, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (26, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', 3, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (27, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29', 4, NULL)
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (28, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', 2, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (31, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', 6, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (32, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215', 15, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (33, N'de0dad01-3610-42c9-b7f5-2f050a55f481', 4, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (34, N'de0dad01-3610-42c9-b7f5-2f050a55f481', 6, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (35, N'de0dad01-3610-42c9-b7f5-2f050a55f481', 7, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (36, N'de0dad01-3610-42c9-b7f5-2f050a55f481', 15, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (37, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 4, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (38, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 5, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (39, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 6, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (40, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 7, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (41, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 8, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (42, N'a3c20d01-bb00-401d-9abc-fc286724bb7e', 9, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (43, N'676c153a-7b6d-448b-8211-f7d2f04d5f35', 5, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (44, N'676c153a-7b6d-448b-8211-f7d2f04d5f35', 7, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (45, N'676c153a-7b6d-448b-8211-f7d2f04d5f35', 15, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (46, N'9b82f3b4-f888-4d0f-a461-052e3396bf35', 7, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (47, N'9b82f3b4-f888-4d0f-a461-052e3396bf35', 15, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (48, N'9b82f3b4-f888-4d0f-a461-052e3396bf35', 4, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (49, N'9b82f3b4-f888-4d0f-a461-052e3396bf35', 6, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (50, N'f344d465-a0e5-47f0-a265-b446806de748', 2, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (51, N'f344d465-a0e5-47f0-a265-b446806de748', 11, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (52, N'f344d465-a0e5-47f0-a265-b446806de748', 12, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (53, N'f344d465-a0e5-47f0-a265-b446806de748', 14, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (54, N'f344d465-a0e5-47f0-a265-b446806de748', 13, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (55, N'f7aa4990-7f56-4b16-ba67-68987669c073', 2, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (56, N'f7aa4990-7f56-4b16-ba67-68987669c073', 14, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (57, N'f7aa4990-7f56-4b16-ba67-68987669c073', 1, N'متوسط')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (58, N'07b1835a-40e6-4aca-a396-d5b86186a090', 5, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (59, N'07b1835a-40e6-4aca-a396-d5b86186a090', 7, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (60, N'b504e1a9-c046-4c30-a14a-fcae22e74501', 2, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (61, N'b504e1a9-c046-4c30-a14a-fcae22e74501', 11, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (62, N'b504e1a9-c046-4c30-a14a-fcae22e74501', 13, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (63, N'b504e1a9-c046-4c30-a14a-fcae22e74501', 14, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (65, N'd5e91be5-d318-47c5-b6f2-517bdd46c227', 7, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (66, N'd5e91be5-d318-47c5-b6f2-517bdd46c227', 5, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (67, N'd5e91be5-d318-47c5-b6f2-517bdd46c227', 15, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (68, N'88ebaf31-b172-4189-acbf-9e366c96b38c', 1, N'ممتاز')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (69, N'88ebaf31-b172-4189-acbf-9e366c96b38c', 4, N'جيد')
GO
INSERT [dbo].[WorkerSkills] ([ID], [WorkerID], [SkillID], [Level]) VALUES (70, N'88ebaf31-b172-4189-acbf-9e366c96b38c', 6, N'جيد')
GO
SET IDENTITY_INSERT [dbo].[WorkerSkills] OFF
GO
SET IDENTITY_INSERT [dbo].[WorkerWorkingPlaces] ON 
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (1, 9, 6, N'42a41d57-8902-407e-97ab-f9e7d759a08d')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (2, 9, 5, N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (3, 9, 5, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (4, 9, 6, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (5, 9, 12, N'f1003ccb-9ffd-4035-af4d-e75ddcca4203')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (6, 9, 7, N'02d8967a-8751-474d-9220-05d518ece80b')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (7, 9, 6, N'ff60843b-93a1-4d2e-996d-4dc4f024ca29')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (8, 9, 5, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (9, 9, 6, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (10, 9, 13, N'6cf80cb7-483e-402d-aeb6-1f2ef1471215')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (11, 9, 23, N'de0dad01-3610-42c9-b7f5-2f050a55f481')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (12, 9, 13, N'de0dad01-3610-42c9-b7f5-2f050a55f481')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (13, 9, 5, N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (14, 9, 14, N'a3c20d01-bb00-401d-9abc-fc286724bb7e')
GO
INSERT [dbo].[WorkerWorkingPlaces] ([ID], [CountryID], [CityID], [WorkerID]) VALUES (15, 9, 5, N'676c153a-7b6d-448b-8211-f7d2f04d5f35')
GO
SET IDENTITY_INSERT [dbo].[WorkerWorkingPlaces] OFF
GO
ALTER TABLE [dbo].[AspNetRoles] ADD  CONSTRAINT [DF_AspNetRoles_IsShow]  DEFAULT ((1)) FOR [IsShow]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ImageUrl]  DEFAULT ('/Content/front/assets/img/user.png') FOR [ImageUrl]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_Gender]  DEFAULT ((1)) FOR [Gender]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_HasDrivingLicense]  DEFAULT ((0)) FOR [HasDrivingLicense]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsRoomShare]  DEFAULT ((1)) FOR [IsRoomShared]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_LastLoggedInDate]  DEFAULT (getdate()) FOR [LastLoggedInDate]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_ViewCount]  DEFAULT ((0)) FOR [ViewCount]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsVerifed]  DEFAULT ((0)) FOR [IsVerifed]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsBlocked]  DEFAULT ((0)) FOR [IsBlocked]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  CONSTRAINT [DF_AspNetUsers_IsVerifed2]  DEFAULT ((0)) FOR [IsActivated]
GO
ALTER TABLE [dbo].[BlokedUsers] ADD  CONSTRAINT [DF_BlokedUsers_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[ContactUsMessages] ADD  CONSTRAINT [DF_ContactUsMessages_IsHide]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[Mail] ADD  CONSTRAINT [DF_Mail_Date]  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [dbo].[Mail] ADD  CONSTRAINT [DF_Mail_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[NewsLetter] ADD  CONSTRAINT [DF_NewsLetter_IsSubscribed_1]  DEFAULT ((1)) FOR [IsSubscribed]
GO
ALTER TABLE [dbo].[Notifications] ADD  CONSTRAINT [DF_Notifications_IsRead]  DEFAULT ((0)) FOR [IsRead]
GO
ALTER TABLE [dbo].[ReportedWorkers] ADD  CONSTRAINT [DF_BlokedWorkers_Date]  DEFAULT (getdate()) FOR [ReportDate]
GO
ALTER TABLE [dbo].[ReportedWorkers] ADD  CONSTRAINT [DF_ReportedWorkers_HasFakeData]  DEFAULT ((1)) FOR [HasFakeData]
GO
ALTER TABLE [dbo].[ReportedWorkers] ADD  CONSTRAINT [DF_ReportedWorkers_HasFakeData1]  DEFAULT ((1)) FOR [HasInappropriateImages]
GO
ALTER TABLE [dbo].[ReportedWorkers] ADD  CONSTRAINT [DF_ReportedWorkers_OtherReasons]  DEFAULT ((1)) FOR [OtherReason]
GO
ALTER TABLE [dbo].[WorkerRequests] ADD  CONSTRAINT [DF_KafilWorkers_Date]  DEFAULT (getdate()) FOR [RequestDate]
GO
ALTER TABLE [dbo].[WorkerRequests] ADD  CONSTRAINT [DF_WorkerRequests_Balance]  DEFAULT ((0)) FOR [Balance]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] NOCHECK CONSTRAINT [FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] NOCHECK CONSTRAINT [FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] NOCHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH NOCHECK ADD  CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] NOCHECK CONSTRAINT [FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_AspNetUsers] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_AspNetUsers]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_City]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Country]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Country1] FOREIGN KEY([BirthCountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Country1]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Country2] FOREIGN KEY([PassportRealseCountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Country2]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUsers_Jobs] FOREIGN KEY([JobsID])
REFERENCES [dbo].[Jobs] ([ID])
GO
ALTER TABLE [dbo].[AspNetUsers] CHECK CONSTRAINT [FK_AspNetUsers_Jobs]
GO
ALTER TABLE [dbo].[AspNetUsers]  WITH NOCHECK ADD  CONSTRAINT [FK_AspNetUsers_Nationality] FOREIGN KEY([NationalityID])
REFERENCES [dbo].[Nationality] ([ID])
GO
ALTER TABLE [dbo].[AspNetUsers] NOCHECK CONSTRAINT [FK_AspNetUsers_Nationality]
GO
ALTER TABLE [dbo].[Attachment]  WITH NOCHECK ADD  CONSTRAINT [FK_Attachment_FileType] FOREIGN KEY([FileTypeID])
REFERENCES [dbo].[FileType] ([ID])
GO
ALTER TABLE [dbo].[Attachment] NOCHECK CONSTRAINT [FK_Attachment_FileType]
GO
ALTER TABLE [dbo].[BlokedUsers]  WITH CHECK ADD  CONSTRAINT [FK_BlokedUsers_AspNetUsers_KafilID] FOREIGN KEY([KafilID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlokedUsers] CHECK CONSTRAINT [FK_BlokedUsers_AspNetUsers_KafilID]
GO
ALTER TABLE [dbo].[BlokedUsers]  WITH CHECK ADD  CONSTRAINT [FK_BlokedUsers_AspNetUsers_OfficeID] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[BlokedUsers] CHECK CONSTRAINT [FK_BlokedUsers_AspNetUsers_OfficeID]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_AspNetUsers] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_AspNetUsers]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_City]
GO
ALTER TABLE [dbo].[Branches]  WITH CHECK ADD  CONSTRAINT [FK_Branches_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[Branches] CHECK CONSTRAINT [FK_Branches_Country]
GO
ALTER TABLE [dbo].[City]  WITH NOCHECK ADD  CONSTRAINT [FK_City_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[City] NOCHECK CONSTRAINT [FK_City_Country]
GO
ALTER TABLE [dbo].[District]  WITH NOCHECK ADD  CONSTRAINT [FK_District_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[District] NOCHECK CONSTRAINT [FK_District_City]
GO
ALTER TABLE [dbo].[FavoriteList]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteList_AspNetUsers] FOREIGN KEY([KafilID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FavoriteList] CHECK CONSTRAINT [FK_FavoriteList_AspNetUsers]
GO
ALTER TABLE [dbo].[FavoriteList]  WITH CHECK ADD  CONSTRAINT [FK_FavoriteList_AspNetUsers1] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[FavoriteList] CHECK CONSTRAINT [FK_FavoriteList_AspNetUsers1]
GO
ALTER TABLE [dbo].[Gallery]  WITH CHECK ADD  CONSTRAINT [FK_Gallery_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Gallery] CHECK CONSTRAINT [FK_Gallery_AspNetUsers]
GO
ALTER TABLE [dbo].[Mail]  WITH CHECK ADD  CONSTRAINT [FK_Mail_AspNetUsers] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Mail] CHECK CONSTRAINT [FK_Mail_AspNetUsers]
GO
ALTER TABLE [dbo].[Mail]  WITH CHECK ADD  CONSTRAINT [FK_Mail_AspNetUsers1] FOREIGN KEY([OperatorID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Mail] CHECK CONSTRAINT [FK_Mail_AspNetUsers1]
GO
ALTER TABLE [dbo].[Mail]  WITH NOCHECK ADD  CONSTRAINT [FK_Mail_Mail] FOREIGN KEY([MailID])
REFERENCES [dbo].[Mail] ([ID])
GO
ALTER TABLE [dbo].[Mail] NOCHECK CONSTRAINT [FK_Mail_Mail]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_AspNetUsers] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_AspNetUsers]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_AspNetUsers1] FOREIGN KEY([KafilID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_AspNetUsers1]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_AspNetUsers2] FOREIGN KEY([AdminID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_AspNetUsers2]
GO
ALTER TABLE [dbo].[Notifications]  WITH CHECK ADD  CONSTRAINT [FK_Notifications_WorkerRequests] FOREIGN KEY([RequestID])
REFERENCES [dbo].[WorkerRequests] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Notifications] CHECK CONSTRAINT [FK_Notifications_WorkerRequests]
GO
ALTER TABLE [dbo].[OfficeDocuments]  WITH CHECK ADD  CONSTRAINT [FK_OfficeDocuments_AspNetUsers] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OfficeDocuments] CHECK CONSTRAINT [FK_OfficeDocuments_AspNetUsers]
GO
ALTER TABLE [dbo].[OfficeServices]  WITH CHECK ADD  CONSTRAINT [FK_OfficeServices_AspNetUsers] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[OfficeServices] CHECK CONSTRAINT [FK_OfficeServices_AspNetUsers]
GO
ALTER TABLE [dbo].[ReportedWorkers]  WITH CHECK ADD  CONSTRAINT [FK_ReportedWorkers_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[ReportedWorkers] CHECK CONSTRAINT [FK_ReportedWorkers_AspNetUsers]
GO
ALTER TABLE [dbo].[ReportedWorkers]  WITH CHECK ADD  CONSTRAINT [FK_ReportedWorkers_AspNetUsers1] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ReportedWorkers] CHECK CONSTRAINT [FK_ReportedWorkers_AspNetUsers1]
GO
ALTER TABLE [dbo].[ReportedWorkers]  WITH CHECK ADD  CONSTRAINT [FK_ReportedWorkers_AspNetUsers2] FOREIGN KEY([KafilID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[ReportedWorkers] CHECK CONSTRAINT [FK_ReportedWorkers_AspNetUsers2]
GO
ALTER TABLE [dbo].[UserFamily]  WITH NOCHECK ADD  CONSTRAINT [FK_UserFamily_AspNetUsers] FOREIGN KEY([UserID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[UserFamily] NOCHECK CONSTRAINT [FK_UserFamily_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerCertificates]  WITH CHECK ADD  CONSTRAINT [FK_WorkerCertificates_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerCertificates] CHECK CONSTRAINT [FK_WorkerCertificates_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerCertificates]  WITH CHECK ADD  CONSTRAINT [FK_WorkerCertificates_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[WorkerCertificates] CHECK CONSTRAINT [FK_WorkerCertificates_City]
GO
ALTER TABLE [dbo].[WorkerCertificates]  WITH CHECK ADD  CONSTRAINT [FK_WorkerCertificates_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[WorkerCertificates] CHECK CONSTRAINT [FK_WorkerCertificates_Country]
GO
ALTER TABLE [dbo].[WorkerCourses]  WITH CHECK ADD  CONSTRAINT [FK_WorkerCourses_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerCourses] CHECK CONSTRAINT [FK_WorkerCourses_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerExpertises]  WITH CHECK ADD  CONSTRAINT [FK_WorkerExpertises_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerExpertises] CHECK CONSTRAINT [FK_WorkerExpertises_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerExpertises]  WITH CHECK ADD  CONSTRAINT [FK_WorkerExpertises_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[WorkerExpertises] CHECK CONSTRAINT [FK_WorkerExpertises_City]
GO
ALTER TABLE [dbo].[WorkerExpertises]  WITH CHECK ADD  CONSTRAINT [FK_WorkerExpertises_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[WorkerExpertises] CHECK CONSTRAINT [FK_WorkerExpertises_Country]
GO
ALTER TABLE [dbo].[WorkerLanguages]  WITH CHECK ADD  CONSTRAINT [FK_WorkerLanguages_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerLanguages] CHECK CONSTRAINT [FK_WorkerLanguages_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerLanguages]  WITH CHECK ADD  CONSTRAINT [FK_WorkerLanguages_Languages] FOREIGN KEY([LanguageID])
REFERENCES [dbo].[Languages] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerLanguages] CHECK CONSTRAINT [FK_WorkerLanguages_Languages]
GO
ALTER TABLE [dbo].[WorkerRequests]  WITH CHECK ADD  CONSTRAINT [FK_KafilWorkers_AspNetUsers] FOREIGN KEY([KafilID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WorkerRequests] CHECK CONSTRAINT [FK_KafilWorkers_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerRequests]  WITH CHECK ADD  CONSTRAINT [FK_KafilWorkers_AspNetUsers1] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WorkerRequests] CHECK CONSTRAINT [FK_KafilWorkers_AspNetUsers1]
GO
ALTER TABLE [dbo].[WorkerRequests]  WITH CHECK ADD  CONSTRAINT [FK_KafilWorkers_AspNetUsers2] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[AspNetUsers] ([Id])
GO
ALTER TABLE [dbo].[WorkerRequests] CHECK CONSTRAINT [FK_KafilWorkers_AspNetUsers2]
GO
ALTER TABLE [dbo].[WorkerSkills]  WITH CHECK ADD  CONSTRAINT [FK_WorkerSkills_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerSkills] CHECK CONSTRAINT [FK_WorkerSkills_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerSkills]  WITH CHECK ADD  CONSTRAINT [FK_WorkerSkills_Skills] FOREIGN KEY([SkillID])
REFERENCES [dbo].[Skills] ([ID])
GO
ALTER TABLE [dbo].[WorkerSkills] CHECK CONSTRAINT [FK_WorkerSkills_Skills]
GO
ALTER TABLE [dbo].[WorkerWorkingPlaces]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkingPlaces_AspNetUsers] FOREIGN KEY([WorkerID])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[WorkerWorkingPlaces] CHECK CONSTRAINT [FK_WorkerWorkingPlaces_AspNetUsers]
GO
ALTER TABLE [dbo].[WorkerWorkingPlaces]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkingPlaces_City] FOREIGN KEY([CityID])
REFERENCES [dbo].[City] ([ID])
GO
ALTER TABLE [dbo].[WorkerWorkingPlaces] CHECK CONSTRAINT [FK_WorkerWorkingPlaces_City]
GO
ALTER TABLE [dbo].[WorkerWorkingPlaces]  WITH CHECK ADD  CONSTRAINT [FK_WorkerWorkingPlaces_Country] FOREIGN KEY([CountryID])
REFERENCES [dbo].[Country] ([ID])
GO
ALTER TABLE [dbo].[WorkerWorkingPlaces] CHECK CONSTRAINT [FK_WorkerWorkingPlaces_Country]
GO
USE [master]
GO
ALTER DATABASE [Marofh] SET  READ_WRITE 
GO
