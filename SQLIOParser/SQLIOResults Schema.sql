/****** Object:  Table [dbo].[SQLIOResults] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
DROP TABLE [dbo].[SQLIOResults]
GO
CREATE TABLE [dbo].[SQLIOResults](
	[ComputerName] [varchar](255) NULL,
	[TestDescription] [varchar](255) NULL,
	[SQLIOCommandLine] [varchar](255) NULL,	
	[SQLIOFileName] [varchar](255) NULL,	
	[ParameterFile] [varchar](255) NULL,
	[TestDate] [datetime] NULL,
	[RunTime] [int] NULL,
	[CoolOff] [int] NULL,
	[NumberOfFiles] [int] NULL,
	[FileSize] [int] NULL,
	[NumberOfThreads] [int] NULL,
	[IOOperation] [varchar](255) NULL,
	[IOSize] [varchar](255) NULL,
	[IOOutstanding] [int] NULL,
	[IOType] [varchar](255) NULL,
	[IOSec] [decimal](18, 2) NULL,
	[MBSec] [decimal](18, 2) NULL,
	[MinLatency] [int] NULL,
	[AvgLatency] [int] NULL,
	[MaxLatency] [int] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


