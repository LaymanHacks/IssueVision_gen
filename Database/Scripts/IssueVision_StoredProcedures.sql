
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_Select]

  AS
   SET NOCOUNT ON;
SELECT [ID], [IssueID], [AttributeName], [Value] FROM [Attributes]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_Select]

  AS
   SET NOCOUNT ON;
   SELECT [ID], [IssueID], [AttributeName], [Value] FROM [Attributes]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_Update]
(
@ID uniqueidentifier, 
@IssueID bigint, 
@AttributeName ntext, 
@Value ntext
  )

  AS
   SET NOCOUNT ON;
UPDATE [Attributes] SET [ID]=@ID, [IssueID]=@IssueID, [AttributeName]=@AttributeName, [Value]=@Value WHERE [ID]=@ID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_Update]
(
@ID uniqueidentifier, 
@IssueID bigint, 
@AttributeName ntext, 
@Value ntext
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Attributes] SET [ID]=@ID, [IssueID]=@IssueID, [AttributeName]=@AttributeName, [Value]=@Value WHERE [ID]=@ID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_Insert]
(
@ID uniqueidentifier, 
@IssueID bigint, 
@AttributeName ntext, 
@Value ntext
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Attributes] ([ID], [IssueID], [AttributeName], [Value]) VALUES (@ID, @IssueID, @AttributeName, @Value);SELECT @ID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_Insert]
(
@ID uniqueidentifier, 
@IssueID bigint, 
@AttributeName ntext, 
@Value ntext
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Attributes] ([ID], [IssueID], [AttributeName], [Value]) VALUES (@ID, @IssueID, @AttributeName, @Value);SELECT @ID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_Delete]
(
@ID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Attributes] WHERE [ID]=@ID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_Delete]
(
@ID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Attributes] WHERE [ID]=@ID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [ID], [IssueID], [AttributeName], [Value] FROM (
		   SELECT [ID], [IssueID], [AttributeName], [Value],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Attributes) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [ID], [IssueID], [AttributeName], [Value] FROM (
		   SELECT [ID], [IssueID], [AttributeName], [Value],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Attributes) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(ID) FROM Attributes'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(ID) FROM Attributes'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_GetDataByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_GetDataByID]
(
@ID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
SELECT [ID], [IssueID], [AttributeName], [Value] FROM [Attributes] WHERE [ID]=@ID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_GetDataByID]
(
@ID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
   SELECT [ID], [IssueID], [AttributeName], [Value] FROM [Attributes] WHERE [ID]=@ID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_GetDataByIssueID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_GetDataByIssueID]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT [ID], [IssueID], [AttributeName], [Value] FROM [Attributes] WHERE [IssueID] = @IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_GetDataByIssueID]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT [ID], [IssueID], [AttributeName], [Value] FROM [Attributes] WHERE [IssueID] = @IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_GetDataByIssueIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_GetDataByIssueIDPageable]
(
@IssueID bigint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [ID], [IssueID], [AttributeName], [Value] FROM (
		   SELECT [ID], [IssueID], [AttributeName], [Value],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Attributes WHERE IssueID = @INIssueID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INIssueID bigint,@inStartRowIndex Int,@inPageSize Int'', @INIssueID = @IssueID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_GetDataByIssueIDPageable]
(
@IssueID bigint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [ID], [IssueID], [AttributeName], [Value] FROM (
		   SELECT [ID], [IssueID], [AttributeName], [Value],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Attributes WHERE IssueID = @INIssueID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INIssueID bigint,@inStartRowIndex Int,@inPageSize Int'', @INIssueID = @IssueID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Attributes_GetDataByIssueIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Attributes_GetDataByIssueIDRowCount]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(IssueID) FROM Attributes WHERE IssueID = @IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Attributes_GetDataByIssueIDRowCount]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(IssueID) FROM Attributes WHERE IssueID = @IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_Select]

  AS
   SET NOCOUNT ON;
SELECT [FileID], [IssueID], [FileName], [Data] FROM [Files]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_Select]

  AS
   SET NOCOUNT ON;
   SELECT [FileID], [IssueID], [FileName], [Data] FROM [Files]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_Update]
(
@FileID uniqueidentifier, 
@IssueID bigint, 
@FileName nvarchar(100), 
@Data image
  )

  AS
   SET NOCOUNT ON;
UPDATE [Files] SET [FileID]=@FileID, [IssueID]=@IssueID, [FileName]=@FileName, [Data]=@Data WHERE [FileID]=@FileID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_Update]
(
@FileID uniqueidentifier, 
@IssueID bigint, 
@FileName nvarchar(100), 
@Data image
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Files] SET [FileID]=@FileID, [IssueID]=@IssueID, [FileName]=@FileName, [Data]=@Data WHERE [FileID]=@FileID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_Insert]
(
@FileID uniqueidentifier, 
@IssueID bigint, 
@FileName nvarchar(100), 
@Data image
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Files] ([FileID], [IssueID], [FileName], [Data]) VALUES (@FileID, @IssueID, @FileName, @Data);SELECT @FileID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_Insert]
(
@FileID uniqueidentifier, 
@IssueID bigint, 
@FileName nvarchar(100), 
@Data image
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Files] ([FileID], [IssueID], [FileName], [Data]) VALUES (@FileID, @IssueID, @FileName, @Data);SELECT @FileID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_Delete]
(
@FileID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Files] WHERE [FileID]=@FileID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_Delete]
(
@FileID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Files] WHERE [FileID]=@FileID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''FileID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [FileID], [IssueID], [FileName], [Data] FROM (
		   SELECT [FileID], [IssueID], [FileName], [Data],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Files) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''FileID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [FileID], [IssueID], [FileName], [Data] FROM (
		   SELECT [FileID], [IssueID], [FileName], [Data],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Files) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(FileID) FROM Files'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(FileID) FROM Files'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_GetDataByFileID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_GetDataByFileID]
