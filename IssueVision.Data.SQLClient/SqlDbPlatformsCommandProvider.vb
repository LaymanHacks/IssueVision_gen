'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Generated by Merlin Version: 1.0.0.0
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------
Imports System
Imports System.Data
Imports System.Data.Common
Imports System.Data.SqlClient
Imports IssueVision.Data.DbCommandProvider

Namespace IssueVision.Data.SqlDbCommandProvider 

  
Public Class SqlDbPlatformsCommandProvider
      Implements IDbPlatformsCommandProvider
    
      ReadOnly _dbConnHolder As DbConnectionHolder

      Public Sub New()
          _dbConnHolder = New DbConnectionHolder(DbConnectionName)
      End Sub

      Public ReadOnly Property DbConnectionName() As String Implements IDbPlatformsCommandProvider.DbConnectionName
          Get
              Return "IssueVisionConnection"
          End Get
      End Property

      Public ReadOnly Property PlatformsDbConnectionHolder() As DbConnectionHolder Implements IDbPlatformsCommandProvider.PlatformsDbConnectionHolder
          Get
              Return _dbConnHolder
          End Get
      End Property
      
    
        ''' <summary>
        ''' Selects one or more records from the Platforms table 
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetDataDbCommand() As IDbCommand Implements IDbPlatformsCommandProvider.GetGetDataDbCommand
            
            Dim command As New SqlCommand("Platforms_Select")
            command.CommandType = CommandType.StoredProcedure
    
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Updates one or more records from the Platforms table 
        ''' </summary>
      ''' <param name="platformID" />
      ''' <param name="browser" />
      ''' <param name="browserVersion" />
      ''' <param name="oS" />
      ''' <param name="oSVersion" />
      ''' <param name="language" />
      ''' <param name="processor" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetUpdateDbCommand( ByVal platformID As Int32,  ByVal browser As String,  ByVal browserVersion As String,  ByVal oS As String,  ByVal oSVersion As String,  ByVal language As String,  ByVal processor As String) As IDbCommand Implements IDbPlatformsCommandProvider.GetUpdateDbCommand
            
            Dim command As New SqlCommand("Platforms_Update")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@PlatformID", SqlDbType.int, platformID))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Browser", SqlDbType.nvarchar, browser))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@BrowserVersion", SqlDbType.nvarchar, browserVersion))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@OS", SqlDbType.nvarchar, oS))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@OSVersion", SqlDbType.nvarchar, oSVersion))
      
            If (Not language  Is Nothing ) Then
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Language", SqlDbType.nvarchar, language))
      Else
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Language", SqlDbType.nvarchar, global.System.DBNull.Value))
      End If
        
            If (Not processor  Is Nothing ) Then
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Processor", SqlDbType.nvarchar, processor))
      Else
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Processor", SqlDbType.nvarchar, global.System.DBNull.Value))
      End If
        
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Inserts a record into the Platforms table on the database.
        ''' </summary>
      ''' <param name="platformID" />
      ''' <param name="browser" />
      ''' <param name="browserVersion" />
      ''' <param name="oS" />
      ''' <param name="oSVersion" />
      ''' <param name="language" />
      ''' <param name="processor" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetInsertDbCommand( ByVal platformID As Int32,  ByVal browser As String,  ByVal browserVersion As String,  ByVal oS As String,  ByVal oSVersion As String,  ByVal language As String,  ByVal processor As String) As IDbCommand Implements IDbPlatformsCommandProvider.GetInsertDbCommand
            
            Dim command As New SqlCommand("Platforms_Insert")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@PlatformID", SqlDbType.int, platformID))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Browser", SqlDbType.nvarchar, browser))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@BrowserVersion", SqlDbType.nvarchar, browserVersion))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@OS", SqlDbType.nvarchar, oS))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@OSVersion", SqlDbType.nvarchar, oSVersion))
      
            If (Not language  Is Nothing ) Then
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Language", SqlDbType.nvarchar, language))
      Else
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Language", SqlDbType.nvarchar, global.System.DBNull.Value))
      End If
        
            If (Not processor  Is Nothing ) Then
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Processor", SqlDbType.nvarchar, processor))
      Else
                            command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Processor", SqlDbType.nvarchar, global.System.DBNull.Value))
      End If
        
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Deletes one or more records from the Platforms table 
        ''' </summary>
      ''' <param name="platformID" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetDeleteDbCommand( ByVal platformID As Int32) As IDbCommand Implements IDbPlatformsCommandProvider.GetDeleteDbCommand
            
            Dim command As New SqlCommand("Platforms_Delete")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@PlatformID", SqlDbType.int, platformID))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Function GetDataPageable returns a IDataReader populated with a subset of data from Platforms
        ''' </summary>
      ''' <param name="sortExpression" />
      ''' <param name="page" />
      ''' <param name="pageSize" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetDataPageableDbCommand( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand Implements IDbPlatformsCommandProvider.GetGetDataPageableDbCommand
            
            Dim command As New SqlCommand("Platforms_GetDataPageable")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@sortExpression", SqlDbType.varchar, sortExpression))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@page", SqlDbType.Int, page))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@pageSize", SqlDbType.Int, pageSize))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Function GetRowCount returns the row count for Platforms
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetRowCountDbCommand() As IDbCommand Implements IDbPlatformsCommandProvider.GetGetRowCountDbCommand
            
            Dim command As New SqlCommand("Platforms_GetRowCount")
            command.CommandType = CommandType.StoredProcedure
    
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Function GetDataByPlatformID returns a IDataReader for Platforms
        ''' </summary>
      ''' <param name="platformID" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetDataByPlatformIDDbCommand( ByVal platformID As Int32) As IDbCommand Implements IDbPlatformsCommandProvider.GetGetDataByPlatformIDDbCommand
            
            Dim command As New SqlCommand("Platforms_GetDataByPlatformID")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@PlatformID", SqlDbType.int, platformID))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
  End Class
 End Namespace
  