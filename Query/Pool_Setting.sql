USE [ADT]
GO
/****** Object:  Table [dbo].[Pool_Setting]    Script Date: 9/9/2020 9:38:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pool_Setting](
	[Name] [varchar](max) NULL,
	[Value] [varchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[Pool_Setting] ([Name], [Value]) VALUES (N'Pool_Size', N'50')
GO