(
@FileID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
SELECT [FileID], [IssueID], [FileName], [Data] FROM [Files] WHERE [FileID]=@FileID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_GetDataByFileID]
(
@FileID uniqueidentifier
  )

  AS
   SET NOCOUNT ON;
   SELECT [FileID], [IssueID], [FileName], [Data] FROM [Files] WHERE [FileID]=@FileID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_GetDataByIssueID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_GetDataByIssueID]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT [FileID], [IssueID], [FileName], [Data] FROM [Files] WHERE [IssueID] = @IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_GetDataByIssueID]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT [FileID], [IssueID], [FileName], [Data] FROM [Files] WHERE [IssueID] = @IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_GetDataByIssueIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_GetDataByIssueIDPageable]
(
@IssueID bigint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [FileID], [IssueID], [FileName], [Data] FROM (
		   SELECT [FileID], [IssueID], [FileName], [Data],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Files WHERE IssueID = @INIssueID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INIssueID bigint,@inStartRowIndex Int,@inPageSize Int'', @INIssueID = @IssueID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_GetDataByIssueIDPageable]
(
@IssueID bigint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [FileID], [IssueID], [FileName], [Data] FROM (
		   SELECT [FileID], [IssueID], [FileName], [Data],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Files WHERE IssueID = @INIssueID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INIssueID bigint,@inStartRowIndex Int,@inPageSize Int'', @INIssueID = @IssueID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Files_GetDataByIssueIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Files_GetDataByIssueIDRowCount]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(IssueID) FROM Files WHERE IssueID = @IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Files_GetDataByIssueIDRowCount]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(IssueID) FROM Files WHERE IssueID = @IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_Select]

  AS
   SET NOCOUNT ON;
SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated] FROM [IssueHistory]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_Select]

  AS
   SET NOCOUNT ON;
   SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated] FROM [IssueHistory]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_Update]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint, 
@Action nvarchar(100), 
@Comment nvarchar(6000), 
@DateCreated datetime, 
@IssueHistoryID int
  )

  AS
   SET NOCOUNT ON;
UPDATE [IssueHistory] SET [IssueID]=@IssueID, [Title]=@Title, [StatusID]=@StatusID, [SubStatusID]=@SubStatusID, [AssignedToID]=@AssignedToID, [IssueTypeID]=@IssueTypeID, [Severity]=@Severity, [Priority]=@Priority, [ChangedByID]=@ChangedByID, [LastChange]=@LastChange, [OpenedDate]=@OpenedDate, [OpenedByID]=@OpenedByID, [PlatformID]=@PlatformID, [ResolutionDate]=@ResolutionDate, [ResolutionID]=@ResolutionID, [ResolvedByID]=@ResolvedByID, [Description]=@Description, [ReproSteps]=@ReproSteps, [DuplicateID]=@DuplicateID, [Action]=@Action, [Comment]=@Comment, [DateCreated]=@DateCreated WHERE [IssueHistoryID]=@IssueHistoryID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_Update]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint, 
@Action nvarchar(100), 
@Comment nvarchar(6000), 
@DateCreated datetime, 
@IssueHistoryID int
  )

  AS
   SET NOCOUNT ON;
   UPDATE [IssueHistory] SET [IssueID]=@IssueID, [Title]=@Title, [StatusID]=@StatusID, [SubStatusID]=@SubStatusID, [AssignedToID]=@AssignedToID, [IssueTypeID]=@IssueTypeID, [Severity]=@Severity, [Priority]=@Priority, [ChangedByID]=@ChangedByID, [LastChange]=@LastChange, [OpenedDate]=@OpenedDate, [OpenedByID]=@OpenedByID, [PlatformID]=@PlatformID, [ResolutionDate]=@ResolutionDate, [ResolutionID]=@ResolutionID, [ResolvedByID]=@ResolvedByID, [Description]=@Description, [ReproSteps]=@ReproSteps, [DuplicateID]=@DuplicateID, [Action]=@Action, [Comment]=@Comment, [DateCreated]=@DateCreated WHERE [IssueHistoryID]=@IssueHistoryID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_Insert]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint, 
@Action nvarchar(100), 
@Comment nvarchar(6000), 
@DateCreated datetime
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [IssueHistory] ([IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated]) VALUES (@IssueID, @Title, @StatusID, @SubStatusID, @AssignedToID, @IssueTypeID, @Severity, @Priority, @ChangedByID, @LastChange, @OpenedDate, @OpenedByID, @PlatformID, @ResolutionDate, @ResolutionID, @ResolvedByID, @Description, @ReproSteps, @DuplicateID, @Action, @Comment, @DateCreated);SELECT SCOPE_IDENTITY();'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_Insert]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint, 
@Action nvarchar(100), 
@Comment nvarchar(6000), 
@DateCreated datetime
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [IssueHistory] ([IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated]) VALUES (@IssueID, @Title, @StatusID, @SubStatusID, @AssignedToID, @IssueTypeID, @Severity, @Priority, @ChangedByID, @LastChange, @OpenedDate, @OpenedByID, @PlatformID, @ResolutionDate, @ResolutionID, @ResolvedByID, @Description, @ReproSteps, @DuplicateID, @Action, @Comment, @DateCreated);SELECT SCOPE_IDENTITY();'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_Delete]
(
@IssueHistoryID int
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [IssueHistory] WHERE [IssueHistoryID]=@IssueHistoryID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_Delete]
(
@IssueHistoryID int
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [IssueHistory] WHERE [IssueHistoryID]=@IssueHistoryID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueHistoryID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated] FROM (
		   SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM IssueHistory) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueHistoryID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated] FROM (
		   SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM IssueHistory) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(IssueHistoryID) FROM IssueHistory'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(IssueHistoryID) FROM IssueHistory'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueHistory_GetDataByIssueHistoryID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueHistory_GetDataByIssueHistoryID]
