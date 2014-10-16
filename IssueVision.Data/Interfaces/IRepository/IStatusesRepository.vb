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
    Public Interface IStatusesRepository
        Function GetData()  as ICollection(Of Statuses)
        Sub Update( ByVal statusID As Byte,  ByVal name As String) 
        Sub Update(ByVal statuses as Statuses) 
        Function Insert( ByVal statusID As Byte,  ByVal name As String)  as Byte
        Function Insert(ByVal statuses as Statuses)  as Byte
        Sub Delete( ByVal statusID As Byte) 
        Sub Delete(ByVal statuses as Statuses) 
        Function GetDataPageable( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Statuses)
        Function GetRowCount()  as Int32
        Function GetDataByStatusID( ByVal statusID As Byte)  as ICollection(Of Statuses)
    End Interface 
End NameSpace
  