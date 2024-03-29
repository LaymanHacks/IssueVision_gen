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

Namespace IssueVision.Data.DbCommandProvider
    Public Interface IDbFilesCommandProvider
        ReadOnly Property FilesDbConnectionHolder() As DbConnectionHolder
        ReadOnly Property DbConnectionName As String
        Function GetGetDataDbCommand() As IDbCommand
        Function GetUpdateDbCommand( ByVal fileID As Guid,  ByVal issueID As Int64,  ByVal fileName As String,  ByVal data As Byte()) As IDbCommand
        Function GetInsertDbCommand( ByVal fileID As Guid,  ByVal issueID As Int64,  ByVal fileName As String,  ByVal data As Byte()) As IDbCommand
        Function GetDeleteDbCommand( ByVal fileID As Guid) As IDbCommand
        Function GetGetDataPageableDbCommand( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetRowCountDbCommand() As IDbCommand
        Function GetGetDataByFileIDDbCommand( ByVal fileID As Guid) As IDbCommand
        Function GetGetDataByIssueIDDbCommand( ByVal issueID As Int64) As IDbCommand
        Function GetGetDataByIssueIDPageableDbCommand( ByVal issueID As Int64,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByIssueIDRowCountDbCommand( ByVal issueID As Int64) As IDbCommand

    End Interface
End Namespace
