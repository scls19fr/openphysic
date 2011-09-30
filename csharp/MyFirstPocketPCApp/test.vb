Imports System.Windows.Forms

Public Class frmMain
     Inherits System.Windows.Forms.Form 

     Public Shared Sub Main() 
          Application.Run(New frmMain) 
     End Sub 

     Public Sub New()
          MyBase.New() 
          Me.Text = "My VB form" 
     End Sub 

     Private Sub frmMain_Click(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Click 
          Me.Close 
     End Sub
End Class