(
@IssueHistoryID int
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated] FROM [IssueHistory] WHERE [IssueHistoryID]=@IssueHistoryID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueHistory_GetDataByIssueHistoryID]
(
@IssueHistoryID int
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueHistoryID], [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID], [Action], [Comment], [DateCreated] FROM [IssueHistory] WHERE [IssueHistoryID]=@IssueHistoryID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_Select]

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_Select]

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_Update]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
UPDATE [Issues] SET [IssueID]=@IssueID, [Title]=@Title, [StatusID]=@StatusID, [SubStatusID]=@SubStatusID, [AssignedToID]=@AssignedToID, [IssueTypeID]=@IssueTypeID, [Severity]=@Severity, [Priority]=@Priority, [ChangedByID]=@ChangedByID, [LastChange]=@LastChange, [OpenedDate]=@OpenedDate, [OpenedByID]=@OpenedByID, [PlatformID]=@PlatformID, [ResolutionDate]=@ResolutionDate, [ResolutionID]=@ResolutionID, [ResolvedByID]=@ResolvedByID, [Description]=@Description, [ReproSteps]=@ReproSteps, [DuplicateID]=@DuplicateID WHERE [IssueID]=@IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_Update]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Issues] SET [IssueID]=@IssueID, [Title]=@Title, [StatusID]=@StatusID, [SubStatusID]=@SubStatusID, [AssignedToID]=@AssignedToID, [IssueTypeID]=@IssueTypeID, [Severity]=@Severity, [Priority]=@Priority, [ChangedByID]=@ChangedByID, [LastChange]=@LastChange, [OpenedDate]=@OpenedDate, [OpenedByID]=@OpenedByID, [PlatformID]=@PlatformID, [ResolutionDate]=@ResolutionDate, [ResolutionID]=@ResolutionID, [ResolvedByID]=@ResolvedByID, [Description]=@Description, [ReproSteps]=@ReproSteps, [DuplicateID]=@DuplicateID WHERE [IssueID]=@IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_Insert]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Issues] ([IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID]) VALUES (@IssueID, @Title, @StatusID, @SubStatusID, @AssignedToID, @IssueTypeID, @Severity, @Priority, @ChangedByID, @LastChange, @OpenedDate, @OpenedByID, @PlatformID, @ResolutionDate, @ResolutionID, @ResolvedByID, @Description, @ReproSteps, @DuplicateID);SELECT @IssueID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_Insert]
(
@IssueID bigint, 
@Title ntext, 
@StatusID tinyint, 
@SubStatusID tinyint, 
@AssignedToID nvarchar(100), 
@IssueTypeID tinyint, 
@Severity tinyint, 
@Priority tinyint, 
@ChangedByID nvarchar(100), 
@LastChange datetime, 
@OpenedDate datetime, 
@OpenedByID nvarchar(100), 
@PlatformID int, 
@ResolutionDate datetime, 
@ResolutionID tinyint, 
@ResolvedByID nvarchar(100), 
@Description ntext, 
@ReproSteps ntext, 
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Issues] ([IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID]) VALUES (@IssueID, @Title, @StatusID, @SubStatusID, @AssignedToID, @IssueTypeID, @Severity, @Priority, @ChangedByID, @LastChange, @OpenedDate, @OpenedByID, @PlatformID, @ResolutionDate, @ResolutionID, @ResolvedByID, @Description, @ReproSteps, @DuplicateID);SELECT @IssueID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_Delete]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Issues] WHERE [IssueID]=@IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_Delete]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Issues] WHERE [IssueID]=@IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(IssueID) FROM Issues'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(IssueID) FROM Issues'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByIssueID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByIssueID]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [IssueID]=@IssueID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByIssueID]
(
@IssueID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [IssueID]=@IssueID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByDuplicateID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByDuplicateID]
(
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [DuplicateID] = @DuplicateID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByDuplicateID]
(
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [DuplicateID] = @DuplicateID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByDuplicateIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByDuplicateIDPageable]
(
@DuplicateID bigint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''DuplicateID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE DuplicateID = @INDuplicateID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INDuplicateID bigint,@inStartRowIndex Int,@inPageSize Int'', @INDuplicateID = @DuplicateID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByDuplicateIDPageable]
(
@DuplicateID bigint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''DuplicateID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE DuplicateID = @INDuplicateID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INDuplicateID bigint,@inStartRowIndex Int,@inPageSize Int'', @INDuplicateID = @DuplicateID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByDuplicateIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByDuplicateIDRowCount]
(
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(DuplicateID) FROM Issues WHERE DuplicateID = @DuplicateID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByDuplicateIDRowCount]
(
@DuplicateID bigint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(DuplicateID) FROM Issues WHERE DuplicateID = @DuplicateID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByIssueTypeID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByIssueTypeID]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [IssueTypeID] = @IssueTypeID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByIssueTypeID]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [IssueTypeID] = @IssueTypeID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByIssueTypeIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByIssueTypeIDPageable]
(
@IssueTypeID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueTypeID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE IssueTypeID = @INIssueTypeID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INIssueTypeID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INIssueTypeID = @IssueTypeID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByIssueTypeIDPageable]
(
@IssueTypeID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueTypeID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE IssueTypeID = @INIssueTypeID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INIssueTypeID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INIssueTypeID = @IssueTypeID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByIssueTypeIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByIssueTypeIDRowCount]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(IssueTypeID) FROM Issues WHERE IssueTypeID = @IssueTypeID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByIssueTypeIDRowCount]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(IssueTypeID) FROM Issues WHERE IssueTypeID = @IssueTypeID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByPlatformID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByPlatformID]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [PlatformID] = @PlatformID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByPlatformID]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [PlatformID] = @PlatformID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByPlatformIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByPlatformIDPageable]
(
@PlatformID int, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PlatformID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE PlatformID = @INPlatformID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INPlatformID int,@inStartRowIndex Int,@inPageSize Int'', @INPlatformID = @PlatformID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByPlatformIDPageable]
(
@PlatformID int, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PlatformID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE PlatformID = @INPlatformID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INPlatformID int,@inStartRowIndex Int,@inPageSize Int'', @INPlatformID = @PlatformID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByPlatformIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByPlatformIDRowCount]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(PlatformID) FROM Issues WHERE PlatformID = @PlatformID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByPlatformIDRowCount]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(PlatformID) FROM Issues WHERE PlatformID = @PlatformID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByResolutionID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByResolutionID]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [ResolutionID] = @ResolutionID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByResolutionID]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [ResolutionID] = @ResolutionID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByResolutionIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByResolutionIDPageable]
(
@ResolutionID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ResolutionID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE ResolutionID = @INResolutionID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INResolutionID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INResolutionID = @ResolutionID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByResolutionIDPageable]
(
@ResolutionID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ResolutionID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE ResolutionID = @INResolutionID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INResolutionID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INResolutionID = @ResolutionID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByResolutionIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByResolutionIDRowCount]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(ResolutionID) FROM Issues WHERE ResolutionID = @ResolutionID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByResolutionIDRowCount]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(ResolutionID) FROM Issues WHERE ResolutionID = @ResolutionID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByStatusID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByStatusID]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [StatusID] = @StatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByStatusID]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [StatusID] = @StatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByStatusIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByStatusIDPageable]
(
@StatusID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''StatusID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE StatusID = @INStatusID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INStatusID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INStatusID = @StatusID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByStatusIDPageable]
(
@StatusID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''StatusID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE StatusID = @INStatusID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INStatusID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INStatusID = @StatusID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByStatusIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByStatusIDRowCount]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(StatusID) FROM Issues WHERE StatusID = @StatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByStatusIDRowCount]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(StatusID) FROM Issues WHERE StatusID = @StatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataBySubStatusID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataBySubStatusID]
(
@SubStatusID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [SubStatusID] = @SubStatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataBySubStatusID]
(
@SubStatusID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [SubStatusID] = @SubStatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataBySubStatusIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataBySubStatusIDPageable]
(
@SubStatusID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''SubStatusID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE SubStatusID = @INSubStatusID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INSubStatusID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INSubStatusID = @SubStatusID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataBySubStatusIDPageable]
(
@SubStatusID tinyint, 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''SubStatusID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE SubStatusID = @INSubStatusID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INSubStatusID tinyint,@inStartRowIndex Int,@inPageSize Int'', @INSubStatusID = @SubStatusID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataBySubStatusIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataBySubStatusIDRowCount]
(
@SubStatusID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(SubStatusID) FROM Issues WHERE SubStatusID = @SubStatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataBySubStatusIDRowCount]
(
@SubStatusID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(SubStatusID) FROM Issues WHERE SubStatusID = @SubStatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByAssignedToID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByAssignedToID]
(
@AssignedToID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [AssignedToID] = @AssignedToID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByAssignedToID]
(
@AssignedToID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [AssignedToID] = @AssignedToID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByAssignedToIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByAssignedToIDPageable]
(
@AssignedToID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''AssignedToID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE AssignedToID = @INAssignedToID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INAssignedToID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INAssignedToID = @AssignedToID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByAssignedToIDPageable]
(
@AssignedToID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''AssignedToID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE AssignedToID = @INAssignedToID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INAssignedToID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INAssignedToID = @AssignedToID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByAssignedToIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByAssignedToIDRowCount]
(
@AssignedToID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(AssignedToID) FROM Issues WHERE AssignedToID = @AssignedToID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByAssignedToIDRowCount]
(
@AssignedToID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(AssignedToID) FROM Issues WHERE AssignedToID = @AssignedToID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByChangedByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByChangedByID]
(
@ChangedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [ChangedByID] = @ChangedByID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByChangedByID]
(
@ChangedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [ChangedByID] = @ChangedByID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByChangedByIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByChangedByIDPageable]
(
@ChangedByID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ChangedByID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE ChangedByID = @INChangedByID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INChangedByID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INChangedByID = @ChangedByID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByChangedByIDPageable]
(
@ChangedByID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ChangedByID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE ChangedByID = @INChangedByID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INChangedByID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INChangedByID = @ChangedByID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByChangedByIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByChangedByIDRowCount]
(
@ChangedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(ChangedByID) FROM Issues WHERE ChangedByID = @ChangedByID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByChangedByIDRowCount]
(
@ChangedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(ChangedByID) FROM Issues WHERE ChangedByID = @ChangedByID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByOpenedByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByOpenedByID]
(
@OpenedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [OpenedByID] = @OpenedByID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByOpenedByID]
(
@OpenedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [OpenedByID] = @OpenedByID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByOpenedByIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByOpenedByIDPageable]
(
@OpenedByID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''OpenedByID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE OpenedByID = @INOpenedByID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INOpenedByID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INOpenedByID = @OpenedByID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByOpenedByIDPageable]
(
@OpenedByID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''OpenedByID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE OpenedByID = @INOpenedByID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INOpenedByID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INOpenedByID = @OpenedByID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByOpenedByIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByOpenedByIDRowCount]
(
@OpenedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(OpenedByID) FROM Issues WHERE OpenedByID = @OpenedByID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByOpenedByIDRowCount]
(
@OpenedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(OpenedByID) FROM Issues WHERE OpenedByID = @OpenedByID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByResolvedByID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByResolvedByID]
(
@ResolvedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [ResolvedByID] = @ResolvedByID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByResolvedByID]
(
@ResolvedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM [Issues] WHERE [ResolvedByID] = @ResolvedByID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByResolvedByIDPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByResolvedByIDPageable]
(
@ResolvedByID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ResolvedByID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE ResolvedByID = @INResolvedByID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INResolvedByID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INResolvedByID = @ResolvedByID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByResolvedByIDPageable]
(
@ResolvedByID nvarchar(100), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ResolvedByID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID] FROM (
		   SELECT [IssueID], [Title], [StatusID], [SubStatusID], [AssignedToID], [IssueTypeID], [Severity], [Priority], [ChangedByID], [LastChange], [OpenedDate], [OpenedByID], [PlatformID], [ResolutionDate], [ResolutionID], [ResolvedByID], [Description], [ReproSteps], [DuplicateID],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Issues WHERE ResolvedByID = @INResolvedByID) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INResolvedByID nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INResolvedByID = @ResolvedByID,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Issues_GetDataByResolvedByIDRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Issues_GetDataByResolvedByIDRowCount]
