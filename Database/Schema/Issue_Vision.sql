-- *******************************************************
-- Create database
-- *******************************************************
USE [master]

IF EXISTS (SELECT name FROM master.dbo.sysdatabases WHERE name = N'IssueVision')
BEGIN
	DECLARE @spid smallint
	DECLARE @sql varchar(4000)

	DECLARE crsr CURSOR FAST_FORWARD FOR
		SELECT spid FROM sysprocesses p INNER JOIN sysdatabases d ON d.[name] = 'IssueVision' AND p.dbid = d.dbid

	OPEN crsr
	FETCH NEXT FROM crsr INTO @spid

	WHILE @@FETCH_STATUS != -1
	BEGIN
		SET @sql = 'KILL ' + CAST(@spid AS varchar)
		EXEC(@sql) 
		FETCH NEXT FROM crsr INTO @spid
	END

	CLOSE crsr
	DEALLOCATE crsr

	DROP DATABASE [IssueVision]
END
GO

CREATE DATABASE [IssueVision] 
GO

Use IssueVision

-- *******************************************************
-- Create tables
-- *******************************************************

/****** Object:  Table [dbo].[SubStatuses] ******/
IF OBJECT_ID('dbo.SubStatuses') IS NOT NULL
   DROP TABLE [dbo].[SubStatuses]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubStatuses](
	[SubStatusId] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_SubStatuses] PRIMARY KEY CLUSTERED 
	(
		[SubStatusId] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Statuses] ******/
