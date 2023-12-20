/****** Object:  Table [dbo].[Individual]    Script Date: 2023-12-20 10:55:03 AM ******/
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

ALTER TABLE [dbo].[Individual]  WITH NOCHECK ADD  CONSTRAINT [FK_Individual_Household] FOREIGN KEY([householdID])
REFERENCES [dbo].[Household] ([householdID])
GO

ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [FK_Individual_Household]
GO

ALTER TABLE [dbo].[Individual]  WITH NOCHECK ADD  CONSTRAINT [YOBCheck1] CHECK  (([yearOfBirth]>(1950) AND [yearOfBirth]<(2006)))
GO

ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [YOBCheck1]
GO

ALTER TABLE [dbo].[Individual]  WITH NOCHECK ADD  CONSTRAINT [YODCheck1] CHECK  (([yearOfDeath]>[yearOfBirth] AND [yearOfDeath]<(2023)))
GO

ALTER TABLE [dbo].[Individual] CHECK CONSTRAINT [YODCheck1]
GO


