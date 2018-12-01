/****** Object:  Database [Motorsports]    Script Date: 01/12/2018 11:13:52 ******/
CREATE DATABASE [Motorsports]
GO
ALTER DATABASE [Motorsports] SET COMPATIBILITY_LEVEL = 140
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
ALTER DATABASE [Motorsports] SET AUTO_SHRINK OFF 
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
ALTER DATABASE [Motorsports] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Motorsports] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [Motorsports] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Motorsports] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [Motorsports] SET  MULTI_USER 
GO
ALTER DATABASE [Motorsports] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Motorsports] SET ENCRYPTION ON
GO
ALTER DATABASE [Motorsports] SET QUERY_STORE = ON
GO
ALTER DATABASE [Motorsports] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
/****** Object:  User [MotorsportsApp]    Script Date: 01/12/2018 11:13:53 ******/
CREATE USER [MotorsportsApp] FOR LOGIN [MotorsportsApp] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [MotorsportsApp]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [MotorsportsApp]
GO
/****** Object:  Table [dbo].[Country]    Script Date: 01/12/2018 11:13:54 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Participant]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Round]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoundWinner]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Season]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeasonEntry]    Script Date: 01/12/2018 11:14:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SeasonEntry](
	[Season] [int] NOT NULL,
	[Team] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Season] ASC,
	[Team] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SeasonWinner]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sport]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team]    Script Date: 01/12/2018 11:14:00 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 01/12/2018 11:14:01 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venue]    Script Date: 01/12/2018 11:14:01 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
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
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (39, N'Mr.', N'Jack', N'Miller', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (40, N'Mr.', N'Max', N'Verstappen', N'NL')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (41, N'Mr.', N'Sébastien', N'Buemi', N'CH')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (42, N'Mr.', N'Lucas', N'di Grassi', N'BR')
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
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (52, N'Mr.', N'Alexander', N'Rossi', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (53, N'Mr.', N'Matt', N'Kenseth', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (54, N'Mr.', N'Daniel', N'Abt', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (55, N'Mr.', N'Nico', N'Rosberg', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (56, N'Mr.', N'Cal', N'Crutchlow', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (57, N'Mr.', N'Andrea', N'Iannone', N'IT')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (58, N'Mr.', N'Dale', N'Earnhardt Jr.', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (59, N'Mr.', N'Tony', N'Stewart', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (60, N'Mr.', N'Chris', N'Buescher', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (61, N'Mr.', N'Juan Pablo', N'Montoya', N'CO')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (62, N'Mr.', N'Jérôme', N'd''Ambrosio', N'BE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (63, N'Mr.', N'Nicolas', N' Prost', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (64, N'Mr.', N'Romain', N'Dumas', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (65, N'Mr.', N'Neel', N'Jani', N'CH')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (66, N'Mr.', N'Marc', N'Lieb', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (67, N'Mr.', N'Oliver', N'Jarvis', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (68, N'Mr.', N'Loïc', N'Duval', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (69, N'Mr.', N'Stéphane', N'Sarrazin', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (70, N'Mr.', N'Mike', N'Conway', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (71, N'Mr.', N'Kamui', N'Kobayashi', N'JP')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (72, N'Mr.', N'Mark', N'Webber', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (73, N'Mr.', N'António', N'Félix da Costa', N'PT')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (74, N'Mr.', N'Nelson', N'Piquet Jr.', N'BR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (75, N'Mr.', N'Clint', N'Bowyer', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (76, N'Mr.', N'Jeff', N'Gordon', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (77, N'Mr.', N'Carlos', N'Muñoz', N'CO')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (78, N'Mr.', N'Ryan', N'Hunter-Raey', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (79, N'Mr.', N'Marcel', N'Fässler', N'CH')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (80, N'Mr', N'André', N'Lotterer', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (81, N'Mr.', N'Benoît', N'Tréluyer', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (82, N'Mr.', N'Nick', N'Tandy', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (83, N'Mr.', N'Nico', N'Hülkenberg', N'DE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (84, N'Mr.', N'Robert', N'Wickens', N'CA')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (85, N'Mr.', N'Jamie', N'McMurray', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (86, N'Mr.', N'Aric', N'Almirola', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (87, N'Mr.', N'A. J.', N'Allmendinger', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (88, N'Mr.', N'Ed', N'Carpenter', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (89, N'Mr.', N'Carlos', N'Huertas', N'CO')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (90, N'Mr.', N'Nicolas', N'Lapierre', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (91, N'Mr.', N'Alexander', N'Wurz', N'AT')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (92, N'Mr.', N'Fernando', N'Alonso', N'ES')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (93, N'Mr.', N'Kimi', N'Räikkönen', N'FI')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (94, N'Mr.', N'David', N'Ragan', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (95, N'Mr.', N'Greg', N'Biffle', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (96, N'Mr.', N'Brian', N'Vickers', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (97, N'Mr.', N'Charlie', N'Kimball', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (98, N'Mr.', N'Jenson', N'Button', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (99, N'Mr.', N'Pastor', N'Maldonado', N'VE')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (100, N'Mr.', N'Casey', N'Stoner', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (101, N'Mr.', N'Marcos', N'Ambrose', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (102, N'Mr.', N'Dario', N'Franchitti', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (103, N'Mr.', N'Justin', N'Wilson', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (104, N'Mr.', N'Ryan', N'Briscoe', N'AU')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (105, N'Mr.', N'Ben', N'Spies', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (106, N'Mr.', N'Jeff', N'Burton', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (107, N'Mr.', N'Trevor', N'Bayne', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (108, N'Mr.', N'Regan', N'Smith', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (109, N'Mr.', N'Paul', N'Menard', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (110, N'Mr.', N'Dan', N'Wheldon', N'GB')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (111, N'Mr.', N'Marco', N'Andretti', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (112, N'Mr.', N'Thomas', N'Laurent', N'FR')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (113, N'Mr.', N'Mathias', N'Beche', N'CH')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (114, N'Mr.', N'Gustavo', N'Menezes', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (115, N'Mr.', N'Erik', N'Jones', N'US')
GO
INSERT [dbo].[Participant] ([Id], [Title], [FirstName], [LastName], [Country]) VALUES (116, N'Mr.', N'José María', N'López', N'AR')
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
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (6, CAST(N'2018-03-25' AS Date), 1, N'Australian Grand Prix', 6, N'Albert Park, Melbourne', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (7, CAST(N'2018-04-08' AS Date), 2, N'Bahrain Grand Prix', 6, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (8, CAST(N'2017-07-16' AS Date), 19, N'', 3, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
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
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (35, CAST(N'2017-08-13' AS Date), 23, NULL, 3, N'Michigan International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (36, CAST(N'2017-08-19' AS Date), 24, NULL, 3, N'Bristol Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (37, CAST(N'2017-09-03' AS Date), 25, N'Southern 500', 3, N'Darlington Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, N'Encumbered race win due to post-race tech inspection failure.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (38, CAST(N'2017-09-09' AS Date), 26, NULL, 3, N'Richmond Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (39, CAST(N'2017-09-17' AS Date), 27, NULL, 3, N'Chicagoland Speedway, Chicago', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (40, CAST(N'2017-09-24' AS Date), 28, NULL, 3, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (41, CAST(N'2017-10-01' AS Date), 29, NULL, 3, N'Dover International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (42, CAST(N'2017-10-07' AS Date), 30, NULL, 3, N'Charlotte Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (43, CAST(N'2017-10-15' AS Date), 31, NULL, 3, N'Talladega Superspeedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (44, CAST(N'2017-10-21' AS Date), 32, NULL, 3, N'Kansas Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (45, CAST(N'2017-10-29' AS Date), 33, NULL, 3, N'Martinsville Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (46, CAST(N'2017-11-05' AS Date), 34, NULL, 3, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (47, CAST(N'2017-11-12' AS Date), 35, NULL, 3, N'ISM Raceway, Phoenix', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (48, CAST(N'2017-11-19' AS Date), 36, NULL, 3, N'Homestead-Miami Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (49, CAST(N'2017-03-12' AS Date), 1, N'', 7, N'Streets of St. Petersburg', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 15, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (50, CAST(N'2017-04-09' AS Date), 2, N'', 7, N'Streets of Long Beach', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (51, CAST(N'2017-04-23' AS Date), 3, N'', 7, N'Barber Motorsports Park, Alabama', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (52, CAST(N'2017-04-29' AS Date), 4, N'', 7, N'ISM Raceway, Phoenix', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (53, CAST(N'2017-05-13' AS Date), 5, N'Grand Prix of Indianapolis', 7, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
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
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (62, CAST(N'2017-08-20' AS Date), 14, NULL, 7, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (63, CAST(N'2017-08-26' AS Date), 15, NULL, 7, N'Gateway Motorsports Park, St. Louis', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (64, CAST(N'2017-09-03' AS Date), 16, NULL, 7, N'Watkins Glen International', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(1 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (65, CAST(N'2017-09-17' AS Date), 17, NULL, 7, N'Sonoma Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
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
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (104, CAST(N'2017-07-15' AS Date), 9, N'', 9, N'Brooklyn Street Circuit, New York', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (105, CAST(N'2017-07-16' AS Date), 10, N'', 9, N'Brooklyn Street Circuit, New York', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
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
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (122, CAST(N'2018-02-11' AS Date), 0, N'Advance Auto Parts Clash', 11, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (123, CAST(N'2018-02-15' AS Date), 0, N'Can-Am Duel 1', 11, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (124, CAST(N'2018-02-15' AS Date), 0, N'Can-Am Duel 2', 11, N'Daytona International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (125, CAST(N'2018-02-18' AS Date), 1, N'Daytona 500', 11, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (126, CAST(N'2018-02-25' AS Date), 2, NULL, 11, N'Atlanta Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (127, CAST(N'2018-03-04' AS Date), 3, NULL, 11, N'Las Vegas Motor Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, N'Harvick lost play-off points after failing post-race inspection.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (128, CAST(N'2018-03-11' AS Date), 4, NULL, 11, N'ISM Raceway, Phoenix', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (129, CAST(N'2018-03-18' AS Date), 5, NULL, 11, N'Auto Club Speedway, Fontana', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (130, CAST(N'2018-03-25' AS Date), 6, NULL, 11, N'Martinsville Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, N'Delayed due to rain. Race was on Monday.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (131, CAST(N'2018-04-08' AS Date), 7, NULL, 11, N'Texas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (132, CAST(N'2018-04-15' AS Date), 8, NULL, 11, N'Bristol Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (133, CAST(N'2018-04-21' AS Date), 9, NULL, 11, N'Richmond Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (134, CAST(N'2018-04-29' AS Date), 10, NULL, 11, N'Talladega Superspeedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (135, CAST(N'2018-05-06' AS Date), 11, NULL, 11, N'Dover International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (136, CAST(N'2018-05-12' AS Date), 12, NULL, 11, N'Kansas Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (137, CAST(N'2018-05-19' AS Date), 0, N'All-Star Open', 11, N'Charlotte Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 49, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (138, CAST(N'2018-05-19' AS Date), 0, N'All-Star Race', 11, N'Charlotte Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (139, CAST(N'2018-05-27' AS Date), 13, N'Coca-Cola 600', 11, N'Charlotte Motor Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (140, CAST(N'2018-06-03' AS Date), 14, NULL, 11, N'Pocono Raceway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (141, CAST(N'2018-06-10' AS Date), 15, NULL, 11, N'Michigan International Speedway', N'Stopped', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (142, CAST(N'2018-06-24' AS Date), 16, NULL, 11, N'Sonoma Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (143, CAST(N'2018-07-01' AS Date), 17, NULL, 11, N'Chicagoland Speedway, Chicago', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (144, CAST(N'2018-07-07' AS Date), 18, NULL, 11, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (145, CAST(N'2018-07-14' AS Date), 19, NULL, 11, N'Kentucky Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (146, CAST(N'2018-07-22' AS Date), 20, NULL, 11, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (147, CAST(N'2018-07-29' AS Date), 21, NULL, 11, N'Pocono Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (148, CAST(N'2018-08-05' AS Date), 22, NULL, 11, N'Watkins Glen International', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (149, CAST(N'2018-08-12' AS Date), 23, NULL, 11, N'Michigan International Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (150, CAST(N'2018-08-18' AS Date), 24, NULL, 11, N'Bristol Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (151, CAST(N'2018-09-02' AS Date), 25, NULL, 11, N'Darlington Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (152, CAST(N'2018-09-09' AS Date), 26, NULL, 11, N'Indianapolis Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (153, CAST(N'2018-09-16' AS Date), 27, NULL, 11, N'Las Vegas Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (154, CAST(N'2018-09-22' AS Date), 28, NULL, 11, N'Richmond Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (155, CAST(N'2018-09-30' AS Date), 29, NULL, 11, N'Charlotte Motor Speedway Road Course', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (156, CAST(N'2018-10-07' AS Date), 30, NULL, 11, N'Dover International Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (157, CAST(N'2018-10-14' AS Date), 31, NULL, 11, N'Talladega Superspeedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (158, CAST(N'2018-10-21' AS Date), 32, NULL, 11, N'Kansas Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (159, CAST(N'2018-10-28' AS Date), 33, NULL, 11, N'Martinsville Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (160, CAST(N'2018-11-04' AS Date), 34, NULL, 11, N'Texas Motor Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (161, CAST(N'2018-11-11' AS Date), 35, NULL, 11, N'ISM Raceway, Phoenix', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (162, CAST(N'2018-11-18' AS Date), 36, NULL, 11, N'Homestead-Miami Speedway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (163, CAST(N'2017-12-02' AS Date), 1, NULL, 12, N'Hong Kong Central Harbourfront Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (164, CAST(N'2017-12-03' AS Date), 2, NULL, 12, N'Hong Kong Central Harbourfront Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 32, N'Daniel Abt won on track, but was disqualified after post-race inspection.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (165, CAST(N'2018-01-13' AS Date), 3, NULL, 12, N'Circuit International Automobile Moulay El Hassan', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 32, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (166, CAST(N'2018-02-03' AS Date), 4, NULL, 12, N'Santiago Street Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 34, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (167, CAST(N'2018-03-03' AS Date), 5, NULL, 12, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (168, CAST(N'2018-03-17' AS Date), 6, NULL, 12, N'Punta del Este Street Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 34, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (169, CAST(N'2018-04-14' AS Date), 7, NULL, 12, N'Circuito Cittadino dell''EUR, Rome', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (170, CAST(N'2018-04-28' AS Date), 8, NULL, 12, N'Paris Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 34, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (171, CAST(N'2018-05-19' AS Date), 9, NULL, 12, N'Tempelhof Airport Street Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (172, CAST(N'2018-06-10' AS Date), 10, NULL, 12, N'Zürich Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (173, CAST(N'2018-07-14' AS Date), 11, NULL, 12, N'Brooklyn Street Circuit, New York', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (174, CAST(N'2018-07-15' AS Date), 12, NULL, 12, N'Brooklyn Street Circuit, New York', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 34, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (175, CAST(N'2018-04-15' AS Date), 3, NULL, 6, N'Shanghai International Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (176, CAST(N'2018-04-29' AS Date), 4, NULL, 6, N'Baku City Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (177, CAST(N'2018-05-13' AS Date), 5, NULL, 6, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (178, CAST(N'2018-05-27' AS Date), 6, NULL, 6, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (179, CAST(N'2018-06-10' AS Date), 7, NULL, 6, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (180, CAST(N'2018-06-24' AS Date), 8, NULL, 6, N'Circuit Paul Ricard, Le Castellet', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (181, CAST(N'2018-07-01' AS Date), 9, NULL, 6, N'Red Bull Ring, Spielberg', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (182, CAST(N'2018-07-08' AS Date), 10, NULL, 6, N'Silverstone Circuit', N'Finished', CAST(10.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (183, CAST(N'2018-07-22' AS Date), 11, NULL, 6, N'Hockenheimring, Hockenheim', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (184, CAST(N'2018-07-29' AS Date), 12, NULL, 6, N'Hungaroring, Budapest', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (185, CAST(N'2018-08-26' AS Date), 13, NULL, 6, N'Spa-Francorchamps', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (186, CAST(N'2018-09-02' AS Date), 14, NULL, 6, N'Autodromo Nazionale Monza', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (187, CAST(N'2018-09-16' AS Date), 15, NULL, 6, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (188, CAST(N'2018-09-30' AS Date), 16, NULL, 6, N'Sochi Autodrom', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (189, CAST(N'2018-10-07' AS Date), 17, NULL, 6, N'Suzuka Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (190, CAST(N'2018-10-21' AS Date), 18, NULL, 6, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (191, CAST(N'2018-10-28' AS Date), 19, NULL, 6, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (192, CAST(N'2018-11-11' AS Date), 20, NULL, 6, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (193, CAST(N'2018-11-25' AS Date), 21, NULL, 6, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (194, CAST(N'2018-05-05' AS Date), 1, NULL, 13, N'Spa-Francorchamps', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (195, CAST(N'2018-06-16' AS Date), 2, N'24 Heures du Mans', 13, N'Circuit de la Sarthe, Le Mans', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (196, CAST(N'2018-08-19' AS Date), 3, NULL, 13, N'Silverstone Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 55, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (197, CAST(N'2018-10-14' AS Date), 4, NULL, 13, N'Fuji Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (198, CAST(N'2018-11-18' AS Date), 5, NULL, 13, N'Shanghai International Circuit', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (199, CAST(N'2019-03-16' AS Date), 6, N'1,500 Miles of Sebring', 13, N'Sebring International Raceway', N'Scheduled', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (200, CAST(N'2019-05-04' AS Date), 7, NULL, 13, N'Spa-Francorchamps', N'Scheduled', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (201, CAST(N'2019-06-15' AS Date), 8, N'24 Heures du Mans', 13, N'Circuit de la Sarthe, Le Mans', N'Scheduled', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (202, CAST(N'2018-03-18' AS Date), 1, NULL, 14, N'Losail Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (203, CAST(N'2018-04-08' AS Date), 2, NULL, 14, N'Termas de Rio Hondo', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(1 AS Decimal(1, 0)), 25, N'Weird decisions on race start, by event organisers.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (204, CAST(N'2018-04-22' AS Date), 3, NULL, 14, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (205, CAST(N'2018-05-06' AS Date), 4, NULL, 14, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (206, CAST(N'2018-05-20' AS Date), 5, NULL, 14, N'Circuit Bugatti, Le Mans', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (207, CAST(N'2018-06-03' AS Date), 6, NULL, 14, N'Mugello Circuit, Scarperia', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (208, CAST(N'2018-06-17' AS Date), 7, NULL, 14, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (209, CAST(N'2018-07-01' AS Date), 8, NULL, 14, N'TT Circuit Assen', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (210, CAST(N'2018-07-15' AS Date), 9, NULL, 14, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (211, CAST(N'2018-08-05' AS Date), 10, NULL, 14, N'Masaryk Circuit, Brno', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (212, CAST(N'2018-08-12' AS Date), 11, NULL, 14, N'Red Bull Ring, Spielberg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (213, CAST(N'2018-08-26' AS Date), 12, NULL, 14, N'Silverstone Circuit', N'Cancelled', CAST(0.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), NULL, N'Cancelled due to heavy rain. The new asphalt did not allow suficient draining.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (214, CAST(N'2018-09-09' AS Date), 13, NULL, 14, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (215, CAST(N'2018-09-23' AS Date), 14, NULL, 14, N'Ciudad del Motor de Aragón', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (216, CAST(N'2018-10-07' AS Date), 15, NULL, 14, N'Buriram International Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (217, CAST(N'2018-10-21' AS Date), 16, NULL, 14, N'Twin Ring Motegi', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (218, CAST(N'2018-10-28' AS Date), 17, NULL, 14, N'Phillip Island Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (219, CAST(N'2018-11-04' AS Date), 18, NULL, 14, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(1 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (220, CAST(N'2018-11-18' AS Date), 19, NULL, 14, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (221, CAST(N'2018-03-11' AS Date), 1, NULL, 15, N'Streets of St. Petersburg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 15, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (222, CAST(N'2018-04-07' AS Date), 2, NULL, 15, N'ISM Raceway, Phoenix', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (223, CAST(N'2018-04-15' AS Date), 3, NULL, 15, N'Streets of Long Beach', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (224, CAST(N'2018-04-22' AS Date), 4, NULL, 15, N'Barber Motorsports Park, Alabama', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(6 AS Decimal(1, 0)), 14, N'Stopped on Sunday, resumed on Monday.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (225, CAST(N'2018-05-12' AS Date), 5, NULL, 15, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(2 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (226, CAST(N'2018-05-27' AS Date), 6, N'Indianapolis 500', 15, N'Indianapolis Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (227, CAST(N'2018-06-02' AS Date), 7, NULL, 15, N'Belle Isle, Detroit', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (228, CAST(N'2018-06-03' AS Date), 8, NULL, 15, N'Belle Isle, Detroit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (229, CAST(N'2018-06-09' AS Date), 9, NULL, 15, N'Texas Motor Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (230, CAST(N'2018-06-24' AS Date), 10, NULL, 15, N'Road America, Elkhart Lake', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (231, CAST(N'2018-07-08' AS Date), 11, NULL, 15, N'Iowa Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (232, CAST(N'2018-07-15' AS Date), 12, NULL, 15, N'Streets of Toronto', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (233, CAST(N'2018-07-29' AS Date), 13, NULL, 15, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (234, CAST(N'2018-08-19' AS Date), 14, NULL, 15, N'Pocono Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (235, CAST(N'2018-08-25' AS Date), 15, NULL, 15, N'Gateway Motorsports Park, St. Louis', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (236, CAST(N'2018-09-02' AS Date), 16, NULL, 15, N'Portland International Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (237, CAST(N'2018-09-16' AS Date), 17, NULL, 15, N'Sonoma Raceway', N'ReadyToWatch', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (238, CAST(N'2016-03-20' AS Date), 1, NULL, 16, N'Albert Park, Melbourne', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (239, CAST(N'2016-04-03' AS Date), 2, NULL, 16, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (240, CAST(N'2016-04-17' AS Date), 3, NULL, 16, N'Shanghai International Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (241, CAST(N'2016-05-01' AS Date), 4, NULL, 16, N'Sochi Autodrom', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (242, CAST(N'2016-05-15' AS Date), 5, NULL, 16, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (243, CAST(N'2016-05-29' AS Date), 6, NULL, 16, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (244, CAST(N'2016-06-12' AS Date), 7, NULL, 16, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (245, CAST(N'2016-06-19' AS Date), 8, N'European Grand Prix', 16, N'Baku City Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (246, CAST(N'2016-07-03' AS Date), 9, NULL, 16, N'Red Bull Ring, Spielberg', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (247, CAST(N'2016-07-10' AS Date), 10, NULL, 16, N'Silverstone Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (248, CAST(N'2016-07-24' AS Date), 11, NULL, 16, N'Hungaroring, Budapest', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (249, CAST(N'2016-07-31' AS Date), 12, NULL, 16, N'Hockenheimring, Hockenheim', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (250, CAST(N'2016-08-28' AS Date), 13, NULL, 16, N'Spa-Francorchamps', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (251, CAST(N'2016-09-04' AS Date), 14, NULL, 16, N'Autodromo Nazionale Monza', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (252, CAST(N'2016-09-18' AS Date), 15, NULL, 16, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (253, CAST(N'2016-10-02' AS Date), 16, NULL, 16, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (254, CAST(N'2016-10-09' AS Date), 17, NULL, 16, N'Suzuka Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (255, CAST(N'2016-10-23' AS Date), 18, NULL, 16, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (256, CAST(N'2016-11-13' AS Date), 19, NULL, 16, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (257, CAST(N'2016-11-27' AS Date), 20, NULL, 16, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (258, CAST(N'2016-03-20' AS Date), 1, NULL, 17, N'Losail Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (259, CAST(N'2016-04-03' AS Date), 2, NULL, 17, N'Termas de Rio Hondo', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (260, CAST(N'2016-04-10' AS Date), 3, NULL, 17, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (261, CAST(N'2016-04-24' AS Date), 4, NULL, 17, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (262, CAST(N'2016-05-08' AS Date), 5, NULL, 17, N'Circuit Bugatti, Le Mans', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (263, CAST(N'2016-05-22' AS Date), 6, NULL, 17, N'Mugello Circuit, Scarperia', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (264, CAST(N'2016-06-05' AS Date), 7, NULL, 17, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (265, CAST(N'2016-06-26' AS Date), 8, NULL, 17, N'TT Circuit Assen', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), 22, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (266, CAST(N'2016-07-17' AS Date), 9, NULL, 17, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (267, CAST(N'2016-08-14' AS Date), 10, NULL, 17, N'Red Bull Ring, Spielberg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (268, CAST(N'2016-08-21' AS Date), 11, NULL, 17, N'Masaryk Circuit, Brno', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 25, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (269, CAST(N'2016-09-04' AS Date), 12, NULL, 17, N'Silverstone Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 39, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (270, CAST(N'2016-09-11' AS Date), 13, NULL, 17, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (271, CAST(N'2016-09-25' AS Date), 14, NULL, 17, N'Ciudad del Motor de Aragón', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (272, CAST(N'2016-10-16' AS Date), 15, NULL, 17, N'Twin Ring Motegi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (273, CAST(N'2016-10-23' AS Date), 16, NULL, 17, N'Phillip Island Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 25, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (274, CAST(N'2016-10-30' AS Date), 17, NULL, 17, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 21, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (275, CAST(N'2016-11-13' AS Date), 18, NULL, 17, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (276, CAST(N'2016-02-13' AS Date), 0, N'The Sprint Unlimited', 18, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (277, CAST(N'2016-02-18' AS Date), 0, N'Can-Am Duel 1', 18, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (278, CAST(N'2016-02-18' AS Date), 0, N'Can-Am Duel 2', 18, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (279, CAST(N'2016-02-21' AS Date), 1, N'Daytona 500', 18, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (280, CAST(N'2016-02-28' AS Date), 2, NULL, 18, N'Atlanta Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (281, CAST(N'2016-03-06' AS Date), 3, NULL, 18, N'Las Vegas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (282, CAST(N'2016-03-13' AS Date), 4, NULL, 18, N'ISM Raceway, Phoenix', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (283, CAST(N'2016-03-20' AS Date), 5, NULL, 18, N'Auto Club Speedway, Fontana', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (284, CAST(N'2016-04-03' AS Date), 6, NULL, 18, N'Martinsville Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (285, CAST(N'2016-04-09' AS Date), 7, NULL, 18, N'Texas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (286, CAST(N'2016-04-17' AS Date), 8, NULL, 18, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (287, CAST(N'2016-04-24' AS Date), 9, NULL, 18, N'Richmond Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (288, CAST(N'2016-05-01' AS Date), 10, NULL, 18, N'Talladega Superspeedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (289, CAST(N'2016-05-07' AS Date), 11, NULL, 18, N'Kansas Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (290, CAST(N'2016-05-15' AS Date), 12, NULL, 18, N'Dover International Speedway', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (291, CAST(N'2016-05-20' AS Date), 0, N'Sprint Showdown', 18, N'Charlotte Motor Speedway', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (292, CAST(N'2016-05-21' AS Date), 0, N'Sprint All-Star Race', 18, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (293, CAST(N'2016-05-29' AS Date), 13, N'Coca-Cola 600', 18, N'Charlotte Motor Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (294, CAST(N'2016-06-05' AS Date), 14, NULL, 18, N'Pocono Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (295, CAST(N'2016-06-12' AS Date), 15, NULL, 18, N'Michigan International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (296, CAST(N'2016-06-26' AS Date), 16, NULL, 18, N'Sonoma Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (297, CAST(N'2016-07-02' AS Date), 17, NULL, 18, N'Daytona International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (298, CAST(N'2016-07-09' AS Date), 18, NULL, 18, N'Kentucky Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (299, CAST(N'2016-07-17' AS Date), 19, NULL, 18, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (300, CAST(N'2016-07-24' AS Date), 20, NULL, 18, N'Indianapolis Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (301, CAST(N'2016-07-31' AS Date), 21, NULL, 18, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 40, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (302, CAST(N'2016-08-07' AS Date), 22, NULL, 18, N'Watkins Glen International', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (303, CAST(N'2016-08-20' AS Date), 23, NULL, 18, N'Bristol Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (304, CAST(N'2016-08-28' AS Date), 24, NULL, 18, N'Michigan International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (305, CAST(N'2016-09-04' AS Date), 25, NULL, 18, N'Darlington Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (306, CAST(N'2016-09-10' AS Date), 26, NULL, 18, N'Richmond Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (307, CAST(N'2016-09-18' AS Date), 27, NULL, 18, N'Chicagoland Speedway, Chicago', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (308, CAST(N'2016-09-25' AS Date), 28, NULL, 18, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (309, CAST(N'2016-10-02' AS Date), 29, NULL, 18, N'Dover International Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (310, CAST(N'2016-10-08' AS Date), 30, NULL, 18, N'Charlotte Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (311, CAST(N'2016-10-16' AS Date), 31, NULL, 18, N'Kansas Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (312, CAST(N'2016-10-23' AS Date), 32, NULL, 18, N'Talladega Superspeedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (313, CAST(N'2016-10-30' AS Date), 33, NULL, 18, N'Martinsville Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (314, CAST(N'2016-11-06' AS Date), 34, NULL, 18, N'Texas Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (315, CAST(N'2016-11-13' AS Date), 35, NULL, 18, N'ISM Raceway, Phoenix', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (316, CAST(N'2016-11-20' AS Date), 36, NULL, 18, N'Homestead-Miami Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (317, CAST(N'2016-03-13' AS Date), 1, NULL, 19, N'Streets of St. Petersburg', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (318, CAST(N'2016-04-02' AS Date), 2, NULL, 19, N'ISM Raceway, Phoenix', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (319, CAST(N'2016-04-17' AS Date), 3, NULL, 19, N'Streets of Long Beach', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (320, CAST(N'2016-04-24' AS Date), 4, NULL, 19, N'Barber Motorsports Park, Alabama', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (321, CAST(N'2016-05-14' AS Date), 5, NULL, 19, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (322, CAST(N'2016-05-29' AS Date), 6, N'Indianapolis 500', 19, N'Indianapolis Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (323, CAST(N'2016-06-04' AS Date), 7, NULL, 19, N'Belle Isle, Detroit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 42, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (324, CAST(N'2016-06-05' AS Date), 8, NULL, 19, N'Belle Isle, Detroit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (325, CAST(N'2016-06-11' AS Date), 9, NULL, 19, N'Texas Motor Speedway', N'Finished', CAST(10.0 AS Decimal(3, 1)), CAST(6 AS Decimal(1, 0)), 19, N'Postponed because of the heavy rain, and resumed on August 27, between round 14 and 15.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (326, CAST(N'2016-06-26' AS Date), 10, NULL, 19, N'Road America, Elkhart Lake', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (327, CAST(N'2016-07-10' AS Date), 11, NULL, 19, N'Iowa Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (328, CAST(N'2016-07-17' AS Date), 12, NULL, 19, N'Streets of Toronto', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (329, CAST(N'2016-07-31' AS Date), 13, NULL, 19, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (330, CAST(N'2016-08-21' AS Date), 14, NULL, 19, N'Pocono Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (331, CAST(N'2016-09-04' AS Date), 15, NULL, 19, N'Watkins Glen International', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (332, CAST(N'2016-09-18' AS Date), 16, NULL, 19, N'Sonoma Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (333, CAST(N'2015-10-24' AS Date), 1, NULL, 20, N'Beijing Olympic Green Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (334, CAST(N'2015-11-07' AS Date), 2, NULL, 20, N'Putrajaya Street Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (335, CAST(N'2015-12-19' AS Date), 3, NULL, 20, N'Punta del Este Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (336, CAST(N'2016-02-06' AS Date), 4, NULL, 20, N'Puerto Madero Street Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (337, CAST(N'2016-03-12' AS Date), 5, NULL, 20, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 29, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (338, CAST(N'2016-04-02' AS Date), 6, NULL, 20, N'Streets of Long Beach', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (339, CAST(N'2016-04-23' AS Date), 7, NULL, 20, N'Paris Street Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (340, CAST(N'2016-05-21' AS Date), 8, NULL, 20, N'Berlin Street Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (341, CAST(N'2016-07-02' AS Date), 9, NULL, 20, N'Battersea Park Street Circuit, London', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (342, CAST(N'2016-07-03' AS Date), 10, NULL, 20, N'Battersea Park Street Circuit, London', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (343, CAST(N'2016-04-17' AS Date), 1, NULL, 21, N'Silverstone Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, N'Audi won the event (Marcel Fässler, André Lotterer, and Benoît Tréluyer), but were disqualified after the race.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (344, CAST(N'2016-05-07' AS Date), 2, NULL, 21, N'Spa-Francorchamps', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 44, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (345, CAST(N'2016-06-18' AS Date), 3, N'24 Heures du Mans', 21, N'Circuit de la Sarthe, Le Mans', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 36, N'Last-minute breakdown of the leading Toyota of Anthony Davidson, Sébastien Buemi and Kazuki Nakajima.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (346, CAST(N'2016-07-24' AS Date), 4, NULL, 21, N'Nürburgring', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (347, CAST(N'2016-09-04' AS Date), 5, NULL, 21, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (348, CAST(N'2016-09-17' AS Date), 6, NULL, 21, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (349, CAST(N'2016-10-16' AS Date), 7, NULL, 21, N'Fuji Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (350, CAST(N'2016-11-06' AS Date), 8, NULL, 21, N'Shanghai International Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (351, CAST(N'2016-11-19' AS Date), 9, NULL, 21, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 44, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (352, CAST(N'2014-09-13' AS Date), 1, NULL, 22, N'Beijing Olympic Green Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 31, N'Inaugural race of the sport.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (353, CAST(N'2014-11-22' AS Date), 2, NULL, 22, N'Putrajaya Street Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (354, CAST(N'2014-12-13' AS Date), 3, NULL, 22, N'Punta del Este Street Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (355, CAST(N'2015-01-10' AS Date), 4, NULL, 22, N'Puerto Madero Street Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 45, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (356, CAST(N'2015-03-14' AS Date), 5, NULL, 22, N'Biscayne Bay Street Circuit, Miami', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (357, CAST(N'2015-04-04' AS Date), 6, NULL, 22, N'Streets of Long Beach', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 46, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (358, CAST(N'2015-05-09' AS Date), 7, NULL, 22, N'Circuit de Monaco, Pool lay-out', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (359, CAST(N'2015-05-23' AS Date), 8, NULL, 22, N'Tempelhof Airport Street Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 29, N'The initial winner, Lucas di Grassi, was disqualified after the race, due to a technical rule violation.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (360, CAST(N'2015-06-06' AS Date), 9, NULL, 22, N'Moscow Street Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 46, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (361, CAST(N'2015-06-27' AS Date), 10, NULL, 22, N'Battersea Park Street Circuit, London', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 30, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (362, CAST(N'2015-06-28' AS Date), 11, NULL, 22, N'Battersea Park Street Circuit, London', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 26, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (363, CAST(N'2015-03-15' AS Date), 1, NULL, 23, N'Albert Park, Melbourne', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (364, CAST(N'2015-03-29' AS Date), 2, NULL, 23, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (365, CAST(N'2015-04-12' AS Date), 3, NULL, 23, N'Shanghai International Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (366, CAST(N'2015-04-19' AS Date), 4, NULL, 23, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (367, CAST(N'2015-05-10' AS Date), 5, NULL, 23, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (368, CAST(N'2015-05-24' AS Date), 6, NULL, 23, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (369, CAST(N'2015-06-07' AS Date), 7, NULL, 23, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (370, CAST(N'2015-06-21' AS Date), 8, NULL, 23, N'Red Bull Ring, Spielberg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (371, CAST(N'2015-07-05' AS Date), 9, NULL, 23, N'Silverstone Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (372, CAST(N'2015-07-26' AS Date), 10, NULL, 23, N'Hungaroring, Budapest', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (373, CAST(N'2015-08-23' AS Date), 11, NULL, 23, N'Spa-Francorchamps', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (374, CAST(N'2015-09-06' AS Date), 12, NULL, 23, N'Autodromo Nazionale Monza', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (375, CAST(N'2015-09-20' AS Date), 13, NULL, 23, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (376, CAST(N'2015-09-27' AS Date), 14, NULL, 23, N'Suzuka Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (377, CAST(N'2015-10-11' AS Date), 15, NULL, 23, N'Sochi Autodrom', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (378, CAST(N'2015-10-25' AS Date), 16, NULL, 23, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(5 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (379, CAST(N'2015-11-01' AS Date), 17, NULL, 23, N'Autódromo Hermanos Rodríguez, Mexico City', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (380, CAST(N'2015-11-15' AS Date), 18, NULL, 23, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (381, CAST(N'2015-11-29' AS Date), 19, NULL, 23, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (382, CAST(N'2015-03-29' AS Date), 1, NULL, 24, N'Losail Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (383, CAST(N'2015-04-12' AS Date), 2, NULL, 24, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (384, CAST(N'2015-04-19' AS Date), 3, NULL, 24, N'Termas de Rio Hondo', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (385, CAST(N'2015-05-03' AS Date), 4, NULL, 24, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (386, CAST(N'2015-05-17' AS Date), 5, NULL, 24, N'Circuit Bugatti, Le Mans', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (387, CAST(N'2015-05-31' AS Date), 6, NULL, 24, N'Mugello Circuit, Scarperia', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (388, CAST(N'2015-06-14' AS Date), 7, NULL, 24, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (389, CAST(N'2015-06-27' AS Date), 8, NULL, 24, N'TT Circuit Assen', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (390, CAST(N'2015-07-12' AS Date), 9, NULL, 24, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (391, CAST(N'2015-08-09' AS Date), 10, NULL, 24, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (392, CAST(N'2015-08-16' AS Date), 11, NULL, 24, N'Masaryk Circuit, Brno', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (393, CAST(N'2015-08-30' AS Date), 12, NULL, 24, N'Silverstone Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (394, CAST(N'2015-09-13' AS Date), 13, NULL, 24, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (395, CAST(N'2015-09-27' AS Date), 14, NULL, 24, N'Ciudad del Motor de Aragón', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (396, CAST(N'2015-10-11' AS Date), 15, NULL, 24, N'Twin Ring Motegi', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (397, CAST(N'2015-10-18' AS Date), 16, NULL, 24, N'Phillip Island Circuit', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (398, CAST(N'2015-10-25' AS Date), 17, NULL, 24, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (399, CAST(N'2015-11-08' AS Date), 18, NULL, 24, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (400, CAST(N'2015-02-14' AS Date), 0, N'Sprint Unlimited', 25, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (401, CAST(N'2015-02-19' AS Date), 0, N'Budweiser Duel 1', 25, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (402, CAST(N'2015-02-19' AS Date), 0, N'Budweiser Duel 2', 25, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (403, CAST(N'2015-02-22' AS Date), 1, N'Daytona 500', 25, N'Daytona International Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (404, CAST(N'2015-03-01' AS Date), 2, NULL, 25, N'Atlanta Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (405, CAST(N'2015-03-08' AS Date), 3, NULL, 25, N'Las Vegas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (406, CAST(N'2015-03-15' AS Date), 4, NULL, 25, N'ISM Raceway, Phoenix', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (407, CAST(N'2015-03-22' AS Date), 5, NULL, 25, N'Auto Club Speedway, Fontana', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (408, CAST(N'2015-03-29' AS Date), 6, NULL, 25, N'Martinsville Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (409, CAST(N'2015-04-11' AS Date), 7, NULL, 25, N'Texas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (410, CAST(N'2015-04-19' AS Date), 8, NULL, 25, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (411, CAST(N'2015-04-25' AS Date), 9, NULL, 25, N'Richmond Raceway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (412, CAST(N'2015-05-03' AS Date), 10, NULL, 25, N'Talladega Superspeedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (413, CAST(N'2015-05-09' AS Date), 11, NULL, 25, N'Kansas Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (414, CAST(N'2015-05-15' AS Date), 0, N'Sprint Showdown', 25, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (415, CAST(N'2015-05-16' AS Date), 0, N'Sprint All-Star Race', 25, N'Charlotte Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (416, CAST(N'2015-05-24' AS Date), 12, NULL, 25, N'Charlotte Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (417, CAST(N'2015-05-31' AS Date), 13, NULL, 25, N'Dover International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (418, CAST(N'2015-06-07' AS Date), 14, NULL, 25, N'Pocono Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (419, CAST(N'2015-06-14' AS Date), 15, NULL, 25, N'Michigan International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (420, CAST(N'2015-06-28' AS Date), 16, NULL, 25, N'Sonoma Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (421, CAST(N'2015-07-05' AS Date), 17, NULL, 25, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (422, CAST(N'2015-07-11' AS Date), 18, NULL, 25, N'Kentucky Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (423, CAST(N'2015-07-19' AS Date), 19, NULL, 25, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (424, CAST(N'2015-07-26' AS Date), 20, NULL, 25, N'Indianapolis Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (425, CAST(N'2015-08-02' AS Date), 21, NULL, 25, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (426, CAST(N'2015-08-09' AS Date), 22, NULL, 25, N'Watkins Glen International', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (427, CAST(N'2015-08-16' AS Date), 23, NULL, 25, N'Michigan International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (428, CAST(N'2015-08-22' AS Date), 24, NULL, 25, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (429, CAST(N'2015-09-06' AS Date), 25, NULL, 25, N'Darlington Raceway', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (430, CAST(N'2015-09-12' AS Date), 26, NULL, 25, N'Richmond Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (431, CAST(N'2015-09-20' AS Date), 27, NULL, 25, N'Chicagoland Speedway, Chicago', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (432, CAST(N'2015-09-27' AS Date), 28, NULL, 25, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (433, CAST(N'2015-10-04' AS Date), 29, NULL, 25, N'Dover International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (434, CAST(N'2015-10-10' AS Date), 30, NULL, 25, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (435, CAST(N'2015-10-18' AS Date), 31, NULL, 25, N'Kansas Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (436, CAST(N'2015-10-25' AS Date), 32, NULL, 25, N'Talladega Superspeedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (437, CAST(N'2015-11-01' AS Date), 33, NULL, 25, N'Martinsville Speedway', N'Finished', CAST(10.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (438, CAST(N'2015-11-08' AS Date), 34, NULL, 25, N'Texas Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (439, CAST(N'2015-11-15' AS Date), 35, NULL, 25, N'ISM Raceway, Phoenix', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (440, CAST(N'2015-11-22' AS Date), 36, NULL, 25, N'Homestead-Miami Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (441, CAST(N'2015-03-29' AS Date), 1, NULL, 26, N'Streets of St. Petersburg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (442, CAST(N'2015-04-12' AS Date), 2, NULL, 26, N'NOLA Motorsports Park, Louisiana', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (443, CAST(N'2015-04-19' AS Date), 3, NULL, 26, N'Streets of Long Beach', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (444, CAST(N'2015-04-26' AS Date), 4, NULL, 26, N'Barber Motorsports Park, Alabama', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (445, CAST(N'2015-05-09' AS Date), 5, NULL, 26, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (446, CAST(N'2015-05-24' AS Date), 6, N'Indianapolis 500', 26, N'Indianapolis Motor Speedway', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (447, CAST(N'2015-05-30' AS Date), 7, NULL, 26, N'Belle Isle, Detroit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (448, CAST(N'2015-05-31' AS Date), 8, NULL, 26, N'Belle Isle, Detroit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 42, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (449, CAST(N'2015-06-06' AS Date), 9, NULL, 26, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (450, CAST(N'2015-06-14' AS Date), 10, NULL, 26, N'Streets of Toronto', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (451, CAST(N'2015-06-27' AS Date), 11, NULL, 26, N'Auto Club Speedway, Fontana', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 19, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (452, CAST(N'2015-07-12' AS Date), 12, NULL, 26, N'Milwaukee Mile', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 42, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (453, CAST(N'2015-07-18' AS Date), 13, NULL, 26, N'Iowa Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (454, CAST(N'2015-08-02' AS Date), 14, NULL, 26, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(1.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 19, N'I strongly suspect Indycar to throw a caution in an opportune time for Graham Rahal. I think this race was fixed.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (455, CAST(N'2015-08-23' AS Date), 15, NULL, 26, N'Pocono Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (456, CAST(N'2015-08-30' AS Date), 16, NULL, 26, N'Sonoma Raceway', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (457, CAST(N'2015-04-12' AS Date), 1, NULL, 27, N'Silverstone Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 44, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (458, CAST(N'2015-05-02' AS Date), 2, NULL, 27, N'Spa-Francorchamps', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 44, N'I attended this race.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (459, CAST(N'2015-06-13' AS Date), 3, N'24 Heures du Mans', 27, N'Circuit de la Sarthe, Le Mans', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (460, CAST(N'2015-08-30' AS Date), 4, NULL, 27, N'Nürburgring', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (461, CAST(N'2015-09-19' AS Date), 5, NULL, 27, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (462, CAST(N'2015-10-11' AS Date), 6, NULL, 27, N'Fuji Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (463, CAST(N'2015-11-01' AS Date), 7, NULL, 27, N'Shanghai International Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (464, CAST(N'2015-11-21' AS Date), 8, NULL, 27, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (465, CAST(N'2014-03-16' AS Date), 1, NULL, 28, N'Albert Park, Melbourne', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (466, CAST(N'2014-03-30' AS Date), 2, NULL, 28, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (467, CAST(N'2014-04-06' AS Date), 3, NULL, 28, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (468, CAST(N'2014-04-20' AS Date), 4, NULL, 28, N'Shanghai International Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (469, CAST(N'2014-05-11' AS Date), 5, NULL, 28, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (470, CAST(N'2014-05-25' AS Date), 6, NULL, 28, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (471, CAST(N'2014-06-08' AS Date), 7, NULL, 28, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (472, CAST(N'2014-06-22' AS Date), 8, NULL, 28, N'Red Bull Ring, Spielberg', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (473, CAST(N'2014-07-06' AS Date), 9, NULL, 28, N'Silverstone Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (474, CAST(N'2014-07-20' AS Date), 10, NULL, 28, N'Hockenheimring, Hockenheim', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (475, CAST(N'2014-07-27' AS Date), 11, NULL, 28, N'Hungaroring, Budapest', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (476, CAST(N'2014-08-24' AS Date), 12, NULL, 28, N'Spa-Francorchamps', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (477, CAST(N'2014-09-07' AS Date), 13, NULL, 28, N'Autodromo Nazionale Monza', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (478, CAST(N'2014-09-21' AS Date), 14, NULL, 28, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (479, CAST(N'2014-10-05' AS Date), 15, NULL, 28, N'Suzuka Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (480, CAST(N'2014-10-12' AS Date), 16, NULL, 28, N'Sochi Autodrom', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (481, CAST(N'2014-11-02' AS Date), 17, NULL, 28, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (482, CAST(N'2014-11-09' AS Date), 18, NULL, 28, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (483, CAST(N'2014-11-23' AS Date), 19, NULL, 28, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (484, CAST(N'2014-03-23' AS Date), 1, NULL, 29, N'Losail Circuit', N'Stopped', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (485, CAST(N'2014-04-13' AS Date), 2, NULL, 29, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (486, CAST(N'2014-04-24' AS Date), 3, NULL, 29, N'Termas de Rio Hondo', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (487, CAST(N'2014-05-04' AS Date), 4, NULL, 29, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (488, CAST(N'2014-05-18' AS Date), 5, NULL, 29, N'Circuit Bugatti, Le Mans', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (489, CAST(N'2014-06-01' AS Date), 6, NULL, 29, N'Mugello Circuit, Scarperia', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (490, CAST(N'2014-06-15' AS Date), 7, NULL, 29, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (491, CAST(N'2014-06-28' AS Date), 8, NULL, 29, N'TT Circuit Assen', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (492, CAST(N'2014-07-13' AS Date), 9, NULL, 29, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (493, CAST(N'2014-08-10' AS Date), 10, NULL, 29, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (494, CAST(N'2014-08-17' AS Date), 11, NULL, 29, N'Masaryk Circuit, Brno', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (495, CAST(N'2014-08-31' AS Date), 12, NULL, 29, N'Silverstone Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (496, CAST(N'2014-09-14' AS Date), 13, NULL, 29, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (497, CAST(N'2014-09-21' AS Date), 14, NULL, 29, N'Ciudad del Motor de Aragón', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (498, CAST(N'2014-09-28' AS Date), 15, NULL, 29, N'Autódromo Internacional Nelson Piquet', N'Cancelled', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (499, CAST(N'2014-10-12' AS Date), 16, NULL, 29, N'Twin Ring Motegi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (500, CAST(N'2014-10-19' AS Date), 17, NULL, 29, N'Phillip Island Circuit', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (501, CAST(N'2014-10-26' AS Date), 18, NULL, 29, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (502, CAST(N'2014-11-09' AS Date), 19, NULL, 29, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (503, CAST(N'2014-02-15' AS Date), 0, N'Sprint Unlimited', 30, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (504, CAST(N'2014-02-20' AS Date), 0, N'Budweiser Duel 1', 30, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (505, CAST(N'2014-02-20' AS Date), 0, N'Budweiser Duel 2', 30, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (506, CAST(N'2014-02-23' AS Date), 1, N'Daytona 500', 30, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (507, CAST(N'2014-03-02' AS Date), 2, NULL, 30, N'ISM Raceway, Phoenix', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (508, CAST(N'2014-03-09' AS Date), 3, NULL, 30, N'Las Vegas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (509, CAST(N'2014-03-16' AS Date), 4, NULL, 30, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (510, CAST(N'2014-03-23' AS Date), 5, NULL, 30, N'Auto Club Speedway, Fontana', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (511, CAST(N'2014-03-30' AS Date), 6, NULL, 30, N'Martinsville Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (512, CAST(N'2014-04-06' AS Date), 7, NULL, 30, N'Texas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (513, CAST(N'2014-04-12' AS Date), 8, NULL, 30, N'Darlington Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (514, CAST(N'2014-04-26' AS Date), 9, NULL, 30, N'Richmond Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (515, CAST(N'2014-05-04' AS Date), 10, NULL, 30, N'Talladega Superspeedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (516, CAST(N'2014-05-10' AS Date), 11, NULL, 30, N'Kansas Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (517, CAST(N'2014-05-16' AS Date), 0, N'Sprint Showdown', 30, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (518, CAST(N'2014-05-17' AS Date), 0, N'Sprint All-Star Race', 30, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (519, CAST(N'2014-05-25' AS Date), 12, N'Coca-Cola 600', 30, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (520, CAST(N'2014-06-01' AS Date), 13, NULL, 30, N'Dover International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (521, CAST(N'2014-06-08' AS Date), 14, NULL, 30, N'Pocono Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (522, CAST(N'2014-06-15' AS Date), 15, NULL, 30, N'Michigan International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (523, CAST(N'2014-06-22' AS Date), 16, NULL, 30, N'Sonoma Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (524, CAST(N'2014-06-28' AS Date), 17, NULL, 30, N'Kentucky Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (525, CAST(N'2014-07-05' AS Date), 18, NULL, 30, N'Daytona International Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 48, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (526, CAST(N'2014-07-13' AS Date), 19, NULL, 30, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (527, CAST(N'2014-07-27' AS Date), 20, NULL, 30, N'Indianapolis Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (528, CAST(N'2014-08-03' AS Date), 21, NULL, 30, N'Pocono Raceway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (529, CAST(N'2014-08-10' AS Date), 22, NULL, 30, N'Watkins Glen International', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 49, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (530, CAST(N'2014-08-17' AS Date), 23, NULL, 30, N'Michigan International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (531, CAST(N'2014-08-23' AS Date), 24, NULL, 30, N'Bristol Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (532, CAST(N'2014-08-31' AS Date), 25, NULL, 30, N'Atlanta Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (533, CAST(N'2014-09-06' AS Date), 26, NULL, 30, N'Richmond Raceway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, N'I attended this race.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (534, CAST(N'2014-09-14' AS Date), 27, NULL, 30, N'Chicagoland Speedway, Chicago', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (535, CAST(N'2014-09-21' AS Date), 28, NULL, 30, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (536, CAST(N'2014-09-28' AS Date), 29, NULL, 30, N'Dover International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (537, CAST(N'2014-10-05' AS Date), 30, NULL, 30, N'Kansas Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (538, CAST(N'2014-10-11' AS Date), 31, NULL, 30, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (539, CAST(N'2014-10-19' AS Date), 32, NULL, 30, N'Talladega Superspeedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (540, CAST(N'2014-10-26' AS Date), 33, NULL, 30, N'Martinsville Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (541, CAST(N'2014-11-02' AS Date), 34, NULL, 30, N'Texas Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (542, CAST(N'2014-11-09' AS Date), 35, NULL, 30, N'ISM Raceway, Phoenix', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (543, CAST(N'2014-11-16' AS Date), 36, NULL, 30, N'Homestead-Miami Speedway', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (544, CAST(N'2014-03-30' AS Date), 1, NULL, 31, N'Streets of St. Petersburg', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (545, CAST(N'2014-04-13' AS Date), 2, NULL, 31, N'Streets of Long Beach', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (546, CAST(N'2014-04-26' AS Date), 3, NULL, 31, N'Barber Motorsports Park, Alabama', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (547, CAST(N'2014-05-10' AS Date), 4, NULL, 31, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (548, CAST(N'2014-05-25' AS Date), 5, N'Indianapolis 500', 31, N'Indianapolis Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (549, CAST(N'2014-05-31' AS Date), 6, NULL, 31, N'Belle Isle, Detroit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (550, CAST(N'2014-06-01' AS Date), 7, NULL, 31, N'Belle Isle, Detroit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (551, CAST(N'2014-06-07' AS Date), 8, NULL, 31, N'Texas Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (552, CAST(N'2014-06-28' AS Date), 9, NULL, 31, N'Reliant Park, Houston', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 15, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (553, CAST(N'2014-06-29' AS Date), 10, NULL, 31, N'Reliant Park, Houston', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (554, CAST(N'2014-07-06' AS Date), 11, NULL, 31, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (555, CAST(N'2014-07-12' AS Date), 12, NULL, 31, N'Iowa Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (556, CAST(N'2014-07-19' AS Date), 13, NULL, 31, N'Streets of Toronto', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 42, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (557, CAST(N'2014-07-20' AS Date), 14, NULL, 31, N'Streets of Toronto', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (558, CAST(N'2014-08-03' AS Date), 15, NULL, 31, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (559, CAST(N'2014-08-17' AS Date), 16, NULL, 31, N'Milwaukee Mile', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (560, CAST(N'2014-08-24' AS Date), 17, NULL, 31, N'Sonoma Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (561, CAST(N'2014-08-30' AS Date), 18, NULL, 31, N'Auto Club Speedway, Fontana', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (562, CAST(N'2014-04-20' AS Date), 1, NULL, 32, N'Silverstone Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (563, CAST(N'2014-05-04' AS Date), 2, NULL, 32, N'Spa-Francorchamps', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (564, CAST(N'2014-06-14' AS Date), 3, N'24 Heures du Mans', 32, N'Circuit de la Sarthe, Le Mans', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 44, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (565, CAST(N'2014-09-20' AS Date), 4, NULL, 32, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 44, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (566, CAST(N'2014-10-12' AS Date), 5, NULL, 32, N'Fuji Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (567, CAST(N'2014-11-02' AS Date), 6, NULL, 32, N'Shanghai International Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (568, CAST(N'2014-11-15' AS Date), 7, NULL, 32, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 37, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (569, CAST(N'2014-11-30' AS Date), 8, NULL, 32, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 36, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (570, CAST(N'2013-03-17' AS Date), 1, NULL, 33, N'Albert Park, Melbourne', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 50, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (571, CAST(N'2013-03-24' AS Date), 2, NULL, 33, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (572, CAST(N'2013-04-14' AS Date), 3, NULL, 33, N'Shanghai International Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (573, CAST(N'2013-04-21' AS Date), 4, NULL, 33, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (574, CAST(N'2013-05-12' AS Date), 5, NULL, 33, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (575, CAST(N'2013-05-26' AS Date), 6, NULL, 33, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (576, CAST(N'2013-06-09' AS Date), 7, NULL, 33, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (577, CAST(N'2013-06-30' AS Date), 8, NULL, 33, N'Silverstone Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (578, CAST(N'2013-07-07' AS Date), 9, NULL, 33, N'Hockenheimring, Hockenheim', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (579, CAST(N'2013-07-28' AS Date), 10, NULL, 33, N'Hungaroring, Budapest', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (580, CAST(N'2013-08-25' AS Date), 11, NULL, 33, N'Spa-Francorchamps', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (581, CAST(N'2013-09-08' AS Date), 12, NULL, 33, N'Autodromo Nazionale Monza', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (582, CAST(N'2013-09-22' AS Date), 13, NULL, 33, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (583, CAST(N'2013-10-06' AS Date), 14, NULL, 33, N'Korea International Circuit, Yeongam', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (584, CAST(N'2013-10-13' AS Date), 15, NULL, 33, N'Suzuka Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (585, CAST(N'2013-10-27' AS Date), 16, NULL, 33, N'Buddh International Circuit, New Delhi', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (586, CAST(N'2013-11-03' AS Date), 17, NULL, 33, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (587, CAST(N'2013-11-17' AS Date), 18, NULL, 33, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (588, CAST(N'2013-11-24' AS Date), 19, NULL, 33, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (589, CAST(N'2013-04-07' AS Date), 1, NULL, 34, N'Losail Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (590, CAST(N'2013-04-21' AS Date), 2, NULL, 34, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (591, CAST(N'2013-05-05' AS Date), 3, NULL, 34, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (592, CAST(N'2013-05-19' AS Date), 4, NULL, 34, N'Circuit Bugatti, Le Mans', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (593, CAST(N'2013-06-02' AS Date), 5, NULL, 34, N'Mugello Circuit, Scarperia', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (594, CAST(N'2013-06-16' AS Date), 6, NULL, 34, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (595, CAST(N'2013-06-29' AS Date), 7, NULL, 34, N'TT Circuit Assen', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (596, CAST(N'2013-07-14' AS Date), 8, NULL, 34, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (597, CAST(N'2013-07-21' AS Date), 9, NULL, 34, N'Laguna Seca Raceway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (598, CAST(N'2013-08-18' AS Date), 10, NULL, 34, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (599, CAST(N'2013-08-25' AS Date), 11, NULL, 34, N'Masaryk Circuit, Brno', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (600, CAST(N'2013-09-01' AS Date), 12, NULL, 34, N'Silverstone Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (601, CAST(N'2013-09-15' AS Date), 13, NULL, 34, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (602, CAST(N'2013-09-29' AS Date), 14, NULL, 34, N'Ciudad del Motor de Aragón', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (603, CAST(N'2013-10-13' AS Date), 15, NULL, 34, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (604, CAST(N'2013-10-20' AS Date), 16, NULL, 34, N'Phillip Island Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (605, CAST(N'2013-10-27' AS Date), 17, NULL, 34, N'Twin Ring Motegi', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (606, CAST(N'2013-11-10' AS Date), 18, NULL, 34, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (607, CAST(N'2013-02-16' AS Date), 0, N'Sprint Unlimited', 35, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (608, CAST(N'2013-02-21' AS Date), 0, N'Budweiser Duel 1', 35, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (609, CAST(N'2013-02-21' AS Date), 0, N'Budweiser Duel 2', 35, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (610, CAST(N'2013-02-24' AS Date), 1, N'Daytona 500', 35, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (611, CAST(N'2013-03-03' AS Date), 2, NULL, 35, N'ISM Raceway, Phoenix', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (612, CAST(N'2013-03-10' AS Date), 3, NULL, 35, N'Las Vegas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (613, CAST(N'2013-03-17' AS Date), 4, NULL, 35, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (614, CAST(N'2013-03-24' AS Date), 5, NULL, 35, N'Auto Club Speedway, Fontana', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (615, CAST(N'2013-04-07' AS Date), 6, NULL, 35, N'Martinsville Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (616, CAST(N'2013-04-13' AS Date), 7, NULL, 35, N'Texas Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (617, CAST(N'2013-04-21' AS Date), 8, NULL, 35, N'Kansas Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (618, CAST(N'2013-04-27' AS Date), 9, NULL, 35, N'Richmond Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (619, CAST(N'2013-05-05' AS Date), 10, NULL, 35, N'Talladega Superspeedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 40, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (620, CAST(N'2013-05-11' AS Date), 11, NULL, 35, N'Darlington Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (621, CAST(N'2013-05-18' AS Date), 0, N'Sprint Showdown', 35, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (622, CAST(N'2013-05-18' AS Date), 0, N'Sprint All-Star Race', 35, N'Charlotte Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (623, CAST(N'2013-05-26' AS Date), 12, N'Coca-Cola 600', 35, N'Charlotte Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (624, CAST(N'2013-06-02' AS Date), 13, NULL, 35, N'Dover International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (625, CAST(N'2013-06-09' AS Date), 14, NULL, 35, N'Pocono Raceway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (626, CAST(N'2013-06-16' AS Date), 15, NULL, 35, N'Michigan International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (627, CAST(N'2013-06-23' AS Date), 16, NULL, 35, N'Sonoma Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (628, CAST(N'2013-06-29' AS Date), 17, NULL, 35, N'Kentucky Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (629, CAST(N'2013-07-06' AS Date), 18, NULL, 35, N'Daytona International Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (630, CAST(N'2013-07-14' AS Date), 19, NULL, 35, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (631, CAST(N'2013-07-28' AS Date), 20, NULL, 35, N'Indianapolis Motor Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (632, CAST(N'2013-08-04' AS Date), 21, NULL, 35, N'Pocono Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (633, CAST(N'2013-08-11' AS Date), 22, NULL, 35, N'Watkins Glen International', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (634, CAST(N'2013-08-18' AS Date), 23, NULL, 35, N'Michigan International Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (635, CAST(N'2013-08-24' AS Date), 24, NULL, 35, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (636, CAST(N'2013-09-01' AS Date), 25, NULL, 35, N'Atlanta Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (637, CAST(N'2013-09-07' AS Date), 26, NULL, 35, N'Richmond Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (638, CAST(N'2013-09-15' AS Date), 27, NULL, 35, N'Chicagoland Speedway, Chicago', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (639, CAST(N'2013-09-22' AS Date), 28, NULL, 35, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (640, CAST(N'2013-09-29' AS Date), 29, NULL, 35, N'Dover International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (641, CAST(N'2013-10-06' AS Date), 30, NULL, 35, N'Kansas Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (642, CAST(N'2013-10-12' AS Date), 31, NULL, 35, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (643, CAST(N'2013-10-20' AS Date), 32, NULL, 35, N'Talladega Superspeedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 11, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (644, CAST(N'2013-10-27' AS Date), 33, NULL, 35, N'Martinsville Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (645, CAST(N'2013-11-03' AS Date), 34, NULL, 35, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (646, CAST(N'2013-11-10' AS Date), 35, NULL, 35, N'ISM Raceway, Phoenix', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (647, CAST(N'2013-11-17' AS Date), 36, NULL, 35, N'Homestead-Miami Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (648, CAST(N'2013-03-24' AS Date), 1, NULL, 36, N'Streets of St. Petersburg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (649, CAST(N'2013-04-07' AS Date), 2, NULL, 36, N'Barber Motorsports Park, Alabama', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (650, CAST(N'2013-04-21' AS Date), 3, NULL, 36, N'Streets of Long Beach', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 51, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (651, CAST(N'2013-05-05' AS Date), 4, NULL, 36, N'Santana Street Circuit, São Paulo', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (652, CAST(N'2013-05-26' AS Date), 5, N'Indianapolis 500', 36, N'Indianapolis Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 42, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (653, CAST(N'2013-06-01' AS Date), 6, NULL, 36, N'Belle Isle, Detroit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 15, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (654, CAST(N'2013-06-02' AS Date), 7, NULL, 36, N'Belle Isle, Detroit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (655, CAST(N'2013-06-08' AS Date), 8, NULL, 36, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (656, CAST(N'2013-06-15' AS Date), 9, NULL, 36, N'Milwaukee Mile', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (657, CAST(N'2013-06-23' AS Date), 10, NULL, 36, N'Iowa Speedway', N'Cancelled', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (658, CAST(N'2013-07-07' AS Date), 11, NULL, 36, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (659, CAST(N'2013-07-13' AS Date), 12, NULL, 36, N'Streets of Toronto', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (660, CAST(N'2013-07-14' AS Date), 13, NULL, 36, N'Streets of Toronto', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (661, CAST(N'2013-08-04' AS Date), 14, NULL, 36, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (662, CAST(N'2013-08-25' AS Date), 15, NULL, 36, N'Sonoma Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (663, CAST(N'2013-09-01' AS Date), 16, NULL, 36, N'Baltimore Street Circuit, Maryland', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 16, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (664, CAST(N'2013-10-05' AS Date), 17, NULL, 36, N'Reliant Park, Houston', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (665, CAST(N'2013-10-06' AS Date), 18, NULL, 36, N'Reliant Park, Houston', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (666, CAST(N'2013-10-19' AS Date), 19, NULL, 36, N'Auto Club Speedway, Fontana', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (667, CAST(N'2012-03-18' AS Date), 1, NULL, 37, N'Albert Park, Melbourne', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (668, CAST(N'2012-03-25' AS Date), 2, NULL, 37, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (669, CAST(N'2012-04-15' AS Date), 3, NULL, 37, N'Shanghai International Circuit', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 2, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (670, CAST(N'2012-04-22' AS Date), 4, NULL, 37, N'Bahrain International Circuit, Sakhir', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (671, CAST(N'2012-05-13' AS Date), 5, NULL, 37, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 3, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (672, CAST(N'2012-05-27' AS Date), 6, NULL, 37, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (673, CAST(N'2012-06-10' AS Date), 7, NULL, 37, N'Montreal Street Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (674, CAST(N'2012-06-24' AS Date), 8, NULL, 37, N'Valencia Street Circuit', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (675, CAST(N'2012-07-08' AS Date), 9, NULL, 37, N'Silverstone Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (676, CAST(N'2012-07-22' AS Date), 10, NULL, 37, N'Hockenheimring, Hockenheim', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (677, CAST(N'2012-07-29' AS Date), 11, NULL, 37, N'Hungaroring, Budapest', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (678, CAST(N'2012-09-02' AS Date), 12, NULL, 37, N'Spa-Francorchamps', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, N'I attended this race.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (679, CAST(N'2012-09-09' AS Date), 13, NULL, 37, N'Autodromo Nazionale Monza', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (680, CAST(N'2012-09-23' AS Date), 14, NULL, 37, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (681, CAST(N'2012-10-07' AS Date), 15, NULL, 37, N'Suzuka Circuit', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (682, CAST(N'2012-10-14' AS Date), 16, NULL, 37, N'Korea International Circuit, Yeongam', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (683, CAST(N'2012-10-28' AS Date), 17, NULL, 37, N'Buddh International Circuit, New Delhi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (684, CAST(N'2012-11-04' AS Date), 18, NULL, 37, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(10.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 50, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (685, CAST(N'2012-11-18' AS Date), 19, NULL, 37, N'Circuit of the Americas, Austin, Texas', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (686, CAST(N'2012-11-25' AS Date), 20, NULL, 37, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (687, CAST(N'2012-04-08' AS Date), 1, NULL, 38, N'Losail Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (688, CAST(N'2012-04-29' AS Date), 2, NULL, 38, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (689, CAST(N'2012-05-06' AS Date), 3, NULL, 38, N'Autódromo do Estoril', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (690, CAST(N'2012-05-20' AS Date), 4, NULL, 38, N'Circuit Bugatti, Le Mans', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (691, CAST(N'2012-06-03' AS Date), 5, NULL, 38, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (692, CAST(N'2012-06-17' AS Date), 6, NULL, 38, N'Silverstone Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (693, CAST(N'2012-06-30' AS Date), 7, NULL, 38, N'TT Circuit Assen', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (694, CAST(N'2012-07-08' AS Date), 8, NULL, 38, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (695, CAST(N'2012-07-15' AS Date), 9, NULL, 38, N'Mugello Circuit, Scarperia', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (696, CAST(N'2012-07-29' AS Date), 10, NULL, 38, N'Laguna Seca Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (697, CAST(N'2012-08-19' AS Date), 11, NULL, 38, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (698, CAST(N'2012-08-26' AS Date), 12, NULL, 38, N'Masaryk Circuit, Brno', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (699, CAST(N'2012-09-16' AS Date), 13, NULL, 38, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (700, CAST(N'2012-09-30' AS Date), 14, NULL, 38, N'Ciudad del Motor de Aragón', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (701, CAST(N'2012-10-14' AS Date), 15, NULL, 38, N'Twin Ring Motegi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (702, CAST(N'2012-10-21' AS Date), 16, NULL, 38, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (703, CAST(N'2012-10-28' AS Date), 17, NULL, 38, N'Phillip Island Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (704, CAST(N'2012-11-11' AS Date), 18, NULL, 38, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (705, CAST(N'2012-02-19' AS Date), 0, N'Budweiser Shootout', 39, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (706, CAST(N'2012-02-23' AS Date), 0, N'Gatorade Duel 1', 39, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (707, CAST(N'2012-02-23' AS Date), 0, N'Gatorade Duel 2', 39, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (708, CAST(N'2012-02-26' AS Date), 1, N'Daytona 500', 39, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (709, CAST(N'2012-03-04' AS Date), 2, NULL, 39, N'ISM Raceway, Phoenix', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (710, CAST(N'2012-03-11' AS Date), 3, NULL, 39, N'Las Vegas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (711, CAST(N'2012-03-18' AS Date), 4, NULL, 39, N'Bristol Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (712, CAST(N'2012-03-25' AS Date), 5, NULL, 39, N'Auto Club Speedway, Fontana', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (713, CAST(N'2012-04-01' AS Date), 6, NULL, 39, N'Martinsville Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (714, CAST(N'2012-04-15' AS Date), 7, NULL, 39, N'Texas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (715, CAST(N'2012-04-22' AS Date), 8, NULL, 39, N'Kansas Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (716, CAST(N'2012-04-29' AS Date), 9, NULL, 39, N'Richmond Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (717, CAST(N'2012-05-06' AS Date), 10, NULL, 39, N'Talladega Superspeedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (718, CAST(N'2012-05-13' AS Date), 11, NULL, 39, N'Darlington Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (719, CAST(N'2012-05-20' AS Date), 0, N'Sprint Showdown', 39, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (720, CAST(N'2012-05-20' AS Date), 0, N'Sprint All-Star Race', 39, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (721, CAST(N'2012-05-27' AS Date), 12, N'Coca-Cola 600', 39, N'Charlotte Motor Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (722, CAST(N'2012-06-03' AS Date), 13, NULL, 39, N'Dover International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (723, CAST(N'2012-06-10' AS Date), 14, NULL, 39, N'Pocono Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (724, CAST(N'2012-06-17' AS Date), 15, NULL, 39, N'Michigan International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (725, CAST(N'2012-06-24' AS Date), 16, NULL, 39, N'Sonoma Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (726, CAST(N'2012-07-01' AS Date), 17, NULL, 39, N'Kentucky Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (727, CAST(N'2012-07-07' AS Date), 18, NULL, 39, N'Daytona International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (728, CAST(N'2012-07-15' AS Date), 19, NULL, 39, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (729, CAST(N'2012-07-29' AS Date), 20, NULL, 39, N'Indianapolis Motor Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (730, CAST(N'2012-08-05' AS Date), 21, NULL, 39, N'Pocono Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (731, CAST(N'2012-08-12' AS Date), 22, NULL, 39, N'Watkins Glen International', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 48, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (732, CAST(N'2012-08-19' AS Date), 23, NULL, 39, N'Michigan International Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (733, CAST(N'2012-08-26' AS Date), 24, NULL, 39, N'Bristol Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (734, CAST(N'2012-09-02' AS Date), 25, NULL, 39, N'Atlanta Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (735, CAST(N'2012-09-09' AS Date), 26, NULL, 39, N'Richmond Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (736, CAST(N'2012-09-16' AS Date), 27, NULL, 39, N'Chicagoland Speedway, Chicago', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (737, CAST(N'2012-09-23' AS Date), 28, NULL, 39, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (738, CAST(N'2012-09-30' AS Date), 29, NULL, 39, N'Dover International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (739, CAST(N'2012-10-07' AS Date), 30, NULL, 39, N'Talladega Superspeedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (740, CAST(N'2012-10-14' AS Date), 31, NULL, 39, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 47, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (741, CAST(N'2012-10-21' AS Date), 32, NULL, 39, N'Kansas Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (742, CAST(N'2012-10-28' AS Date), 33, NULL, 39, N'Martinsville Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (743, CAST(N'2012-11-04' AS Date), 34, NULL, 39, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (744, CAST(N'2012-11-11' AS Date), 35, NULL, 39, N'ISM Raceway, Phoenix', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (745, CAST(N'2012-11-18' AS Date), 36, NULL, 39, N'Homestead-Miami Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (746, CAST(N'2012-03-25' AS Date), 1, NULL, 40, N'Streets of St. Petersburg', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (747, CAST(N'2012-04-01' AS Date), 2, NULL, 40, N'Barber Motorsports Park, Alabama', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (748, CAST(N'2012-04-15' AS Date), 3, NULL, 40, N'Streets of Long Beach', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (749, CAST(N'2012-04-29' AS Date), 4, NULL, 40, N'Santana Street Circuit, São Paulo', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (750, CAST(N'2012-05-27' AS Date), 5, N'Indianapolis 500', 40, N'Indianapolis Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (751, CAST(N'2012-06-03' AS Date), 6, NULL, 40, N'Belle Isle, Detroit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (752, CAST(N'2012-06-09' AS Date), 7, NULL, 40, N'Texas Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 15, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (753, CAST(N'2012-06-16' AS Date), 8, NULL, 40, N'Milwaukee Mile', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (754, CAST(N'2012-06-23' AS Date), 9, NULL, 40, N'Iowa Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (755, CAST(N'2012-07-08' AS Date), 10, NULL, 40, N'Streets of Toronto', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (756, CAST(N'2012-07-22' AS Date), 11, NULL, 40, N'Edmonton City Centre Airport', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (757, CAST(N'2012-08-05' AS Date), 12, NULL, 40, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (758, CAST(N'2012-08-26' AS Date), 13, NULL, 40, N'Sonoma Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (759, CAST(N'2012-09-02' AS Date), 14, NULL, 40, N'Baltimore Street Circuit, Maryland', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (760, CAST(N'2012-09-15' AS Date), 15, NULL, 40, N'Auto Club Speedway, Fontana', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 41, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (761, CAST(N'2011-03-13' AS Date), 1, NULL, 41, N'Bahrain International Circuit, Sakhir', N'Cancelled', CAST(0.0 AS Decimal(3, 1)), NULL, NULL, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (762, CAST(N'2011-03-27' AS Date), 2, NULL, 41, N'Albert Park, Melbourne', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (763, CAST(N'2011-04-10' AS Date), 3, NULL, 41, N'Sepang International Circuit, Kuala Lumpur', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (764, CAST(N'2011-04-17' AS Date), 4, NULL, 41, N'Shanghai International Circuit', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (765, CAST(N'2011-05-08' AS Date), 5, NULL, 41, N'Intercity Istanbul Park', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (766, CAST(N'2011-05-22' AS Date), 6, NULL, 41, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (767, CAST(N'2011-05-29' AS Date), 7, NULL, 41, N'Circuit de Monaco, Monte Carlo', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (768, CAST(N'2011-06-12' AS Date), 8, NULL, 41, N'Circuit Gilles Villeneuve, Montréal', N'Finished', CAST(9.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (769, CAST(N'2011-06-26' AS Date), 9, NULL, 41, N'Valencia Street Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (770, CAST(N'2011-07-10' AS Date), 10, NULL, 41, N'Silverstone Circuit', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 1, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (771, CAST(N'2011-07-24' AS Date), 11, NULL, 41, N'Nürburgring', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (772, CAST(N'2011-07-31' AS Date), 12, NULL, 41, N'Hungaroring, Budapest', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (773, CAST(N'2011-08-28' AS Date), 13, NULL, 41, N'Spa-Francorchamps', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (774, CAST(N'2011-09-11' AS Date), 14, NULL, 41, N'Autodromo Nazionale Monza', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (775, CAST(N'2011-09-25' AS Date), 15, NULL, 41, N'Marina Bay Street Circuit, Singapore', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (776, CAST(N'2011-10-09' AS Date), 16, NULL, 41, N'Suzuka Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (777, CAST(N'2011-10-16' AS Date), 17, NULL, 41, N'Korea International Circuit, Yeongam', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (778, CAST(N'2011-10-30' AS Date), 18, NULL, 41, N'Buddh International Circuit, New Delhi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (779, CAST(N'2011-11-13' AS Date), 19, NULL, 41, N'Yas Marina Circuit, Abu Dhabi', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 52, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (780, CAST(N'2011-11-27' AS Date), 20, NULL, 41, N'Autódromo José Carlos Pace, Interlagos', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 7, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (781, CAST(N'2011-03-20' AS Date), 1, NULL, 42, N'Losail Circuit', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (782, CAST(N'2011-04-03' AS Date), 2, NULL, 42, N'Circuito Permanente de Jerez, Jerez de la Frontera', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (783, CAST(N'2011-05-01' AS Date), 3, NULL, 42, N'Autódromo do Estoril', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (784, CAST(N'2011-05-15' AS Date), 4, NULL, 42, N'Circuit Bugatti, Le Mans', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (785, CAST(N'2011-06-05' AS Date), 5, NULL, 42, N'Circuit de Barcelona-Catalunya', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (786, CAST(N'2011-06-12' AS Date), 6, NULL, 42, N'Silverstone Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (787, CAST(N'2011-06-25' AS Date), 7, NULL, 42, N'TT Circuit Assen', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (788, CAST(N'2011-07-03' AS Date), 8, NULL, 42, N'Mugello Circuit, Scarperia', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (789, CAST(N'2011-07-17' AS Date), 9, NULL, 42, N'Sachsenring, Hohenstein-Ernstthal', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (790, CAST(N'2011-07-24' AS Date), 10, NULL, 42, N'Laguna Seca Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (791, CAST(N'2011-08-14' AS Date), 11, NULL, 42, N'Masaryk Circuit, Brno', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (792, CAST(N'2011-08-28' AS Date), 12, NULL, 42, N'Indianapolis Motor Speedway Road Course', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (793, CAST(N'2011-09-04' AS Date), 13, NULL, 42, N'Misano World Circuit Marco Simoncelli', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 20, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (794, CAST(N'2011-09-18' AS Date), 14, NULL, 42, N'Ciudad del Motor de Aragón', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (795, CAST(N'2011-10-02' AS Date), 15, NULL, 42, N'Twin Ring Motegi', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (796, CAST(N'2011-10-16' AS Date), 16, NULL, 42, N'Phillip Island Circuit', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (797, CAST(N'2011-10-23' AS Date), 17, NULL, 42, N'Sepang International Circuit, Kuala Lumpur', N'Stopped', CAST(0.0 AS Decimal(3, 1)), NULL, NULL, N'Stopped after fatal accident of Marco Simoncelli.')
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (798, CAST(N'2011-11-06' AS Date), 18, NULL, 42, N'Circuit Ricardo Tormo, Valencia', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 24, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (799, CAST(N'2011-02-12' AS Date), 0, N'Budweiser Shootout', 43, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (800, CAST(N'2011-02-17' AS Date), 0, N'Gatorade Duel 1', 43, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (801, CAST(N'2011-02-17' AS Date), 0, N'Gatorade Duel 2', 43, N'Daytona International Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (802, CAST(N'2011-02-20' AS Date), 1, N'Daytona 500', 43, N'Daytona International Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 13, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (803, CAST(N'2011-02-27' AS Date), 2, NULL, 43, N'ISM Raceway, Phoenix', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (804, CAST(N'2011-03-06' AS Date), 3, NULL, 43, N'Las Vegas Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (805, CAST(N'2011-03-20' AS Date), 4, NULL, 43, N'Bristol Motor Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (806, CAST(N'2011-03-27' AS Date), 5, NULL, 43, N'Auto Club Speedway, Fontana', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (807, CAST(N'2011-04-03' AS Date), 6, NULL, 43, N'Martinsville Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (808, CAST(N'2011-04-10' AS Date), 7, NULL, 43, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (809, CAST(N'2011-04-17' AS Date), 8, NULL, 43, N'Talladega Superspeedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (810, CAST(N'2011-04-30' AS Date), 9, NULL, 43, N'Richmond Raceway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (811, CAST(N'2011-05-07' AS Date), 10, NULL, 43, N'Darlington Raceway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 8, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (812, CAST(N'2011-05-15' AS Date), 11, NULL, 43, N'Dover International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (813, CAST(N'2011-05-21' AS Date), 0, N'Sprint Showdown', 43, N'Charlotte Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (814, CAST(N'2011-05-21' AS Date), 0, N'Sprint All-Star Race', 43, N'Charlotte Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (815, CAST(N'2011-05-29' AS Date), 12, N'Coca-Cola 600', 43, N'Charlotte Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (816, CAST(N'2011-06-05' AS Date), 13, NULL, 43, N'Kansas Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (817, CAST(N'2011-06-12' AS Date), 14, NULL, 43, N'Pocono Raceway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (818, CAST(N'2011-06-19' AS Date), 15, NULL, 43, N'Michigan International Speedway', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (819, CAST(N'2011-06-26' AS Date), 16, NULL, 43, N'Sonoma Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (820, CAST(N'2011-07-03' AS Date), 17, NULL, 43, N'Daytona International Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (821, CAST(N'2011-07-10' AS Date), 18, NULL, 43, N'Kentucky Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (822, CAST(N'2011-07-17' AS Date), 19, NULL, 43, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (823, CAST(N'2011-07-31' AS Date), 20, NULL, 43, N'Indianapolis Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (824, CAST(N'2011-08-07' AS Date), 21, NULL, 43, N'Pocono Raceway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (825, CAST(N'2011-08-14' AS Date), 22, NULL, 43, N'Watkins Glen International', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 48, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (826, CAST(N'2011-08-21' AS Date), 23, NULL, 43, N'Michigan International Speedway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 5, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (827, CAST(N'2011-08-28' AS Date), 24, NULL, 43, N'Bristol Motor Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (828, CAST(N'2011-09-04' AS Date), 25, NULL, 43, N'Atlanta Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (829, CAST(N'2011-09-11' AS Date), 26, NULL, 43, N'Richmond Raceway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (830, CAST(N'2011-09-18' AS Date), 27, NULL, 43, N'Chicagoland Speedway, Chicago', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (831, CAST(N'2011-09-25' AS Date), 28, NULL, 43, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (832, CAST(N'2011-10-02' AS Date), 29, NULL, 43, N'Dover International Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 10, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (833, CAST(N'2011-10-09' AS Date), 30, NULL, 43, N'Kansas Speedway', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (834, CAST(N'2011-10-16' AS Date), 31, NULL, 43, N'Charlotte Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 6, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (835, CAST(N'2011-10-23' AS Date), 32, NULL, 43, N'Talladega Superspeedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 12, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (836, CAST(N'2011-10-30' AS Date), 33, NULL, 43, N'Martinsville Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (837, CAST(N'2011-11-06' AS Date), 34, NULL, 43, N'Texas Motor Speedway', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (838, CAST(N'2011-11-13' AS Date), 35, NULL, 43, N'ISM Raceway, Phoenix', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 4, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (839, CAST(N'2011-11-20' AS Date), 36, NULL, 43, N'Homestead-Miami Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(3 AS Decimal(1, 0)), 9, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (840, CAST(N'2011-03-27' AS Date), 1, NULL, 44, N'Streets of St. Petersburg', N'Finished', CAST(4.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (841, CAST(N'2011-04-10' AS Date), 2, NULL, 44, N'Barber Motorsports Park, Alabama', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (842, CAST(N'2011-04-17' AS Date), 3, NULL, 44, N'Streets of Long Beach', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (843, CAST(N'2011-05-01' AS Date), 4, NULL, 44, N'Santana Street Circuit, São Paulo', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (844, CAST(N'2011-05-29' AS Date), 5, NULL, 44, N'Indianapolis Motor Speedway', N'Finished', CAST(8.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 54, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (845, CAST(N'2011-06-11' AS Date), 6, N'Twin 275s: Race 1', 44, N'Texas Motor Speedway', N'Cancelled', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (846, CAST(N'2011-06-11' AS Date), 7, N'Twin 275s: Race 2', 44, N'Texas Motor Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (847, CAST(N'2011-06-19' AS Date), 8, NULL, 44, N'Milwaukee Mile', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (848, CAST(N'2011-06-25' AS Date), 9, NULL, 44, N'Iowa Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (849, CAST(N'2011-07-10' AS Date), 10, NULL, 44, N'Streets of Toronto', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (850, CAST(N'2011-07-24' AS Date), 11, NULL, 44, N'Edmonton City Centre Airport', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (851, CAST(N'2011-08-07' AS Date), 12, NULL, 44, N'Mid-Ohio Sports Car Course, Lexington', N'Finished', CAST(5.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (852, CAST(N'2011-08-14' AS Date), 13, NULL, 44, N'New Hampshire Motor Speedway, Loudon', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(4 AS Decimal(1, 0)), 17, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (853, CAST(N'2011-08-28' AS Date), 14, NULL, 44, N'Sonoma Raceway', N'Finished', CAST(3.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (854, CAST(N'2011-09-04' AS Date), 15, NULL, 44, N'Baltimore Street Circuit, Maryland', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 14, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (855, CAST(N'2011-09-18' AS Date), 16, NULL, 44, N'Twin Ring Motegi', N'Finished', CAST(6.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 18, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (856, CAST(N'2011-10-02' AS Date), 17, NULL, 44, N'Kentucky Speedway', N'Finished', CAST(7.0 AS Decimal(3, 1)), CAST(0 AS Decimal(1, 0)), 53, NULL)
GO
INSERT [dbo].[Round] ([Id], [Date], [Number], [Name], [Season], [Venue], [Status], [Rating], [Rain], [WinningTeam], [Note]) VALUES (857, CAST(N'2011-10-16' AS Date), 18, NULL, 44, N'Las Vegas Motor Speedway', N'Stopped', CAST(0.0 AS Decimal(3, 1)), NULL, NULL, N'Stopped after fatal accident of Dan Wheldon.')
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
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (140, 35, 15)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (141, 36, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (142, 62, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (144, 63, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (145, 64, 52)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (148, 37, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (149, 65, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (150, 38, 15)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (151, 39, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (152, 40, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (153, 41, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (154, 42, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (155, 43, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (156, 44, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (157, 45, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (158, 46, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (159, 47, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (160, 48, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (161, 163, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (163, 238, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (164, 239, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (165, 240, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (166, 241, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (167, 242, 40)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (168, 243, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (169, 244, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (171, 245, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (172, 246, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (173, 247, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (174, 248, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (175, 249, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (176, 250, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (177, 251, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (178, 252, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (179, 253, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (180, 254, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (181, 255, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (182, 256, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (183, 257, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (184, 258, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (185, 259, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (186, 260, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (187, 261, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (188, 262, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (189, 263, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (190, 264, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (191, 265, 39)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (192, 266, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (193, 267, 57)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (194, 268, 56)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (195, 269, 33)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (196, 270, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (197, 271, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (198, 272, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (199, 273, 56)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (200, 274, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (201, 275, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (202, 276, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (203, 277, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (204, 279, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (205, 278, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (206, 280, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (207, 281, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (208, 282, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (209, 283, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (211, 284, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (212, 285, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (213, 286, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (214, 287, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (215, 288, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (216, 289, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (217, 290, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (218, 291, 15)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (219, 292, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (220, 293, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (221, 294, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (222, 295, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (223, 296, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (224, 297, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (225, 298, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (226, 299, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (227, 300, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (229, 301, 60)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (230, 302, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (231, 303, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (232, 304, 15)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (233, 305, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (234, 306, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (235, 307, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (236, 308, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (237, 309, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (238, 310, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (239, 311, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (240, 312, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (241, 313, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (242, 314, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (243, 315, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (244, 316, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (245, 325, 28)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (246, 317, 61)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (247, 318, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (248, 319, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (249, 320, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (250, 321, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (251, 322, 52)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (252, 323, 22)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (253, 324, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (254, 326, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (255, 327, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (256, 328, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (257, 329, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (258, 330, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (259, 331, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (260, 332, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (261, 333, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (263, 335, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (264, 336, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (265, 334, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (266, 337, 62)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (267, 338, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (268, 339, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (269, 340, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (270, 341, 63)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (271, 342, 63)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (272, 343, 64)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (273, 343, 65)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (274, 343, 66)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (275, 344, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (276, 344, 68)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (277, 344, 67)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (281, 345, 64)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (282, 345, 65)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (283, 345, 66)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (284, 346, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (285, 346, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (286, 346, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (290, 347, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (291, 347, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (292, 347, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (293, 348, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (294, 348, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (295, 348, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (296, 349, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (297, 349, 71)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (298, 349, 69)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (299, 350, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (300, 350, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (301, 350, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (302, 351, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (303, 351, 68)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (304, 351, 67)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (305, 352, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (306, 353, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (307, 354, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (308, 355, 73)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (309, 356, 63)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (310, 357, 74)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (311, 358, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (312, 359, 62)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (313, 360, 74)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (314, 361, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (315, 362, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (316, 363, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (317, 364, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (319, 366, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (322, 369, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (323, 368, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (325, 367, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (326, 365, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (327, 370, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (328, 371, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (329, 372, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (330, 373, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (331, 374, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (332, 375, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (333, 376, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (334, 377, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (335, 378, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (336, 379, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (337, 380, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (338, 381, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (339, 382, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (340, 383, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (341, 384, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (342, 385, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (343, 386, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (344, 387, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (345, 388, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (346, 389, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (347, 390, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (348, 391, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (349, 392, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (350, 393, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (351, 394, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (352, 395, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (353, 396, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (354, 397, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (355, 398, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (356, 399, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (357, 400, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (358, 401, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (359, 402, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (360, 403, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (361, 404, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (362, 405, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (363, 406, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (364, 407, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (365, 408, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (366, 409, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (367, 410, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (368, 411, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (369, 412, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (370, 413, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (371, 414, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (372, 415, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (373, 416, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (374, 417, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (375, 418, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (376, 419, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (377, 420, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (378, 421, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (379, 422, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (380, 423, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (381, 424, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (382, 425, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (383, 426, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (384, 427, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (385, 428, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (386, 429, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (387, 430, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (388, 431, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (389, 432, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (390, 433, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (391, 434, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (392, 435, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (393, 436, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (394, 437, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (395, 438, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (396, 439, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (397, 440, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (398, 441, 61)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (399, 442, 23)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (400, 443, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (401, 444, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (402, 445, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (403, 446, 61)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (405, 447, 77)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (406, 448, 22)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (407, 449, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (409, 450, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (410, 451, 28)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (411, 452, 22)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (412, 453, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (413, 454, 28)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (414, 455, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (415, 456, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (416, 122, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (417, 123, 19)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (418, 124, 11)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (420, 164, 43)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (421, 165, 43)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (422, 457, 79)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (423, 457, 80)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (424, 457, 81)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (428, 459, 48)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (429, 459, 83)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (430, 459, 82)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (431, 460, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (432, 460, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (433, 460, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (434, 461, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (435, 461, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (436, 461, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (437, 462, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (438, 462, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (439, 462, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (440, 463, 49)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (441, 463, 50)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (442, 463, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (443, 464, 64)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (444, 464, 65)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (445, 464, 66)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (446, 166, 45)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (447, 125, 18)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (448, 126, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (449, 167, 54)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (451, 221, 22)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (452, 6, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (454, 466, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (456, 468, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (457, 469, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (458, 470, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (459, 471, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (460, 472, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (461, 473, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (462, 474, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (463, 475, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (464, 476, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (465, 477, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (466, 478, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (467, 479, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (468, 480, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (469, 481, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (470, 482, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (471, 483, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (472, 465, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (473, 467, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (474, 484, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (475, 485, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (476, 486, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (478, 487, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (479, 488, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (480, 489, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (481, 490, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (482, 491, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (483, 492, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (484, 493, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (485, 494, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (486, 495, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (487, 496, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (488, 497, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (489, 499, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (490, 500, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (491, 501, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (492, 502, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (493, 503, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (494, 504, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (495, 506, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (496, 507, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (497, 508, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (498, 509, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (499, 510, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (500, 511, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (501, 512, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (502, 513, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (503, 514, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (504, 515, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (505, 516, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (506, 517, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (507, 518, 85)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (508, 519, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (509, 520, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (510, 521, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (511, 522, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (512, 523, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (513, 524, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (514, 525, 86)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (515, 526, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (516, 527, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (517, 528, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (518, 529, 87)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (519, 530, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (520, 531, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (521, 532, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (522, 533, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (523, 534, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (524, 535, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (525, 536, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (526, 537, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (527, 538, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (528, 539, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (529, 540, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (530, 541, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (531, 542, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (532, 543, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (533, 544, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (534, 545, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (535, 546, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (536, 547, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (537, 548, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (538, 549, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (539, 550, 30)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (540, 551, 88)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (541, 552, 89)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (542, 553, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (543, 554, 61)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (544, 555, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (545, 556, 22)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (546, 557, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (547, 558, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (548, 559, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (549, 560, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (550, 561, 31)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (551, 562, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (552, 562, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (553, 562, 90)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (554, 563, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (555, 563, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (556, 563, 90)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (557, 564, 79)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (558, 564, 80)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (559, 564, 81)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (560, 565, 79)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (561, 565, 80)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (562, 565, 81)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (563, 566, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (564, 566, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (565, 567, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (566, 567, 46)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (567, 568, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (568, 568, 69)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (569, 568, 91)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (570, 569, 64)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (571, 569, 65)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (572, 569, 66)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (573, 458, 79)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (574, 458, 80)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (575, 458, 81)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (576, 505, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (577, 202, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (578, 127, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (579, 128, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (580, 168, 45)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (581, 129, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (583, 130, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (585, 7, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (586, 222, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (588, 203, 56)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (589, 131, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (590, 175, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (591, 169, 44)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (592, 223, 52)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (593, 204, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (594, 176, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (595, 132, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (596, 177, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (597, 170, 45)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (598, 205, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (599, 194, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (600, 194, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (601, 194, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (602, 206, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (603, 171, 54)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (604, 133, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (605, 178, 7)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (606, 224, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (607, 134, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (608, 179, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (609, 195, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (610, 195, 41)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (611, 195, 47)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (612, 180, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (614, 571, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (615, 570, 93)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (616, 572, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (617, 573, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (618, 574, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (619, 575, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (620, 576, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (621, 577, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (622, 578, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (623, 579, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (624, 580, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (625, 581, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (626, 582, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (627, 583, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (628, 584, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (629, 585, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (630, 586, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (631, 587, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (632, 588, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (633, 589, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (634, 590, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (635, 591, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (636, 592, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (637, 593, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (638, 594, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (639, 595, 37)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (640, 596, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (641, 597, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (642, 598, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (643, 599, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (644, 600, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (645, 601, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (646, 602, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (647, 603, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (648, 604, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (649, 605, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (650, 606, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (651, 607, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (652, 608, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (653, 609, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (654, 610, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (655, 611, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (656, 612, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (657, 613, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (658, 614, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (659, 615, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (660, 616, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (661, 617, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (662, 618, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (663, 619, 94)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (664, 620, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (665, 621, 85)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (666, 622, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (667, 623, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (668, 624, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (669, 625, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (670, 626, 95)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (671, 627, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (672, 628, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (673, 629, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (674, 630, 96)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (675, 631, 14)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (676, 632, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (677, 633, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (678, 634, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (679, 635, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (680, 636, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (681, 637, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (682, 638, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (683, 639, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (684, 640, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (685, 641, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (686, 642, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (687, 643, 85)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (688, 644, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (689, 645, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (690, 646, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (691, 647, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (692, 648, 23)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (693, 649, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (694, 650, 27)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (695, 651, 23)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (696, 652, 31)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (697, 653, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (698, 654, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (699, 655, 30)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (700, 656, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (701, 657, 23)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (702, 658, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (703, 659, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (704, 660, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (705, 661, 97)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (706, 662, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (707, 663, 25)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (708, 664, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (709, 665, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (710, 666, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (711, 667, 98)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (712, 668, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (713, 669, 55)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (714, 670, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (715, 671, 99)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (716, 672, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (717, 673, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (718, 674, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (719, 675, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (720, 676, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (721, 677, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (723, 678, 98)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (724, 679, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (725, 680, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (726, 681, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (727, 682, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (728, 683, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (729, 684, 93)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (730, 685, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (731, 686, 98)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (732, 687, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (733, 688, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (734, 689, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (735, 690, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (736, 691, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (737, 692, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (738, 693, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (739, 694, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (740, 695, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (741, 696, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (742, 697, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (743, 698, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (744, 699, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (745, 700, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (746, 701, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (747, 702, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (748, 703, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (749, 704, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (750, 207, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (752, 706, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (753, 707, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (754, 708, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (755, 709, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (756, 710, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (757, 711, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (758, 712, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (759, 713, 14)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (760, 714, 95)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (761, 715, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (762, 716, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (763, 717, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (764, 718, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (765, 719, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (766, 720, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (767, 721, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (768, 722, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (769, 723, 10)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (770, 724, 58)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (771, 725, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (772, 726, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (773, 727, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (774, 728, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (775, 729, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (776, 730, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (777, 731, 101)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (778, 732, 95)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (779, 733, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (780, 734, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (781, 735, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (782, 736, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (783, 737, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (784, 738, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (785, 739, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (786, 740, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (787, 741, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (788, 742, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (789, 743, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (790, 744, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (791, 745, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (792, 746, 30)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (793, 747, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (794, 748, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (795, 749, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (796, 750, 102)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (797, 751, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (798, 752, 103)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (799, 753, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (800, 754, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (801, 755, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (802, 756, 30)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (803, 757, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (804, 758, 104)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (805, 759, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (806, 760, 88)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (807, 762, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (808, 763, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (809, 764, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (810, 765, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (811, 766, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (812, 767, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (813, 768, 98)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (814, 769, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (815, 770, 92)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (816, 771, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (817, 772, 98)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (818, 773, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (819, 774, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (820, 775, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (821, 776, 98)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (822, 777, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (823, 778, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (824, 779, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (825, 780, 72)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (826, 781, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (827, 782, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (828, 783, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (829, 784, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (830, 785, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (831, 786, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (832, 787, 105)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (833, 788, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (834, 789, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (835, 790, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (836, 791, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (837, 792, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (838, 793, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (839, 794, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (840, 795, 35)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (841, 796, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (842, 798, 100)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (843, 799, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (844, 800, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (845, 801, 106)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (846, 802, 107)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (848, 804, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (849, 805, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (850, 806, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (851, 807, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (852, 808, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (853, 809, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (854, 810, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (855, 811, 108)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (856, 812, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (857, 813, 94)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (858, 814, 21)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (859, 815, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (860, 816, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (861, 817, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (862, 818, 4)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (863, 819, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (864, 820, 94)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (865, 821, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (866, 822, 14)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (867, 823, 109)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (868, 824, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (869, 825, 101)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (870, 826, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (871, 827, 13)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (872, 828, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (873, 829, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (874, 830, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (875, 831, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (876, 832, 12)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (877, 833, 16)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (878, 834, 53)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (879, 835, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (880, 836, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (881, 837, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (882, 838, 8)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (883, 839, 59)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (884, 840, 102)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (885, 841, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (886, 842, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (887, 843, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (888, 844, 110)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (889, 845, 102)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (890, 846, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (891, 847, 102)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (892, 848, 111)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (893, 849, 102)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (894, 850, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (895, 851, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (896, 852, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (897, 853, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (898, 854, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (899, 855, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (900, 856, 88)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (901, 181, 40)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (902, 803, 76)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (903, 705, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (904, 208, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (905, 172, 42)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (906, 182, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (907, 209, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (908, 225, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (909, 135, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (910, 210, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (911, 173, 45)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (912, 183, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (913, 184, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (914, 136, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (915, 174, 45)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (916, 137, 87)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (917, 138, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (918, 211, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (919, 226, 26)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (920, 212, 38)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (921, 139, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (922, 227, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (923, 185, 1)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (925, 186, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (926, 196, 113)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (927, 196, 112)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (928, 196, 114)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (929, 214, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (930, 228, 78)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (931, 187, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (932, 140, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (933, 229, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (934, 141, 75)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (935, 215, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (936, 230, 24)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (937, 142, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (938, 188, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (939, 143, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (940, 189, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (941, 216, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (942, 144, 115)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (943, 231, 23)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (944, 217, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (945, 190, 93)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (946, 145, 9)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (947, 232, 29)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (948, 191, 40)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (949, 146, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (950, 218, 33)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (951, 219, 34)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (952, 233, 52)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (953, 147, 17)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (954, 192, 2)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (955, 148, 11)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (956, 220, 36)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (957, 197, 70)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (958, 197, 71)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (959, 197, 116)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (960, 149, 20)
GO
INSERT [dbo].[RoundWinner] ([Id], [Round], [Participant]) VALUES (961, 193, 2)
GO
SET IDENTITY_INSERT [dbo].[RoundWinner] OFF
GO
SET IDENTITY_INSERT [dbo].[Season] ON 
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (1, N'F1', N'', 2)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (3, N'NASCAR', N'Monster Energy Cup 2017', 8)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (6, N'F1', NULL, 2)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (7, N'Indycar', NULL, 14)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (8, N'MotoGP', N'', 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (9, N'FE', N'', 30)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (10, N'WEC', N'', 36)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (11, N'NASCAR', N'Monster Energy Cup 2018', NULL)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (12, N'FE', NULL, 31)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (13, N'WEC', NULL, NULL)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (14, N'MotoGP', NULL, 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (15, N'Indycar', NULL, NULL)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (16, N'F1', NULL, 2)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (17, N'MotoGP', NULL, 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (18, N'NASCAR', N'Sprint Cup Series 2016', 4)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (19, N'Indycar', NULL, 14)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (20, N'FE', NULL, 30)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (21, N'WEC', NULL, 36)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (22, N'FE', NULL, 30)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (23, N'F1', NULL, 2)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (24, N'MotoGP', NULL, 20)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (25, N'NASCAR', N'Sprint Cup Series 2015', 5)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (26, N'Indycar', NULL, 18)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (27, N'WEC', NULL, 36)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (28, N'F1', NULL, 2)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (29, N'MotoGP', NULL, 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (30, N'NASCAR', N'Sprint Cup Series 2014', 9)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (31, N'Indycar', NULL, 14)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (32, N'WEC', NULL, 37)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (33, N'F1', NULL, 7)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (34, N'MotoGP', NULL, 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (35, N'NASCAR', N'Sprint Cup Series 2013', 4)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (36, N'Indycar', NULL, 18)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (37, N'F1', NULL, 7)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (38, N'MotoGP', NULL, 20)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (39, N'NASCAR', N'Sprint Cup Series 2012', 10)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (40, N'Indycar', NULL, 17)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (41, N'F1', NULL, 7)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (42, N'MotoGP', NULL, 24)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (43, N'NASCAR', N'Sprint Cup Series 2011', 9)
GO
INSERT [dbo].[Season] ([Id], [Sport], [Label], [WinningTeam]) VALUES (44, N'Indycar', NULL, 18)
GO
SET IDENTITY_INSERT [dbo].[Season] OFF
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (1, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (1, 2, N'Mercedes AMG Petronas Motorsport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (1, 7, N'Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 6, N'Roush Fenway Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 8, N'Furniture Row Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 10, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 11, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 12, N'Richard Childress Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (3, 13, N'Wood Brothers Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (6, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (6, 2, N'Mercedes AMG Petronas Motorsport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (6, 7, N'Aston Martin Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (7, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (7, 15, N'Dale Coyne Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (7, 16, N'Schmidt Peterson Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (7, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (7, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (7, 19, N'Rahal Letterman Lanigan Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (8, 20, N'Movistar Yamaha MotoGP')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (8, 21, N'Ducati Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (8, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (9, 26, N'DS Virgin Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (9, 30, N'Renault e.Dams')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (9, 31, N'ABT Schaeffler Audi Sport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (9, 32, N'Mahindra Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (9, 34, N'Techeetah')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (10, 36, N'Porsche LMP Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (10, 37, N'Toyota Gazoo Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 8, N'Furniture Row Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 10, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 12, N'Richard Childress Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (11, 49, N'JTG Daugherty Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (12, 26, N'DS Virgin Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (12, 31, N'Audi Sport ABT Schaeffler')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (12, 32, N'Mahindra Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (12, 34, N'Techeetah')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (13, 37, N'Toyota Gazoo Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (13, 55, N'Rebellion Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (14, 20, N'Movistar Yamaha MotoGP')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (14, 21, N'Ducati Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (14, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (14, 25, N'LCR Honda')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (15, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (15, 15, N'Dale Coyne Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (15, 16, N'Schmidt Peterson Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (15, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (15, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (16, 2, N'Mercedes AMG Petronas Motorsport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (16, 7, N'Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (17, 20, N'Movistar Yamaha MotoGP')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (17, 21, N'Ducati Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (17, 22, N'Estrella Galicia 0,0 Marc VDS')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (17, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (17, 25, N'LCR Honda')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (17, 39, N'Team Suzuki Ecstar')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 8, N'Furniture Row Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 10, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 11, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (18, 40, N'Front Row Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (19, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (19, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (19, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (19, 19, N'Rahal Letterman Lanigan Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (19, 41, N'Ed Carpenter Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (19, 42, N'KVSH Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (20, 26, N'DS Virgin Racing Formula E Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (20, 29, N'Dragon Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (20, 30, N'Renault e.Dams')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (20, 31, N'ABT Schaeffler Audi Sport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (21, 36, N'Porsche Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (21, 37, N'Toyota Gazoo Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (21, 44, N'Audi Sport Team Joest')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (22, 26, N'Virgin Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (22, 29, N'Dragon Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (22, 30, N'Renault e.Dams')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (22, 31, N'Audi Sport ABT')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (22, 45, N'Amlin Aguri')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (22, 46, N'NEXTEV TCR')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (23, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (23, 2, N'Mercedes AMG Petronas F1 Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (24, 20, N'Movistar Yamaha MotoGP')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (24, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (25, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (25, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (25, 8, N'Furniture Row Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (25, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (25, 10, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (25, 47, N'Michael Waltrip Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 16, N'Schmidt Peterson Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 19, N'Rahal Letterman Lanigan Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 41, N'CFH Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (26, 42, N'KV Racing Technology')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (27, 36, N'Porsche Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (27, 37, N'Toyota Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (27, 44, N'Audi Sport Team Joest')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (28, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (28, 2, N'Mercedes AMG Petronas F1 Team	')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (28, 7, N'Infiniti Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (29, 20, N'Movistar Yamaha MotoGP')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (29, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 6, N'Roush Fenway Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 10, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 11, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 47, N'Michael Waltrip Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 48, N'Richard Petty Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (30, 49, N'JTG Daugherty Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 15, N'Dale Coyne Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 16, N'Schmidt Peterson Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 41, N'Ed Carpenter Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (31, 42, N'KV Racing Technology')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (32, 36, N'Porsche Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (32, 37, N'Toyota Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (32, 44, N'Audi Sport Team Joest')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (33, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (33, 2, N'Mercedes AMG Petronas F1 Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (33, 7, N'Infiniti Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (33, 50, N'Lotus F1 Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (34, 20, N'Yamaha Factory Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (34, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 6, N'Roush Fenway Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 10, N'Penske Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 11, N'Earnhardt Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 12, N'Richard Childress Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 40, N'Front Row Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (35, 47, N'Michael Waltrip Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 15, N'Dale Coyne Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 16, N'Schmidt Peterson Hamilton HP Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 42, N'KV Racing Technology')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (36, 51, N'A. J. Foyt Enterprises')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (37, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (37, 2, N'Mercedes AMG Petronas F1 Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (37, 3, N'Williams F1 Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (37, 7, N'Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (37, 50, N'Lotus F1 Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (37, 52, N'Vodafone McLaren Mercedes')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (38, 20, N'Yamaha Factory Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (38, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 6, N'Roush Fenway Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 10, N'Penske Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 12, N'Richard Childress Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 47, N'Michael Waltrip Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (39, 48, N'Richard Petty Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (40, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (40, 15, N'Dale Coyne Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (40, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (40, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (40, 41, N'Ed Carpenter Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (41, 1, N'Scuderia Ferrari')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (41, 7, N'Red Bull Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (41, 52, N'Vodafone McLaren Mercedes')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (42, 20, N'Yamaha Factory Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (42, 24, N'Repsol Honda Team')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 4, N'Hendrick Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 5, N'Joe Gibbs Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 6, N'Roush Fenway Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 8, N'Furniture Row Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 9, N'Stewart-Haas Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 10, N'Penske Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 12, N'Richard Childress Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 13, N'Wood Brothers Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (43, 48, N'Richard Petty Motorsports')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (44, 14, N'Team Penske')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (44, 17, N'Andretti Autosport')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (44, 18, N'Chip Ganassi Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (44, 53, N'Sarah Fisher Racing')
GO
INSERT [dbo].[SeasonEntry] ([Season], [Team], [Name]) VALUES (44, 54, N'Bryan Herta Autosport')
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
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (25, 7, 24)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (26, 3, 9)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (27, 16, 55)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (29, 18, 16)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (30, 19, 25)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (31, 20, 41)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (32, 21, 64)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (33, 21, 65)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (34, 21, 66)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (35, 22, 74)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (36, 23, 2)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (37, 24, 38)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (38, 25, 17)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (39, 26, 29)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (40, 27, 49)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (41, 27, 50)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (42, 27, 72)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (43, 28, 2)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (44, 29, 34)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (45, 30, 20)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (46, 31, 26)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (47, 32, 41)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (48, 32, 46)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (49, 33, 1)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (50, 34, 34)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (51, 17, 34)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (52, 35, 16)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (53, 36, 29)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (54, 37, 1)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (55, 38, 38)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (56, 39, 13)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (57, 40, 78)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (58, 41, 1)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (59, 42, 100)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (60, 43, 59)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (61, 44, 102)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (63, 12, 45)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (65, 14, 34)
GO
INSERT [dbo].[SeasonWinner] ([Id], [Season], [Participant]) VALUES (66, 6, 2)
GO
SET IDENTITY_INSERT [dbo].[SeasonWinner] OFF
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
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (11, N'Chip Ganassi Racing', N'NASCAR', N'US')
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
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (18, N'Chip Ganassi Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (19, N'Rahal Letterman Lanigan Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (20, N'Yamaha Factory Racing', N'MotoGP', N'JP')
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
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (26, N'Virgin Racing', N'FE', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (27, N'NextEV NIO', N'FE', N'CN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (28, N'Venturi Formula E', N'FE', N'MC')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (29, N'Dragon Racing', N'FE', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (30, N'Renault e.Dams', N'FE', N'FR')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (31, N'Audi Sport', N'FE', N'DE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (32, N'Mahindra Racing', N'FE', N'IN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (33, N'Panasonic Jaguar Racing', N'FE', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (34, N'Techeetah', N'FE', N'CN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (35, N'MS Amlin Andretti', N'FE', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (36, N'Porsche Team', N'WEC', N'DE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (37, N'Toyota Racing', N'WEC', N'JP')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (39, N'Suzuki MotoGP', N'MotoGP', N'JP')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (40, N'Front Row Motorsports', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (41, N'Ed Carpenter Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (42, N'KV Racing Technology', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (44, N'Audi Sport Team Joest', N'WEC', N'DE')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (45, N'Amlin Aguri', N'FE', N'JP')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (46, N'NIO', N'FE', N'CN')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (47, N'Michael Waltrip Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (48, N'Richard Petty Motorsports', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (49, N'JTG Daugherty Racing', N'NASCAR', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (50, N'Lotus F1 Team', N'F1', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (51, N'A. J. Foyt Enterprises', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (52, N'McLaren F1 Team', N'F1', N'GB')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (53, N'Sarah Fisher Racing', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (54, N'Bryan Herta Autosport', N'Indycar', N'US')
GO
INSERT [dbo].[Team] ([Id], [Name], [Sport], [Country]) VALUES (55, N'Rebellion Racing', N'WEC', N'CH')
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
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autódromo do Estoril', N'PT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autódromo Hermanos Rodríguez, Mexico City', N'MX')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autódromo Internacional Nelson Piquet', N'BR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autódromo José Carlos Pace, Interlagos', N'BR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Autodromo Nazionale Monza', N'IT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Bahrain International Circuit, Sakhir', N'BH')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Baku City Circuit', N'AZ')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Baltimore Street Circuit, Maryland', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Barber Motorsports Park, Alabama', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Battersea Park Street Circuit, London', N'GB')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Beijing Olympic Green Circuit', N'CN')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Belle Isle, Detroit', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Berlin Street Circuit', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Biscayne Bay Street Circuit, Miami', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Bristol Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Brooklyn Street Circuit, New York', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Buddh International Circuit, New Delhi', N'IN')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Buriram International Circuit', N'TH')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Charlotte Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Charlotte Motor Speedway Road Course', N'US')
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
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit Paul Ricard, Le Castellet', N'FR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuit Ricardo Tormo, Valencia', N'ES')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Circuito Cittadino dell''EUR, Rome', N'IT')
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
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Edmonton City Centre Airport', N'CA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Fuji Speedway', N'JP')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Gateway Motorsports Park, St. Louis', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Hockenheimring, Hockenheim', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Homestead-Miami Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Hong Kong Central Harbourfront Circuit', N'HK')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Hungaroring, Budapest', N'HU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Indianapolis Motor Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Indianapolis Motor Speedway Road Course', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Intercity Istanbul Park', N'TR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Iowa Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'ISM Raceway, Phoenix', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Kansas Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Kentucky Speedway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Korea International Circuit, Yeongam', N'KR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Laguna Seca Raceway', N'US')
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
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Milwaukee Mile', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Misano World Circuit Marco Simoncelli', N'SM')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Montreal Street Circuit', N'CA')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Moscow Street Circuit', N'RU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Mugello Circuit, Scarperia', N'IT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'New Hampshire Motor Speedway, Loudon', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'NOLA Motorsports Park, Louisiana', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Nürburgring', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Paris Street Circuit', N'FR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Phillip Island Circuit', N'AU')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Pocono Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Portland International Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Puerto Madero Street Circuit', N'AR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Punta del Este Street Circuit', N'UY')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Putrajaya Street Circuit', N'MY')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Red Bull Ring, Spielberg', N'AT')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Reliant Park, Houston', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Richmond Raceway', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Road America, Elkhart Lake', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Sachsenring, Hohenstein-Ernstthal', N'DE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Santana Street Circuit, São Paulo', N'BR')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Santiago Street Circuit', N'CL')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Sebring International Raceway', N'US')
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
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Valencia Street Circuit', N'ES')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Watkins Glen International', N'US')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Yas Marina Circuit, Abu Dhabi', N'AE')
GO
INSERT [dbo].[Venue] ([Name], [Country]) VALUES (N'Zürich Street Circuit', N'CH')
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
ALTER TABLE [dbo].[SeasonEntry]  WITH CHECK ADD  CONSTRAINT [FK_Season_SeasonEntry] FOREIGN KEY([Season])
REFERENCES [dbo].[Season] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[SeasonEntry] CHECK CONSTRAINT [FK_Season_SeasonEntry]
GO
ALTER TABLE [dbo].[SeasonEntry]  WITH CHECK ADD  CONSTRAINT [FK_Team_SeasonEntry] FOREIGN KEY([Team])
REFERENCES [dbo].[Team] ([Id])
GO
ALTER TABLE [dbo].[SeasonEntry] CHECK CONSTRAINT [FK_Team_SeasonEntry]
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