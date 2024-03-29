/****** Object:  Database [dash-project]    Script Date: 2023-12-20 11:44:25 AM ******/
CREATE DATABASE [dash-project]  (EDITION = 'Basic', SERVICE_OBJECTIVE = 'Basic', MAXSIZE = 2 GB) WITH CATALOG_COLLATION = SQL_Latin1_General_CP1_CI_AS, LEDGER = OFF;
GO
ALTER DATABASE [dash-project] SET COMPATIBILITY_LEVEL = 150
GO
ALTER DATABASE [dash-project] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dash-project] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dash-project] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dash-project] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dash-project] SET ARITHABORT OFF 
GO
ALTER DATABASE [dash-project] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dash-project] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dash-project] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dash-project] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dash-project] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dash-project] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dash-project] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dash-project] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dash-project] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [dash-project] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dash-project] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [dash-project] SET  MULTI_USER 
GO
ALTER DATABASE [dash-project] SET ENCRYPTION ON
GO
ALTER DATABASE [dash-project] SET QUERY_STORE = ON
GO
ALTER DATABASE [dash-project] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
/*** The scripts of database scoped configurations in Azure should be executed inside the target database connection. ***/
GO
-- ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;
GO
/****** Object:  UserDefinedFunction [dbo].[GetBirthYear]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- Create a scalar function to get the birth year
CREATE FUNCTION [dbo].[GetBirthYear] (@HouseholdID INT)
RETURNS INT
AS
BEGIN
    DECLARE @BirthYear INT

    SELECT @BirthYear = yearOfBirth
    FROM Individual
    WHERE householdID = @HouseholdID

    RETURN @BirthYear
END;
GO
/****** Object:  Table [dbo].[account]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account](
	[accountID] [int] NOT NULL,
	[loginEmail] [nvarchar](255) NOT NULL,
	[microsoftId] [nvarchar](255) NULL,
	[firstName] [nvarchar](255) NOT NULL,
	[lastName] [nvarchar](255) NOT NULL,
	[isAdmin] [bit] NOT NULL,
	[lastLogin] [date] NULL,
 CONSTRAINT [PK_account] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [UK_LoginEmail] UNIQUE NONCLUSTERED 
(
	[loginEmail] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DisabilitySupportType]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DisabilitySupportType](
	[DisabilitySupportTypeID] [int] NOT NULL,
	[Type] [varchar](100) NOT NULL,
 CONSTRAINT [PK_DisabilityType] PRIMARY KEY CLUSTERED 
(
	[DisabilitySupportTypeID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Household]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Household](
	[householdID] [bigint] NOT NULL,
 CONSTRAINT [PK_Household] PRIMARY KEY CLUSTERED 
(
	[householdID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HousingApplication]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HousingApplication](
	[applicationID] [bigint] NOT NULL,
	[householdID] [bigint] NOT NULL,
	[registryID] [bigint] NOT NULL,
	[state] [nvarchar](50) NOT NULL,
	[enterStateDate] [date] NOT NULL,
	[BeforeSettlePlaceType] [varchar](50) NULL,
	[AfterMoveOutPlaceType] [varchar](50) NULL,
 CONSTRAINT [PK_HousingApplication] PRIMARY KEY CLUSTERED 
(
	[applicationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HousingRegistry]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HousingRegistry](
	[registryID] [bigint] NOT NULL,
 CONSTRAINT [PK_HousingRegistry] PRIMARY KEY CLUSTERED 
(
	[registryID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[HousingUnit]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HousingUnit](
	[housingUnitID] [bigint] NOT NULL,
	[unitType] [varchar](50) NOT NULL,
	[registryID] [bigint] NOT NULL,
	[adress] [varchar](max) NOT NULL,
	[city] [varchar](100) NOT NULL,
	[provience] [varchar](100) NOT NULL,
	[postalCode] [varchar](10) NOT NULL,
	[numberOfBedroom] [smallint] NOT NULL,
	[wheelchairAccessible] [bit] NOT NULL,
 CONSTRAINT [PK_HousingUnit] PRIMARY KEY CLUSTERED 
(
	[housingUnitID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Individual]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Individual](
	[individualID] [bigint] NOT NULL,
	[yearOfBirth] [int] NOT NULL,
	[householdID] [bigint] NOT NULL,
	[CitizenshipStatus] [varchar](50) NOT NULL,
	[yearOfDeath] [int] NULL,
	[GenderType] [varchar](50) NOT NULL,
	[diverseStatus] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Individual] PRIMARY KEY CLUSTERED 
(
	[individualID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[IndividualDisability]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IndividualDisability](
	[IndividualDisabilityId] [bigint] NOT NULL,
	[individualID] [bigint] NOT NULL,
	[DisabilitySuportTypeID] [int] NOT NULL,
 CONSTRAINT [PK_IndividualDisability] PRIMARY KEY CLUSTERED 
(
	[IndividualDisabilityId] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Occupation]    Script Date: 2023-12-20 11:44:25 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Occupation](
	[registryID] [bigint] NOT NULL,
	[OccupationID] [bigint] NOT NULL,
	[startDate] [date] NOT NULL,
	[endDate] [date] NOT NULL,
	[householdID] [bigint] NOT NULL,
	[housingUnitID] [bigint] NOT NULL,
 CONSTRAINT [PK_Occupation] PRIMARY KEY CLUSTERED 
(
	[OccupationID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Index [IX_Individual]    Script Date: 2023-12-20 11:44:25 AM ******/
