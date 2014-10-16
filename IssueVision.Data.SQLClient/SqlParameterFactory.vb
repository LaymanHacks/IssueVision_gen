Imports System
Imports System.Data
Imports System.Data.SqlClient

Public Class SqlParameterFactory
	Public Shared Function CreateInputParameter(ByVal paramName As String, ByVal dbType As SqlDbType, ByVal objValue As Object) As SqlParameter
	    Dim param As New SqlParameter(paramName, dbType)

		If objValue Is Nothing Then
			param.IsNullable = True
			param.Value = DBNull.Value
		Else
			param.Value = objValue
		End If

		Return param
	End Function
End Class
