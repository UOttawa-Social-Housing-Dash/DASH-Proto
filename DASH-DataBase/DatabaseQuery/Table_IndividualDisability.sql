/****** Object:  Table [dbo].[IndividualDisability]    Script Date: 2023-12-20 10:55:31 AM ******/
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


