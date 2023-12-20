/****** Object:  Table [dbo].[Occupation]    Script Date: 2023-12-20 10:56:04 AM ******/
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

ALTER TABLE [dbo].[Occupation]  WITH NOCHECK ADD  CONSTRAINT [OccupationCheck1] CHECK  (([startDate]>='1970-01-01' AND [endDate]<='2023-10-26' AND [endDate]>[startDate]))
GO

ALTER TABLE [dbo].[Occupation] CHECK CONSTRAINT [OccupationCheck1]
GO


