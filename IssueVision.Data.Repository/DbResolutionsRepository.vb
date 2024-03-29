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
    Public Class DbResolutionsRepository
        Implements IResolutionsRepository
        Implements IDisposable

        Private ReadOnly _dbResolutionsCommandProvider As IDbResolutionsCommandProvider
        Private _dbConnHolder As DbConnectionHolder = Nothing

        Public Sub New(ByVal dbResolutionsCommandProvider As IDbResolutionsCommandProvider)
            _dbResolutionsCommandProvider = dbResolutionsCommandProvider
            _dbConnHolder =_dbResolutionsCommandProvider.ResolutionsDbConnectionHolder
        End Sub

      
    ''' <summary>
    ''' Selects one or more records from the Resolutions table 
    ''' </summary>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], true)> _ 
    Public Function GetData()  as ICollection(Of Resolutions) Implements IResolutionsRepository.GetData
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetGetDataDbCommand()
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of Resolutions)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New Resolutions(reader("ResolutionID"),  reader.GetString("Name") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
  
    ''' <summary>
    ''' Updates one or more records from the Resolutions table 
    ''' </summary>
   ''' <param name="ResolutionID"></param>
   ''' <param name="Name"></param>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Update, true)> _ 
    Public Sub Update( ByVal resolutionID As Byte,  ByVal name As String)  Implements IResolutionsRepository.Update
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetUpdateDbCommand(ResolutionID, Name)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
          Command.ExecuteNonQuery
            _dbConnHolder.Close()
    End Sub
  
    ''' <summary>
    ''' Updates one or more records from the Resolutions table 
    ''' </summary>
    ''' <param name="Resolutions"></param>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Update, False)> _ 
    Public Sub Update(ByVal resolutions as Resolutions)  Implements IResolutionsRepository.Update
             With Resolutions
Update(.ResolutionID,  CStr(.Name))
       End With

    End Sub
  
    ''' <summary>
    ''' Inserts an entity of Resolutions into the database.
    ''' </summary>
   ''' <param name="ResolutionID"></param>
   ''' <param name="Name"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Insert, true)> _ 
    Public Function Insert( ByVal resolutionID As Byte,  ByVal name As String)  as Byte Implements IResolutionsRepository.Insert
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetInsertDbCommand(ResolutionID, Name)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim returnValue As Byte  = Convert.ToByte(Command.ExecuteScalar())
            _dbConnHolder.Close()
            Return returnValue 

    End Function
  
    ''' <summary>
    ''' Inserts an entity of Resolutions into the database.
    ''' </summary>
    ''' <param name="Resolutions"></param>
    ''' <returns></returns>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Insert, False)> _ 
    Public Function Insert(ByVal resolutions as Resolutions)  as Byte Implements IResolutionsRepository.Insert
             With Resolutions
 Return Insert(.ResolutionID,  CStr(.Name))
       End With

    End Function
  
    ''' <summary>
    ''' Deletes one or more records from the Resolutions table 
    ''' </summary>
   ''' <param name="ResolutionID"></param>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Delete, true)> _ 
    Public Sub Delete( ByVal resolutionID As Byte)  Implements IResolutionsRepository.Delete
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetDeleteDbCommand(ResolutionID)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
          Command.ExecuteNonQuery
            _dbConnHolder.Close()
    End Sub
  
    ''' <summary>
    ''' Deletes one or more records from the Resolutions table 
    ''' </summary>
    ''' <param name="Resolutions"></param>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Delete, False)> _ 
    Public Sub Delete(ByVal resolutions as Resolutions)  Implements IResolutionsRepository.Delete
             With Resolutions
Delete(.ResolutionID)
       End With

    End Sub
  
    ''' <summary>
    ''' Function GetDataPageable returns a IDataReader populated with a subset of data from Resolutions
    ''' </summary>
   ''' <param name="sortExpression"></param>
   ''' <param name="page"></param>
   ''' <param name="pageSize"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetDataPageable( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of Resolutions) Implements IResolutionsRepository.GetDataPageable
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetGetDataPageableDbCommand(sortExpression, page, pageSize)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of Resolutions)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New Resolutions(reader("ResolutionID"),  reader.GetString("Name") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
  
    ''' <summary>
    ''' Function GetRowCount returns the row count for Resolutions
    ''' </summary>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetRowCount()  as Int32 Implements IResolutionsRepository.GetRowCount
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetGetRowCountDbCommand()
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim returnValue As Int32  = Convert.ToInt32(Command.ExecuteScalar())
            _dbConnHolder.Close()
            Return returnValue 

    End Function
  
    ''' <summary>
    ''' Function GetDataByResolutionID returns a IDataReader for Resolutions
    ''' </summary>
   ''' <param name="ResolutionID"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetDataByResolutionID( ByVal resolutionID As Byte)  as ICollection(Of Resolutions) Implements IResolutionsRepository.GetDataByResolutionID
        Dim command As IDbCommand = _dbResolutionsCommandProvider.GetGetDataByResolutionIDDbCommand(ResolutionID)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of Resolutions)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New Resolutions(reader("ResolutionID"),  reader.GetString("Name") )
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