IF OBJECT_ID('dbo.Statuses') IS NOT NULL
   DROP TABLE [dbo].[Statuses]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Statuses](
	[StatusID] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Statuses] PRIMARY KEY CLUSTERED 
	(
		[StatusID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Resolutions] ******/
IF OBJECT_ID('dbo.Resolutions') IS NOT NULL
   DROP TABLE [dbo].[Resolutions]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Resolutions](
	[ResolutionID] [tinyint] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	CONSTRAINT [PK_Resolutions] PRIMARY KEY CLUSTERED 
	(
		[ResolutionID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Platforms] ******/
IF OBJECT_ID('dbo.Platforms') IS NOT NULL
   DROP TABLE [dbo].[Platforms]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Platforms](
	[PlatformID] [int] NOT NULL,
	[Browser] [nvarchar](50) NOT NULL,
	[BrowserVersion] [nvarchar](50) NOT NULL,
	[OS] [nvarchar](50) NOT NULL,
	[OSVersion] [nvarchar](50) NOT NULL,
	[Language] [nvarchar](50) NULL,
	[Processor] [nvarchar](10) NULL,
	CONSTRAINT [PK_Platforms] PRIMARY KEY CLUSTERED 
	(
		[PlatformID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Files] ******/
IF OBJECT_ID('dbo.Files') IS NOT NULL
   DROP TABLE [dbo].[Files]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Files](
	[FileID] [uniqueidentifier] NOT NULL,
	[IssueID] [bigint] NOT NULL,
	[FileName] [nvarchar](50) NOT NULL,
	[Data] [varbinary](max) NOT NULL,
	CONSTRAINT [PK_Files] PRIMARY KEY CLUSTERED 
	(
		[FileID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO

/****** Object:  Table [dbo].[Attributes] ******/
IF OBJECT_ID('dbo.Attributes') IS NOT NULL
   DROP TABLE [dbo].[Attributes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[ID] [uniqueidentifier] NOT NULL,
	[IssueID] [bigint] NOT NULL,
	[AttributeName] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
	(
		[ID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IssueTypes] ******/
IF OBJECT_ID('dbo.IssueTypes') IS NOT NULL
   DROP TABLE [dbo].[IssueTypes]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueTypes](
	[IssueTypeID] [tinyint] NOT NULL,
	[Name] [nchar](50) NOT NULL,
	CONSTRAINT [PK_IssueTypes] PRIMARY KEY CLUSTERED 
	(
		[IssueTypeID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Issues] ******/
IF OBJECT_ID('dbo.Issues') IS NOT NULL
   DROP TABLE [dbo].[Issues]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Issues](
	[IssueID] [bigint] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[SubStatusID] [tinyint] NULL,
	[AssignedToID] [nvarchar](50) NULL,
	[IssueTypeID] [tinyint] NOT NULL,
	[Severity] [tinyint] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[ChangedByID] [nvarchar](50) NOT NULL,
	[LastChange] [datetime] NOT NULL,
	[OpenedDate] [datetime] NOT NULL,
	[OpenedByID] [nvarchar](50) NOT NULL,
	[PlatformID] [int] NULL,
	[ResolutionDate] [datetime] NULL,
	[ResolutionID] [tinyint] NULL,
	[ResolvedByID] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ReproSteps] [nvarchar](max) NULL,
	[DuplicateID] [bigint] NULL,
	CONSTRAINT [PK_Issues] PRIMARY KEY CLUSTERED 
	(
		[IssueID] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[IssueHistory] ******/
IF OBJECT_ID('dbo.IssueHistory') IS NOT NULL
   DROP TABLE [dbo].[IssueHistory]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[IssueHistory] (
	[IssueHistoryID] [int] IDENTITY (1, 1) NOT NULL ,
	[IssueID] [bigint] NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[StatusID] [tinyint] NOT NULL,
	[SubStatusID] [tinyint] NULL,
	[AssignedToID] [nvarchar](50) NULL,
	[IssueTypeID] [tinyint] NOT NULL,
	[Severity] [tinyint] NOT NULL,
	[Priority] [tinyint] NOT NULL,
	[ChangedByID] [nvarchar](50) NOT NULL,
	[LastChange] [datetime] NOT NULL,
	[OpenedDate] [datetime] NOT NULL,
	[OpenedByID] [nvarchar](50) NOT NULL,
	[PlatformID] [int] NULL,
	[ResolutionDate] [datetime] NULL,
	[ResolutionID] [tinyint] NULL,
	[ResolvedByID] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
	[ReproSteps] [nvarchar](max) NULL,
	[DuplicateID] [bigint] NULL,
	[Action] [nvarchar](50) NOT NULL,
	[Comment] [nvarchar](3000) NULL,
	[DateCreated] [datetime] NOT NULL DEFAULT (getdate()),
	CONSTRAINT [PK_IssueHistory] PRIMARY KEY  CLUSTERED 
	(
		[IssueHistoryID]
	)  ON [PRIMARY] 
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Users] ******/
IF OBJECT_ID('dbo.Users') IS NOT NULL
   DROP TABLE [dbo].[Users]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Name] [nvarchar](50) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](100) NULL ,
	[PasswordHash] [nvarchar](100) NOT NULL ,
	[PasswordSalt] [nvarchar](10) NOT NULL, 
	[PasswordQuestion] [nvarchar](200) NOT NULL ,
	[PasswordAnswerHash] [nvarchar](100) NOT NULL ,
	[PasswordAnswerSalt] [nvarchar](10)  NOT NULL, 
	[UserType] [char](1) NOT NULL,
	[ProfileReset] [tinyint] NOT NULL,
	CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
	(
		[Name] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

IF OBJECT_ID('dbo.SecurityQuestions') IS NOT NULL
   DROP TABLE [dbo].[SecurityQuestions]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SecurityQuestions](
    [PasswordQuestion] [nvarchar](200) NOT NULL,
	CONSTRAINT [PK_SecurityQuestions] PRIMARY KEY CLUSTERED
	(
		[PasswordQuestion] ASC
	) ON [PRIMARY]
) ON [PRIMARY]
GO

-- *******************************************************
-- Create foreign keys
-- *******************************************************

/****** Object:  ForeignKey [Issues] ******/
IF OBJECT_ID('FK_Issues_AssignedTo') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_AssignedTo]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_AssignedTo] FOREIGN KEY 
	(
		[AssignedToID]
	) REFERENCES [dbo].[Users] (
		[Name]
	)
GO

IF OBJECT_ID('FK_Issues_ChangedBy') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_ChangedBy]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_ChangedBy] FOREIGN KEY 
	(
		[ChangedByID]
	) REFERENCES [dbo].[Users] (
		[Name]
	)
GO

IF OBJECT_ID('FK_Issues_Duplicate') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_Duplicate]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_Duplicate] FOREIGN KEY 
	(
		[DuplicateID]
	) REFERENCES [dbo].[Issues] (
		[IssueID]
	)
GO

IF OBJECT_ID('FK_Issues_IssueType') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_IssueType]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_IssueType] FOREIGN KEY 
	(
		[IssueTypeID]
	) REFERENCES [dbo].[IssueTypes] (
		[IssueTypeID]
	)
GO

IF OBJECT_ID('FK_Issues_OpenedBy') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_OpenedBy]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_OpenedBy] FOREIGN KEY 
	(
		[OpenedByID]
	) REFERENCES [dbo].[Users] (
		[Name]
	)
GO

