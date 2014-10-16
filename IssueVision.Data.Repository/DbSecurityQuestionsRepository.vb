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
    Public Class DbSecurityQuestionsRepository
        Implements ISecurityQuestionsRepository
        Implements IDisposable

        Private ReadOnly _dbSecurityQuestionsCommandProvider As IDbSecurityQuestionsCommandProvider
        Private _dbConnHolder As DbConnectionHolder = Nothing

        Public Sub New(ByVal dbSecurityQuestionsCommandProvider As IDbSecurityQuestionsCommandProvider)
            _dbSecurityQuestionsCommandProvider = dbSecurityQuestionsCommandProvider
            _dbConnHolder =_dbSecurityQuestionsCommandProvider.SecurityQuestionsDbConnectionHolder
        End Sub

      
    ''' <summary>
    ''' Selects one or more records from the SecurityQuestions table 
    ''' </summary>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], true)> _ 
    Public Function GetData()  as ICollection(Of SecurityQuestions) Implements ISecurityQuestionsRepository.GetData
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetGetDataDbCommand()
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of SecurityQuestions)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New SecurityQuestions( reader.GetString("PasswordQuestion") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
  
    ''' <summary>
    ''' Updates one or more records from the SecurityQuestions table 
    ''' </summary>
   ''' <param name="PasswordQuestion"></param>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Update, true)> _ 
    Public Sub Update( ByVal passwordQuestion As String)  Implements ISecurityQuestionsRepository.Update
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetUpdateDbCommand(PasswordQuestion)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
          Command.ExecuteNonQuery
            _dbConnHolder.Close()
    End Sub
  
    ''' <summary>
    ''' Updates one or more records from the SecurityQuestions table 
    ''' </summary>
    ''' <param name="SecurityQuestions"></param>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Update, False)> _ 
    Public Sub Update(ByVal securityQuestions as SecurityQuestions)  Implements ISecurityQuestionsRepository.Update
             With SecurityQuestions
Update( CStr(.PasswordQuestion))
       End With

    End Sub
  
    ''' <summary>
    ''' Inserts an entity of SecurityQuestions into the database.
    ''' </summary>
   ''' <param name="PasswordQuestion"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Insert, true)> _ 
    Public Function Insert( ByVal passwordQuestion As String)  as String Implements ISecurityQuestionsRepository.Insert
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetInsertDbCommand(PasswordQuestion)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim returnValue As String  = Convert.ToString(Command.ExecuteScalar())
            _dbConnHolder.Close()
            Return returnValue 

    End Function
  
    ''' <summary>
    ''' Inserts an entity of SecurityQuestions into the database.
    ''' </summary>
    ''' <param name="SecurityQuestions"></param>
    ''' <returns></returns>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Insert, False)> _ 
    Public Function Insert(ByVal securityQuestions as SecurityQuestions)  as String Implements ISecurityQuestionsRepository.Insert
             With SecurityQuestions
 Return Insert( CStr(.PasswordQuestion))
       End With

    End Function
  
    ''' <summary>
    ''' Deletes one or more records from the SecurityQuestions table 
    ''' </summary>
   ''' <param name="PasswordQuestion"></param>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Delete, true)> _ 
    Public Sub Delete( ByVal passwordQuestion As String)  Implements ISecurityQuestionsRepository.Delete
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetDeleteDbCommand(PasswordQuestion)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
          Command.ExecuteNonQuery
            _dbConnHolder.Close()
    End Sub
  
    ''' <summary>
    ''' Deletes one or more records from the SecurityQuestions table 
    ''' </summary>
    ''' <param name="SecurityQuestions"></param>
    ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.Delete, False)> _ 
    Public Sub Delete(ByVal securityQuestions as SecurityQuestions)  Implements ISecurityQuestionsRepository.Delete
             With SecurityQuestions
Delete( CStr(.PasswordQuestion))
       End With

    End Sub
  
    ''' <summary>
    ''' Function GetDataPageable returns a IDataReader populated with a subset of data from SecurityQuestions
    ''' </summary>
   ''' <param name="sortExpression"></param>
   ''' <param name="page"></param>
   ''' <param name="pageSize"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetDataPageable( ByVal sortExpression As String,  ByVal page As Int32,  ByVal pageSize As Int32)  as ICollection(Of SecurityQuestions) Implements ISecurityQuestionsRepository.GetDataPageable
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetGetDataPageableDbCommand(sortExpression, page, pageSize)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of SecurityQuestions)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New SecurityQuestions( reader.GetString("PasswordQuestion") )
                 entList.Add(tempEntity)
            Loop
            reader.Close
            Return entList
    
    End Function
  
    ''' <summary>
    ''' Function GetRowCount returns the row count for SecurityQuestions
    ''' </summary>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetRowCount()  as Int32 Implements ISecurityQuestionsRepository.GetRowCount
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetGetRowCountDbCommand()
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim returnValue As Int32  = Convert.ToInt32(Command.ExecuteScalar())
            _dbConnHolder.Close()
            Return returnValue 

    End Function
  
    ''' <summary>
    ''' Function GetDataByPasswordQuestion returns a IDataReader for SecurityQuestions
    ''' </summary>
   ''' <param name="PasswordQuestion"></param>''' <returns></returns>
   ''' <remarks></remarks> 
  <Global.System.ComponentModel.DataObjectMethodAttribute(Global.System.ComponentModel.DataObjectMethodType.[Select], false)> _ 
    Public Function GetDataByPasswordQuestion( ByVal passwordQuestion As String)  as ICollection(Of SecurityQuestions) Implements ISecurityQuestionsRepository.GetDataByPasswordQuestion
        Dim command As IDbCommand = _dbSecurityQuestionsCommandProvider.GetGetDataByPasswordQuestionDbCommand(PasswordQuestion)
            command.Connection = _dbConnHolder.Connection
            _dbConnHolder.Open()
              Dim entList as new Collection(Of SecurityQuestions)
            Dim reader As New SafeDataReader(command.ExecuteReader(CommandBehavior.CloseConnection))
            Do While (reader.Read())
                 Dim tempEntity As New SecurityQuestions( reader.GetString("PasswordQuestion") )
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
