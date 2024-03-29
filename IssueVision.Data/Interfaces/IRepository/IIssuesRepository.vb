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
Imports System.Collections.Generic
Imports IssueVision.Data
Imports IssueVision.Domain.Entities

  
 Namespace IssueVision.Data.Repository     
    Public Interface IIssuesRepository
        Function GetData()  as ICollection(Of Issues)
        Sub Update( ByVal issueID As Int64,  ByVal title As String,  ByVal statusID As Byte,  ByVal subStatusID As  Nullable(Of Byte) ,  ByVal assignedToID As String,  ByVal issueTypeID As Byte,  ByVal severity As Byte,  ByVal priority As Byte,  ByVal changedByID As String,  ByVal lastChange As DateTime,  ByVal openedDate As DateTime,  ByVal openedByID As String,  ByVal platformID As  Nullable(Of Int32) ,  ByVal resolutionDate As  Nullable(Of DateTime) ,  ByVal resolutionID As  Nullable(Of Byte) ,  ByVal resolvedByID As String,  ByVal description As String,  ByVal reproSteps As String,  ByVal duplicateID As  Nullable(Of Int64) ) 
        Sub Update(ByVal issues as Issues) 
        Function Insert( ByVal issueID As Int64,  ByVal title As String,  ByVal statusID As Byte,  ByVal subStatusID As  Nullable(Of Byte) ,  ByVal assignedToID As String,  ByVal issueTypeID As Byte,  ByVal severity As Byte,  ByVal priority As Byte,  ByVal changedByID As String,  ByVal lastChange As DateTime,  ByVal openedDate As DateTime,  ByVal openedByID As String,  ByVal platformID As  Nullable(Of Int32) ,  ByVal resolutionDate As  Nullable(Of DateTime) ,  ByVal resolutionID As  Nullable(Of Byte) ,  ByVal resolvedByID As String,  ByVal description As String,  ByVal reproSteps As String,  ByVal duplicateID As  Nullable(Of Int64) )  as Int64
        Function Insert(ByVal issues as Issues)  as Int64
        Sub Delete( ByVal issueID As Int64) 
        Sub Delete(ByVal issues as Issues) 
        Function GetDataPageable( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetRowCount()  as Int32
        Function GetDataByIssueID( ByVal issueID As Int64)  as ICollection(Of Issues)
        Function GetDataByDuplicateID( ByVal duplicateID As Int64)  as ICollection(Of Issues)
        Function GetDataByDuplicateIDPageable( ByVal duplicateID As Int64,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByDuplicateIDRowCount( ByVal duplicateID As Int64)  as Int32
        Function GetDataByIssueTypeID( ByVal issueTypeID As Byte)  as ICollection(Of Issues)
        Function GetDataByIssueTypeIDPageable( ByVal issueTypeID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByIssueTypeIDRowCount( ByVal issueTypeID As Byte)  as Int32
        Function GetDataByPlatformID( ByVal platformID As Int32)  as ICollection(Of Issues)
        Function GetDataByPlatformIDPageable( ByVal platformID As Int32,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByPlatformIDRowCount( ByVal platformID As Int32)  as Int32
        Function GetDataByResolutionID( ByVal resolutionID As Byte)  as ICollection(Of Issues)
        Function GetDataByResolutionIDPageable( ByVal resolutionID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByResolutionIDRowCount( ByVal resolutionID As Byte)  as Int32
        Function GetDataByStatusID( ByVal statusID As Byte)  as ICollection(Of Issues)
        Function GetDataByStatusIDPageable( ByVal statusID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByStatusIDRowCount( ByVal statusID As Byte)  as Int32
        Function GetDataBySubStatusID( ByVal subStatusID As Byte)  as ICollection(Of Issues)
        Function GetDataBySubStatusIDPageable( ByVal subStatusID As Byte,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataBySubStatusIDRowCount( ByVal subStatusID As Byte)  as Int32
        Function GetDataByAssignedToID( ByVal assignedToID As String)  as ICollection(Of Issues)
        Function GetDataByAssignedToIDPageable( ByVal assignedToID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByAssignedToIDRowCount( ByVal assignedToID As String)  as Int32
        Function GetDataByChangedByID( ByVal changedByID As String)  as ICollection(Of Issues)
        Function GetDataByChangedByIDPageable( ByVal changedByID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByChangedByIDRowCount( ByVal changedByID As String)  as Int32
        Function GetDataByOpenedByID( ByVal openedByID As String)  as ICollection(Of Issues)
        Function GetDataByOpenedByIDPageable( ByVal openedByID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByOpenedByIDRowCount( ByVal openedByID As String)  as Int32
        Function GetDataByResolvedByID( ByVal resolvedByID As String)  as ICollection(Of Issues)
        Function GetDataByResolvedByIDPageable( ByVal resolvedByID As String,  ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Issues)
        Function GetDataByResolvedByIDRowCount( ByVal resolvedByID As String)  as Int32
    End Interface 
End NameSpace
  