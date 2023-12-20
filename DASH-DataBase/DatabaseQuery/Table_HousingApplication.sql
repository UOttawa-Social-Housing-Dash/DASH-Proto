/****** Object:  Table [dbo].[HousingApplication]    Script Date: 2023-12-20 10:53:12 AM ******/
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