IF OBJECT_ID('FK_Issues_Platform') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_Platform]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_Platform] FOREIGN KEY 
	(
		[PlatformID]
	) REFERENCES [dbo].[Platforms] (
		[PlatformID]
	)
GO

IF OBJECT_ID('FK_Issues_Resolution') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_Resolution]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_Resolution] FOREIGN KEY 
	(
		[ResolutionID]
	) REFERENCES [dbo].[Resolutions] (
		[ResolutionID]
	)
GO

IF OBJECT_ID('FK_Issues_ResolvedBy') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_ResolvedBy]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_ResolvedBy] FOREIGN KEY 
	(
		[ResolvedByID]
	) REFERENCES [dbo].[Users] (
		[Name]
	)
GO

IF OBJECT_ID('FK_Issues_Status') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_Status]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_Status] FOREIGN KEY 
	(
		[StatusID]
	) REFERENCES [dbo].[Statuses] (
		[StatusID]
	)
GO

IF OBJECT_ID('FK_Issues_SubStatus') IS NOT NULL
  ALTER TABLE [dbo].[Issues] DROP CONSTRAINT [FK_Issues_SubStatus]
GO
ALTER TABLE [dbo].[Issues]
  ADD 
	CONSTRAINT [FK_Issues_SubStatus] FOREIGN KEY 
	(
		[SubStatusID]
	) REFERENCES [dbo].[SubStatuses] (
		[SubStatusID]
	)
GO

/****** Object:  ForeignKey [Attributes] ******/
IF OBJECT_ID('FK_Attributes_IssueAttributes') IS NOT NULL
  ALTER TABLE [dbo].[Attributes] DROP CONSTRAINT [FK_Attributes_IssueAttributes]
GO
ALTER TABLE [dbo].[Attributes]
  ADD 
	CONSTRAINT [FK_Attributes_IssueAttributes] FOREIGN KEY 
	(
		[IssueID]
	) REFERENCES [dbo].[Issues] (
		[IssueID]
	)
GO

/****** Object:  ForeignKey [Files] ******/
IF OBJECT_ID('FK_Files_AttachedFiles') IS NOT NULL
  ALTER TABLE [dbo].[Files] DROP CONSTRAINT [FK_Files_AttachedFiles]
GO
ALTER TABLE [dbo].[Files]
  ADD 
	CONSTRAINT [FK_Files_AttachedFiles] FOREIGN KEY 
	(
		[IssueID]
	) REFERENCES [dbo].[Issues] (
		[IssueID]
	)
GO

/****** Object:  ForeignKey [Users] ******/
IF OBJECT_ID('FK_Users_PasswordQuestion') IS NOT NULL
  ALTER TABLE [dbo].[Users] DROP CONSTRAINT FK_Users_PasswordQuestion
GO
ALTER TABLE [dbo].[Users]
  ADD 
	CONSTRAINT [FK_Users_PasswordQuestion] FOREIGN KEY 
	(
		[PasswordQuestion]
	) REFERENCES [dbo].[SecurityQuestions] (
		[PasswordQuestion]
	)
GO

-- *******************************************************
-- Create triggers
-- *******************************************************

/****** Object:  Trigger [Issues] ******/
SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

IF OBJECT_ID('dbo.Insert_Issue') IS NOT NULL
   DROP TRIGGER [dbo].[Insert_Issue]
GO
CREATE TRIGGER [dbo].[Insert_Issue]
ON Issues
AFTER INSERT
AS
INSERT [dbo].[IssueHistory] ([IssueID],
							[Title],
							[StatusID],
							[SubStatusID],
							[AssignedToID],
							[IssueTypeID],
							[Severity],
							[Priority],
							[ChangedByID],
							[LastChange],
							[OpenedDate],
							[OpenedByID],
							[PlatformID],
							[ResolutionDate],
							[ResolutionID],
							[ResolvedByID],
							[Description],
							[ReproSteps],
							[DuplicateID],
                             [Action])
SELECT 	[IssueID],
		[Title],
		[StatusID],
		[SubStatusID],
		[AssignedToID],
		[IssueTypeID],
		[Severity],
		[Priority],
		[ChangedByID],
		[LastChange],
		[OpenedDate],
		[OpenedByID],
		[PlatformID],
		[ResolutionDate],
		[ResolutionID],
		[ResolvedByID],
		[Description],
		[ReproSteps],
		[DuplicateID], 
		'INSERTED' 
FROM inserted
GO

IF OBJECT_ID('dbo.Update_Issue') IS NOT NULL
   DROP TRIGGER [dbo].[Update_Issue]