(
@ResolvedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(ResolvedByID) FROM Issues WHERE ResolvedByID = @ResolvedByID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Issues_GetDataByResolvedByIDRowCount]
(
@ResolvedByID nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(ResolvedByID) FROM Issues WHERE ResolvedByID = @ResolvedByID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_Select]

  AS
   SET NOCOUNT ON;
SELECT [IssueTypeID], [Name] FROM [IssueTypes]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_Select]

  AS
   SET NOCOUNT ON;
   SELECT [IssueTypeID], [Name] FROM [IssueTypes]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_Update]
(
@IssueTypeID tinyint, 
@Name nchar
  )

  AS
   SET NOCOUNT ON;
UPDATE [IssueTypes] SET [IssueTypeID]=@IssueTypeID, [Name]=@Name WHERE [IssueTypeID]=@IssueTypeID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_Update]
(
@IssueTypeID tinyint, 
@Name nchar
  )

  AS
   SET NOCOUNT ON;
   UPDATE [IssueTypes] SET [IssueTypeID]=@IssueTypeID, [Name]=@Name WHERE [IssueTypeID]=@IssueTypeID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_Insert]
(
@IssueTypeID tinyint, 
@Name nchar
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [IssueTypes] ([IssueTypeID], [Name]) VALUES (@IssueTypeID, @Name);SELECT @IssueTypeID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_Insert]
(
@IssueTypeID tinyint, 
@Name nchar
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [IssueTypes] ([IssueTypeID], [Name]) VALUES (@IssueTypeID, @Name);SELECT @IssueTypeID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_Delete]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [IssueTypes] WHERE [IssueTypeID]=@IssueTypeID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_Delete]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [IssueTypes] WHERE [IssueTypeID]=@IssueTypeID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueTypeID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueTypeID], [Name] FROM (
		   SELECT [IssueTypeID], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM IssueTypes) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''IssueTypeID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [IssueTypeID], [Name] FROM (
		   SELECT [IssueTypeID], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM IssueTypes) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(IssueTypeID) FROM IssueTypes'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(IssueTypeID) FROM IssueTypes'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IssueTypes_GetDataByIssueTypeID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[IssueTypes_GetDataByIssueTypeID]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [IssueTypeID], [Name] FROM [IssueTypes] WHERE [IssueTypeID]=@IssueTypeID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[IssueTypes_GetDataByIssueTypeID]
