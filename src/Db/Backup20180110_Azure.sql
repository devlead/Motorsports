/****** Object:  Database [Motorsports]    Script Date: 2018-01-10 21:08:58 ******/
CREATE DATABASE [Motorsports]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 500 MB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS;
GO
ALTER DATABASE [Motorsports] SET COMPATIBILITY_LEVEL = 130
GO
ALTER DATABASE [Motorsports] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Motorsports] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Motorsports] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Motorsports] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Motorsports] SET ARITHABORT OFF 
GO
ALTER DATABASE [Motorsports] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [Motorsports] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Motorsports] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Motorsports] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Motorsports] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Motorsports] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Motorsports] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Motorsports] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Motorsports] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Motorsports] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Motorsports] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Motorsports] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Motorsports] SET  MULTI_USER 
GO
ALTER DATABASE [Motorsports] SET ENCRYPTION ON
GO
ALTER DATABASE [Motorsports] SET QUERY_STORE = ON
GO
ALTER DATABASE [Motorsports] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 100, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET OPTIMIZE_FOR_AD_HOC_WORKLOADS = OFF;
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
-- ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
/****** Object:  User [MotorsportsApp]    Script Date: 2018-01-10 21:08:58 ******/
CREATE USER [MotorsportsApp] FOR LOGIN [MotorsportsApp] WITH DEFAULT_SCHEMA=[dbo]
GO
sys.sp_addrolemember @rolename = N'db_datareader', @membername = N'MotorsportsApp'
GO
sys.sp_addrolemember @rolename = N'db_datawriter', @membername = N'MotorsportsApp'
GO
/****** Object:  Table [dbo].[Country]    Script Date: 2018-01-10 21:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Country](
	[ISO] [char](2) NOT NULL,
	[Name] [varchar](80) NULL,
	[NiceName] [varchar](80) NULL,
	[ISO3] [char](3) NULL,
	[NumCode] [smallint] NULL,
	[PhoneCode] [smallint] NULL,
 CONSTRAINT [PK_Country] PRIMARY KEY CLUSTERED 
(
	[ISO] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 2018-01-10 21:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Participant](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Country] [char](2) NOT NULL,
 CONSTRAINT [PK_Participant] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Round]    Script Date: 2018-01-10 21:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Round](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Date] [date] NOT NULL,
	[Number] [smallint] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Season] [int] NOT NULL,
	[Venue] [nvarchar](50) NOT NULL,
	[Status] [nvarchar](20) NOT NULL,
	[Rating] [decimal](3, 1) NULL,
	[Rain] [decimal](1, 0) NULL,
	[WinningTeam] [int] NULL,
	[Note] [nvarchar](max) NULL,
 CONSTRAINT [PK_Round] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundWinner]    Script Date: 2018-01-10 21:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoundWinner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Round] [int] NOT NULL,
	[Participant] [int] NOT NULL,
 CONSTRAINT [PK_RoundWinner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 2018-01-10 21:08:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Season](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sport] [nvarchar](50) NOT NULL,
	[Label] [nvarchar](100) NULL,
	[WinningTeam] [int] NULL,
 CONSTRAINT [PK_Season] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeasonWinner]    Script Date: 2018-01-10 21:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonWinner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Season] [int] NOT NULL,
	[Participant] [int] NOT NULL,
 CONSTRAINT [PK_SeasonWinner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sport]    Script Date: 2018-01-10 21:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sport](
	[Name] [nvarchar](50) NOT NULL,
	[FullName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Sport] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 2018-01-10 21:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[Name] [nvarchar](20) NOT NULL,
	[Step] [tinyint] NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 2018-01-10 21:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Sport] [nvarchar](50) NOT NULL,
	[Country] [char](2) NOT NULL,
 CONSTRAINT [PK_Team] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 2018-01-10 21:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [nvarchar](255) NOT NULL,
	[PasswordHash] [varbinary](50) NOT NULL,
	[Salt] [varbinary](50) NOT NULL,
	[Iterations] [int] NOT NULL,
	[Prf] [varchar](10) NOT NULL,
	[ForceChangePassword] [bit] NOT NULL,
	[Title] [nvarchar](255) NULL,
	[GivenName] [nvarchar](255) NULL,
	[FamilyName] [nvarchar](255) NULL,
	[EmailAddress] [nvarchar](255) NULL,
	[IsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 2018-01-10 21:08:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venue](
	[Name] [nvarchar](50) NOT NULL,
	[Country] [char](2) NOT NULL,
 CONSTRAINT [PK_Venue] PRIMARY KEY CLUSTERED 
(
	[Name] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AD', N'ANDORRA', N'Andorra', N'AND', 20, 376)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AE', N'UNITED ARAB EMIRATES', N'United Arab Emirates', N'ARE', 784, 971)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AF', N'AFGHANISTAN', N'Afghanistan', N'AFG', 4, 93)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AG', N'ANTIGUA AND BARBUDA', N'Antigua and Barbuda', N'ATG', 28, 1268)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AI', N'ANGUILLA', N'Anguilla', N'AIA', 660, 1264)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AL', N'ALBANIA', N'Albania', N'ALB', 8, 355)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AM', N'ARMENIA', N'Armenia', N'ARM', 51, 374)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AN', N'NETHERLANDS ANTILLES', N'Netherlands Antilles', N'ANT', 530, 599)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AO', N'ANGOLA', N'Angola', N'AGO', 24, 244)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AP', N'ASIA PACIFIC REGION', N'Asia / Pacific Region', N'0  ', 0, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AQ', N'ANTARCTICA', N'Antarctica', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AR', N'ARGENTINA', N'Argentina', N'ARG', 32, 54)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AS', N'AMERICAN SAMOA', N'American Samoa', N'ASM', 16, 1684)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AT', N'AUSTRIA', N'Austria', N'AUT', 40, 43)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AU', N'AUSTRALIA', N'Australia', N'AUS', 36, 61)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AW', N'ARUBA', N'Aruba', N'ABW', 533, 297)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AX', N'ALAND ISLANDS', N'Aland Islands', N'ALA', 248, 358)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'AZ', N'AZERBAIJAN', N'Azerbaijan', N'AZE', 31, 994)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BA', N'BOSNIA AND HERZEGOVINA', N'Bosnia and Herzegovina', N'BIH', 70, 387)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BB', N'BARBADOS', N'Barbados', N'BRB', 52, 1246)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BD', N'BANGLADESH', N'Bangladesh', N'BGD', 50, 880)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BE', N'BELGIUM', N'Belgium', N'BEL', 56, 32)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BF', N'BURKINA FASO', N'Burkina Faso', N'BFA', 854, 226)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BG', N'BULGARIA', N'Bulgaria', N'BGR', 100, 359)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BH', N'BAHRAIN', N'Bahrain', N'BHR', 48, 973)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BI', N'BURUNDI', N'Burundi', N'BDI', 108, 257)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BJ', N'BENIN', N'Benin', N'BEN', 204, 229)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BL', N'SAINT BARTHELEMY', N'Saint Barthelemy', N'BLM', 652, 590)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BM', N'BERMUDA', N'Bermuda', N'BMU', 60, 1441)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BN', N'BRUNEI DARUSSALAM', N'Brunei Darussalam', N'BRN', 96, 673)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BO', N'BOLIVIA', N'Bolivia', N'BOL', 68, 591)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BQ', N'BONAIRE, SINT EUSTATIUS AND SABA', N'Bonaire, Sint Eustatius and Saba', N'BES', 535, 599)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BR', N'BRAZIL', N'Brazil', N'BRA', 76, 55)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BS', N'BAHAMAS', N'Bahamas', N'BHS', 44, 1242)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BT', N'BHUTAN', N'Bhutan', N'BTN', 64, 975)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BV', N'BOUVET ISLAND', N'Bouvet Island', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BW', N'BOTSWANA', N'Botswana', N'BWA', 72, 267)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BY', N'BELARUS', N'Belarus', N'BLR', 112, 375)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'BZ', N'BELIZE', N'Belize', N'BLZ', 84, 501)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CA', N'CANADA', N'Canada', N'CAN', 124, 1)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CC', N'COCOS (KEELING) ISLANDS', N'Cocos (Keeling) Islands', NULL, NULL, 672)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CD', N'CONGO, THE DEMOCRATIC REPUBLIC OF THE', N'Congo, the Democratic Republic of the', N'COD', 180, 242)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CF', N'CENTRAL AFRICAN REPUBLIC', N'Central African Republic', N'CAF', 140, 236)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CG', N'CONGO', N'Congo', N'COG', 178, 242)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CH', N'SWITZERLAND', N'Switzerland', N'CHE', 756, 41)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CI', N'COTE D''IVOIRE', N'Cote D''Ivoire', N'CIV', 384, 225)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CK', N'COOK ISLANDS', N'Cook Islands', N'COK', 184, 682)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CL', N'CHILE', N'Chile', N'CHL', 152, 56)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CM', N'CAMEROON', N'Cameroon', N'CMR', 120, 237)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CN', N'CHINA', N'China', N'CHN', 156, 86)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CO', N'COLOMBIA', N'Colombia', N'COL', 170, 57)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CR', N'COSTA RICA', N'Costa Rica', N'CRI', 188, 506)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CS', N'SERBIA AND MONTENEGRO', N'Serbia and Montenegro', NULL, NULL, 381)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CU', N'CUBA', N'Cuba', N'CUB', 192, 53)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CV', N'CAPE VERDE', N'Cape Verde', N'CPV', 132, 238)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CW', N'CURACAO', N'Curacao', N'CUW', 531, 599)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CX', N'CHRISTMAS ISLAND', N'Christmas Island', NULL, NULL, 61)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CY', N'CYPRUS', N'Cyprus', N'CYP', 196, 357)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'CZ', N'CZECH REPUBLIC', N'Czech Republic', N'CZE', 203, 420)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'DE', N'GERMANY', N'Germany', N'DEU', 276, 49)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'DJ', N'DJIBOUTI', N'Djibouti', N'DJI', 262, 253)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'DK', N'DENMARK', N'Denmark', N'DNK', 208, 45)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'DM', N'DOMINICA', N'Dominica', N'DMA', 212, 1767)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'DO', N'DOMINICAN REPUBLIC', N'Dominican Republic', N'DOM', 214, 1809)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'DZ', N'ALGERIA', N'Algeria', N'DZA', 12, 213)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'EC', N'ECUADOR', N'Ecuador', N'ECU', 218, 593)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'EE', N'ESTONIA', N'Estonia', N'EST', 233, 372)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'EG', N'EGYPT', N'Egypt', N'EGY', 818, 20)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'EH', N'WESTERN SAHARA', N'Western Sahara', N'ESH', 732, 212)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ER', N'ERITREA', N'Eritrea', N'ERI', 232, 291)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ES', N'SPAIN', N'Spain', N'ESP', 724, 34)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ET', N'ETHIOPIA', N'Ethiopia', N'ETH', 231, 251)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'FI', N'FINLAND', N'Finland', N'FIN', 246, 358)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'FJ', N'FIJI', N'Fiji', N'FJI', 242, 679)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'FK', N'FALKLAND ISLANDS (MALVINAS)', N'Falkland Islands (Malvinas)', N'FLK', 238, 500)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'FM', N'MICRONESIA, FEDERATED STATES OF', N'Micronesia, Federated States of', N'FSM', 583, 691)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'FO', N'FAROE ISLANDS', N'Faroe Islands', N'FRO', 234, 298)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'FR', N'FRANCE', N'France', N'FRA', 250, 33)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GA', N'GABON', N'Gabon', N'GAB', 266, 241)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GB', N'UNITED KINGDOM', N'United Kingdom', N'GBR', 826, 44)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GD', N'GRENADA', N'Grenada', N'GRD', 308, 1473)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GE', N'GEORGIA', N'Georgia', N'GEO', 268, 995)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GF', N'FRENCH GUIANA', N'French Guiana', N'GUF', 254, 594)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GG', N'GUERNSEY', N'Guernsey', N'GGY', 831, 44)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GH', N'GHANA', N'Ghana', N'GHA', 288, 233)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GI', N'GIBRALTAR', N'Gibraltar', N'GIB', 292, 350)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GL', N'GREENLAND', N'Greenland', N'GRL', 304, 299)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GM', N'GAMBIA', N'Gambia', N'GMB', 270, 220)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GN', N'GUINEA', N'Guinea', N'GIN', 324, 224)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GP', N'GUADELOUPE', N'Guadeloupe', N'GLP', 312, 590)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GQ', N'EQUATORIAL GUINEA', N'Equatorial Guinea', N'GNQ', 226, 240)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GR', N'GREECE', N'Greece', N'GRC', 300, 30)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GS', N'SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS', N'South Georgia and the South Sandwich Islands', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GT', N'GUATEMALA', N'Guatemala', N'GTM', 320, 502)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GU', N'GUAM', N'Guam', N'GUM', 316, 1671)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GW', N'GUINEA-BISSAU', N'Guinea-Bissau', N'GNB', 624, 245)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'GY', N'GUYANA', N'Guyana', N'GUY', 328, 592)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'HK', N'HONG KONG', N'Hong Kong', N'HKG', 344, 852)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'HM', N'HEARD ISLAND AND MCDONALD ISLANDS', N'Heard Island and Mcdonald Islands', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'HN', N'HONDURAS', N'Honduras', N'HND', 340, 504)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'HR', N'CROATIA', N'Croatia', N'HRV', 191, 385)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'HT', N'HAITI', N'Haiti', N'HTI', 332, 509)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'HU', N'HUNGARY', N'Hungary', N'HUN', 348, 36)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ID', N'INDONESIA', N'Indonesia', N'IDN', 360, 62)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IE', N'IRELAND', N'Ireland', N'IRL', 372, 353)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IL', N'ISRAEL', N'Israel', N'ISR', 376, 972)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IM', N'ISLE OF MAN', N'Isle of Man', N'IMN', 833, 44)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IN', N'INDIA', N'India', N'IND', 356, 91)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IO', N'BRITISH INDIAN OCEAN TERRITORY', N'British Indian Ocean Territory', NULL, NULL, 246)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IQ', N'IRAQ', N'Iraq', N'IRQ', 368, 964)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IR', N'IRAN, ISLAMIC REPUBLIC OF', N'Iran, Islamic Republic of', N'IRN', 364, 98)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IS', N'ICELAND', N'Iceland', N'ISL', 352, 354)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'IT', N'ITALY', N'Italy', N'ITA', 380, 39)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'JE', N'JERSEY', N'Jersey', N'JEY', 832, 44)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'JM', N'JAMAICA', N'Jamaica', N'JAM', 388, 1876)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'JO', N'JORDAN', N'Jordan', N'JOR', 400, 962)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'JP', N'JAPAN', N'Japan', N'JPN', 392, 81)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KE', N'KENYA', N'Kenya', N'KEN', 404, 254)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KG', N'KYRGYZSTAN', N'Kyrgyzstan', N'KGZ', 417, 996)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KH', N'CAMBODIA', N'Cambodia', N'KHM', 116, 855)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KI', N'KIRIBATI', N'Kiribati', N'KIR', 296, 686)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KM', N'COMOROS', N'Comoros', N'COM', 174, 269)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KN', N'SAINT KITTS AND NEVIS', N'Saint Kitts and Nevis', N'KNA', 659, 1869)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KP', N'KOREA, DEMOCRATIC PEOPLE''S REPUBLIC OF', N'Korea, Democratic People''s Republic of', N'PRK', 408, 850)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KR', N'KOREA, REPUBLIC OF', N'Korea, Republic of', N'KOR', 410, 82)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KW', N'KUWAIT', N'Kuwait', N'KWT', 414, 965)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KY', N'CAYMAN ISLANDS', N'Cayman Islands', N'CYM', 136, 1345)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'KZ', N'KAZAKHSTAN', N'Kazakhstan', N'KAZ', 398, 7)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LA', N'LAO PEOPLE''S DEMOCRATIC REPUBLIC', N'Lao People''s Democratic Republic', N'LAO', 418, 856)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LB', N'LEBANON', N'Lebanon', N'LBN', 422, 961)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LC', N'SAINT LUCIA', N'Saint Lucia', N'LCA', 662, 1758)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LI', N'LIECHTENSTEIN', N'Liechtenstein', N'LIE', 438, 423)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LK', N'SRI LANKA', N'Sri Lanka', N'LKA', 144, 94)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LR', N'LIBERIA', N'Liberia', N'LBR', 430, 231)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LS', N'LESOTHO', N'Lesotho', N'LSO', 426, 266)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LT', N'LITHUANIA', N'Lithuania', N'LTU', 440, 370)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LU', N'LUXEMBOURG', N'Luxembourg', N'LUX', 442, 352)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LV', N'LATVIA', N'Latvia', N'LVA', 428, 371)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'LY', N'LIBYAN ARAB JAMAHIRIYA', N'Libyan Arab Jamahiriya', N'LBY', 434, 218)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MA', N'MOROCCO', N'Morocco', N'MAR', 504, 212)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MC', N'MONACO', N'Monaco', N'MCO', 492, 377)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MD', N'MOLDOVA, REPUBLIC OF', N'Moldova, Republic of', N'MDA', 498, 373)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ME', N'MONTENEGRO', N'Montenegro', N'MNE', 499, 382)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MF', N'SAINT MARTIN', N'Saint Martin', N'MAF', 663, 590)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MG', N'MADAGASCAR', N'Madagascar', N'MDG', 450, 261)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MH', N'MARSHALL ISLANDS', N'Marshall Islands', N'MHL', 584, 692)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MK', N'MACEDONIA, THE FORMER YUGOSLAV REPUBLIC OF', N'Macedonia, the Former Yugoslav Republic of', N'MKD', 807, 389)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ML', N'MALI', N'Mali', N'MLI', 466, 223)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MM', N'MYANMAR', N'Myanmar', N'MMR', 104, 95)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MN', N'MONGOLIA', N'Mongolia', N'MNG', 496, 976)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MO', N'MACAO', N'Macao', N'MAC', 446, 853)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MP', N'NORTHERN MARIANA ISLANDS', N'Northern Mariana Islands', N'MNP', 580, 1670)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MQ', N'MARTINIQUE', N'Martinique', N'MTQ', 474, 596)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MR', N'MAURITANIA', N'Mauritania', N'MRT', 478, 222)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MS', N'MONTSERRAT', N'Montserrat', N'MSR', 500, 1664)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MT', N'MALTA', N'Malta', N'MLT', 470, 356)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MU', N'MAURITIUS', N'Mauritius', N'MUS', 480, 230)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MV', N'MALDIVES', N'Maldives', N'MDV', 462, 960)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MW', N'MALAWI', N'Malawi', N'MWI', 454, 265)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MX', N'MEXICO', N'Mexico', N'MEX', 484, 52)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MY', N'MALAYSIA', N'Malaysia', N'MYS', 458, 60)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'MZ', N'MOZAMBIQUE', N'Mozambique', N'MOZ', 508, 258)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NA', N'NAMIBIA', N'Namibia', N'NAM', 516, 264)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NC', N'NEW CALEDONIA', N'New Caledonia', N'NCL', 540, 687)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NE', N'NIGER', N'Niger', N'NER', 562, 227)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NF', N'NORFOLK ISLAND', N'Norfolk Island', N'NFK', 574, 672)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NG', N'NIGERIA', N'Nigeria', N'NGA', 566, 234)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NI', N'NICARAGUA', N'Nicaragua', N'NIC', 558, 505)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NL', N'NETHERLANDS', N'Netherlands', N'NLD', 528, 31)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NO', N'NORWAY', N'Norway', N'NOR', 578, 47)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NP', N'NEPAL', N'Nepal', N'NPL', 524, 977)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NR', N'NAURU', N'Nauru', N'NRU', 520, 674)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NU', N'NIUE', N'Niue', N'NIU', 570, 683)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'NZ', N'NEW ZEALAND', N'New Zealand', N'NZL', 554, 64)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'OM', N'OMAN', N'Oman', N'OMN', 512, 968)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PA', N'PANAMA', N'Panama', N'PAN', 591, 507)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PE', N'PERU', N'Peru', N'PER', 604, 51)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PF', N'FRENCH POLYNESIA', N'French Polynesia', N'PYF', 258, 689)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PG', N'PAPUA NEW GUINEA', N'Papua New Guinea', N'PNG', 598, 675)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PH', N'PHILIPPINES', N'Philippines', N'PHL', 608, 63)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PK', N'PAKISTAN', N'Pakistan', N'PAK', 586, 92)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PL', N'POLAND', N'Poland', N'POL', 616, 48)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PM', N'SAINT PIERRE AND MIQUELON', N'Saint Pierre and Miquelon', N'SPM', 666, 508)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PN', N'PITCAIRN', N'Pitcairn', N'PCN', 612, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PR', N'PUERTO RICO', N'Puerto Rico', N'PRI', 630, 1787)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PS', N'PALESTINIAN TERRITORY, OCCUPIED', N'Palestinian Territory, Occupied', NULL, NULL, 970)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PT', N'PORTUGAL', N'Portugal', N'PRT', 620, 351)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PW', N'PALAU', N'Palau', N'PLW', 585, 680)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'PY', N'PARAGUAY', N'Paraguay', N'PRY', 600, 595)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'QA', N'QATAR', N'Qatar', N'QAT', 634, 974)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'RE', N'REUNION', N'Reunion', N'REU', 638, 262)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'RO', N'ROMANIA', N'Romania', N'ROM', 642, 40)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'RS', N'SERBIA', N'Serbia', N'SRB', 688, 381)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'RU', N'RUSSIAN FEDERATION', N'Russian Federation', N'RUS', 643, 70)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'RW', N'RWANDA', N'Rwanda', N'RWA', 646, 250)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SA', N'SAUDI ARABIA', N'Saudi Arabia', N'SAU', 682, 966)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SB', N'SOLOMON ISLANDS', N'Solomon Islands', N'SLB', 90, 677)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SC', N'SEYCHELLES', N'Seychelles', N'SYC', 690, 248)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SD', N'SUDAN', N'Sudan', N'SDN', 736, 249)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SE', N'SWEDEN', N'Sweden', N'SWE', 752, 46)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SG', N'SINGAPORE', N'Singapore', N'SGP', 702, 65)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SH', N'SAINT HELENA', N'Saint Helena', N'SHN', 654, 290)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SI', N'SLOVENIA', N'Slovenia', N'SVN', 705, 386)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SJ', N'SVALBARD AND JAN MAYEN', N'Svalbard and Jan Mayen', N'SJM', 744, 47)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SK', N'SLOVAKIA', N'Slovakia', N'SVK', 703, 421)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SL', N'SIERRA LEONE', N'Sierra Leone', N'SLE', 694, 232)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SM', N'SAN MARINO', N'San Marino', N'SMR', 674, 378)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SN', N'SENEGAL', N'Senegal', N'SEN', 686, 221)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SO', N'SOMALIA', N'Somalia', N'SOM', 706, 252)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SR', N'SURINAME', N'Suriname', N'SUR', 740, 597)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SS', N'SOUTH SUDAN', N'South Sudan', N'SSD', 728, 211)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ST', N'SAO TOME AND PRINCIPE', N'Sao Tome and Principe', N'STP', 678, 239)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SV', N'EL SALVADOR', N'El Salvador', N'SLV', 222, 503)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SX', N'SINT MAARTEN', N'Sint Maarten', N'SXM', 534, 1)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SY', N'SYRIAN ARAB REPUBLIC', N'Syrian Arab Republic', N'SYR', 760, 963)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'SZ', N'SWAZILAND', N'Swaziland', N'SWZ', 748, 268)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TC', N'TURKS AND CAICOS ISLANDS', N'Turks and Caicos Islands', N'TCA', 796, 1649)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TD', N'CHAD', N'Chad', N'TCD', 148, 235)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TF', N'FRENCH SOUTHERN TERRITORIES', N'French Southern Territories', NULL, NULL, 0)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TG', N'TOGO', N'Togo', N'TGO', 768, 228)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TH', N'THAILAND', N'Thailand', N'THA', 764, 66)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TJ', N'TAJIKISTAN', N'Tajikistan', N'TJK', 762, 992)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TK', N'TOKELAU', N'Tokelau', N'TKL', 772, 690)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TL', N'TIMOR-LESTE', N'Timor-Leste', NULL, NULL, 670)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TM', N'TURKMENISTAN', N'Turkmenistan', N'TKM', 795, 7370)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TN', N'TUNISIA', N'Tunisia', N'TUN', 788, 216)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TO', N'TONGA', N'Tonga', N'TON', 776, 676)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TR', N'TURKEY', N'Turkey', N'TUR', 792, 90)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TT', N'TRINIDAD AND TOBAGO', N'Trinidad and Tobago', N'TTO', 780, 1868)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TV', N'TUVALU', N'Tuvalu', N'TUV', 798, 688)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TW', N'TAIWAN, PROVINCE OF CHINA', N'Taiwan, Province of China', N'TWN', 158, 886)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'TZ', N'TANZANIA, UNITED REPUBLIC OF', N'Tanzania, United Republic of', N'TZA', 834, 255)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'UA', N'UKRAINE', N'Ukraine', N'UKR', 804, 380)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'UG', N'UGANDA', N'Uganda', N'UGA', 800, 256)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'UM', N'UNITED STATES MINOR OUTLYING ISLANDS', N'United States Minor Outlying Islands', NULL, NULL, 1)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'US', N'UNITED STATES', N'United States', N'USA', 840, 1)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'UY', N'URUGUAY', N'Uruguay', N'URY', 858, 598)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'UZ', N'UZBEKISTAN', N'Uzbekistan', N'UZB', 860, 998)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VA', N'HOLY SEE (VATICAN CITY STATE)', N'Holy See (Vatican City State)', N'VAT', 336, 39)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VC', N'SAINT VINCENT AND THE GRENADINES', N'Saint Vincent and the Grenadines', N'VCT', 670, 1784)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VE', N'VENEZUELA', N'Venezuela', N'VEN', 862, 58)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VG', N'VIRGIN ISLANDS, BRITISH', N'Virgin Islands, British', N'VGB', 92, 1284)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VI', N'VIRGIN ISLANDS, U.S.', N'Virgin Islands, U.s.', N'VIR', 850, 1340)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VN', N'VIET NAM', N'Viet Nam', N'VNM', 704, 84)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'VU', N'VANUATU', N'Vanuatu', N'VUT', 548, 678)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'WF', N'WALLIS AND FUTUNA', N'Wallis and Futuna', N'WLF', 876, 681)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'WS', N'SAMOA', N'Samoa', N'WSM', 882, 684)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'XK', N'KOSOVO', N'Kosovo', N'---', 0, 381)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'YE', N'YEMEN', N'Yemen', N'YEM', 887, 967)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'YT', N'MAYOTTE', N'Mayotte', NULL, NULL, 269)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ZA', N'SOUTH AFRICA', N'South Africa', N'ZAF', 710, 27)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ZM', N'ZAMBIA', N'Zambia', N'ZMB', 894, 260)
GO
INSERT [dbo].[Country] ([ISO], [Name], [NiceName], [ISO3], [NumCode], [PhoneCode]) VALUES (N'ZW', N'ZIMBABWE', N'Zimbabwe', N'ZWE', 716, 263)
GO
SET IDENTITY_INSERT [dbo].[Participant] ON 
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (1, N'Mr.', N'Sebastian', N'Vettel', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (2, N'Mr.', N'Lewis', N'Hamilton', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (3, N'Mr.', N'Stoffel', N'Vandoorne', N'BE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (4, N'Mr.', N'Denny', N'Hamlin', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (5, N'Mr.', N'Ricky', N'Stenhouse Jr.', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (6, N'Mr.', N'Valtteri', N'Bottas', N'FI')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (7, N'Mr.', N'Daniel', N'Ricciardo', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (8, N'Mr.', N'Kasey', N'Kahne', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (9, N'Mr.', N'Martin', N'Truex Jr.', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (10, N'Mr.', N'Joey', N'Logano', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (11, N'Mr.', N'Chase', N'Elliott', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (12, N'Mr.', N'Kurt', N'Busch', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (13, N'Mr.', N'Brad', N'Keselowski', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (14, N'Mr.', N'Ryan', N'Newman', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (15, N'Mr.', N'Kyle', N'Larson', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (16, N'Mr.', N'Jimmie', N'Johnson', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (17, N'Mr.', N'Kyle', N'Busch', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (18, N'Mr.', N'Austin', N'Dillon', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (19, N'Mr.', N'Ryan', N'Blaney', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (20, N'Mr.', N'Kevin', N'Harvick', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (21, N'Mr.', N'Carl', N'Edwards', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (22, N'Mr.', N'Sébastien', N'Bourdais', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (23, N'Mr.', N'James', N'Hinchcliffe', N'CA')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (24, N'Mr.', N'Josef', N'Newgarden', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (25, N'Mr.', N'Simon', N'Pagenaud', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (26, N'Mr.', N'Will', N'Power', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (27, N'Mr.', N'Takuma', N'Sato', N'JP')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (28, N'Mr.', N'Graham', N'Rahal', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (29, N'Mr.', N'Scott', N'Dixon', N'NZ')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (30, N'Mr.', N'Helio', N'Castroneves', N'BR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (31, N'Mr.', N'Tony', N'Kanaan', N'BR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (32, N'Ms.', N'Danica', N'Patrick', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (33, N'Mr.', N'Maverick', N'Viñales', N'ES')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (34, N'Mr.', N'Marc', N'Marquez', N'ES')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (35, N'Mr.', N'Dani', N'Pedrosa', N'ES')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (36, N'Mr.', N'Andrea', N'Dovizioso', N'IT')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (37, N'Mr.', N'Valentino', N'Rossi', N'IT')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (38, N'Mr.', N'Jorge', N'Lorenzo', N'ES')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (39, N'Mr.', N'Jack', N'Miller', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (40, N'Mr.', N'Max', N'Verstappen', N'NL')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (41, N'Mr.', N'Sébastien', N'Buemi', N'CH')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (42, N'Mr.', N'Lucas', N'Di Grassi', N'BR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (43, N'Mr', N'Felix', N'Rosenqvist', N'SE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (44, N'Mr.', N'Sam', N'Bird', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (45, N'Mr.', N'Jean-Éric', N'Vergne', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (46, N'Mr.', N'Anthony', N'Davidson', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (47, N'Mr.', N'Kazuki', N'Nakajima', N'JP')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (48, N'Mr.', N'Earl', N'Bamber', N'NZ')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (49, N'Mr.', N'Timo', N'Bernhard', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (50, N'Mr.', N'Brendon', N'Hartley', N'NZ')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (51, N'Mr.', N'Daniel', N'Suarez', N'MX')
GO
SET IDENTITY_INSERT [dbo].[Participant] OFF
GO
SET IDENTITY_INSERT [dbo].[Round] ON 
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (1, CAST(N'2017-03-26' AS Date), 1, N'Australian Grand Prix', 1, N'Albert Park, Melbourne', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (2, CAST(N'2017-04-09' AS Date), 2, N'Chinese Grand Prix', 1, N'Shanghai International Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (3, CAST(N'2017-07-02' AS Date), 17, N'Coke 400', 3, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (6, CAST(N'2018-03-25' AS Date), 1, N'Australian Grand Prix', 6, N'Albert Park, Melbourne', N'Scheduled', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (7, CAST(N'2018-04-08' AS Date), 2, N'Bahrain Grand Prix', 6, N'Bahrain International Circuit, Sakhir', N'Scheduled', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (8, CAST(N'2017-07-16' AS Date), 19, N'', 3, N'New Hampshire Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (9, CAST(N'2017-04-16' AS Date), 3, N'Bahrain Grand Prix', 1, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (10, CAST(N'2017-04-30' AS Date), 4, N'Russian Grand Prix', 1, N'Sochi Autodrom', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (11, CAST(N'2017-05-14' AS Date), 5, N'Spanish Grand Prix', 1, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (12, CAST(N'2017-05-28' AS Date), 6, N'Monaco Grand Prix', 1, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (13, CAST(N'2017-06-11' AS Date), 7, N'Canadian Grand Prix', 1, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (14, CAST(N'2017-06-25' AS Date), 8, N'European Grand Prix', 1, N'Baku City Circuit', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (15, CAST(N'2017-08-06' AS Date), 22, N'', 3, N'Watkins Glen International', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (16, CAST(N'2017-07-30' AS Date), 21, N'', 3, N'Pocono Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (17, CAST(N'2017-02-26' AS Date), 1, N'Daytona 500', 3, N'Daytona International Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (18, CAST(N'2017-03-05' AS Date), 2, N'', 3, N'Atlanta Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (19, CAST(N'2017-03-12' AS Date), 3, N'', 3, N'Las Vegas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (20, CAST(N'2017-03-19' AS Date), 4, N'', 3, N'ISM Raceway, Phoenix', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (21, CAST(N'2017-03-26' AS Date), 5, N'', 3, N'Auto Club Speedway, Fontana', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (22, CAST(N'2017-04-02' AS Date), 6, N'', 3, N'Martinsville Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (23, CAST(N'2017-04-09' AS Date), 7, N'', 3, N'Texas Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (24, CAST(N'2017-04-23' AS Date), 8, N'', 3, N'Bristol Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (25, CAST(N'2017-04-30' AS Date), 9, NULL, 3, N'Richmond Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, N'Win does not count for play-off berth, because Logano''s car did not pass post-race inspection.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (26, CAST(N'2017-05-07' AS Date), 10, N'', 3, N'Talladega Superspeedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (27, CAST(N'2017-05-13' AS Date), 11, N'', 3, N'Kansas Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (28, CAST(N'2017-05-28' AS Date), 12, N'', 3, N'Charlotte Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (29, CAST(N'2017-06-04' AS Date), 13, N'', 3, N'Dover International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (30, CAST(N'2017-06-11' AS Date), 14, N'', 3, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 13, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (31, CAST(N'2017-06-18' AS Date), 15, N'', 3, N'Michigan International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (32, CAST(N'2017-06-25' AS Date), 16, N'', 3, N'Sonoma Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (33, CAST(N'2017-07-08' AS Date), 18, N'', 3, N'Kentucky Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (34, CAST(N'2017-07-23' AS Date), 20, N'', 3, N'Indianapolis Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (35, CAST(N'2017-08-13' AS Date), 23, NULL, 3, N'Michigan International Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (36, CAST(N'2017-08-19' AS Date), 24, NULL, 3, N'Bristol Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (37, CAST(N'2017-09-03' AS Date), 25, NULL, 3, N'Darlington Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (38, CAST(N'2017-09-09' AS Date), 26, NULL, 3, N'Richmond Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (39, CAST(N'2017-09-17' AS Date), 27, NULL, 3, N'Chicagoland Speedway, Chicago', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (40, CAST(N'2017-09-24' AS Date), 28, NULL, 3, N'New Hampshire Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (41, CAST(N'2017-10-01' AS Date), 29, NULL, 3, N'Dover International Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (42, CAST(N'2017-10-07' AS Date), 30, NULL, 3, N'Charlotte Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (43, CAST(N'2017-10-15' AS Date), 31, NULL, 3, N'Talladega Superspeedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (44, CAST(N'2017-10-21' AS Date), 32, NULL, 3, N'Kansas Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (45, CAST(N'2017-10-29' AS Date), 33, NULL, 3, N'Martinsville Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (46, CAST(N'2017-11-05' AS Date), 34, NULL, 3, N'Texas Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (47, CAST(N'2017-11-12' AS Date), 35, NULL, 3, N'ISM Raceway, Phoenix', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (48, CAST(N'2017-11-19' AS Date), 36, NULL, 3, N'Homestead-Miami Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (49, CAST(N'2017-03-12' AS Date), 1, N'', 7, N'Streets of St. Petersburg', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 15, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (50, CAST(N'2017-04-09' AS Date), 2, N'', 7, N'Streets of Long Beach', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (51, CAST(N'2017-04-23' AS Date), 3, N'', 7, N'Barber Motorsports Park, Alabama', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (52, CAST(N'2017-04-29' AS Date), 4, N'', 7, N'ISM Raceway, Phoenix', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (53, CAST(N'2017-05-13' AS Date), 5, N'Grand Prix of Indianapolis', 7, N'Indianapolis Motor Speedway, Grand Prix track', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (54, CAST(N'2017-05-28' AS Date), 6, N'Indianapolis 500', 7, N'Indianapolis Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (55, CAST(N'2017-06-03' AS Date), 7, N'', 7, N'Belle Isle, Detroit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 19, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (56, CAST(N'2017-06-04' AS Date), 8, N'', 7, N'Belle Isle, Detroit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 19, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (57, CAST(N'2017-06-10' AS Date), 9, N'', 7, N'Texas Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (58, CAST(N'2017-06-25' AS Date), 10, N'', 7, N'Road America, Elkhart Lake', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (59, CAST(N'2017-07-09' AS Date), 11, N'', 7, N'Iowa Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (60, CAST(N'2017-07-16' AS Date), 12, N'', 7, N'Streets of Toronto', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (61, CAST(N'2017-07-30' AS Date), 13, N'', 7, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (62, CAST(N'2017-08-20' AS Date), 14, NULL, 7, N'Pocono Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (63, CAST(N'2017-08-26' AS Date), 15, NULL, 7, N'Gateway Motorsports Park', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (64, CAST(N'2017-09-03' AS Date), 16, NULL, 7, N'Watkins Glen International', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (65, CAST(N'2017-09-17' AS Date), 17, NULL, 7, N'Sonoma Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (66, CAST(N'2017-03-26' AS Date), 1, N'', 8, N'Losail Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (67, CAST(N'2017-04-09' AS Date), 2, N'', 8, N'Termas de Rio Hondo', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (68, CAST(N'2017-04-23' AS Date), 3, N'', 8, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (69, CAST(N'2017-05-07' AS Date), 4, N'', 8, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (70, CAST(N'2017-05-21' AS Date), 5, N'', 8, N'Circuit Bugatti, Le Mans', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (71, CAST(N'2017-06-04' AS Date), 6, N'', 8, N'Mugello Circuit, Scarperia', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (72, CAST(N'2017-06-11' AS Date), 7, N'', 8, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (73, CAST(N'2017-06-25' AS Date), 8, N'', 8, N'TT Circuit Assen', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (74, CAST(N'2017-07-02' AS Date), 9, N'', 8, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (75, CAST(N'2017-08-06' AS Date), 10, N'', 8, N'Masaryk Circuit, Brno', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (76, CAST(N'2017-08-13' AS Date), 11, N'', 8, N'Red Bull Ring, Spielberg', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (77, CAST(N'2017-08-27' AS Date), 12, N'', 8, N'Silverstone Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (78, CAST(N'2017-09-10' AS Date), 13, N'', 8, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (79, CAST(N'2017-09-24' AS Date), 14, N'', 8, N'Ciudad del Motor de Aragón', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (80, CAST(N'2017-10-15' AS Date), 15, NULL, 8, N'Twin Ring Motegi', N'Finished', CAST(10.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (81, CAST(N'2017-10-22' AS Date), 16, N'', 8, N'Phillip Island Circuit', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (82, CAST(N'2017-10-22' AS Date), 17, N'', 8, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (83, CAST(N'2017-11-12' AS Date), 18, N'', 8, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (84, CAST(N'2017-07-09' AS Date), 9, N'', 1, N'Red Bull Ring, Spielberg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (85, CAST(N'2017-07-16' AS Date), 10, N'', 1, N'Silverstone Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (86, CAST(N'2017-07-30' AS Date), 11, N'', 1, N'Hungaroring, Budapest', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (87, CAST(N'2017-08-27' AS Date), 12, N'', 1, N'Spa-Francorchamps', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (88, CAST(N'2017-09-03' AS Date), 13, N'', 1, N'Autodromo Nazionale Monza', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (89, CAST(N'2017-09-17' AS Date), 14, N'', 1, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (90, CAST(N'2017-10-01' AS Date), 15, N'', 1, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (91, CAST(N'2017-10-08' AS Date), 16, N'', 1, N'Suzuka Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (92, CAST(N'2017-10-22' AS Date), 17, N'', 1, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (93, CAST(N'2017-10-29' AS Date), 18, N'', 1, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (94, CAST(N'2017-11-12' AS Date), 19, N'', 1, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (95, CAST(N'2017-11-26' AS Date), 20, N'', 1, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (96, CAST(N'2016-10-09' AS Date), 1, N'', 9, N'Hong Kong Central Harbourfront Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (97, CAST(N'2016-11-12' AS Date), 2, N'', 9, N'Circuit International Automobile Moulay El Hassan', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (98, CAST(N'2017-02-18' AS Date), 3, N'', 9, N'Puerto Madero Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (99, CAST(N'2017-04-01' AS Date), 4, N'', 9, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (100, CAST(N'2017-05-13' AS Date), 5, N'', 9, N'Circuit de Monaco, Pool lay-out', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (101, CAST(N'2017-05-20' AS Date), 6, N'', 9, N'Paris Street Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (102, CAST(N'2017-06-10' AS Date), 7, N'', 9, N'Tempelhof Airport Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 32, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (103, CAST(N'2017-06-11' AS Date), 8, N'', 9, N'Tempelhof Airport Street Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (104, CAST(N'2017-07-15' AS Date), 9, N'', 9, N'Brooklyn Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (105, CAST(N'2017-07-16' AS Date), 10, N'', 9, N'Brooklyn Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (106, CAST(N'2017-07-29' AS Date), 11, N'', 9, N'Montreal Street Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (107, CAST(N'2017-07-30' AS Date), 12, N'', 9, N'Montreal Street Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 34, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (108, CAST(N'2017-04-16' AS Date), 1, N'6 Hours of Silverstone', 10, N'Silverstone Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (109, CAST(N'2017-05-06' AS Date), 2, N'6 Hours of Spa-Francorchamps', 10, N'Spa-Francorchamps', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (110, CAST(N'2017-06-17' AS Date), 3, N'24 Heures du Mans', 10, N'Circuit de la Sarthe, Le Mans', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (111, CAST(N'2017-07-16' AS Date), 4, N'6 Hours of Nürburgring', 10, N'Nürburgring', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (112, CAST(N'2017-09-03' AS Date), 5, N'6 Hours of Mexico City', 10, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (113, CAST(N'2017-09-16' AS Date), 6, N'6 Hours of Circuit of the Americas', 10, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (114, CAST(N'2017-10-15' AS Date), 7, N'6 Hours of Fuji', 10, N'Fuji Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(6 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (115, CAST(N'2017-11-05' AS Date), 8, N'6 Hours of Shanghai', 10, N'Shanghai International Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (116, CAST(N'2017-11-18' AS Date), 9, N'6 Hours of Bahrain', 10, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (117, CAST(N'2017-02-18' AS Date), 0, N'The Clash', 3, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (118, CAST(N'2017-02-23' AS Date), 0, N'Can-Am Duel 1', 3, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (119, CAST(N'2017-02-23' AS Date), 0, N'Can-Am Duel 2', 3, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (120, CAST(N'2017-05-19' AS Date), 0, N'Sprint Showdown', 3, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (121, CAST(N'2017-05-20' AS Date), 0, N'All-Star race', 3, N'Charlotte Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
SET IDENTITY_INSERT [dbo].[Round] OFF
GO
SET IDENTITY_INSERT [dbo].[RoundWinner] ON 
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (1, 1, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (19, 2, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (21, 3, 5)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (22, 9, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (23, 10, 6)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (24, 11, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (25, 12, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (26, 13, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (28, 14, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (30, 8, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (31, 16, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (32, 15, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (33, 27, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (34, 18, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (35, 17, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (36, 19, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (37, 20, 14)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (38, 21, 15)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (39, 22, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (40, 23, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (41, 24, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (43, 26, 5)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (44, 28, 18)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (45, 29, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (46, 30, 19)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (47, 31, 15)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (48, 32, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (49, 33, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (50, 34, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (51, 49, 22)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (52, 50, 23)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (53, 51, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (54, 52, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (55, 53, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (56, 54, 27)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (57, 55, 28)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (58, 56, 28)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (59, 57, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (60, 58, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (61, 59, 30)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (62, 60, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (63, 61, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (64, 69, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (65, 66, 33)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (66, 67, 33)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (67, 68, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (68, 70, 33)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (69, 71, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (70, 72, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (71, 73, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (72, 74, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (73, 75, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (74, 76, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (75, 77, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (76, 78, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (77, 79, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (79, 81, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (80, 82, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (81, 83, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (82, 84, 6)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (83, 85, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (84, 86, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (85, 87, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (86, 88, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (87, 89, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (88, 90, 40)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (89, 91, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (90, 92, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (91, 93, 40)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (92, 94, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (93, 95, 6)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (94, 96, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (95, 97, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (96, 98, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (97, 99, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (98, 100, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (99, 101, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (100, 102, 43)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (101, 103, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (102, 104, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (103, 105, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (104, 106, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (105, 107, 45)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (106, 116, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (107, 116, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (108, 116, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (109, 108, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (110, 108, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (111, 108, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (112, 109, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (113, 109, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (114, 109, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (115, 110, 48)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (116, 110, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (117, 110, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (118, 111, 48)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (119, 111, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (120, 111, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (121, 112, 48)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (122, 112, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (123, 112, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (124, 113, 48)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (125, 113, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (126, 113, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (127, 114, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (128, 114, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (129, 114, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (130, 115, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (131, 115, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (132, 115, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (133, 80, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (134, 25, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (135, 117, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (136, 118, 11)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (137, 119, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (138, 120, 51)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (139, 121, 17)
GO
SET IDENTITY_INSERT [dbo].[RoundWinner] OFF
GO
SET IDENTITY_INSERT [dbo].[Season] ON 
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (1, N'F1', N'', 2)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (3, N'NASCAR', N'Monster Energy Cup 2017', NULL)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (6, N'F1', NULL, NULL)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (7, N'Indycar', N'', NULL)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (8, N'MotoGP', N'', 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (9, N'FE', N'', 30)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (10, N'WEC', N'', 36)
GO
SET IDENTITY_INSERT [dbo].[Season] OFF
GO
SET IDENTITY_INSERT [dbo].[SeasonWinner] ON 
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (8, 1, 2)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (20, 8, 34)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (21, 9, 42)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (22, 10, 48)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (23, 10, 49)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (24, 10, 50)
GO
SET IDENTITY_INSERT [dbo].[SeasonWinner] OFF
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'DTM', N'Deutsche Tourenwagen Masters')
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'F1', N'Formula 1')
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'FE', N'Formula E')
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'Indycar', N'Indycar')
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'MotoGP', N'MotoGP')
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'NASCAR', N'NASCAR')
GO
INSERT [dbo].[Sport] ([Name], [FullName]) VALUES (N'WEC', N'World Endurance Championship')
GO
INSERT [dbo].[Status] ([Name], [Step]) VALUES (N'Cancelled', 3)
GO
INSERT [dbo].[Status] ([Name], [Step]) VALUES (N'Finished', 3)
GO
INSERT [dbo].[Status] ([Name], [Step]) VALUES (N'Postponed', 2)
GO
INSERT [dbo].[Status] ([Name], [Step]) VALUES (N'ReadyToWatch', 1)
GO
INSERT [dbo].[Status] ([Name], [Step]) VALUES (N'Scheduled', 0)
GO
INSERT [dbo].[Status] ([Name], [Step]) VALUES (N'Stopped', 3)
GO
SET IDENTITY_INSERT [dbo].[Team] ON 
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (1, N'Scuderia Ferrari', N'F1', N'IT')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (2, N'Mercedes AMG Petronas Motorsport', N'F1', N'DE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (3, N'Williams', N'F1', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (4, N'Hendrick Motorsports', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (5, N'Joe Gibbs Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (6, N'Roush Fenway Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (7, N'Red Bull Racing', N'F1', N'AT')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (8, N'Furniture Row Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (9, N'Stewart-Haas Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (10, N'Team Penske', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (11, N'Chip Gannassi Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (12, N'Richard Childress Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (13, N'Wood Brothers Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (14, N'Team Penske', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (15, N'Dale Coyne Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (16, N'Schmidt Peterson Motorsports', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (17, N'Andretti Autosport', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (18, N'Chip Gannassi Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (19, N'Rahal Letterman Lanigan Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (20, N'Movistar Yamaha MotoGP', N'MotoGP', N'JP')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (21, N'Ducati Team', N'MotoGP', N'IT')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (22, N'Marc VDS Racing', N'MotoGP', N'BE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (23, N'Monster Yamaha Tech 3', N'MotoGP', N'FR')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (24, N'Repsol Honda Team', N'MotoGP', N'JP')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (25, N'LCR Honda', N'MotoGP', N'MC')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (26, N'DS Virgin Racing', N'FE', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (27, N'NextEV NIO', N'FE', N'CN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (28, N'Venturi Formula E', N'FE', N'MC')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (29, N'Faraday Future Dragon Racing', N'FE', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (30, N'Renault e.Dams', N'FE', N'FR')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (31, N'ABT Schaeffler Audi Sport', N'FE', N'DE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (32, N'Mahindra Racing', N'FE', N'IN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (33, N'Panasonic Jaguar Racing', N'FE', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (34, N'Techeetah', N'FE', N'CN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (35, N'MS Amlin Andretti', N'FE', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (36, N'Porsche LMP Team', N'WEC', N'DE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (37, N'Toyota Gazoo Racing', N'WEC', N'JP')
GO
SET IDENTITY_INSERT [dbo].[Team] OFF
GO
INSERT [dbo].[User] ([Id], [Username], [PasswordHash], [Salt], [Iterations], [Prf], [ForceChangePassword], [Title], [GivenName], [FamilyName], [EmailAddress], [IsDeleted]) VALUES (N'8500d15b-7ab3-45a0-9547-00e0f6b4a984', N'admin', 0x45D367F14F8C118D53C3B1227714EB66DD4610D558DA43C890B93592D330155A, 0x06B218CD4BB89E89839CB28E1B9F42EB, 10000, N'HMACSHA512', 0, N'Mr', NULL, N'Admin', NULL, 0)
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Albert Park, Melbourne', N'AU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Atlanta Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Auto Club Speedway, Fontana', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autódromo Hermanos Rodríguez, Mexico City', N'MX')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autódromo José Carlos Pace, Interlagos', N'BR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autodromo Nazionale Monza', N'IT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Bahrain International Circuit, Sakhir', N'BH')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Baku City Circuit', N'AZ')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Barber Motorsports Park, Alabama', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Belle Isle, Detroit', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Bristol Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Brooklyn Street Circuit', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Charlotte Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Chicagoland Speedway, Chicago', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit Bugatti, Le Mans', N'FR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit de Barcelona-Catalunya', N'ES')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit de la Sarthe, Le Mans', N'FR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit de Monaco, Monte Carlo', N'MC')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit de Monaco, Pool lay-out', N'MC')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit Gilles Villeneuve, Montréal', N'CA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit International Automobile Moulay El Hassan', N'MA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit of the Americas, Austin, Texas', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit Ricardo Tormo, Valencia', N'ES')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuito Permanente de Jerez, Jerez de la Frontera', N'ES')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Ciudad del Motor de Aragón', N'ES')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Darlington Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Daytona International Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Dover International Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Fuji Speedway', N'JP')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Gateway Motorsports Park', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Homestead-Miami Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Hong Kong Central Harbourfront Circuit', N'HK')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Hungaroring, Budapest', N'HU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Indianapolis Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Indianapolis Motor Speedway, Grand Prix track', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Iowa Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'ISM Raceway, Phoenix', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Kansas Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Kentucky Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Las Vegas Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Losail Circuit', N'QA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Marina Bay Street Circuit, Singapore', N'SG')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Martinsville Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Masaryk Circuit, Brno', N'CZ')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Michigan International Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Mid-Ohio Sports Car Course, Lexington', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Misano World Circuit Marco Simoncelli', N'SM')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Montreal Street Circuit', N'CA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Mugello Circuit, Scarperia', N'IT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'New Hampshire Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Nürburgring', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Paris Street Circuit', N'FR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Phillip Island Circuit', N'AU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Pocono Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Puerto Madero Street Circuit', N'AR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Red Bull Ring, Spielberg', N'AT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Richmond Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Road America, Elkhart Lake', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Sachsenring, Hohenstein-Ernstthal', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Sepang International Circuit, Kuala Lumpur', N'MY')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Shanghai International Circuit', N'CN')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Silverstone Circuit', N'GB')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Sochi Autodrom', N'RU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Sonoma Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Spa-Francorchamps', N'BE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Streets of Long Beach', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Streets of St. Petersburg', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Streets of Toronto', N'CA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Suzuka Circuit', N'JP')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Talladega Superspeedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Tempelhof Airport Street Circuit', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Termas de Rio Hondo', N'AR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Texas Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'TT Circuit Assen', N'NL')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Twin Ring Motegi', N'JP')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Watkins Glen International', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Yas Marina Circuit, Abu Dhabi', N'AE')
GO
ALTER TABLE [dbo].[Round] ADD  CONSTRAINT [DF_Round_Status]  DEFAULT (N'Scheduled') FOR [Status]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_ForceChangePassword]  DEFAULT ((0)) FOR [ForceChangePassword]
GO
ALTER TABLE [dbo].[User] ADD  CONSTRAINT [DF_User_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
GO
ALTER TABLE [dbo].[Participant]  WITH CHECK ADD  CONSTRAINT [FK_Country_Participant] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([ISO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Participant] CHECK CONSTRAINT [FK_Country_Participant]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [FK_Season_Round] FOREIGN KEY([Season])
REFERENCES [dbo].[Season] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [FK_Season_Round]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [FK_Status_Round] FOREIGN KEY([Status])
REFERENCES [dbo].[Status] ([Name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [FK_Status_Round]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [FK_Team_Round] FOREIGN KEY([WinningTeam])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [FK_Team_Round]
GO
ALTER TABLE [dbo].[Round]  WITH CHECK ADD  CONSTRAINT [FK_Venue_Round] FOREIGN KEY([Venue])
REFERENCES [dbo].[Venue] ([Name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Round] CHECK CONSTRAINT [FK_Venue_Round]
GO
ALTER TABLE [dbo].[RoundWinner]  WITH CHECK ADD  CONSTRAINT [FK_Participant_RoundWinner] FOREIGN KEY([Participant])
REFERENCES [dbo].[Participant] ([Id])
GO
ALTER TABLE [dbo].[RoundWinner] CHECK CONSTRAINT [FK_Participant_RoundWinner]
GO
ALTER TABLE [dbo].[RoundWinner]  WITH CHECK ADD  CONSTRAINT [FK_Round_RoundWinner] FOREIGN KEY([Round])
REFERENCES [dbo].[Round] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoundWinner] CHECK CONSTRAINT [FK_Round_RoundWinner]
GO
ALTER TABLE [dbo].[Season]  WITH CHECK ADD  CONSTRAINT [FK_Sport_Season] FOREIGN KEY([Sport])
REFERENCES [dbo].[Sport] ([Name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Season] CHECK CONSTRAINT [FK_Sport_Season]
GO
ALTER TABLE [dbo].[Season]  WITH CHECK ADD  CONSTRAINT [FK_Team_Season] FOREIGN KEY([WinningTeam])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[Season] CHECK CONSTRAINT [FK_Team_Season]
GO
ALTER TABLE [dbo].[SeasonWinner]  WITH CHECK ADD  CONSTRAINT [FK_Participant_SeasonWinner] FOREIGN KEY([Participant])
REFERENCES [dbo].[Participant] ([Id])
GO
ALTER TABLE [dbo].[SeasonWinner] CHECK CONSTRAINT [FK_Participant_SeasonWinner]
GO
ALTER TABLE [dbo].[SeasonWinner]  WITH CHECK ADD  CONSTRAINT [FK_Season_SeasonWinner] FOREIGN KEY([Season])
REFERENCES [dbo].[Season] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeasonWinner] CHECK CONSTRAINT [FK_Season_SeasonWinner]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Country_Team] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([ISO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Country_Team]
GO
ALTER TABLE [dbo].[Team]  WITH CHECK ADD  CONSTRAINT [FK_Sport_Team] FOREIGN KEY([Sport])
REFERENCES [dbo].[Sport] ([Name])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Team] CHECK CONSTRAINT [FK_Sport_Team]
GO
ALTER TABLE [dbo].[Venue]  WITH CHECK ADD  CONSTRAINT [FK_Country_Venue] FOREIGN KEY([Country])
REFERENCES [dbo].[Country] ([ISO])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[Venue] CHECK CONSTRAINT [FK_Country_Venue]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [CK_User_Prf] CHECK  (([Prf]='HMACSHA1' OR [Prf]='HMACSHA256' OR [Prf]='HMACSHA512'))
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [CK_User_Prf]
GO
ALTER DATABASE [Motorsports] SET  READ_WRITE 
GO
