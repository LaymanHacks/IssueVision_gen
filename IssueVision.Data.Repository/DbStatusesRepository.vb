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
Imports System.Collections.Generic
Imports IssueVision.Data
Imports IssueVision.Domain.Entities
Imports IssueVision.Data.DbCommandProvider
Imports System.Collections.ObjectModel

  
Namespace IssueVision.Data.Repository    
    
    <Global.System.ComponentModel.DataObjectAttribute(true)>  _
    Public Class DbStatusesRepository
        Implements IStatusesRepository
        Implements IDisposable

        Private ReadOnly _dbStatusesCommandProvider As IDbStatusesCommandProvider
        Private _dbConnHolder As DbConnectionHolder = Nothing

        Public Sub New(ByVal dbStatusesCommandProvider As IDbStatusesCommandProvider)
            _dbStatusesCommandProvider = dbStatusesCommandProvider
            _dbConnHolder =_dbStatusesCommandProvider.StatusesDbConnectionHolder
        End Sub

      
    ''' <summary>
    ''' Selects one or more records from the Statuses table 
    ''' </summary>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], true)> _ 
    Public Function GetData()  as ICollection(Of Statuses) Implements IStatusesRepository.GetData
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetGetDataDbCommand()
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of Statuses)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New Statuses(CByte(reader("StatusID")),  reader.GetString("Name") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
  
    ''' <summary>
    ''' Updates one or more records from the Statuses table 
    ''' </summary>
   ''' <param name="StatusID"></param>
   ''' <param name="Name"></param>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Update, true)> _ 
    Public Sub Update( ByVal statusID As Byte,  ByVal name As String)  Implements IStatusesRepository.Update
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetUpdateDbCommand(StatusID, Name)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
          Command.ExecuteNonQuery
            _dbConnHolder.Close()
    End Sub
  
    ''' <summary>
    ''' Updates one or more records from the Statuses table 
    ''' </summary>
    ''' <param name="Statuses"></param>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Update, False)> _ 
    Public Sub Update(ByVal statuses as Statuses)  Implements IStatusesRepository.Update
             With Statuses
Update(.StatusID,  CStr(.Name))
       End With

    End Sub
  
    ''' <summary>
    ''' Inserts an entity of Statuses into the database.
    ''' </summary>
   ''' <param name="StatusID"></param>
   ''' <param name="Name"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Insert, true)> _ 
    Public Function Insert( ByVal statusID As Byte,  ByVal name As String)  as Byte Implements IStatusesRepository.Insert
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetInsertDbCommand(StatusID, Name)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim returnValue As Byte  = Convert.ToByte(Command.ExecuteScalar())
            _dbConnHolder.Close()
            Return returnValue 

    End Function
  
    ''' <summary>
    ''' Inserts an entity of Statuses into the database.
    ''' </summary>
    ''' <param name="Statuses"></param>
    ''' <returns></returns>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Insert, False)> _ 
    Public Function Insert(ByVal statuses as Statuses)  as Byte Implements IStatusesRepository.Insert
             With Statuses
 Return Insert(.StatusID,  CStr(.Name))
       End With

    End Function
  
    ''' <summary>
    ''' Deletes one or more records from the Statuses table 
    ''' </summary>
   ''' <param name="StatusID"></param>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Delete, true)> _ 
    Public Sub Delete( ByVal statusID As Byte)  Implements IStatusesRepository.Delete
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetDeleteDbCommand(StatusID)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
          Command.ExecuteNonQuery
            _dbConnHolder.Close()
    End Sub
  
    ''' <summary>
    ''' Deletes one or more records from the Statuses table 
    ''' </summary>
    ''' <param name="Statuses"></param>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Delete, False)> _ 
    Public Sub Delete(ByVal statuses as Statuses)  Implements IStatusesRepository.Delete
             With Statuses
Delete(.StatusID)
       End With

    End Sub
  
    ''' <summary>
    ''' Function GetDataPageable returns a IDataReader populated with a subset of data from Statuses
    ''' </summary>
   ''' <param name="sortExpression"></param>
   ''' <param name="page"></param>
   ''' <param name="pageSize"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetDataPageable( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Statuses) Implements IStatusesRepository.GetDataPageable
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetGetDataPageableDbCommand(sortExpression, page, pageSize)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of Statuses)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New Statuses(CByte(reader("StatusID")),  reader.GetString("Name") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
  
    ''' <summary>
    ''' Function GetRowCount returns the row count for Statuses
    ''' </summary>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetRowCount()  as Int32 Implements IStatusesRepository.GetRowCount
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetGetRowCountDbCommand()
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim returnValue As Int32  = Convert.ToInt32(Command.ExecuteScalar())
            _dbConnHolder.Close()
            Return returnValue 

    End Function
  
    ''' <summary>
    ''' Function GetDataByStatusID returns a IDataReader for Statuses
    ''' </summary>
   ''' <param name="StatusID"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetDataByStatusID( ByVal statusID As Byte)  as ICollection(Of Statuses) Implements IStatusesRepository.GetDataByStatusID
        Dim command As IDbCommand = _dbStatusesCommandProvider.GetGetDataByStatusIDDbCommand(StatusID)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of Statuses)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New Statuses(CByte(reader("StatusID")),  reader.GetString("Name") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
   
  
#Region "IDisposable Support"
        Private disposedValue As Boolean
        Protected Overridable Sub Dispose(disposing As Boolean)
            If Not Me.disposedValue Then
                If disposing Then
                    Select Case _dbConnHolder.Connection.State
                        Case ConnectionState.Open
                            _dbConnHolder.Close()
                    End Select
                    _dbConnHolder = Nothing
                End If

            End If
            Me.disposedValue = True
        End Sub

        Public Sub Dispose() Implements IDisposable.Dispose
            Dispose(True)
            GC.SuppressFinalize(Me)
        End Sub
#End Region
 
  End Class 
End NameSpace