'------------------------------------------------------------------------------
' <autogenerated>
'     This code was generated by a tool.
'     Generated by Merlin Version: 1.0.0.0
'
'     Changes to this file may cause incorrect behavior and will be lost if 
'     the code is regenerated.
' </autogenerated>
'------------------------------------------------------------------------------
Imports System.Configuration
Imports System.Data.Common
Imports System

Namespace IssueVision.Data
  Public NotInheritable Class DbConnectionHelper
      Private Sub New()
      End Sub

      Public Shared Function GetConnectionHolder(connectionName As String) As DbConnectionHolder

          Dim holder As New DbConnectionHolder(connectionName)
          Dim closeConn As Boolean = True
          Try
              Try
                  holder.Open()
                  closeConn = False
              Finally
                  If closeConn Then
                      holder.Close()
                      holder = Nothing
                  End If
              End Try
          Catch
              Throw
          End Try
          Return holder
      End Function

      Public Shared Function GetConnectionString(connectionStringName As String) As String
          If connectionStringName Is Nothing OrElse connectionStringName.Length < 1 Then
              Return Nothing
          End If

          Dim connectionString As String = Nothing

          Dim connObj As ConnectionStringSettings = ConfigurationManager.ConnectionStrings(connectionStringName)
          If connObj IsNot Nothing Then
              connectionString = connObj.ConnectionString
          End If

          If connectionString Is Nothing Then
              Return Nothing
          End If

          Return connectionString
      End Function
  End Class

  Public NotInheritable Class DbConnectionHolder
      Private _dbConnection As DbConnection
      Private _opened As Boolean

      Public Property Connection() As DbConnection
          Get
              Return _dbConnection
          End Get
          Set(value As DbConnection)
              _dbConnection = value
          End Set
      End Property

      Public Sub New(dbConnection As DbConnection)
          If Not dbConnection Is Nothing Then
              _dbConnection = dbConnection
          End If
      End Sub

      Public Sub New(connectionName As String)
          If Not connectionName Is Nothing Then
              Try

                  Dim connSettings As ConnectionStringSettings = ConfigurationManager.ConnectionStrings(connectionName)
                  Dim factory As DbProviderFactory = DbProviderFactories.GetFactory(connSettings.ProviderName)

                  _dbConnection = factory.CreateConnection()
                  Connection.ConnectionString = connSettings.ConnectionString
              Catch ex As Exception
                  If Not Connection Is Nothing Then
                      _dbConnection = Nothing
                  End If
              End Try
          End If

      End Sub

      Public Sub Open()
            If Connection.State = System.Data.ConnectionState.Open Then
                _opened = True
                Return
            Else
                If Not Connection Is Nothing Then
                    Connection.Open()
                Else
                    Throw New Exception("Connection is nothing, check that connection information is set in the calling project.")
                End If

            End If
            _opened = True
        End Sub


        Public Sub Close()
            If Not Connection.State = System.Data.ConnectionState.Closed Then
                Return
            End If
            Connection.Close()
            _opened = False
        End Sub
    End Class

End Namespace
