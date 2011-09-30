Option Explicit On
Option Strict On

Public Class frmMain

    Const delta_t As Integer = 500

    Private Sub Form1_Load(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Load
        Timer1.Interval = delta_t
        Timer1.Enabled = True

        txtInput.Text = CStr(0.0)
        lblOutput.Text = CStr(0.0)
    End Sub

    Private Sub txtInput_TextChanged(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles txtInput.TextChanged
        CtlFirstOrder1.Input = CDbl(txtInput.Text)
    End Sub

    Private Sub Timer1_Tick(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles Timer1.Tick
        Dim outp As Double
        outp = CtlFirstOrder1.Output
        lblOutput.Text = CStr(outp)
        CtlPlot1.add(outp)
    End Sub

End Class
