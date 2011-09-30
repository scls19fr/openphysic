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
        Me.ListBox1 = New System.Windows.Forms.ListBox
        Me.ListBox2 = New System.Windows.Forms.ListBox
        Me.cmdAdd = New System.Windows.Forms.Button
        Me.txtValue = New System.Windows.Forms.TextBox
        Me.lblBufferUsed = New System.Windows.Forms.Label
        Me.cmdRedim = New System.Windows.Forms.Button
        Me.SuspendLayout()
        '
        'ListBox1
        '
        Me.ListBox1.FormattingEnabled = True
        Me.ListBox1.Location = New System.Drawing.Point(194, 23)
        Me.ListBox1.Name = "ListBox1"
        Me.ListBox1.Size = New System.Drawing.Size(120, 225)
        Me.ListBox1.TabIndex = 0
        '
        'ListBox2
        '
        Me.ListBox2.FormattingEnabled = True
        Me.ListBox2.Location = New System.Drawing.Point(343, 23)
        Me.ListBox2.Name = "ListBox2"
        Me.ListBox2.Size = New System.Drawing.Size(120, 225)
        Me.ListBox2.TabIndex = 1
        '
        'cmdAdd
        '
        Me.cmdAdd.Location = New System.Drawing.Point(62, 64)
        Me.cmdAdd.Name = "cmdAdd"
        Me.cmdAdd.Size = New System.Drawing.Size(75, 23)
        Me.cmdAdd.TabIndex = 2
        Me.cmdAdd.Text = "Add"
        Me.cmdAdd.UseVisualStyleBackColor = True
        '
        'txtValue
        '
        Me.txtValue.Location = New System.Drawing.Point(62, 23)
        Me.txtValue.Name = "txtValue"
        Me.txtValue.Size = New System.Drawing.Size(100, 20)
        Me.txtValue.TabIndex = 3
        '
        'lblBufferUsed
        '
        Me.lblBufferUsed.AutoSize = True
        Me.lblBufferUsed.Location = New System.Drawing.Point(59, 130)
        Me.lblBufferUsed.Name = "lblBufferUsed"
        Me.lblBufferUsed.Size = New System.Drawing.Size(0, 13)
        Me.lblBufferUsed.TabIndex = 4
        '
        'cmdRedim
        '
        Me.cmdRedim.Location = New System.Drawing.Point(62, 224)
        Me.cmdRedim.Name = "cmdRedim"
        Me.cmdRedim.Size = New System.Drawing.Size(75, 23)
        Me.cmdRedim.TabIndex = 5
        Me.cmdRedim.Text = "Redim"
        Me.cmdRedim.UseVisualStyleBackColor = True
        '
        'frmMain
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(542, 266)
        Me.Controls.Add(Me.cmdRedim)
        Me.Controls.Add(Me.lblBufferUsed)
        Me.Controls.Add(Me.txtValue)
        Me.Controls.Add(Me.cmdAdd)
        Me.Controls.Add(Me.ListBox2)
        Me.Controls.Add(Me.ListBox1)
        Me.Name = "frmMain"
        Me.Text = "Test circular buffer"
        Me.ResumeLayout(False)
        Me.PerformLayout()

    End Sub
    Friend WithEvents ListBox1 As System.Windows.Forms.ListBox
    Friend WithEvents ListBox2 As System.Windows.Forms.ListBox
    Friend WithEvents cmdAdd As System.Windows.Forms.Button
    Friend WithEvents txtValue As System.Windows.Forms.TextBox
    Friend WithEvents lblBufferUsed As System.Windows.Forms.Label
    Friend WithEvents cmdRedim As System.Windows.Forms.Button

End Class