(
@IssueTypeID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [IssueTypeID], [Name] FROM [IssueTypes] WHERE [IssueTypeID]=@IssueTypeID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_Select]

  AS
   SET NOCOUNT ON;
SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor] FROM [Platforms]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_Select]

  AS
   SET NOCOUNT ON;
   SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor] FROM [Platforms]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_Update]
(
@PlatformID int, 
@Browser nvarchar(100), 
@BrowserVersion nvarchar(100), 
@OS nvarchar(100), 
@OSVersion nvarchar(100), 
@Language nvarchar(100), 
@Processor nvarchar(20)
  )

  AS
   SET NOCOUNT ON;
UPDATE [Platforms] SET [PlatformID]=@PlatformID, [Browser]=@Browser, [BrowserVersion]=@BrowserVersion, [OS]=@OS, [OSVersion]=@OSVersion, [Language]=@Language, [Processor]=@Processor WHERE [PlatformID]=@PlatformID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_Update]
(
@PlatformID int, 
@Browser nvarchar(100), 
@BrowserVersion nvarchar(100), 
@OS nvarchar(100), 
@OSVersion nvarchar(100), 
@Language nvarchar(100), 
@Processor nvarchar(20)
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Platforms] SET [PlatformID]=@PlatformID, [Browser]=@Browser, [BrowserVersion]=@BrowserVersion, [OS]=@OS, [OSVersion]=@OSVersion, [Language]=@Language, [Processor]=@Processor WHERE [PlatformID]=@PlatformID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_Insert]
(
@PlatformID int, 
@Browser nvarchar(100), 
@BrowserVersion nvarchar(100), 
@OS nvarchar(100), 
@OSVersion nvarchar(100), 
@Language nvarchar(100), 
@Processor nvarchar(20)
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Platforms] ([PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor]) VALUES (@PlatformID, @Browser, @BrowserVersion, @OS, @OSVersion, @Language, @Processor);SELECT @PlatformID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_Insert]
(
@PlatformID int, 
@Browser nvarchar(100), 
@BrowserVersion nvarchar(100), 
@OS nvarchar(100), 
@OSVersion nvarchar(100), 
@Language nvarchar(100), 
@Processor nvarchar(20)
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Platforms] ([PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor]) VALUES (@PlatformID, @Browser, @BrowserVersion, @OS, @OSVersion, @Language, @Processor);SELECT @PlatformID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_Delete]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Platforms] WHERE [PlatformID]=@PlatformID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_Delete]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Platforms] WHERE [PlatformID]=@PlatformID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PlatformID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor] FROM (
		   SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Platforms) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PlatformID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor] FROM (
		   SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Platforms) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(PlatformID) FROM Platforms'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(PlatformID) FROM Platforms'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Platforms_GetDataByPlatformID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Platforms_GetDataByPlatformID]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor] FROM [Platforms] WHERE [PlatformID]=@PlatformID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Platforms_GetDataByPlatformID]
