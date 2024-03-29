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

  
Public Class SqlDbIssueTypesCommandProvider
      Implements IDbIssueTypesCommandProvider
    
      ReadOnly _dbConnHolder As DbConnectionHolder

      Public Sub New()
          _dbConnHolder = New DbConnectionHolder(DbConnectionName)
      End Sub

      Public ReadOnly Property DbConnectionName() As String Implements IDbIssueTypesCommandProvider.DbConnectionName
          Get
              Return "IssueVisionConnection"
          End Get
      End Property

      Public ReadOnly Property IssueTypesDbConnectionHolder() As DbConnectionHolder Implements IDbIssueTypesCommandProvider.IssueTypesDbConnectionHolder
          Get
              Return _dbConnHolder
          End Get
      End Property
      
    
        ''' <summary>
        ''' Selects one or more records from the IssueTypes table 
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetDataDbCommand() As IDbCommand Implements IDbIssueTypesCommandProvider.GetGetDataDbCommand
            
            Dim command As New SqlCommand("IssueTypes_Select")
            command.CommandType = CommandType.StoredProcedure
    
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Updates one or more records from the IssueTypes table 
        ''' </summary>
      ''' <param name="issueTypeID" />
      ''' <param name="name" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetUpdateDbCommand( ByVal issueTypeID As Byte,  ByVal name As String) As IDbCommand Implements IDbIssueTypesCommandProvider.GetUpdateDbCommand
            
            Dim command As New SqlCommand("IssueTypes_Update")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@IssueTypeID", SqlDbType.tinyint, issueTypeID))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Name", SqlDbType.nchar, name))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Inserts a record into the IssueTypes table on the database.
        ''' </summary>
      ''' <param name="issueTypeID" />
      ''' <param name="name" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetInsertDbCommand( ByVal issueTypeID As Byte,  ByVal name As String) As IDbCommand Implements IDbIssueTypesCommandProvider.GetInsertDbCommand
            
            Dim command As New SqlCommand("IssueTypes_Insert")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@IssueTypeID", SqlDbType.tinyint, issueTypeID))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@Name", SqlDbType.nchar, name))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Deletes one or more records from the IssueTypes table 
        ''' </summary>
      ''' <param name="issueTypeID" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetDeleteDbCommand( ByVal issueTypeID As Byte) As IDbCommand Implements IDbIssueTypesCommandProvider.GetDeleteDbCommand
            
            Dim command As New SqlCommand("IssueTypes_Delete")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@IssueTypeID", SqlDbType.tinyint, issueTypeID))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Function GetDataPageable returns a IDataReader populated with a subset of data from IssueTypes
        ''' </summary>
      ''' <param name="sortExpression" />
      ''' <param name="page" />
      ''' <param name="pageSize" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetDataPageableDbCommand( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand Implements IDbIssueTypesCommandProvider.GetGetDataPageableDbCommand
            
            Dim command As New SqlCommand("IssueTypes_GetDataPageable")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@sortExpression", SqlDbType.varchar, sortExpression))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@page", SqlDbType.Int, page))
                  command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@pageSize", SqlDbType.Int, pageSize))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Function GetRowCount returns the row count for IssueTypes
        ''' </summary>
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetRowCountDbCommand() As IDbCommand Implements IDbIssueTypesCommandProvider.GetGetRowCountDbCommand
            
            Dim command As New SqlCommand("IssueTypes_GetRowCount")
            command.CommandType = CommandType.StoredProcedure
    
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
        ''' <summary>
        ''' Function GetDataByIssueTypeID returns a IDataReader for IssueTypes
        ''' </summary>
      ''' <param name="issueTypeID" />
        ''' <returns></returns>
        ''' <remarks></remarks> 
        Public Function GetGetDataByIssueTypeIDDbCommand( ByVal issueTypeID As Byte) As IDbCommand Implements IDbIssueTypesCommandProvider.GetGetDataByIssueTypeIDDbCommand
            
            Dim command As New SqlCommand("IssueTypes_GetDataByIssueTypeID")
            command.CommandType = CommandType.StoredProcedure
                command.Parameters.Add(SqlParameterFactory.CreateInputParameter("@IssueTypeID", SqlDbType.tinyint, issueTypeID))
      
            command.Connection = CType(_dbConnHolder.Connection, SqlConnection)
            Return command
      End Function
         
            
  End Class
 End Namespace
  