<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class frmMain
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.components = New System.ComponentModel.Container
        Me.lblOutput = New System.Windows.Forms.Label
        Me.txtInput = New System.Windows.Forms.TextBox
        Me.Timer1 = New System.Windows.Forms.Timer(Me.components)
        Me.Label1 = New System.Windows.Forms.Label
        Me.Label2 = New System.Windows.Forms.Label
        Me.CtlPlot1 = New FirstOrder.ctlPlot
        Me.CtlFirstOrder1 = New FirstOrder.ctlFirstOrder
        Me.SuspendLayout()
        '
        'lblOutput
        '
        Me.lblOutput.AutoSize = True
        Me.lblOutput.Location = New System.Drawing.Point(158, 138)
        Me.lblOutput.Name = "lblOutput"
        Me.lblOutput.Size = New System.Drawing.Size(0, 13)
        Me.lblOutput.TabIndex = 0
        '
        'txtInput
        '
        Me.txtInput.Location = New System.Drawing.Point(37, 130)
        Me.txtInput.Name = "txtInput"
        Me.txtInput.Size = New System.Drawing.Size(100, 20)
        Me.txtInput.TabIndex = 2
        '
        'Timer1
        '
        '
        'Label1
        '
        Me.Label1.AutoSize = True
        Me.Label1.Location = New System.Drawing.Point(37, 111)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(31, 13)
        Me.Label1.TabIndex = 4
        Me.Label1.Text = "Input"
        '
        'Label2
        '
        Me.Label2.AutoSize = True
        Me.Label2.Location = New System.Drawing.Point(161, 111)
        Me.Label2.Name = "Label2"
        Me.Label2.Size = New System.Drawing.Size(39, 13)
        Me.Label2.TabIndex = 5
        Me.Label2.Text = "Output"
        '
        'CtlPlot1
        '
        Me.CtlPlot1.Location = New System.Drawing.Point(259, 12)
        Me.CtlPlot1.Name = "CtlPlot1"
        Me.CtlPlot1.Size = New System.Drawing.Size(314, 165)
        Me.CtlPlot1.TabIndex = 7
        '
        'CtlFirstOrder1
        '
        Me.CtlFirstOrder1.BackColor = System.Drawing.SystemColors.ActiveCaption
        Me.CtlFirstOrder1.Input = 0
        Me.CtlFirstOrder1.Location = New System.Drawing.Point(37, 12)
        Me.CtlFirstOrder1.Name = "CtlFirstOrder1"
        Me.CtlFirstOrder1.Size = New System.Drawing.Size(195, 68)
        Me.CtlFirstOrder1.TabIndex = 6
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(585, 189)
        Me.Controls.Add(Me.CtlPlot1)
        Me.Controls.Add(Me.CtlFirstOrder1)
        Me.Controls.Add(Me.Label2)
        Me.Controls.Add(Me.Label1)
        Me.Controls.Add(Me.txtInput)
        Me.Controls.Add(Me.lblOutput)
        Me.Name = "frmMain"
        Me.Text = "Simulator"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents lblOutput As System.Windows.Forms.Label
    Friend WithEvents txtInput As System.Windows.Forms.TextBox
    Friend WithEvents Timer1 As System.Windows.Forms.Timer
    Friend WithEvents Label1 As System.Windows.Forms.Label
    Friend WithEvents Label2 As System.Windows.Forms.Label
    Friend WithEvents CtlFirstOrder1 As FirstOrder.ctlFirstOrder
    Friend WithEvents CtlPlot1 As FirstOrder.ctlPlot

End Class