(
@PlatformID int
  )

  AS
   SET NOCOUNT ON;
   SELECT [PlatformID], [Browser], [BrowserVersion], [OS], [OSVersion], [Language], [Processor] FROM [Platforms] WHERE [PlatformID]=@PlatformID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_Select]

  AS
   SET NOCOUNT ON;
SELECT [ResolutionID], [Name] FROM [Resolutions]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_Select]

  AS
   SET NOCOUNT ON;
   SELECT [ResolutionID], [Name] FROM [Resolutions]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_Update]
(
@ResolutionID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
UPDATE [Resolutions] SET [ResolutionID]=@ResolutionID, [Name]=@Name WHERE [ResolutionID]=@ResolutionID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_Update]
(
@ResolutionID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Resolutions] SET [ResolutionID]=@ResolutionID, [Name]=@Name WHERE [ResolutionID]=@ResolutionID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_Insert]
(
@ResolutionID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Resolutions] ([ResolutionID], [Name]) VALUES (@ResolutionID, @Name);SELECT @ResolutionID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_Insert]
(
@ResolutionID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Resolutions] ([ResolutionID], [Name]) VALUES (@ResolutionID, @Name);SELECT @ResolutionID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_Delete]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Resolutions] WHERE [ResolutionID]=@ResolutionID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_Delete]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Resolutions] WHERE [ResolutionID]=@ResolutionID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ResolutionID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [ResolutionID], [Name] FROM (
		   SELECT [ResolutionID], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Resolutions) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''ResolutionID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [ResolutionID], [Name] FROM (
		   SELECT [ResolutionID], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Resolutions) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(ResolutionID) FROM Resolutions'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(ResolutionID) FROM Resolutions'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Resolutions_GetDataByResolutionID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Resolutions_GetDataByResolutionID]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [ResolutionID], [Name] FROM [Resolutions] WHERE [ResolutionID]=@ResolutionID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Resolutions_GetDataByResolutionID]
(
@ResolutionID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [ResolutionID], [Name] FROM [Resolutions] WHERE [ResolutionID]=@ResolutionID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_Select]

  AS
   SET NOCOUNT ON;
SELECT [PasswordQuestion] FROM [SecurityQuestions]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_Select]

  AS
   SET NOCOUNT ON;
   SELECT [PasswordQuestion] FROM [SecurityQuestions]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_Update]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
UPDATE [SecurityQuestions] SET [PasswordQuestion]=@PasswordQuestion WHERE [PasswordQuestion]=@PasswordQuestion'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_Update]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
   UPDATE [SecurityQuestions] SET [PasswordQuestion]=@PasswordQuestion WHERE [PasswordQuestion]=@PasswordQuestion'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_Insert]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [SecurityQuestions] ([PasswordQuestion]) VALUES (@PasswordQuestion);SELECT @PasswordQuestion;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_Insert]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [SecurityQuestions] ([PasswordQuestion]) VALUES (@PasswordQuestion);SELECT @PasswordQuestion;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_Delete]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [SecurityQuestions] WHERE [PasswordQuestion]=@PasswordQuestion'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_Delete]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [SecurityQuestions] WHERE [PasswordQuestion]=@PasswordQuestion'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PasswordQuestion'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [PasswordQuestion] FROM (
		   SELECT [PasswordQuestion],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM SecurityQuestions) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PasswordQuestion'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [PasswordQuestion] FROM (
		   SELECT [PasswordQuestion],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM SecurityQuestions) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(PasswordQuestion) FROM SecurityQuestions'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(PasswordQuestion) FROM SecurityQuestions'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SecurityQuestions_GetDataByPasswordQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SecurityQuestions_GetDataByPasswordQuestion]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
SELECT [PasswordQuestion] FROM [SecurityQuestions] WHERE [PasswordQuestion]=@PasswordQuestion'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SecurityQuestions_GetDataByPasswordQuestion]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
   SELECT [PasswordQuestion] FROM [SecurityQuestions] WHERE [PasswordQuestion]=@PasswordQuestion'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_Select]

  AS
   SET NOCOUNT ON;