GO
CREATE TRIGGER [dbo].[Update_Issue]
ON Issues
AFTER UPDATE
AS
INSERT [dbo].[IssueHistory] ([IssueID],
							[Title],
							[StatusID],
							[SubStatusID],
							[AssignedToID],
							[IssueTypeID],
							[Severity],
							[Priority],
							[ChangedByID],
							[LastChange],
							[OpenedDate],
							[OpenedByID],
							[PlatformID],
							[ResolutionDate],
							[ResolutionID],
							[ResolvedByID],
							[Description],
							[ReproSteps],
							[DuplicateID],
                             [Action])
SELECT 	[IssueID],
		[Title],
		[StatusID],
		[SubStatusID],
		[AssignedToID],
		[IssueTypeID],
		[Severity],
		[Priority],
		[ChangedByID],
		[LastChange],
		[OpenedDate],
		[OpenedByID],
		[PlatformID],
		[ResolutionDate],
		[ResolutionID],
		[ResolvedByID],
		[Description],
		[ReproSteps],
		[DuplicateID], 
		'BEFORE UPDATE' 
FROM deleted

INSERT [dbo].[IssueHistory] ([IssueID],
							[Title],
							[StatusID],
							[SubStatusID],
							[AssignedToID],
							[IssueTypeID],
							[Severity],
							[Priority],
							[ChangedByID],
							[LastChange],
							[OpenedDate],
							[OpenedByID],
							[PlatformID],
							[ResolutionDate],
							[ResolutionID],
							[ResolvedByID],
							[Description],
							[ReproSteps],
							[DuplicateID],
                             [Action])
SELECT 	[IssueID],
		[Title],
		[StatusID],
		[SubStatusID],
		[AssignedToID],
		[IssueTypeID],
		[Severity],
		[Priority],
		[ChangedByID],
		[LastChange],
		[OpenedDate],
		[OpenedByID],
		[PlatformID],
		[ResolutionDate],
		[ResolutionID],
		[ResolvedByID],
		[Description],
		[ReproSteps],
		[DuplicateID], 
		'AFTER UPDATE' 
FROM inserted
GO

IF OBJECT_ID('dbo.Delete_Issue') IS NOT NULL
   DROP TRIGGER [dbo].[Delete_Issue]
GO
CREATE TRIGGER [dbo].[Delete_Issue]
ON Issues
AFTER DELETE
AS
INSERT [dbo].[IssueHistory] ([IssueID],
							[Title],
							[StatusID],
							[SubStatusID],
							[AssignedToID],
							[IssueTypeID],
							[Severity],
							[Priority],
							[ChangedByID],
							[LastChange],
							[OpenedDate],
							[OpenedByID],
							[PlatformID],
							[ResolutionDate],
							[ResolutionID],
							[ResolvedByID],
							[Description],
							[ReproSteps],
							[DuplicateID],
                             [Action])
SELECT 	[IssueID],
		[Title],
		[StatusID],
		[SubStatusID],
		[AssignedToID],
		[IssueTypeID],
		[Severity],
		[Priority],
		[ChangedByID],
		[LastChange],
		[OpenedDate],
		[OpenedByID],
		[PlatformID],
		[ResolutionDate],
		[ResolutionID],
		[ResolvedByID],
		[Description],
		[ReproSteps],
		[DuplicateID], 
		'DELETE' 
FROM deleted
GO


-- *******************************************************
-- Create login user
-- *******************************************************

if not exists (select * from master.dbo.syslogins where loginname = N'IVUser')
BEGIN
	declare @logindb nvarchar(132), @loginlang nvarchar(132) select @logindb = N'IssueVision', @loginlang = N'us_english'
	if @logindb is null or not exists (select * from master.dbo.sysdatabases where name = @logindb)
		select @logindb = N'master'
	if @loginlang is null or (not exists (select * from master.dbo.syslanguages where name = @loginlang) and @loginlang <> N'us_english')
		select @loginlang = @@language
	exec sp_addlogin N'IVUser', N'uLwJ1cUj4asWaHwV11hW', @logindb, @loginlang
END
GO

if not exists (select * from dbo.sysusers where name = N'IVUser' and uid < 16382)
	EXEC sp_grantdbaccess N'IVUser', N'IVUser'
GO

GRANT  SELECT  TO [IVUser]
GO

GRANT  UPDATE  TO [IVUser]
GO

GRANT  INSERT  TO [IVUser]
GO

GRANT  DELETE  TO [IVUser]
GO