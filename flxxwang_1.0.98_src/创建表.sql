USE [Flxxwang]
GO
/****** Object:  Table [dbo].[Info_TicketTrain]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_TicketTrain](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[StartStation] [nvarchar](32) NULL,
	[EndStation] [nvarchar](32) NULL,
	[Number] [nvarchar](16) NULL,
	[Time] [smalldatetime] NULL,
	[StartTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
	[Count] [smallint] NOT NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_TicketTrain] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_TicketTrain] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_TicketTrain] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_TicketTrain] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_TicketTrain] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_TicketTrain] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_TicketPleasure]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_TicketPleasure](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Type] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_TicketPleasure] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_TicketPleasure] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_TicketPleasure] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_TicketPleasure] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_TicketPleasure] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_TicketPleasure] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_TicketPerform]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_TicketPerform](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Time] [smalldatetime] NOT NULL,
	[Facility] [nvarchar](64) NULL,
	[Count] [int] NOT NULL,
	[Seat] [nvarchar](64) NULL,
	[PriceOriginal] [int] NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_TicketPerform] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_TicketPerform] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_TicketPerform] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_TicketPerform] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_TicketPerform] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_TicketPerform] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_TicketOther]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_TicketOther](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Type] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_TicketOther] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_TicketOther] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_TicketOther] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_TicketOther] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_TicketOther] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_TicketOther] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_TicketCard]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_TicketCard](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[ExpiryDate] [smalldatetime] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_TicketCard] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_TicketCard] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_TicketCard] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_TicketCard] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_TicketCard] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_TicketCard] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_TicketAirplane]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_TicketAirplane](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Address] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_TicketAirplane] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_TicketAirplane] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_TicketAirplane] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_TicketAirplane] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_TicketAirplane] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_TicketAirplane] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Stat_Click]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Stat_Click](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](max) NULL,
	[Text] [nvarchar](128) NULL,
	[IP] [nvarchar](50) NULL,
	[Address] [nvarchar](255) NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Info_Stat_Click] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Spider]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Spider](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Url] [nvarchar](256) NULL,
	[SearchEngine] [tinyint] NOT NULL,
	[UserAgent] [nvarchar](128) NULL,
	[WebSite] [tinyint] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_Spider] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleSwap]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleSwap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Want] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleSwap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleSwap] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleSwap] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleSwap] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleSwap] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleSwap] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'我有' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SaleSwap', @level2type=N'COLUMN',@level2name=N'Title'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'想换' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_SaleSwap', @level2type=N'COLUMN',@level2name=N'Want'
GO
/****** Object:  Table [dbo].[Info_SaleSex]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleSex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[District] [nvarchar](64) NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleSex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleSex] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleSex] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleSex] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleSex] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleSex] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleService]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Tags] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleService] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleService] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleService] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleService] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleService] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleOther]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleOther](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleOther] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleOther] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleOther] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleOther] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleOther] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleOther] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleOffice]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleOffice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleOffice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleOffice] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleOffice] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleOffice] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleOffice] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleOffice] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleMobileNumber]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleMobileNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Number] [nvarchar](32) NULL,
	[Is3G] [bit] NOT NULL,
	[Character] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleMobileNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleMobileNumber] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleMobileNumber] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleMobileNumber] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleMobileNumber] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleMobileNumber] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleMobile]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleMobile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Tag] [tinyint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleMobile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleMobile] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleMobile] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleMobile] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleMobile] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleMobile] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleHome]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleHome](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleHome] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleHome] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleHome] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleHome] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleHome] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleHome] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleGame]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleGame](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleGame] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleGame] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleGame] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleGame] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleGame] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleGame] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleFacial]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleFacial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleFacial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleFacial] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleFacial] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleFacial] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleFacial] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleFacial] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleEquipment]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleEquipment](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleEquipment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleEquipment] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleEquipment] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleEquipment] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleEquipment] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleEquipment] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleElectric]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleElectric](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleElectric] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleElectric] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleElectric] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleElectric] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleElectric] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleElectric] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleDigital]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleDigital](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleDigital] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleDigital] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleDigital] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleDigital] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleDigital] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleDigital] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleComputer]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleComputer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleComputer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleComputer] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleComputer] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleComputer] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleComputer] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleComputer] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleCommunication]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleCommunication](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleCommunication] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleCommunication] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleCommunication] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleCommunication] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleCommunication] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleCommunication] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleClothing]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleClothing](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleClothing] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleClothing] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleClothing] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleClothing] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleClothing] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleClothing] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleBook]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleBook] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleBook] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleBook] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleBook] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleBook] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleBaby]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleBaby](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleBaby] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleBaby] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleBaby] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleBaby] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleBaby] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleBaby] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleAthletics]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleAthletics](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleAthletics] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleAthletics] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleAthletics] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleAthletics] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleAthletics] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleAthletics] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_SaleArt]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_SaleArt](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Price] [int] NOT NULL,
	[Pictures] [ntext] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_SaleArt] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_SaleArt] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_SaleArt] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_SaleArt] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_SaleArt] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_SaleArt] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_ResumeFavorite]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_ResumeFavorite](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ResumeId] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_ResumeFavorite] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Resume]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Resume](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[ResumeType] [tinyint] NOT NULL,
	[Name] [nvarchar](64) NULL,
	[JobType] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NULL,
	[JobName] [nvarchar](64) NULL,
	[WageMin] [int] NOT NULL,
	[WageMax] [int] NOT NULL,
	[AboutMe] [ntext] NULL,
	[RealName] [nvarchar](16) NULL,
	[Sex] [bit] NULL,
	[BirthDay] [smalldatetime] NULL,
	[Education] [tinyint] NOT NULL,
	[WorkYearStart] [tinyint] NOT NULL,
	[WorkYearEnd] [tinyint] NOT NULL,
	[Phone] [ntext] NULL,
	[Email] [nvarchar](128) NULL,
	[NowCityId] [smallint] NOT NULL,
	[NowRegionId] [smallint] NULL,
	[NowCircleId] [smallint] NULL,
	[PublicState] [tinyint] NOT NULL,
	[EduBackgrounds] [ntext] NULL,
	[WorkExperiences] [ntext] NULL,
	[Certificates] [ntext] NULL,
	[LanguageSkills] [ntext] NULL,
	[FreeTimes] [ntext] NULL,
	[IsStudent] [bit] NULL,
	[Pictures] [ntext] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Source] [bigint] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_Resume] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_Resume] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_Resume] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_Resume] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_Resume] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Recruit]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Recruit](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CompanyId] [int] NOT NULL,
	[JobType] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[JobName] [nvarchar](64) NULL,
	[RecruitCount] [smallint] NOT NULL,
	[WageMin] [int] NOT NULL,
	[WageMax] [int] NOT NULL,
	[Education] [tinyint] NOT NULL,
	[WorkYearStart] [tinyint] NOT NULL,
	[WorkYearEnd] [tinyint] NOT NULL,
	[SexRequire] [bit] NULL,
	[WorkTimes] [ntext] NULL,
	[JobDescription] [ntext] NULL,
	[RecvEmail] [nvarchar](128) NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[WorkType] [tinyint] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_Recruit] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_Recruit] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_Recruit] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_Recruit] 
(
	[CityId] ASC,
	[JobType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_Recruit] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_Recruit] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Profile]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Profile](
	[UserId] [int] NOT NULL,
	[Credit] [int] NULL,
	[Point] [int] NULL,
	[Auth] [nvarchar](128) NULL,
	[TId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PicPhone]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PicPhone](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Pic] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
 CONSTRAINT [PK_Info_PicPhone] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PetService]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PetService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_PetService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_PetService] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_PetService] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_PetService] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_PetService] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_PetService] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PetGive]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PetGive](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_PetGive] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_PetGive] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_PetGive] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_PetGive] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_PetGive] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_PetGive] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PetFood]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PetFood](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag] [tinyint] NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_PetFood] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_PetFood] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_PetFood] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_PetFood] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_PetFood] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_PetFood] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PetDog]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PetDog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Sex] [bit] NOT NULL,
	[Age] [tinyint] NULL,
	[AgeUnit] [nvarchar](4) NULL,
	[Price] [int] NULL,
	[Bacterin] [nvarchar](8) NULL,
	[Descent] [bit] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_PetDog] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_PetDog] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_PetDog] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_PetDog] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_PetDog] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_PetDog] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PetCat]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PetCat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_PetCat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_PetCat] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_PetCat] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_PetCat] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_PetCat] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_PetCat] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_PetBird]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_PetBird](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag] [tinyint] NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_PetBird] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_PetBird] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_PetBird] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_PetBird] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_PetBird] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_PetBird] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_KeywordStat]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_KeywordStat](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[KeywordId] [int] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[Total] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_KeywordStat] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_KeywordStat] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Keyword]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Keyword](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Key] [nvarchar](64) NULL,
	[ParentCode] [nvarchar](32) NULL,
	[Code] [nvarchar](32) NULL,
	[ObjType] [tinyint] NULL,
	[Tag] [tinyint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_Keyword] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_JobSeek]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_JobSeek](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[JobType] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[WorkType] [tinyint] NOT NULL,
	[JobName] [nvarchar](64) NULL,
	[WageMin] [smallint] NOT NULL,
	[WageMax] [smallint] NOT NULL,
	[AboutMe] [ntext] NULL,
	[ResumeId] [int] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Source] [bigint] NULL,
	[Age] [tinyint] NULL,
	[Sex] [bit] NULL,
	[Education] [tinyint] NOT NULL,
	[WorkYearStart] [smallint] NOT NULL,
	[WorkYearEnd] [smallint] NOT NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_JobSeek] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_JobSeek] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_JobSeek] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_JobSeek] 
(
	[CityId] ASC,
	[JobType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_JobSeek] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_JobSeek] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_JobApply]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_JobApply](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[ResumeId] [int] NOT NULL,
	[RecruitId] [int] NOT NULL,
	[RecruitUserId] [int] NOT NULL,
	[CompanyId] [int] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_JobApply] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Interview]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Interview](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[JobSeekId] [int] NOT NULL,
	[ResumeId] [int] NOT NULL,
	[ToUserId] [int] NOT NULL,
	[Content] [ntext] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_Interview] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_HouseShort]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseShort](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District1] [nvarchar](64) NULL,
	[District2] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Lease] [tinyint] NULL,
	[Price] [smallint] NOT NULL,
	[Price2] [smallint] NOT NULL,
	[PriceUnit] [tinyint] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseShort] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseShort] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseShort] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseShort] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseShort] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseShort] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:出租,2:求租' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseShort', @level2type=N'COLUMN',@level2name=N'Type'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1:元/天,2:元/月' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseShort', @level2type=N'COLUMN',@level2name=N'PriceUnit'
GO
/****** Object:  Table [dbo].[Info_HouseShop]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseShop](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District1] [nvarchar](64) NULL,
	[District2] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Management] [nvarchar](128) NULL,
	[Price] [real] NOT NULL,
	[Price2] [real] NULL,
	[PriceTransfer] [real] NULL,
	[PriceUnit] [tinyint] NULL,
	[Area] [smallint] NOT NULL,
	[Area2] [smallint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseShop] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseShop] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseShop] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseShop] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseShop] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseShop] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转让费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseShop', @level2type=N'COLUMN',@level2name=N'PriceTransfer'
GO
/****** Object:  Table [dbo].[Info_HouseShare]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseShare](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[Address] [nvarchar](128) NULL,
	[Room] [tinyint] NOT NULL,
	[Parlor] [tinyint] NOT NULL,
	[Toilet] [tinyint] NOT NULL,
	[Floor] [smallint] NOT NULL,
	[FloorTotal] [tinyint] NOT NULL,
	[Area] [smallint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[FitType] [nvarchar](32) NULL,
	[Toward] [nvarchar](16) NULL,
	[Price] [int] NOT NULL,
	[PayWay] [nvarchar](32) NULL,
	[Bed] [bit] NOT NULL,
	[WaterHeater] [bit] NOT NULL,
	[WashingMachine] [bit] NOT NULL,
	[AirConditioner] [bit] NOT NULL,
	[Icebox] [bit] NOT NULL,
	[Television] [bit] NOT NULL,
	[Broadband] [bit] NOT NULL,
	[Bedroom] [nvarchar](64) NULL,
	[HireLimit] [nvarchar](32) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseShare] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseShare] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseShare] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseShare] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseShare] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseShare] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_HouseSecond]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseSecond](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[District2] [nvarchar](64) NULL,
	[Address] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[FitType] [nvarchar](32) NULL,
	[Toward] [nvarchar](16) NULL,
	[Right] [nvarchar](64) NULL,
	[Room] [tinyint] NOT NULL,
	[Parlor] [tinyint] NULL,
	[Toilet] [tinyint] NULL,
	[Floor] [smallint] NULL,
	[FloorTotal] [tinyint] NULL,
	[Price] [real] NOT NULL,
	[Price2] [real] NULL,
	[Area] [int] NOT NULL,
	[Area2] [int] NULL,
	[Age] [tinyint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseSecond] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseSecond] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseSecond] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseSecond] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseSecond] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseSecond] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'产权' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseSecond', @level2type=N'COLUMN',@level2name=N'Right'
GO
/****** Object:  Table [dbo].[Info_HouseRent]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseRent](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[Address] [nvarchar](64) NULL,
	[Room] [tinyint] NOT NULL,
	[Parlor] [tinyint] NOT NULL,
	[Toilet] [tinyint] NOT NULL,
	[Floor] [smallint] NOT NULL,
	[FloorTotal] [tinyint] NOT NULL,
	[Area] [smallint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[FitType] [nvarchar](32) NULL,
	[Toward] [nvarchar](16) NULL,
	[Price] [int] NOT NULL,
	[PayWay] [nvarchar](32) NULL,
	[Bed] [bit] NOT NULL,
	[WaterHeater] [bit] NOT NULL,
	[WashingMachine] [bit] NOT NULL,
	[AirConditioner] [bit] NOT NULL,
	[Icebox] [bit] NOT NULL,
	[Television] [bit] NOT NULL,
	[Broadband] [bit] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseRent] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseRent] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseRent] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseRent] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseRent] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseRent] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'小区' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseRent', @level2type=N'COLUMN',@level2name=N'District'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseRent', @level2type=N'COLUMN',@level2name=N'Room'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'厅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseRent', @level2type=N'COLUMN',@level2name=N'Parlor'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'是否经纪人' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseRent', @level2type=N'COLUMN',@level2name=N'IsBiz'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'区域' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseRent', @level2type=N'COLUMN',@level2name=N'RegionId'
GO
/****** Object:  Table [dbo].[Info_HouseOther]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseOther](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District1] [nvarchar](64) NULL,
	[District2] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Area] [int] NOT NULL,
	[Price] [real] NOT NULL,
	[Price2] [real] NULL,
	[PriceTransfer] [real] NULL,
	[PriceUnit] [tinyint] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseOther] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseOther] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseOther] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseOther] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseOther] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseOther] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'转让费' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseOther', @level2type=N'COLUMN',@level2name=N'PriceTransfer'
GO
/****** Object:  Table [dbo].[Info_HouseOffice]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseOffice](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[BuildingName] [nvarchar](32) NULL,
	[District1] [nvarchar](64) NULL,
	[District2] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[RegCompany] [bit] NOT NULL,
	[Area] [int] NOT NULL,
	[Area2] [int] NULL,
	[Price] [real] NOT NULL,
	[Price2] [real] NULL,
	[PriceUnit] [tinyint] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseOffice] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseOffice] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseOffice] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseOffice] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseOffice] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseOffice] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'楼盘名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseOffice', @level2type=N'COLUMN',@level2name=N'BuildingName'
GO
/****** Object:  Table [dbo].[Info_HouseHire]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseHire](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District1] [nvarchar](64) NULL,
	[District2] [nvarchar](64) NULL,
	[HouseType1] [bit] NOT NULL,
	[HouseType2] [bit] NOT NULL,
	[HouseType3] [bit] NOT NULL,
	[HouseType4] [bit] NOT NULL,
	[HouseType5] [bit] NOT NULL,
	[Room1] [bit] NOT NULL,
	[Room2] [bit] NOT NULL,
	[Room3] [bit] NOT NULL,
	[Room4] [bit] NOT NULL,
	[Room5] [bit] NOT NULL,
	[FitType1] [bit] NOT NULL,
	[FitType2] [bit] NOT NULL,
	[FitType3] [bit] NOT NULL,
	[FitType4] [bit] NOT NULL,
	[Price1] [int] NOT NULL,
	[Price2] [int] NOT NULL,
	[PayWay] [nvarchar](32) NULL,
	[Bed] [bit] NOT NULL,
	[WaterHeater] [bit] NOT NULL,
	[WashingMachine] [bit] NOT NULL,
	[AirConditioner] [bit] NOT NULL,
	[Icebox] [bit] NOT NULL,
	[Television] [bit] NOT NULL,
	[Broadband] [bit] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseHire] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseHire] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseHire] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseHire] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseHire] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseHire] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地区1' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'District1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地区2' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'District2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'地下室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'HouseType1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'平房' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'HouseType2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'普通住宅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'HouseType3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'公寓' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'HouseType4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'别墅' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'HouseType5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'一居室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'Room1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'二居室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'Room2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'三居室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'Room3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'四居室' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'Room4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'四居室以上' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'Room5'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'简装' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'FitType1'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'中等装修' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'FitType2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'精装修' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'FitType3'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'豪华装修' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'FitType4'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'补充说明' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Info_HouseHire', @level2type=N'COLUMN',@level2name=N'Content'
GO
/****** Object:  Table [dbo].[Info_HouseBed]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_HouseBed](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[District] [nvarchar](64) NULL,
	[Address] [nvarchar](128) NULL,
	[Room] [tinyint] NOT NULL,
	[Parlor] [tinyint] NOT NULL,
	[Toilet] [tinyint] NOT NULL,
	[Floor] [smallint] NOT NULL,
	[FloorTotal] [tinyint] NOT NULL,
	[Area] [smallint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[FitType] [nvarchar](64) NULL,
	[Toward] [nvarchar](16) NULL,
	[Price] [int] NOT NULL,
	[PayWay] [nvarchar](32) NULL,
	[Bed] [bit] NOT NULL,
	[WaterHeater] [bit] NOT NULL,
	[WashingMachine] [bit] NOT NULL,
	[AirConditioner] [bit] NOT NULL,
	[Icebox] [bit] NOT NULL,
	[Television] [bit] NOT NULL,
	[Broadband] [bit] NOT NULL,
	[HireLimit] [nvarchar](32) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_HouseBed] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_HouseBed] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_HouseBed] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_HouseBed] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_HouseBed] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_HouseBed] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_FriendSkill]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_FriendSkill](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Sex] [bit] NOT NULL,
	[Age] [tinyint] NOT NULL,
	[MySkill] [nvarchar](64) NULL,
	[WantSkill] [nvarchar](64) NULL,
	[IsBiz] [bit] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_FriendSkill] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_FriendSkill] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_FriendSkill] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_FriendSkill] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_FriendSkill] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_FriendSkill] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_FriendSex]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_FriendSex](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Purpose] [nvarchar](64) NULL,
	[Sex] [bit] NOT NULL,
	[Age] [tinyint] NOT NULL,
	[Constellation] [nvarchar](64) NULL,
	[Height] [tinyint] NOT NULL,
	[Weight] [tinyint] NOT NULL,
	[Marriage] [nvarchar](64) NULL,
	[Child] [nvarchar](64) NULL,
	[Job] [nvarchar](64) NULL,
	[Education] [nvarchar](32) NULL,
	[HomeProvinceId] [tinyint] NULL,
	[HomeCityId] [smallint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_FriendSex] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_FriendSex] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_FriendSex] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_FriendSex] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_FriendSex] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_FriendSex] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_FriendInterest]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_FriendInterest](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Interest] [nvarchar](128) NULL,
	[Sex] [bit] NULL,
	[Age] [tinyint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_FriendInterest] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_FriendInterest] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_FriendInterest] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_FriendInterest] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_FriendInterest] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_FriendInterest] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_FriendHome]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_FriendHome](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Sex] [bit] NULL,
	[Age] [tinyint] NULL,
	[HomeProvinceId] [tinyint] NOT NULL,
	[HomeCityId] [smallint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_FriendHome] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_FriendHome] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_FriendHome] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_FriendHome] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_FriendHome] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_FriendHome] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_FriendActivity]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_FriendActivity](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Address] [nvarchar](128) NULL,
	[StartTime] [smalldatetime] NULL,
	[EndTime] [smalldatetime] NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[IsBiz] [bit] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_FriendActivity] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_FriendActivity] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_FriendActivity] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_FriendActivity] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_FriendActivity] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_FriendActivity] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduTutor]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduTutor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Tag3] [tinyint] NULL,
	[Tag4] [tinyint] NULL,
	[Tag5] [tinyint] NULL,
	[Tag6] [tinyint] NULL,
	[Tag7] [tinyint] NULL,
	[Tag8] [tinyint] NULL,
	[Tag9] [tinyint] NULL,
	[Tag10] [tinyint] NULL,
	[Tag11] [tinyint] NULL,
	[Tag12] [tinyint] NULL,
	[TrainWay] [nvarchar](32) NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Type] [tinyint] NOT NULL,
	[TutorWay] [nvarchar](32) NULL,
	[Salary] [nvarchar](64) NULL,
	[Identity] [nvarchar](64) NULL,
	[Certificate] [nvarchar](128) NULL,
	[Course] [nvarchar](128) NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduTutor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduTutor] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduTutor] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduTutor] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduTutor] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduTutor] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduSpecial]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduSpecial](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Tag3] [tinyint] NULL,
	[Tag4] [tinyint] NULL,
	[Tag5] [tinyint] NULL,
	[Tag6] [tinyint] NULL,
	[Tag7] [tinyint] NULL,
	[Tag8] [tinyint] NULL,
	[Tag9] [tinyint] NULL,
	[Tag10] [tinyint] NULL,
	[Tag11] [tinyint] NULL,
	[Tag12] [tinyint] NULL,
	[TrainWay] [nvarchar](32) NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduSpecial] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduSpecial] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduSpecial] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduSpecial] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduSpecial] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduSpecial] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduProfession]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduProfession](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[BusTime] [nvarchar](128) NULL,
	[Duration] [nvarchar](32) NULL,
	[TrainWay] [nvarchar](32) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduProfession] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduProfession] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduProfession] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduProfession] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduProfession] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduProfession] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduOther]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduOther](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduOther] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduOther] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduOther] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduOther] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduOther] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduOther] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduMBA]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduMBA](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[TrainWay] [nvarchar](32) NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduMBA] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduMBA] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduMBA] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduMBA] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduMBA] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduMBA] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduLanguage]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduLanguage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Tag3] [tinyint] NULL,
	[Tag4] [tinyint] NULL,
	[Tag5] [tinyint] NULL,
	[Tag6] [tinyint] NULL,
	[Tag7] [tinyint] NULL,
	[Tag8] [tinyint] NULL,
	[Tag9] [tinyint] NULL,
	[Tag10] [tinyint] NULL,
	[Tag11] [tinyint] NULL,
	[Tag12] [tinyint] NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduLanguage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduLanguage] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduLanguage] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduLanguage] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduLanguage] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduLanguage] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduIT]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduIT](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[TrainWay] [nvarchar](32) NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduIT] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduIT] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduIT] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduIT] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduIT] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduIT] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduEducation]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduEducation](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[TrainWay] [nvarchar](32) NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduEducation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduEducation] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduEducation] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduEducation] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduEducation] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduEducation] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduDesign]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduDesign](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[TrainWay] [nvarchar](32) NULL,
	[Duration] [nvarchar](32) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduDesign] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduDesign] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduDesign] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduDesign] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduDesign] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduDesign] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduBaby]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduBaby](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Kind] [tinyint] NULL,
	[Condition] [nvarchar](256) NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduBaby] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduBaby] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduBaby] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduBaby] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduBaby] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduBaby] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_EduAbroad]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_EduAbroad](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[BusTime] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Bus] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[CityId] [smallint] NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_EduAbroad] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_EduAbroad] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_EduAbroad] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_EduAbroad] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_EduAbroad] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_EduAbroad] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CompanyType]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CompanyType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](32) NULL,
 CONSTRAINT [PK_Info_CompanyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CompanyTrade]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CompanyTrade](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](64) NULL,
 CONSTRAINT [PK_Info_CompanyTrade] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CompanySize]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CompanySize](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Min] [int] NULL,
	[Max] [int] NULL,
 CONSTRAINT [PK_Info_CompanySize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Company]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Company](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NULL,
	[CompanyName] [nvarchar](32) NULL,
	[CompanyName2] [nvarchar](32) NULL,
	[TradeId] [tinyint] NOT NULL,
	[TypeId] [tinyint] NOT NULL,
	[SizeId] [tinyint] NULL,
	[Email] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Mobile] [ntext] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Source] [bigint] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_Company] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_Company] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_Company] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_Company] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_Company] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarService]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarService](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarService] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarService] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarService] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarService] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarService] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarService] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarSecondHand]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarSecondHand](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrandId] [tinyint] NULL,
	[SeriesId] [tinyint] NULL,
	[ModelId] [tinyint] NULL,
	[BrandDescription] [nvarchar](64) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Exhaust] [real] NOT NULL,
	[Transmission] [nvarchar](54) NULL,
	[Color] [nvarchar](64) NULL,
	[BuyTime] [smallint] NOT NULL,
	[Rundistance] [real] NOT NULL,
	[Price] [real] NOT NULL,
	[SaleCarNum] [bit] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarSecondHand] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarSecondHand] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarSecondHand] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarSecondHand] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarSecondHand] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarSecondHand] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Carpool]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Carpool](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Startstation] [nvarchar](32) NULL,
	[EndStation] [nvarchar](32) NULL,
	[Way] [nvarchar](256) NULL,
	[Round] [nvarchar](64) NULL,
	[StartTime] [smalldatetime] NULL,
	[Model] [nvarchar](32) NULL,
	[Title] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_Carpool] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_Carpool] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_Carpool] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_Carpool] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_Carpool] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_Carpool] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarOther]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarOther](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarOther] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarOther] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarOther] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarOther] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarOther] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarOther] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarMotor]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarMotor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Tag1] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Exhaust] [nvarchar](64) NULL,
	[Color] [nvarchar](32) NULL,
	[BuyTime] [smallint] NULL,
	[Rundistance] [int] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarMotor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarMotor] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarMotor] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarMotor] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarMotor] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarMotor] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarFitting]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarFitting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarFitting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarFitting] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarFitting] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarFitting] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarFitting] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarFitting] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarBuy]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarBuy](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Transmission] [nvarchar](64) NULL,
	[Exhaust] [nvarchar](64) NULL,
	[Rundistance] [nvarchar](64) NULL,
	[Price1] [int] NOT NULL,
	[Price2] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarBuy] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarBuy] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarBuy] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarBuy] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarBuy] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarBuy] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarBicycle]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarBicycle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[Type] [tinyint] NOT NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Quality] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Tag1] [tinyint] NOT NULL,
	[BrandId] [tinyint] NULL,
	[BrandHandWrite] [nvarchar](32) NULL,
	[Size] [nvarchar](32) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarBicycle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarBicycle] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarBicycle] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarBicycle] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarBicycle] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarBicycle] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_CarAccompany]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_CarAccompany](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NOT NULL,
	[Price] [int] NOT NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[IsBiz] [bit] NOT NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[Pictures] [ntext] NULL,
	[UserId] [int] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_CarAccompany] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_CarAccompany] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_CarAccompany] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_CarAccompany] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_CarAccompany] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_CarAccompany] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_Autotask]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_Autotask](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Action] [tinyint] NOT NULL,
	[State] [tinyint] NOT NULL,
	[Content] [nvarchar](256) NULL,
	[DealStart] [smalldatetime] NOT NULL,
	[DateCreated] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Info_Autotask] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Users]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](16) NOT NULL,
	[Password] [nvarchar](128) NOT NULL,
	[PasswordFormat] [tinyint] NOT NULL,
	[PasswordSalt] [nvarchar](128) NULL,
	[MobilePIN] [nvarchar](32) NULL,
	[Email] [nvarchar](32) NULL,
	[LoweredEmail] [nvarchar](32) NULL,
	[PasswordQuestion] [nvarchar](32) NULL,
	[PasswordAnswer] [nvarchar](32) NULL,
	[IsApproved] [bit] NOT NULL,
	[IsLockedOut] [bit] NOT NULL,
	[CreateDate] [smalldatetime] NOT NULL,
	[LastLoginDate] [smalldatetime] NULL,
	[LastPasswordChangedDate] [smalldatetime] NULL,
	[LastLockoutDate] [smalldatetime] NULL,
	[FailedPasswordAttemptCount] [smallint] NULL,
	[FailedPasswordAttemptWindowStart] [smalldatetime] NULL,
	[FailedPasswordAnswerAttemptCount] [smallint] NULL,
	[FailedPasswordAnswerAttemptWindowStart] [smalldatetime] NULL,
	[Comment] [ntext] NULL,
 CONSTRAINT [PK_Fr_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_UserRoles]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_UserRoles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[RoleId] [tinyint] NOT NULL,
 CONSTRAINT [PK_Fr_UserRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Roles]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Roles](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Role] [nvarchar](16) NOT NULL,
 CONSTRAINT [PK_Fr_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Region]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Region](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](16) NULL,
	[CityId] [smallint] NOT NULL,
	[ShortName] [nvarchar](8) NULL,
 CONSTRAINT [PK_Fr_Region] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Province]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Province](
	[id] [tinyint] NOT NULL,
	[Name] [nvarchar](16) NULL,
	[CountryId] [tinyint] NULL,
	[ShortName] [nvarchar](8) NULL,
 CONSTRAINT [PK_Fr_Province] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Profile]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Profile](
	[UserId] [int] NOT NULL,
	[RealName] [nvarchar](16) NULL,
	[Nickname] [nvarchar](16) NULL,
	[PhotoURL] [ntext] NULL,
	[Birthday] [smalldatetime] NULL,
	[PhoneMain] [nvarchar](32) NULL,
	[PhoneFax] [nvarchar](32) NULL,
	[PhoneMobile] [nvarchar](32) NULL,
	[AboutMe] [ntext] NULL,
	[CountryId] [smallint] NULL,
	[ProvinceId] [smallint] NULL,
	[CityId] [smallint] NULL,
	[Address] [nvarchar](128) NULL,
	[PostCode] [nvarchar](8) NULL,
	[WebSite] [ntext] NULL,
	[QQ] [nvarchar](16) NULL,
	[IP] [nvarchar](16) NULL,
	[DateCreated] [smalldatetime] NULL,
	[DateModified] [smalldatetime] NULL,
	[Sex] [bit] NULL,
 CONSTRAINT [PK_Fr_Profile] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Log]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Log](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Type] [tinyint] NOT NULL,
	[Message] [ntext] NULL,
	[StackTrace] [ntext] NULL,
	[Url] [ntext] NULL,
	[DateCreated] [datetime] NOT NULL,
 CONSTRAINT [PK_Fr_Log] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_IP]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_IP](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[StartIP] [bigint] NOT NULL,
	[EndIP] [bigint] NOT NULL,
	[Address] [nvarchar](255) NULL,
	[CityId] [smallint] NULL,
 CONSTRAINT [PK_Fr_IP] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Country]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Country](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](16) NULL,
	[Remark] [nvarchar](16) NULL,
 CONSTRAINT [PK_Fr_Country] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'国家名称' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Fr_Country', @level2type=N'COLUMN',@level2name=N'Name'
GO
/****** Object:  Table [dbo].[Fr_City]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_City](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](16) NULL,
	[ProvinceId] [tinyint] NOT NULL,
	[ShortName] [nvarchar](8) NULL,
	[Code] [nvarchar](16) NULL,
	[Aleph] [nvarchar](1) NULL,
	[Sequence] [smallint] NULL,
 CONSTRAINT [PK_Fr_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Fr_Circle]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Fr_Circle](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](16) NULL,
	[RegionId] [smallint] NOT NULL,
	[ShortName] [nvarchar](16) NULL,
 CONSTRAINT [PK_Fr_Circle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UnionAd]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnionAd](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [ntext] NULL,
	[Union] [tinyint] NULL,
	[Name] [nvarchar](50) NULL,
	[Size] [nvarchar](50) NULL,
 CONSTRAINT [PK_UnionAd] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_YellowTranslate]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_YellowTranslate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType1] [tinyint] NOT NULL,
	[ObjectType2] [tinyint] NULL,
	[ObjectType3] [tinyint] NULL,
	[ObjectType4] [tinyint] NULL,
	[ObjectType5] [tinyint] NULL,
	[Tag1] [tinyint] NOT NULL,
	[Tag2] [tinyint] NULL,
	[Tag3] [tinyint] NULL,
	[Tag4] [tinyint] NULL,
	[Tag5] [tinyint] NULL,
	[Tag6] [tinyint] NULL,
	[BusTime] [nvarchar](32) NULL,
	[Bus] [nvarchar](128) NULL,
	[Address] [nvarchar](128) NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [nvarchar](32) NULL,
	[Phone2] [nvarchar](32) NULL,
	[QQOrMSN] [nvarchar](32) NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[TId] [int] NULL,
 CONSTRAINT [PK_Info_YellowTranslate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_YellowTranslate] 
(
	[CityId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Info_YellowPage]    Script Date: 01/20/2013 15:15:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Info_YellowPage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YellowPageType] [tinyint] NOT NULL,
	[Title] [nvarchar](128) NULL,
	[ObjectType] [tinyint] NULL,
	[Tag1] [tinyint] NULL,
	[Tag2] [tinyint] NULL,
	[Tag3] [tinyint] NULL,
	[Tag4] [tinyint] NULL,
	[Tag5] [tinyint] NULL,
	[Tag6] [tinyint] NULL,
	[Tag7] [tinyint] NULL,
	[Tag8] [tinyint] NULL,
	[Tag9] [tinyint] NULL,
	[Tag10] [tinyint] NULL,
	[Tag11] [tinyint] NULL,
	[Tag12] [tinyint] NULL,
	[Address] [nvarchar](128) NULL,
	[Price] [int] NULL,
	[Content] [ntext] NULL,
	[ContactPerson] [nvarchar](16) NULL,
	[Phone] [ntext] NULL,
	[Phone2] [ntext] NULL,
	[QQOrMSN] [ntext] NULL,
	[Pictures] [ntext] NULL,
	[CityId] [smallint] NOT NULL,
	[RegionId] [smallint] NULL,
	[CircleId] [smallint] NULL,
	[DateCreated] [smalldatetime] NOT NULL,
	[DateModified] [smalldatetime] NOT NULL,
	[UserId] [int] NULL,
	[Source] [bigint] NULL,
	[Keywords] [nvarchar](128) NULL,
	[Sequence] [smallint] NOT NULL,
	[TId] [int] NULL,
	[BaiduSpiderTotal] [smallint] NOT NULL,
	[GoogleSpiderTotal] [smallint] NOT NULL,
	[SogouSpiderTotal] [smallint] NOT NULL,
	[OtherSpiderTotal] [smallint] NOT NULL,
 CONSTRAINT [PK_Info_YellowPage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [BaiduSpider] ON [dbo].[Info_YellowPage] 
(
	[BaiduSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [GoogleSpider] ON [dbo].[Info_YellowPage] 
(
	[GoogleSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Idx] ON [dbo].[Info_YellowPage] 
(
	[CityId] ASC,
	[YellowPageType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [OtherSpider] ON [dbo].[Info_YellowPage] 
(
	[OtherSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SogouSpider] ON [dbo].[Info_YellowPage] 
(
	[SogouSpiderTotal] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Stat_VisitInfo]    Script Date: 01/22/2013 20:18:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stat_VisitInfo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[VYear] [smallint] NOT NULL,
	[VMonth] [tinyint] NOT NULL,
	[VDay] [tinyint] NOT NULL,
	[VHour] [tinyint] NOT NULL,
	[VTime] [datetime] NOT NULL,
	[VWeek] [tinyint] NULL,
	[VIP] [nvarchar](50) NULL,
	[VAddress] [nvarchar](255) NULL,
	[VReferrer] [ntext] NULL,
	[VPage] [ntext] NULL,
	[VBrowser] [nvarchar](50) NULL,
	[VOS] [nvarchar](50) NULL,
	[TId] [int] NULL,
 CONSTRAINT [PK_Stat_VisitInfo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

/****** Object:  View [dbo].[Info_TotalStat]    Script Date: 01/20/2013 15:15:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[Info_TotalStat]
AS
--Info_CarAccompany
select 'CarAccompany' Info, count(*) as Total from Info_CarAccompany --where Source is null
union
--Info_CarBicycle
select 'CarBicycle' Info, count(*) as Total from Info_CarBicycle --where Source is null
union
--Info_CarBuy
select 'CarBuy' Info, count(*) as Total from Info_CarBuy --where Source is null
union
--Info_CarFitting
select 'CarFitting' Info, count(*) as Total from Info_CarFitting --where Source is null
union
--Info_CarMotor
select 'CarMotor' Info, count(*) as Total from Info_CarMotor --where Source is null
union
--Info_CarOther
select 'CarOther' Info, count(*) as Total from Info_CarOther --where Source is null
union
--Info_Carpool
select 'Carpool' Info, count(*) as Total from Info_Carpool --where Source is null
union
--Info_CarSecondHand
select 'CarSecondHand' Info, count(*) as Total from Info_CarSecondHand --where Source is null
union
--Info_CarService
select 'CarService' Info, count(*) as Total from Info_CarService --where Source is null
union
--Info_EduAbroad
select 'EduAbroad' Info, count(*) as Total from Info_EduAbroad --where Source is null
union
--Info_EduBaby
select 'EduBaby' Info, count(*) as Total from Info_EduBaby --where Source is null
union
--Info_EduDesign
select 'EduDesign' Info, count(*) as Total from Info_EduDesign --where Source is null
union
--Info_EduEducation
select 'EduEducation' Info, count(*) as Total from Info_EduEducation --where Source is null
union
--Info_EduIT
select 'EduIT' Info, count(*) as Total from Info_EduIT --where Source is null
union
--Info_EduLanguage
select 'EduLanguage' Info, count(*) as Total from Info_EduLanguage --where Source is null
union
--Info_EduMBA
select 'EduMBA' Info, count(*) as Total from Info_EduMBA --where Source is null
union
--Info_EduOther
select 'EduOther' Info, count(*) as Total from Info_EduOther --where Source is null
union
--Info_EduProfession
select 'EduProfession' Info, count(*) as Total from Info_EduProfession --where Source is null
union
--Info_EduSpecial
select 'EduSpecial' Info, count(*) as Total from Info_EduSpecial --where Source is null
union
--Info_EduTutor
select 'EduTutor' Info, count(*) as Total from Info_EduTutor --where Source is null
union
--Info_FriendActivity
select 'FriendActivity' Info, count(*) as Total from Info_FriendActivity --where Source is null
union
--Info_FriendHome
select 'FriendHome' Info, count(*) as Total from Info_FriendHome --where Source is null
union
--Info_FriendInterest
select 'FriendInterest' Info, count(*) as Total from Info_FriendInterest --where Source is null
union
--Info_FriendSex
select 'FriendSex' Info, count(*) as Total from Info_FriendSex --where Source is null
union
--Info_FriendSkill
select 'FriendSkill' Info, count(*) as Total from Info_FriendSkill --where Source is null
union
--Info_HouseBed
select 'HouseBed' Info, count(*) as Total from Info_HouseBed --where Source is null
union
--Info_HouseHire
select 'HouseHire' Info, count(*) as Total from Info_HouseHire --where Source is null
union
--Info_HouseOffice
select 'HouseOffice' Info, count(*) as Total from Info_HouseOffice --where Source is null
union
--Info_HouseOther
select 'HouseOther' Info, count(*) as Total from Info_HouseOther --where Source is null
union
--Info_HouseRent
select 'HouseRent' Info, count(*) as Total from Info_HouseRent --where Source is null
union
--Info_HouseSecond
select 'HouseSecond' Info, count(*) as Total from Info_HouseSecond --where Source is null
union
--Info_HouseShare
select 'HouseShare' Info, count(*) as Total from Info_HouseShare --where Source is null
union
--Info_HouseShop
select 'HouseShop' Info, count(*) as Total from Info_HouseShop --where Source is null
union
--Info_HouseShort
select 'HouseShort' Info, count(*) as Total from Info_HouseShort --where Source is null
union
--Info_PetBird
select 'PetBird' Info, count(*) as Total from Info_PetBird --where Source is null
union
--Info_PetCat
select 'PetCat' Info, count(*) as Total from Info_PetCat --where Source is null
union
--Info_PetDog
select 'PetDog' Info, count(*) as Total from Info_PetDog --where Source is null
union
--Info_PetFood
select 'PetFood' Info, count(*) as Total from Info_PetFood --where Source is null
union
--Info_PetGive
select 'PetGive' Info, count(*) as Total from Info_PetGive --where Source is null
union
--Info_PetService
select 'PetService' Info, count(*) as Total from Info_PetService --where Source is null
union
--Info_SaleArt
select 'SaleArt' Info, count(*) as Total from Info_SaleArt --where Source is null
union
--Info_SaleAthletics
select 'SaleAthletics' Info, count(*) as Total from Info_SaleAthletics --where Source is null
union
--Info_SaleBaby
select 'SaleBaby' Info, count(*) as Total from Info_SaleBaby --where Source is null
union
--Info_SaleBook
select 'SaleBook' Info, count(*) as Total from Info_SaleBook --where Source is null
union
--Info_SaleClothing
select 'SaleClothing' Info, count(*) as Total from Info_SaleClothing --where Source is null
union
--Info_SaleCommunication
select 'SaleCommunication' Info, count(*) as Total from Info_SaleCommunication --where Source is null
union
--Info_SaleComputer
select 'SaleComputer' Info, count(*) as Total from Info_SaleComputer --where Source is null
union
--Info_SaleDigital
select 'SaleDigital' Info, count(*) as Total from Info_SaleDigital --where Source is null
union
--Info_SaleElectric
select 'SaleElectric' Info, count(*) as Total from Info_SaleElectric --where Source is null
union
--Info_SaleEquipment
select 'SaleEquipment' Info, count(*) as Total from Info_SaleEquipment --where Source is null
union
--Info_SaleFacial
select 'SaleFacial' Info, count(*) as Total from Info_SaleFacial --where Source is null
union
--Info_SaleGame
select 'SaleGame' Info, count(*) as Total from Info_SaleGame --where Source is null
union
--Info_SaleHome
select 'SaleHome' Info, count(*) as Total from Info_SaleHome --where Source is null
union
--Info_SaleMobile
select 'SaleMobile' Info, count(*) as Total from Info_SaleMobile --where Source is null
union
--Info_SaleMobileNumber
select 'SaleMobileNumber' Info, count(*) as Total from Info_SaleMobileNumber --where Source is null
union
--Info_SaleOffice
select 'SaleOffice' Info, count(*) as Total from Info_SaleOffice --where Source is null
union
--Info_SaleOther
select 'SaleOther' Info, count(*) as Total from Info_SaleOther --where Source is null
union
--Info_SaleService
select 'SaleService' Info, count(*) as Total from Info_SaleService --where Source is null
union
--Info_SaleSex
select 'SaleSex' Info, count(*) as Total from Info_SaleSex --where Source is null
union
--Info_SaleSwap
select 'SaleSwap' Info, count(*) as Total from Info_SaleSwap --where Source is null
union
--Info_TicketAirplane
select 'TicketAirplane' Info, count(*) as Total from Info_TicketAirplane --where Source is null
union
--Info_TicketCard
select 'TicketCard' Info, count(*) as Total from Info_TicketCard --where Source is null
union
--Info_TicketOther
select 'TicketOther' Info, count(*) as Total from Info_TicketOther --where Source is null
union
--Info_TicketPerform
select 'TicketPerform' Info, count(*) as Total from Info_TicketPerform --where Source is null
union
--Info_TicketPleasure
select 'TicketPleasure' Info, count(*) as Total from Info_TicketPleasure --where Source is null
union
--Info_TicketTrain
select 'TicketTrain' Info, count(*) as Total from Info_TicketTrain --where Source is null
union
--求职
select 'JobSeek' Info, count(*) as Total from Info_JobSeek --where Source is null
union
--招聘
select 'Recruit' Info, count(*) as Total from Info_Recruit --where Source is null
union
--黄页
select 'YellowPage' Info, count(*) as Total from Info_YellowPage --where Source is null
GO
/****** Object:  Default [DF_Fr_Log_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Log] ADD  CONSTRAINT [DF_Fr_Log_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Fr_Profile_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Profile] ADD  CONSTRAINT [DF_Fr_Profile_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Fr_Profile_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Profile] ADD  CONSTRAINT [DF_Fr_Profile_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Fr_Users_PasswordFormat]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Users] ADD  CONSTRAINT [DF_Fr_Users_PasswordFormat]  DEFAULT ((0)) FOR [PasswordFormat]
GO
/****** Object:  Default [DF_Fr_Users_IsApproved]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Users] ADD  CONSTRAINT [DF_Fr_Users_IsApproved]  DEFAULT ((1)) FOR [IsApproved]
GO
/****** Object:  Default [DF_Fr_Users_IsLockedOut]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Users] ADD  CONSTRAINT [DF_Fr_Users_IsLockedOut]  DEFAULT ((0)) FOR [IsLockedOut]
GO
/****** Object:  Default [DF_Fr_Users_CreateDate]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Fr_Users] ADD  CONSTRAINT [DF_Fr_Users_CreateDate]  DEFAULT (getdate()) FOR [CreateDate]
GO
/****** Object:  Default [DF_Info_Autotask_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Autotask] ADD  CONSTRAINT [DF_Info_Autotask_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarAccompany_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  CONSTRAINT [DF_Info_CarAccompany_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarAccompany_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  CONSTRAINT [DF_Info_CarAccompany_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarAccompany_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  CONSTRAINT [DF_Info_CarAccompany_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarA__Baidu__42E1EEFE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarA__Googl__43D61337]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarA__Sogou__44CA3770]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarA__Other__45BE5BA9]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarAccompany] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarBicycle_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  CONSTRAINT [DF_Info_CarBicycle_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarBicycle_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  CONSTRAINT [DF_Info_CarBicycle_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarBicycle_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  CONSTRAINT [DF_Info_CarBicycle_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarB__Baidu__498EEC8D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarB__Googl__4A8310C6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarB__Sogou__4B7734FF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarB__Other__4C6B5938]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBicycle] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarBuy_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  CONSTRAINT [DF_Info_CarBuy_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarBuy_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  CONSTRAINT [DF_Info_CarBuy_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarBuy_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  CONSTRAINT [DF_Info_CarBuy_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarB__Baidu__503BEA1C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarB__Googl__51300E55]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarB__Sogou__5224328E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarB__Other__531856C7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarBuy] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarFitting_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  CONSTRAINT [DF_Info_CarFitting_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarFitting_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  CONSTRAINT [DF_Info_CarFitting_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarFitting_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  CONSTRAINT [DF_Info_CarFitting_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarF__Baidu__56E8E7AB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarF__Googl__57DD0BE4]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarF__Sogou__58D1301D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarF__Other__59C55456]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarFitting] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarMotor_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  CONSTRAINT [DF_Info_CarMotor_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarMotor_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  CONSTRAINT [DF_Info_CarMotor_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarMotor_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  CONSTRAINT [DF_Info_CarMotor_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarM__Baidu__5D95E53A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarM__Googl__5E8A0973]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarM__Sogou__5F7E2DAC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarM__Other__607251E5]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarMotor] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarOther_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  CONSTRAINT [DF_Info_CarOther_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarOther_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  CONSTRAINT [DF_Info_CarOther_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarOther_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  CONSTRAINT [DF_Info_CarOther_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarO__Baidu__6442E2C9]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarO__Googl__65370702]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarO__Sogou__662B2B3B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarO__Other__671F4F74]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarOther] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Carpool_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  CONSTRAINT [DF_Info_Carpool_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Carpool_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  CONSTRAINT [DF_Info_Carpool_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_Carpool_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  CONSTRAINT [DF_Info_Carpool_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Carp__Baidu__6AEFE058]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Carp__Googl__6BE40491]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Carp__Sogou__6CD828CA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Carp__Other__6DCC4D03]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Carpool] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarSecondHand_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  CONSTRAINT [DF_Info_CarSecondHand_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarSecondHand_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  CONSTRAINT [DF_Info_CarSecondHand_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarSecondHand_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  CONSTRAINT [DF_Info_CarSecondHand_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarS__Baidu__719CDDE7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarS__Googl__72910220]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarS__Sogou__73852659]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarS__Other__74794A92]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarSecondHand] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_CarService_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  CONSTRAINT [DF_Info_CarService_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_CarService_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  CONSTRAINT [DF_Info_CarService_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_CarService_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  CONSTRAINT [DF_Info_CarService_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_CarS__Baidu__7849DB76]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarS__Googl__793DFFAF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarS__Sogou__7A3223E8]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_CarS__Other__7B264821]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_CarService] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Company_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Company] ADD  CONSTRAINT [DF_Info_Company_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Company_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Company] ADD  CONSTRAINT [DF_Info_Company_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF__Info_Comp__Baidu__7E02B4CC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Company] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Comp__Googl__7EF6D905]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Company] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Comp__Sogou__7FEAFD3E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Company] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Comp__Other__00DF2177]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Company] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduAbroad_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  CONSTRAINT [DF_Info_EduAbroad_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduAbroad_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  CONSTRAINT [DF_Info_EduAbroad_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduAbroad_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  CONSTRAINT [DF_Info_EduAbroad_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduA__Baidu__04AFB25B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduA__Googl__05A3D694]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduA__Sogou__0697FACD]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduA__Other__078C1F06]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduAbroad] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduBaby_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  CONSTRAINT [DF_Info_EduBaby_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduBaby_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  CONSTRAINT [DF_Info_EduBaby_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduBaby_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  CONSTRAINT [DF_Info_EduBaby_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduB__Baidu__0B5CAFEA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduB__Googl__0C50D423]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduB__Sogou__0D44F85C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduB__Other__0E391C95]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduBaby] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduDesign_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  CONSTRAINT [DF_Info_EduDesign_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduDesign_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  CONSTRAINT [DF_Info_EduDesign_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduDesign_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  CONSTRAINT [DF_Info_EduDesign_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduD__Baidu__1209AD79]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduD__Googl__12FDD1B2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduD__Sogou__13F1F5EB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduD__Other__14E61A24]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduDesign] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduEducation_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  CONSTRAINT [DF_Info_EduEducation_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduEducation_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  CONSTRAINT [DF_Info_EduEducation_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduEducation_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  CONSTRAINT [DF_Info_EduEducation_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduE__Baidu__18B6AB08]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduE__Googl__19AACF41]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduE__Sogou__1A9EF37A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduE__Other__1B9317B3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduEducation] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduIT_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  CONSTRAINT [DF_Info_EduIT_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduIT_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  CONSTRAINT [DF_Info_EduIT_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduIT_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  CONSTRAINT [DF_Info_EduIT_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduI__Baidu__1F63A897]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduI__Googl__2057CCD0]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduI__Sogou__214BF109]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduI__Other__22401542]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduIT] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduLanguage_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  CONSTRAINT [DF_Info_EduLanguage_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduLanguage_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  CONSTRAINT [DF_Info_EduLanguage_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduLanguage_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  CONSTRAINT [DF_Info_EduLanguage_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduL__Baidu__2610A626]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduL__Googl__2704CA5F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduL__Sogou__27F8EE98]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduL__Other__28ED12D1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduLanguage] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduMBA_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  CONSTRAINT [DF_Info_EduMBA_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduMBA_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  CONSTRAINT [DF_Info_EduMBA_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduMBA_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  CONSTRAINT [DF_Info_EduMBA_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduM__Baidu__2CBDA3B5]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduM__Googl__2DB1C7EE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduM__Sogou__2EA5EC27]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduM__Other__2F9A1060]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduMBA] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduOther_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  CONSTRAINT [DF_Info_EduOther_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduOther_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  CONSTRAINT [DF_Info_EduOther_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduOther_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  CONSTRAINT [DF_Info_EduOther_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduO__Baidu__336AA144]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduO__Googl__345EC57D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduO__Sogou__3552E9B6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduO__Other__36470DEF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduOther] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduProfession_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  CONSTRAINT [DF_Info_EduProfession_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduProfession_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  CONSTRAINT [DF_Info_EduProfession_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduProfession_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  CONSTRAINT [DF_Info_EduProfession_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduP__Baidu__3A179ED3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduP__Googl__3B0BC30C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduP__Sogou__3BFFE745]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduP__Other__3CF40B7E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduProfession] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduSpecial_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  CONSTRAINT [DF_Info_EduSpecial_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduSpecial_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  CONSTRAINT [DF_Info_EduSpecial_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduSpecial_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  CONSTRAINT [DF_Info_EduSpecial_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduS__Baidu__40C49C62]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduS__Googl__41B8C09B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduS__Sogou__42ACE4D4]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduS__Other__43A1090D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduSpecial] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_EduTutor_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  CONSTRAINT [DF_Info_EduTutor_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_EduTutor_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  CONSTRAINT [DF_Info_EduTutor_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_EduTutor_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  CONSTRAINT [DF_Info_EduTutor_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_EduT__Baidu__477199F1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduT__Googl__4865BE2A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduT__Sogou__4959E263]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_EduT__Other__4A4E069C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_EduTutor] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_FriendActivity_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  CONSTRAINT [DF_Info_FriendActivity_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_FriendActivity_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  CONSTRAINT [DF_Info_FriendActivity_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_FriendActivity_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  CONSTRAINT [DF_Info_FriendActivity_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Frie__Baidu__4E1E9780]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Googl__4F12BBB9]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Sogou__5006DFF2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Other__50FB042B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendActivity] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_FriendHome_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  CONSTRAINT [DF_Info_FriendHome_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_FriendHome_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  CONSTRAINT [DF_Info_FriendHome_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_FriendHome_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  CONSTRAINT [DF_Info_FriendHome_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Frie__Baidu__54CB950F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Googl__55BFB948]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Sogou__56B3DD81]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Other__57A801BA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendHome] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_FriendInterest_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  CONSTRAINT [DF_Info_FriendInterest_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_FriendInterest_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  CONSTRAINT [DF_Info_FriendInterest_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_FriendInterest_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  CONSTRAINT [DF_Info_FriendInterest_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Frie__Baidu__5B78929E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Googl__5C6CB6D7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Sogou__5D60DB10]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Other__5E54FF49]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendInterest] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_FriendSex_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  CONSTRAINT [DF_Info_FriendSex_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_FriendSex_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  CONSTRAINT [DF_Info_FriendSex_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_FriendSex_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  CONSTRAINT [DF_Info_FriendSex_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Frie__Baidu__6225902D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Googl__6319B466]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Sogou__640DD89F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Other__6501FCD8]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSex] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_FriendSkill_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  CONSTRAINT [DF_Info_FriendSkill_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_FriendSkill_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  CONSTRAINT [DF_Info_FriendSkill_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_FriendSkill_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  CONSTRAINT [DF_Info_FriendSkill_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Frie__Baidu__68D28DBC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Googl__69C6B1F5]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Sogou__6ABAD62E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Frie__Other__6BAEFA67]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_FriendSkill] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseBed_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  CONSTRAINT [DF_Info_HouseBed_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseBed_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  CONSTRAINT [DF_Info_HouseBed_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseBed_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  CONSTRAINT [DF_Info_HouseBed_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__6F7F8B4B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__7073AF84]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__7167D3BD]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__725BF7F6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseBed] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseHire_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  CONSTRAINT [DF_Info_HouseHire_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseHire_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  CONSTRAINT [DF_Info_HouseHire_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseHire_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  CONSTRAINT [DF_Info_HouseHire_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__762C88DA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__7720AD13]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__7814D14C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__7908F585]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseHire] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseOffice_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  CONSTRAINT [DF_Info_HouseOffice_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseOffice_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  CONSTRAINT [DF_Info_HouseOffice_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseOffice_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  CONSTRAINT [DF_Info_HouseOffice_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__7CD98669]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__7DCDAAA2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__7EC1CEDB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__7FB5F314]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOffice] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseOther_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  CONSTRAINT [DF_Info_HouseOther_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseOther_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  CONSTRAINT [DF_Info_HouseOther_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseOther_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  CONSTRAINT [DF_Info_HouseOther_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__038683F8]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__047AA831]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__056ECC6A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__0662F0A3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseOther] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseRent_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  CONSTRAINT [DF_Info_HouseRent_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseRent_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  CONSTRAINT [DF_Info_HouseRent_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseRent_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  CONSTRAINT [DF_Info_HouseRent_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__0A338187]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__0B27A5C0]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__0C1BC9F9]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__0D0FEE32]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseRent] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseSecond_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  CONSTRAINT [DF_Info_HouseSecond_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseSecond_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  CONSTRAINT [DF_Info_HouseSecond_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseSecond_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  CONSTRAINT [DF_Info_HouseSecond_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__10E07F16]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__11D4A34F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__12C8C788]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__13BCEBC1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseSecond] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseShare_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  CONSTRAINT [DF_Info_HouseShare_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseShare_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  CONSTRAINT [DF_Info_HouseShare_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseShare_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  CONSTRAINT [DF_Info_HouseShare_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__178D7CA5]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__1881A0DE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__1975C517]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__1A69E950]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShare] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseShop_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  CONSTRAINT [DF_Info_HouseShop_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseShop_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  CONSTRAINT [DF_Info_HouseShop_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseShop_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  CONSTRAINT [DF_Info_HouseShop_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__1E3A7A34]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__1F2E9E6D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__2022C2A6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__2116E6DF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShop] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_HouseShort_Price2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  CONSTRAINT [DF_Info_HouseShort_Price2]  DEFAULT ((0)) FOR [Price2]
GO
/****** Object:  Default [DF_Info_HouseShort_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  CONSTRAINT [DF_Info_HouseShort_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_HouseShort_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  CONSTRAINT [DF_Info_HouseShort_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_HouseShort_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  CONSTRAINT [DF_Info_HouseShort_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Hous__Baidu__25DB9BFC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Googl__26CFC035]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Sogou__27C3E46E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Hous__Other__28B808A7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_HouseShort] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Interview_Content]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Interview] ADD  CONSTRAINT [DF_Info_Interview_Content]  DEFAULT (N'getdate()') FOR [Content]
GO
/****** Object:  Default [DF_Info_Interview_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Interview] ADD  CONSTRAINT [DF_Info_Interview_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Interview_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Interview] ADD  CONSTRAINT [DF_Info_Interview_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_JobApply_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobApply] ADD  CONSTRAINT [DF_Info_JobApply_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_JobApply_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobApply] ADD  CONSTRAINT [DF_Info_JobApply_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_JobSeek_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  CONSTRAINT [DF_Info_JobSeek_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_JobSeek_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  CONSTRAINT [DF_Info_JobSeek_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_JobSeek_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  CONSTRAINT [DF_Info_JobSeek_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_JobS__Baidu__314D4EA8]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_JobS__Googl__324172E1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_JobS__Sogou__3335971A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_JobS__Other__3429BB53]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_JobSeek] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Keyword_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Keyword] ADD  CONSTRAINT [DF_Info_Keyword_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Keyword_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Keyword] ADD  CONSTRAINT [DF_Info_Keyword_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_KeywordStat_Total]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_KeywordStat] ADD  CONSTRAINT [DF_Info_KeywordStat_Total]  DEFAULT ((0)) FOR [Total]
GO
/****** Object:  Default [DF_Info_KeywordStat_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_KeywordStat] ADD  CONSTRAINT [DF_Info_KeywordStat_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_KeywordStat_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_KeywordStat] ADD  CONSTRAINT [DF_Info_KeywordStat_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetBird_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  CONSTRAINT [DF_Info_PetBird_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_PetBird_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  CONSTRAINT [DF_Info_PetBird_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetBird_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  CONSTRAINT [DF_Info_PetBird_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_PetB__Baidu__3CBF0154]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetB__Googl__3DB3258D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetB__Sogou__3EA749C6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetB__Other__3F9B6DFF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetBird] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_PetCat_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  CONSTRAINT [DF_Info_PetCat_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_PetCat_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  CONSTRAINT [DF_Info_PetCat_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetCat_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  CONSTRAINT [DF_Info_PetCat_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_PetC__Baidu__436BFEE3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetC__Googl__4460231C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetC__Sogou__45544755]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetC__Other__46486B8E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetCat] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_PetDog_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  CONSTRAINT [DF_Info_PetDog_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_PetDog_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  CONSTRAINT [DF_Info_PetDog_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetDog_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  CONSTRAINT [DF_Info_PetDog_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_PetD__Baidu__4A18FC72]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetD__Googl__4B0D20AB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetD__Sogou__4C0144E4]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetD__Other__4CF5691D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetDog] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_PetFood_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  CONSTRAINT [DF_Info_PetFood_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_PetFood_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  CONSTRAINT [DF_Info_PetFood_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetFood_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  CONSTRAINT [DF_Info_PetFood_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_PetF__Baidu__50C5FA01]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetF__Googl__51BA1E3A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetF__Sogou__52AE4273]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetF__Other__53A266AC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetFood] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_PetGive_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  CONSTRAINT [DF_Info_PetGive_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_PetGive_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  CONSTRAINT [DF_Info_PetGive_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetGive_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  CONSTRAINT [DF_Info_PetGive_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_PetG__Baidu__5772F790]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetG__Googl__58671BC9]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetG__Sogou__595B4002]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetG__Other__5A4F643B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetGive] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_PetService_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  CONSTRAINT [DF_Info_PetService_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_PetService_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  CONSTRAINT [DF_Info_PetService_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_PetService_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  CONSTRAINT [DF_Info_PetService_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_PetS__Baidu__5E1FF51F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetS__Googl__5F141958]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetS__Sogou__60083D91]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_PetS__Other__60FC61CA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_PetService] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Recruit_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  CONSTRAINT [DF_Info_Recruit_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Recruit_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  CONSTRAINT [DF_Info_Recruit_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_Recruit_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  CONSTRAINT [DF_Info_Recruit_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Recr__Baidu__64CCF2AE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Recr__Googl__65C116E7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Recr__Sogou__66B53B20]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Recr__Other__67A95F59]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Recruit] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Resume_DateCreated_1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Resume] ADD  CONSTRAINT [DF_Info_Resume_DateCreated_1]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Resume_DateModified_1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Resume] ADD  CONSTRAINT [DF_Info_Resume_DateModified_1]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF__Info_Resu__Baidu__6A85CC04]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Resume] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Resu__Googl__6B79F03D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Resume] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Resu__Sogou__6C6E1476]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Resume] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Resu__Other__6D6238AF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Resume] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_ResumeFavorite_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_ResumeFavorite] ADD  CONSTRAINT [DF_Info_ResumeFavorite_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_ResumeFavorite_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_ResumeFavorite] ADD  CONSTRAINT [DF_Info_ResumeFavorite_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleArt_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  CONSTRAINT [DF_Info_SaleArt_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleArt_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  CONSTRAINT [DF_Info_SaleArt_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleArt_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  CONSTRAINT [DF_Info_SaleArt_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__731B1205]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__740F363E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__75035A77]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__75F77EB0]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleArt] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleAthletics_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  CONSTRAINT [DF_Info_SaleAthletics_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleAthletics_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  CONSTRAINT [DF_Info_SaleAthletics_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleAthletics_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  CONSTRAINT [DF_Info_SaleAthletics_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__79C80F94]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__7ABC33CD]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__7BB05806]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__7CA47C3F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleAthletics] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleBaby_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  CONSTRAINT [DF_Info_SaleBaby_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleBaby_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  CONSTRAINT [DF_Info_SaleBaby_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleBaby_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  CONSTRAINT [DF_Info_SaleBaby_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__00750D23]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__0169315C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__025D5595]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__035179CE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBaby] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleBook_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  CONSTRAINT [DF_Info_SaleBook_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleBook_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  CONSTRAINT [DF_Info_SaleBook_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleBook_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  CONSTRAINT [DF_Info_SaleBook_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__07220AB2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__08162EEB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__090A5324]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__09FE775D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleBook] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleClothing_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  CONSTRAINT [DF_Info_SaleClothing_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleClothing_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  CONSTRAINT [DF_Info_SaleClothing_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleClothing_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  CONSTRAINT [DF_Info_SaleClothing_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__0DCF0841]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__0EC32C7A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__0FB750B3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__10AB74EC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleClothing] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleCommunication_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  CONSTRAINT [DF_Info_SaleCommunication_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleCommunication_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  CONSTRAINT [DF_Info_SaleCommunication_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleCommunication_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  CONSTRAINT [DF_Info_SaleCommunication_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__147C05D0]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__15702A09]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__16644E42]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__1758727B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleCommunication] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleComputer_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  CONSTRAINT [DF_Info_SaleComputer_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleComputer_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  CONSTRAINT [DF_Info_SaleComputer_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleComputer_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  CONSTRAINT [DF_Info_SaleComputer_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__1B29035F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__1C1D2798]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__1D114BD1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__1E05700A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleComputer] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleDigital_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  CONSTRAINT [DF_Info_SaleDigital_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleDigital_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  CONSTRAINT [DF_Info_SaleDigital_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleDigital_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  CONSTRAINT [DF_Info_SaleDigital_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__21D600EE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__22CA2527]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__23BE4960]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__24B26D99]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleDigital] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleElectric_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  CONSTRAINT [DF_Info_SaleElectric_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleElectric_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  CONSTRAINT [DF_Info_SaleElectric_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleElectric_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  CONSTRAINT [DF_Info_SaleElectric_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__2882FE7D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__297722B6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__2A6B46EF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__2B5F6B28]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleElectric] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleEquipment_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  CONSTRAINT [DF_Info_SaleEquipment_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleEquipment_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  CONSTRAINT [DF_Info_SaleEquipment_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleEquipment_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  CONSTRAINT [DF_Info_SaleEquipment_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__2F2FFC0C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__30242045]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__3118447E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__320C68B7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleEquipment] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleFacial_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  CONSTRAINT [DF_Info_SaleFacial_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleFacial_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  CONSTRAINT [DF_Info_SaleFacial_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleFacial_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  CONSTRAINT [DF_Info_SaleFacial_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__35DCF99B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__36D11DD4]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__37C5420D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__38B96646]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleFacial] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleGame_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  CONSTRAINT [DF_Info_SaleGame_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleGame_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  CONSTRAINT [DF_Info_SaleGame_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleGame_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  CONSTRAINT [DF_Info_SaleGame_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__3C89F72A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__3D7E1B63]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__3E723F9C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__3F6663D5]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleGame] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleHome_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  CONSTRAINT [DF_Info_SaleHome_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleHome_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  CONSTRAINT [DF_Info_SaleHome_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleHome_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  CONSTRAINT [DF_Info_SaleHome_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__4336F4B9]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__442B18F2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__451F3D2B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__46136164]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleHome] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleMobile_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  CONSTRAINT [DF_Info_SaleMobile_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleMobile_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  CONSTRAINT [DF_Info_SaleMobile_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleMobile_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  CONSTRAINT [DF_Info_SaleMobile_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__49E3F248]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__4AD81681]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__4BCC3ABA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__4CC05EF3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobile] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleMobileNumber_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  CONSTRAINT [DF_Info_SaleMobileNumber_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleMobileNumber_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  CONSTRAINT [DF_Info_SaleMobileNumber_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleMobileNumber_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  CONSTRAINT [DF_Info_SaleMobileNumber_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__5090EFD7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__51851410]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__52793849]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__536D5C82]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleMobileNumber] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleOffice_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  CONSTRAINT [DF_Info_SaleOffice_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleOffice_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  CONSTRAINT [DF_Info_SaleOffice_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleOffice_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  CONSTRAINT [DF_Info_SaleOffice_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__573DED66]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__5832119F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__592635D8]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__5A1A5A11]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOffice] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleOther_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  CONSTRAINT [DF_Info_SaleOther_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleOther_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  CONSTRAINT [DF_Info_SaleOther_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleOther_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  CONSTRAINT [DF_Info_SaleOther_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__5DEAEAF5]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__5EDF0F2E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__5FD33367]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__60C757A0]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleOther] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleService_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  CONSTRAINT [DF_Info_SaleService_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleService_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  CONSTRAINT [DF_Info_SaleService_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleService_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  CONSTRAINT [DF_Info_SaleService_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__6497E884]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__658C0CBD]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__668030F6]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__6774552F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleService] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleSex_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  CONSTRAINT [DF_Info_SaleSex_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleSex_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  CONSTRAINT [DF_Info_SaleSex_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleSex_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  CONSTRAINT [DF_Info_SaleSex_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__6B44E613]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__6C390A4C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__6D2D2E85]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__6E2152BE]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSex] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_SaleSwap_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  CONSTRAINT [DF_Info_SaleSwap_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_SaleSwap_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  CONSTRAINT [DF_Info_SaleSwap_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_SaleSwap_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  CONSTRAINT [DF_Info_SaleSwap_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Sale__Baidu__71F1E3A2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Googl__72E607DB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Sogou__73DA2C14]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Sale__Other__74CE504D]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_SaleSwap] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_Spider_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Spider] ADD  CONSTRAINT [DF_Info_Spider_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_Stat_Click_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_Stat_Click] ADD  CONSTRAINT [DF_Info_Stat_Click_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketAirplane_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  CONSTRAINT [DF_Info_TicketAirplane_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketAirplane_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  CONSTRAINT [DF_Info_TicketAirplane_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_TicketAirplane_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  CONSTRAINT [DF_Info_TicketAirplane_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Tick__Baidu__7A8729A3]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Googl__7B7B4DDC]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Sogou__7C6F7215]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Other__7D63964E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketAirplane] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_TicketCard_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  CONSTRAINT [DF_Info_TicketCard_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketCard_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  CONSTRAINT [DF_Info_TicketCard_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_TicketCard_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  CONSTRAINT [DF_Info_TicketCard_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Tick__Baidu__01342732]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Googl__02284B6B]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Sogou__031C6FA4]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Other__041093DD]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketCard] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_TicketOther_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  CONSTRAINT [DF_Info_TicketOther_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketOther_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  CONSTRAINT [DF_Info_TicketOther_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_TicketOther_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  CONSTRAINT [DF_Info_TicketOther_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Tick__Baidu__07E124C1]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Googl__08D548FA]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Sogou__09C96D33]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Other__0ABD916C]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketOther] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_TicketPerform_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  CONSTRAINT [DF_Info_TicketPerform_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketPerform_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  CONSTRAINT [DF_Info_TicketPerform_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_TicketPerform_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  CONSTRAINT [DF_Info_TicketPerform_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Tick__Baidu__0E8E2250]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Googl__0F824689]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Sogou__10766AC2]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Other__116A8EFB]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPerform] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_TicketPleasure_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  CONSTRAINT [DF_Info_TicketPleasure_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketPleasure_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  CONSTRAINT [DF_Info_TicketPleasure_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_TicketPleasure_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  CONSTRAINT [DF_Info_TicketPleasure_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Tick__Baidu__153B1FDF]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Googl__162F4418]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Sogou__17236851]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Other__18178C8A]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketPleasure] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_TicketTrain_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  CONSTRAINT [DF_Info_TicketTrain_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_TicketTrain_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  CONSTRAINT [DF_Info_TicketTrain_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_TicketTrain_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  CONSTRAINT [DF_Info_TicketTrain_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Tick__Baidu__1BE81D6E]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Googl__1CDC41A7]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Sogou__1DD065E0]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Tick__Other__1EC48A19]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_TicketTrain] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_YellowPage_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  CONSTRAINT [DF_Info_YellowPage_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_YellowPage_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  CONSTRAINT [DF_Info_YellowPage_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
/****** Object:  Default [DF_Info_YellowPage_Sequence]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  CONSTRAINT [DF_Info_YellowPage_Sequence]  DEFAULT ((100)) FOR [Sequence]
GO
/****** Object:  Default [DF__Info_Yell__Baidu__22951AFD]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  DEFAULT ((0)) FOR [BaiduSpiderTotal]
GO
/****** Object:  Default [DF__Info_Yell__Googl__23893F36]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  DEFAULT ((0)) FOR [GoogleSpiderTotal]
GO
/****** Object:  Default [DF__Info_Yell__Sogou__247D636F]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  DEFAULT ((0)) FOR [SogouSpiderTotal]
GO
/****** Object:  Default [DF__Info_Yell__Other__257187A8]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowPage] ADD  DEFAULT ((0)) FOR [OtherSpiderTotal]
GO
/****** Object:  Default [DF_Info_YellowTranslate_DateCreated]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowTranslate] ADD  CONSTRAINT [DF_Info_YellowTranslate_DateCreated]  DEFAULT (getdate()) FOR [DateCreated]
GO
/****** Object:  Default [DF_Info_YellowTranslate_DateModified]    Script Date: 01/20/2013 15:15:30 ******/
ALTER TABLE [dbo].[Info_YellowTranslate] ADD  CONSTRAINT [DF_Info_YellowTranslate_DateModified]  DEFAULT (getdate()) FOR [DateModified]
GO