SELECT [StatusID], [Name] FROM [Statuses]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_Select]

  AS
   SET NOCOUNT ON;
   SELECT [StatusID], [Name] FROM [Statuses]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_Update]
(
@StatusID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
UPDATE [Statuses] SET [StatusID]=@StatusID, [Name]=@Name WHERE [StatusID]=@StatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_Update]
(
@StatusID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Statuses] SET [StatusID]=@StatusID, [Name]=@Name WHERE [StatusID]=@StatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_Insert]
(
@StatusID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Statuses] ([StatusID], [Name]) VALUES (@StatusID, @Name);SELECT @StatusID;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_Insert]
(
@StatusID tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Statuses] ([StatusID], [Name]) VALUES (@StatusID, @Name);SELECT @StatusID;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_Delete]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Statuses] WHERE [StatusID]=@StatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_Delete]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Statuses] WHERE [StatusID]=@StatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''StatusID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [StatusID], [Name] FROM (
		   SELECT [StatusID], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Statuses) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''StatusID'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [StatusID], [Name] FROM (
		   SELECT [StatusID], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Statuses) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(StatusID) FROM Statuses'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(StatusID) FROM Statuses'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Statuses_GetDataByStatusID]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Statuses_GetDataByStatusID]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [StatusID], [Name] FROM [Statuses] WHERE [StatusID]=@StatusID'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Statuses_GetDataByStatusID]
(
@StatusID tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [StatusID], [Name] FROM [Statuses] WHERE [StatusID]=@StatusID'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_Select]

  AS
   SET NOCOUNT ON;
SELECT [SubStatusId], [Name] FROM [SubStatuses]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_Select]

  AS
   SET NOCOUNT ON;
   SELECT [SubStatusId], [Name] FROM [SubStatuses]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_Update]
(
@SubStatusId tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
UPDATE [SubStatuses] SET [SubStatusId]=@SubStatusId, [Name]=@Name WHERE [SubStatusId]=@SubStatusId'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_Update]
(
@SubStatusId tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   UPDATE [SubStatuses] SET [SubStatusId]=@SubStatusId, [Name]=@Name WHERE [SubStatusId]=@SubStatusId'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_Insert]
(
@SubStatusId tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [SubStatuses] ([SubStatusId], [Name]) VALUES (@SubStatusId, @Name);SELECT @SubStatusId;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_Insert]
(
@SubStatusId tinyint, 
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [SubStatuses] ([SubStatusId], [Name]) VALUES (@SubStatusId, @Name);SELECT @SubStatusId;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_Delete]
(
@SubStatusId tinyint
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [SubStatuses] WHERE [SubStatusId]=@SubStatusId'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_Delete]
(
@SubStatusId tinyint
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [SubStatuses] WHERE [SubStatusId]=@SubStatusId'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''SubStatusId'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [SubStatusId], [Name] FROM (
		   SELECT [SubStatusId], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM SubStatuses) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''SubStatusId'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [SubStatusId], [Name] FROM (
		   SELECT [SubStatusId], [Name],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM SubStatuses) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(SubStatusId) FROM SubStatuses'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(SubStatusId) FROM SubStatuses'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SubStatuses_GetDataBySubStatusId]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[SubStatuses_GetDataBySubStatusId]
(
@SubStatusId tinyint
  )

  AS
   SET NOCOUNT ON;
SELECT [SubStatusId], [Name] FROM [SubStatuses] WHERE [SubStatusId]=@SubStatusId'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[SubStatuses_GetDataBySubStatusId]
(
@SubStatusId tinyint
  )

  AS
   SET NOCOUNT ON;
   SELECT [SubStatusId], [Name] FROM [SubStatuses] WHERE [SubStatusId]=@SubStatusId'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_Select]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_Select]

  AS
   SET NOCOUNT ON;
SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM [Users]'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_Select]

  AS
   SET NOCOUNT ON;
   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM [Users]'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_Update]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_Update]
(
@Name nvarchar(100), 
@FirstName nvarchar(100), 
@LastName nvarchar(100), 
@Email nvarchar(200), 
@PasswordHash nvarchar(200), 
@PasswordSalt nvarchar(20), 
@PasswordQuestion nvarchar(400), 
@PasswordAnswerHash nvarchar(200), 
@PasswordAnswerSalt nvarchar(20), 
@UserType char, 
@ProfileReset tinyint
  )

  AS
   SET NOCOUNT ON;
UPDATE [Users] SET [Name]=@Name, [FirstName]=@FirstName, [LastName]=@LastName, [Email]=@Email, [PasswordHash]=@PasswordHash, [PasswordSalt]=@PasswordSalt, [PasswordQuestion]=@PasswordQuestion, [PasswordAnswerHash]=@PasswordAnswerHash, [PasswordAnswerSalt]=@PasswordAnswerSalt, [UserType]=@UserType, [ProfileReset]=@ProfileReset WHERE [Name]=@Name'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_Update]
(
@Name nvarchar(100), 
@FirstName nvarchar(100), 
@LastName nvarchar(100), 
@Email nvarchar(200), 
@PasswordHash nvarchar(200), 
@PasswordSalt nvarchar(20), 
@PasswordQuestion nvarchar(400), 
@PasswordAnswerHash nvarchar(200), 
@PasswordAnswerSalt nvarchar(20), 
@UserType char, 
@ProfileReset tinyint
  )

  AS
   SET NOCOUNT ON;
   UPDATE [Users] SET [Name]=@Name, [FirstName]=@FirstName, [LastName]=@LastName, [Email]=@Email, [PasswordHash]=@PasswordHash, [PasswordSalt]=@PasswordSalt, [PasswordQuestion]=@PasswordQuestion, [PasswordAnswerHash]=@PasswordAnswerHash, [PasswordAnswerSalt]=@PasswordAnswerSalt, [UserType]=@UserType, [ProfileReset]=@ProfileReset WHERE [Name]=@Name'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_Insert]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_Insert]
(
@Name nvarchar(100), 
@FirstName nvarchar(100), 
@LastName nvarchar(100), 
@Email nvarchar(200), 
@PasswordHash nvarchar(200), 
@PasswordSalt nvarchar(20), 
@PasswordQuestion nvarchar(400), 
@PasswordAnswerHash nvarchar(200), 
@PasswordAnswerSalt nvarchar(20), 
@UserType char, 
@ProfileReset tinyint
  )

  AS
   SET NOCOUNT ON;
INSERT INTO [Users] ([Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset]) VALUES (@Name, @FirstName, @LastName, @Email, @PasswordHash, @PasswordSalt, @PasswordQuestion, @PasswordAnswerHash, @PasswordAnswerSalt, @UserType, @ProfileReset);SELECT @Name;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_Insert]
(
@Name nvarchar(100), 
@FirstName nvarchar(100), 
@LastName nvarchar(100), 
@Email nvarchar(200), 
@PasswordHash nvarchar(200), 
@PasswordSalt nvarchar(20), 
@PasswordQuestion nvarchar(400), 
@PasswordAnswerHash nvarchar(200), 
@PasswordAnswerSalt nvarchar(20), 
@UserType char, 
@ProfileReset tinyint
  )

  AS
   SET NOCOUNT ON;
   INSERT INTO [Users] ([Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset]) VALUES (@Name, @FirstName, @LastName, @Email, @PasswordHash, @PasswordSalt, @PasswordQuestion, @PasswordAnswerHash, @PasswordAnswerSalt, @UserType, @ProfileReset);SELECT @Name;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_Delete]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_Delete]
