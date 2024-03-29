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
    Public Interface IDbIssuesCommandProvider
        ReadOnly Property IssuesDbConnectionHolder() As DbConnectionHolder
        ReadOnly Property DbConnectionName As String
        Function GetGetDataDbCommand() As IDbCommand
        Function GetUpdateDbCommand( ByVal issueID As Int64,  ByVal title As String,  ByVal statusID As Byte,  ByVal subStatusID As  Nullable(Of Byte) ,  ByVal assignedToID As String,  ByVal issueTypeID As Byte,  ByVal severity As Byte,  ByVal priority As Byte,  ByVal changedByID As String,  ByVal lastChange As DateTime,  ByVal openedDate As DateTime,  ByVal openedByID As String,  ByVal platformID As  Nullable(Of Int32) ,  ByVal resolutionDate As  Nullable(Of DateTime) ,  ByVal resolutionID As  Nullable(Of Byte) ,  ByVal resolvedByID As String,  ByVal description As String,  ByVal reproSteps As String,  ByVal duplicateID As  Nullable(Of Int64) ) As IDbCommand
        Function GetInsertDbCommand( ByVal issueID As Int64,  ByVal title As String,  ByVal statusID As Byte,  ByVal subStatusID As  Nullable(Of Byte) ,  ByVal assignedToID As String,  ByVal issueTypeID As Byte,  ByVal severity As Byte,  ByVal priority As Byte,  ByVal changedByID As String,  ByVal lastChange As DateTime,  ByVal openedDate As DateTime,  ByVal openedByID As String,  ByVal platformID As  Nullable(Of Int32) ,  ByVal resolutionDate As  Nullable(Of DateTime) ,  ByVal resolutionID As  Nullable(Of Byte) ,  ByVal resolvedByID As String,  ByVal description As String,  ByVal reproSteps As String,  ByVal duplicateID As  Nullable(Of Int64) ) As IDbCommand
        Function GetDeleteDbCommand( ByVal issueID As Int64) As IDbCommand
        Function GetGetDataPageableDbCommand( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetRowCountDbCommand() As IDbCommand
        Function GetGetDataByIssueIDDbCommand( ByVal issueID As Int64) As IDbCommand
        Function GetGetDataByDuplicateIDDbCommand( ByVal duplicateID As Int64) As IDbCommand
        Function GetGetDataByDuplicateIDPageableDbCommand( ByVal duplicateID As Int64,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByDuplicateIDRowCountDbCommand( ByVal duplicateID As Int64) As IDbCommand
        Function GetGetDataByIssueTypeIDDbCommand( ByVal issueTypeID As Byte) As IDbCommand
        Function GetGetDataByIssueTypeIDPageableDbCommand( ByVal issueTypeID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByIssueTypeIDRowCountDbCommand( ByVal issueTypeID As Byte) As IDbCommand
        Function GetGetDataByPlatformIDDbCommand( ByVal platformID As Int32) As IDbCommand
        Function GetGetDataByPlatformIDPageableDbCommand( ByVal platformID As Int32,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByPlatformIDRowCountDbCommand( ByVal platformID As Int32) As IDbCommand
        Function GetGetDataByResolutionIDDbCommand( ByVal resolutionID As Byte) As IDbCommand
        Function GetGetDataByResolutionIDPageableDbCommand( ByVal resolutionID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByResolutionIDRowCountDbCommand( ByVal resolutionID As Byte) As IDbCommand
        Function GetGetDataByStatusIDDbCommand( ByVal statusID As Byte) As IDbCommand
        Function GetGetDataByStatusIDPageableDbCommand( ByVal statusID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByStatusIDRowCountDbCommand( ByVal statusID As Byte) As IDbCommand
        Function GetGetDataBySubStatusIDDbCommand( ByVal subStatusID As Byte) As IDbCommand
        Function GetGetDataBySubStatusIDPageableDbCommand( ByVal subStatusID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataBySubStatusIDRowCountDbCommand( ByVal subStatusID As Byte) As IDbCommand
        Function GetGetDataByAssignedToIDDbCommand( ByVal assignedToID As String) As IDbCommand
        Function GetGetDataByAssignedToIDPageableDbCommand( ByVal assignedToID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByAssignedToIDRowCountDbCommand( ByVal assignedToID As String) As IDbCommand
        Function GetGetDataByChangedByIDDbCommand( ByVal changedByID As String) As IDbCommand
        Function GetGetDataByChangedByIDPageableDbCommand( ByVal changedByID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByChangedByIDRowCountDbCommand( ByVal changedByID As String) As IDbCommand
        Function GetGetDataByOpenedByIDDbCommand( ByVal openedByID As String) As IDbCommand
        Function GetGetDataByOpenedByIDPageableDbCommand( ByVal openedByID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByOpenedByIDRowCountDbCommand( ByVal openedByID As String) As IDbCommand
        Function GetGetDataByResolvedByIDDbCommand( ByVal resolvedByID As String) As IDbCommand
        Function GetGetDataByResolvedByIDPageableDbCommand( ByVal resolvedByID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32) As IDbCommand
        Function GetGetDataByResolvedByIDRowCountDbCommand( ByVal resolvedByID As String) As IDbCommand

    End Interface
End Namespace
