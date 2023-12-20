/****** Object:  Table [dbo].[DisabilitySupportType]    Script Date: 2023-12-20 10:51:15 AM ******/
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


