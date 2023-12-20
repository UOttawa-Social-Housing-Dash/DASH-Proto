/****** Object:  Table [dbo].[HousingUnit]    Script Date: 2023-12-20 10:54:34 AM ******/
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

ALTER TABLE [dbo].[HousingUnit]  WITH NOCHECK ADD  CONSTRAINT [FK_HousingUnit_Registry] FOREIGN KEY([registryID])
REFERENCES [dbo].[HousingRegistry] ([registryID])
GO

ALTER TABLE [dbo].[HousingUnit] CHECK CONSTRAINT [FK_HousingUnit_Registry]
GO

ALTER TABLE [dbo].[HousingUnit]  WITH NOCHECK ADD  CONSTRAINT [CHK_City_Province] CHECK  (([provience]='Ontario' AND ([city]='Brampton' OR [city]='Windsor' OR [city]='Kitchener' OR [city]='London' OR [city]='Mississauga' OR [city]='Toronto' OR [city]='Ottawa') OR [provience]='Quebec' AND ([city]='Longueuil' OR [city]='Drummondville' OR [city]='Trois-Rivieres' OR [city]='Sherbrooke' OR [city]='Laval' OR [city]='Gatineau' OR [city]='Montreal') OR [provience]='Alberta' AND ([city]='Airdrie' OR [city]='St. Albert' OR [city]='Grande Prairie' OR [city]='Red Deer' OR [city]='Lethbridge' OR [city]='Edmonton' OR [city]='Calgary') OR [provience]='British Columbia' AND ([city]='Kelowna' OR [city]='Kamloops' OR [city]='Burnaby' OR [city]='Richmond' OR [city]='Surrey' OR [city]='Victoria' OR [city]='Vancouver') OR [provience]='Manitoba' AND ([city]='Winkler' OR [city]='Springfield' OR [city]='Steinbach' OR [city]='Brandon' OR [city]='Winnipeg') OR [provience]='New Brunswick' AND ([city]='Bathurst' OR [city]='Fredericton' OR [city]='Moncton' OR [city]='Saint John') OR [provience]='Newfoundland and Labrador' AND ([city]='Stephenville' OR [city]='Mount Pearl' OR [city]='Labrador City') OR [provience]='Northwest Territories' AND ([city]='Fort Simpson' OR [city]='Fort Smith' OR [city]='Yellowknife') OR [provience]='Nova Scotia' AND ([city]='Yarmouth' OR [city]='Shelburne' OR [city]='New Glasgow' OR [city]='Kentville' OR [city]='Halifax') OR [provience]='Nunavut' AND ([city]='Cambridge Bay' OR [city]='Kugluktuk' OR [city]='Iqaluit') OR [provience]='Prince Edward Island' AND ([city]='Cornwall' OR [city]='Kensington' OR [city]='Charlottetown') OR [provience]='Saskatchewan' AND ([city]='Warman' OR [city]='Estevan' OR [city]='Yorkton' OR [city]='Regina' OR [city]='Saskatoon') OR [provience]='Yukon Territory' AND ([city]='Teslin' OR [city]='Dawson City' OR [city]='Whitehorse')))
GO

ALTER TABLE [dbo].[HousingUnit] CHECK CONSTRAINT [CHK_City_Province]
GO