CREATE NONCLUSTERED INDEX [IX_Individual] ON [dbo].[Individual]
(
	[individualID] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, DROP_EXISTING = OFF, ONLINE = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account] ADD  CONSTRAINT [DF_account_isAdmin]  DEFAULT ((0)) FOR [isAdmin]
GO
ALTER TABLE [dbo].[HousingApplication]  WITH NOCHECK ADD  CONSTRAINT [FK_HousingApplication_Household] FOREIGN KEY([householdID])
REFERENCES [dbo].[Household] ([householdID])
GO
ALTER TABLE [dbo].[HousingApplication] CHECK CONSTRAINT [FK_HousingApplication_Household]
GO
ALTER TABLE [dbo].[HousingApplication]  WITH NOCHECK ADD  CONSTRAINT [FK_HousingApplication_HousingRegistry] FOREIGN KEY([registryID])
REFERENCES [dbo].[HousingRegistry] ([registryID])
GO
ALTER TABLE [dbo].[HousingApplication] CHECK CONSTRAINT [FK_HousingApplication_HousingRegistry]
GO
ALTER TABLE [dbo].[HousingUnit]  WITH NOCHECK ADD  CONSTRAINT [FK_HousingUnit_Registry] FOREIGN KEY([registryID])
REFERENCES [dbo].[HousingRegistry] ([registryID])
GO
ALTER TABLE [dbo].[HousingUnit] CHECK CONSTRAINT [FK_HousingUnit_Registry]
GO
ALTER TABLE [dbo].[Individual]  WITH NOCHECK ADD  CONSTRAINT [FK_Individual_Household] FOREIGN KEY([householdID])
REFERENCES [dbo].[Household] ([householdID])
GO
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [FK_Individual_Household]
GO
ALTER TABLE [dbo].[IndividualDisability]  WITH NOCHECK ADD  CONSTRAINT [FK_IndividualDisability_Individual] FOREIGN KEY([individualID])
REFERENCES [dbo].[Individual] ([individualID])
GO
ALTER TABLE [dbo].[IndividualDisability] CHECK CONSTRAINT [FK_IndividualDisability_Individual]
GO
ALTER TABLE [dbo].[IndividualDisability]  WITH NOCHECK ADD  CONSTRAINT [FK_IndividualDisability_Type] FOREIGN KEY([DisabilitySuportTypeID])
REFERENCES [dbo].[DisabilitySupportType] ([DisabilitySupportTypeID])
GO
ALTER TABLE [dbo].[IndividualDisability] CHECK CONSTRAINT [FK_IndividualDisability_Type]
GO
ALTER TABLE [dbo].[Occupation]  WITH NOCHECK ADD  CONSTRAINT [FK_Occupation_Household] FOREIGN KEY([householdID])
REFERENCES [dbo].[Household] ([householdID])
GO
ALTER TABLE [dbo].[Occupation] CHECK CONSTRAINT [FK_Occupation_Household]
GO
ALTER TABLE [dbo].[Occupation]  WITH NOCHECK ADD  CONSTRAINT [FK_Occupation_HousingUnit] FOREIGN KEY([housingUnitID])
REFERENCES [dbo].[HousingUnit] ([housingUnitID])
GO
ALTER TABLE [dbo].[Occupation] CHECK CONSTRAINT [FK_Occupation_HousingUnit]
GO
ALTER TABLE [dbo].[Occupation]  WITH NOCHECK ADD  CONSTRAINT [FK_Occupation_registry] FOREIGN KEY([registryID])
REFERENCES [dbo].[HousingRegistry] ([registryID])
GO
ALTER TABLE [dbo].[Occupation] CHECK CONSTRAINT [FK_Occupation_registry]
GO
ALTER TABLE [dbo].[HousingUnit]  WITH NOCHECK ADD  CONSTRAINT [CHK_City_Province] CHECK  (([provience]='Ontario' AND ([city]='Brampton' OR [city]='Windsor' OR [city]='Kitchener' OR [city]='London' OR [city]='Mississauga' OR [city]='Toronto' OR [city]='Ottawa') OR [provience]='Quebec' AND ([city]='Longueuil' OR [city]='Drummondville' OR [city]='Trois-Rivieres' OR [city]='Sherbrooke' OR [city]='Laval' OR [city]='Gatineau' OR [city]='Montreal') OR [provience]='Alberta' AND ([city]='Airdrie' OR [city]='St. Albert' OR [city]='Grande Prairie' OR [city]='Red Deer' OR [city]='Lethbridge' OR [city]='Edmonton' OR [city]='Calgary') OR [provience]='British Columbia' AND ([city]='Kelowna' OR [city]='Kamloops' OR [city]='Burnaby' OR [city]='Richmond' OR [city]='Surrey' OR [city]='Victoria' OR [city]='Vancouver') OR [provience]='Manitoba' AND ([city]='Winkler' OR [city]='Springfield' OR [city]='Steinbach' OR [city]='Brandon' OR [city]='Winnipeg') OR [provience]='New Brunswick' AND ([city]='Bathurst' OR [city]='Fredericton' OR [city]='Moncton' OR [city]='Saint John') OR [provience]='Newfoundland and Labrador' AND ([city]='Stephenville' OR [city]='Mount Pearl' OR [city]='Labrador City') OR [provience]='Northwest Territories' AND ([city]='Fort Simpson' OR [city]='Fort Smith' OR [city]='Yellowknife') OR [provience]='Nova Scotia' AND ([city]='Yarmouth' OR [city]='Shelburne' OR [city]='New Glasgow' OR [city]='Kentville' OR [city]='Halifax') OR [provience]='Nunavut' AND ([city]='Cambridge Bay' OR [city]='Kugluktuk' OR [city]='Iqaluit') OR [provience]='Prince Edward Island' AND ([city]='Cornwall' OR [city]='Kensington' OR [city]='Charlottetown') OR [provience]='Saskatchewan' AND ([city]='Warman' OR [city]='Estevan' OR [city]='Yorkton' OR [city]='Regina' OR [city]='Saskatoon') OR [provience]='Yukon Territory' AND ([city]='Teslin' OR [city]='Dawson City' OR [city]='Whitehorse')))
GO
ALTER TABLE [dbo].[HousingUnit] CHECK CONSTRAINT [CHK_City_Province]
GO
ALTER TABLE [dbo].[Individual]  WITH NOCHECK ADD  CONSTRAINT [YOBCheck1] CHECK  (([yearOfBirth]>(1950) AND [yearOfBirth]<(2006)))
GO
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [YOBCheck1]
GO
ALTER TABLE [dbo].[Individual]  WITH NOCHECK ADD  CONSTRAINT [YODCheck1] CHECK  (([yearOfDeath]>[yearOfBirth] AND [yearOfDeath]<(2023)))
GO
ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [YODCheck1]
GO
ALTER TABLE [dbo].[Occupation]  WITH NOCHECK ADD  CONSTRAINT [OccupationCheck1] CHECK  (([startDate]>='1970-01-01' AND [endDate]<='2023-10-26' AND [endDate]>[startDate]))
GO
ALTER TABLE [dbo].[Occupation] CHECK CONSTRAINT [OccupationCheck1]
GO
ALTER DATABASE [dash-project] SET  READ_WRITE 
GO
