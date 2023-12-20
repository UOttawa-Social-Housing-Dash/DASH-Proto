/****** Object:  Table [dbo].[HousingRegistry]    Script Date: 2023-12-20 10:53:54 AM ******/
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


