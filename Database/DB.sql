 USE [master]
GO
/****** Object:  Database [TripsDB]    Script Date: 6/1/2021 8:50:47 PM ******/
CREATE DATABASE [TripsDB]
GO
USE [TripsDB]
GO
/****** Object:  Table [dbo].[Inbox]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inbox](
	[MsgID] [int] IDENTITY(1,1) NOT NULL,
	[PersonFromID] [int] NULL,
	[PersonToID] [int] NULL,
	[DateOfMessage] [date] NULL,
	[MsgContent] [nvarchar](500) NULL,
 CONSTRAINT [PK_Inbox] PRIMARY KEY CLUSTERED 
(
	[MsgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[PersonID] [int] IDENTITY(1,1) NOT NULL,
	[FName] [nvarchar](100) NOT NULL,
	[LName] [nvarchar](100) NULL,
	[Mail] [nvarchar](50) NULL,
	[Phone] [nvarchar](20) NULL,
	[Photo] [image] NULL,
	[Role] [int] NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Posts]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Posts](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NOT NULL,
	[TripTitle] [nvarchar](50) NULL,
	[TripDetails] [nvarchar](250) NULL,
	[PostDate] [date] NULL,
	[TripDate] [date] NULL,
	[TripDestination] [nvarchar](50) NULL,
	[TripImage] [image] NULL,
	[TripPrice] [money] NULL,
	[IsApproved] [int] NULL,
 CONSTRAINT [PK_Posts] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PostsStatus]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PostsStatus](
	[PersonID] [int] NOT NULL,
	[PostsID] [int] NOT NULL,
	[Status] [int] NOT NULL,
 CONSTRAINT [PK_PostsStatus] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[PostsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SavedPosts]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SavedPosts](
	[PersonID] [int] NOT NULL,
	[PostID] [int] NOT NULL,
 CONSTRAINT [PK_SavedPosts] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC,
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/1/2021 8:50:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[PersonID] [int] NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Password] [varbinary](max) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[PersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = On) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Inbox]  WITH CHECK ADD  CONSTRAINT [FK_Inbox_Persons2] FOREIGN KEY([PersonFromID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[Inbox] CHECK CONSTRAINT [FK_Inbox_Persons2]
GO
ALTER TABLE [dbo].[Inbox]  WITH CHECK ADD  CONSTRAINT [FK_Inbox_Persons3] FOREIGN KEY([PersonToID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[Inbox] CHECK CONSTRAINT [FK_Inbox_Persons3]
GO
ALTER TABLE [dbo].[Persons]  WITH CHECK ADD  CONSTRAINT [FK_Persons_Roles] FOREIGN KEY([Role])
REFERENCES [dbo].[Roles] ([ID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Persons] CHECK CONSTRAINT [FK_Persons_Roles]
GO
ALTER TABLE [dbo].[Posts]  WITH CHECK ADD  CONSTRAINT [FK_Posts_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Posts] CHECK CONSTRAINT [FK_Posts_Persons]
GO
ALTER TABLE [dbo].[PostsStatus]  WITH CHECK ADD  CONSTRAINT [FK_PostsStatus_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[PostsStatus] CHECK CONSTRAINT [FK_PostsStatus_Persons]
GO
ALTER TABLE [dbo].[PostsStatus]  WITH CHECK ADD  CONSTRAINT [FK_PostsStatus_Posts] FOREIGN KEY([PostsID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[PostsStatus] CHECK CONSTRAINT [FK_PostsStatus_Posts]
GO
ALTER TABLE [dbo].[SavedPosts]  WITH CHECK ADD  CONSTRAINT [FK_SavedPosts_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
GO
ALTER TABLE [dbo].[SavedPosts] CHECK CONSTRAINT [FK_SavedPosts_Persons]
GO
ALTER TABLE [dbo].[SavedPosts]  WITH CHECK ADD  CONSTRAINT [FK_SavedPosts_Posts] FOREIGN KEY([PostID])
REFERENCES [dbo].[Posts] ([PostID])
GO
ALTER TABLE [dbo].[SavedPosts] CHECK CONSTRAINT [FK_SavedPosts_Posts]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Persons] FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([PersonID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Persons]
GO
USE [master]
GO
ALTER DATABASE [TripsDB] SET  READ_WRITE 
GO