(
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
DELETE FROM [Users] WHERE [Name]=@Name'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_Delete]
(
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   DELETE FROM [Users] WHERE [Name]=@Name'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetDataPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''Name'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM (
		   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Users) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_GetDataPageable]
(
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''Name'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM (
		   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset],
			  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Users) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND (@inStartRowIndex  +  @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@inStartRowIndex Int,@inPageSize Int'', @inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_GetRowCount]

  AS
   SET NOCOUNT ON;
SELECT COUNT(Name) FROM Users'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_GetRowCount]

  AS
   SET NOCOUNT ON;
   SELECT COUNT(Name) FROM Users'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetDataByName]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_GetDataByName]
(
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM [Users] WHERE [Name]=@Name'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_GetDataByName]
(
@Name nvarchar(100)
  )

  AS
   SET NOCOUNT ON;
   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM [Users] WHERE [Name]=@Name'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetDataByPasswordQuestion]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_GetDataByPasswordQuestion]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM [Users] WHERE [PasswordQuestion] = @PasswordQuestion'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_GetDataByPasswordQuestion]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM [Users] WHERE [PasswordQuestion] = @PasswordQuestion'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetDataByPasswordQuestionPageable]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_GetDataByPasswordQuestionPageable]
(
@PasswordQuestion nvarchar(400), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PasswordQuestion'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM (
		   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Users WHERE PasswordQuestion = @INPasswordQuestion) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INPasswordQuestion nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INPasswordQuestion = @PasswordQuestion,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_GetDataByPasswordQuestionPageable]
(
@PasswordQuestion nvarchar(400), 
@sortExpression varchar(125), 
@page Int, 
@pageSize Int
  )

  AS
   SET NOCOUNT ON;
   DECLARE @sql nvarchar(4000), 
@startRowIndex int 

IF @page < 1 SET @page = 1 
IF @pageSize < 1 SET @pageSize = 10 
IF LEN(@sortExpression) = 0 SET @sortExpression = ''PasswordQuestion'' 
SET @startRowIndex = (@page -1) * @pageSize + 1 
SET @sql = ''SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset] FROM (
		   SELECT [Name], [FirstName], [LastName], [Email], [PasswordHash], [PasswordSalt], [PasswordQuestion], [PasswordAnswerHash], [PasswordAnswerSalt], [UserType], [ProfileReset],  ROW_NUMBER() OVER (ORDER BY '' + @SortExpression + '' ) AS ResultSetRowNumber
		   FROM Users WHERE PasswordQuestion = @INPasswordQuestion) AS PagedResults
		WHERE ResultSetRowNumber BETWEEN @inStartRowIndex AND ( @inStartRowIndex + @inPageSize) - 1''
-- Execute the SQL query
EXEC sp_executesql @sql, N''@INPasswordQuestion nvarchar,@inStartRowIndex Int,@inPageSize Int'', @INPasswordQuestion = @PasswordQuestion,@inStartRowIndex =@startRowIndex, @inPageSize = @PageSize;'
  END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Users_GetDataByPasswordQuestionRowCount]') AND type in (N'P', N'PC'))
BEGIN
EXEC dbo.sp_executesql @statement = N'CREATE PROCEDURE [dbo].[Users_GetDataByPasswordQuestionRowCount]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
SELECT COUNT(PasswordQuestion) FROM Users WHERE PasswordQuestion = @PasswordQuestion'
    END
  ELSE
  BEGIN
  EXEC dbo.sp_executesql @statement = N'ALTER PROCEDURE [dbo].[Users_GetDataByPasswordQuestionRowCount]
(
@PasswordQuestion nvarchar(400)
  )

  AS
   SET NOCOUNT ON;
   SELECT COUNT(PasswordQuestion) FROM Users WHERE PasswordQuestion = @PasswordQuestion'
  END
GO
