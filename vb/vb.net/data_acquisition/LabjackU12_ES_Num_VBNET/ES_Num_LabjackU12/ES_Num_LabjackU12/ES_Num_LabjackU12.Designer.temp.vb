<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class ES_Num_LabjackU12
    Inherits System.Windows.Forms.UserControl

    'UserControl1 remplace la méthode Dispose pour nettoyer la liste des composants.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Requise par le Concepteur Windows Form
    Private components As System.ComponentModel.IContainer

    'REMARQUE : la procédure suivante est requise par le Concepteur Windows Form
    'Elle peut être modifiée à l'aide du Concepteur Windows Form.  
    'Ne la modifiez pas à l'aide de l'éditeur de code.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.gbEntréesSortiesNumériques = New System.Windows.Forms.GroupBox
        Me.TableLayoutPanel1 = New System.Windows.Forms.TableLayoutPanel
        Me.gbPortA = New System.Windows.Forms.GroupBox
        Me.gbPortC = New System.Windows.Forms.GroupBox
        Me.FlowLayoutPortA = New System.Windows.Forms.FlowLayoutPanel
        Me.FlowLayoutPortB = New System.Windows.Forms.FlowLayoutPanel
        Me.gbEntréesSortiesNumériques.SuspendLayout()
        Me.TableLayoutPanel1.SuspendLayout()
        Me.gbPortA.SuspendLayout()
        Me.gbPortC.SuspendLayout()
        Me.SuspendLayout()
        '
        'gbEntréesSortiesNumériques
        '
        Me.gbEntréesSortiesNumériques.Controls.Add(Me.TableLayoutPanel1)
        Me.gbEntréesSortiesNumériques.Dock = System.Windows.Forms.DockStyle.Fill
        Me.gbEntréesSortiesNumériques.Location = New System.Drawing.Point(0, 0)
        Me.gbEntréesSortiesNumériques.Name = "gbEntréesSortiesNumériques"
        Me.gbEntréesSortiesNumériques.Size = New System.Drawing.Size(421, 150)
        Me.gbEntréesSortiesNumériques.TabIndex = 0
        Me.gbEntréesSortiesNumériques.TabStop = False
        Me.gbEntréesSortiesNumériques.Text = "Entrées/Sorties numériques"
        '
        'TableLayoutPanel1
        '
        Me.TableLayoutPanel1.ColumnCount = 1
        Me.TableLayoutPanel1.ColumnStyles.Add(New System.Windows.Forms.ColumnStyle(System.Windows.Forms.SizeType.Percent, 50.0!))
        Me.TableLayoutPanel1.Controls.Add(Me.gbPortA, 0, 0)
        Me.TableLayoutPanel1.Controls.Add(Me.gbPortC, 0, 1)
        Me.TableLayoutPanel1.Dock = System.Windows.Forms.DockStyle.Fill
        Me.TableLayoutPanel1.Location = New System.Drawing.Point(3, 16)
        Me.TableLayoutPanel1.Name = "TableLayoutPanel1"
        Me.TableLayoutPanel1.RowCount = 2
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 51.0!))
        Me.TableLayoutPanel1.RowStyles.Add(New System.Windows.Forms.RowStyle(System.Windows.Forms.SizeType.Percent, 49.0!))
        Me.TableLayoutPanel1.Size = New System.Drawing.Size(415, 131)
        Me.TableLayoutPanel1.TabIndex = 1
        '
        'gbPortA
        '
        Me.gbPortA.Controls.Add(Me.FlowLayoutPortA)
        Me.gbPortA.Dock = System.Windows.Forms.DockStyle.Fill
        Me.gbPortA.Location = New System.Drawing.Point(3, 3)
        Me.gbPortA.Name = "gbPortA"
        Me.gbPortA.Size = New System.Drawing.Size(409, 60)
        Me.gbPortA.TabIndex = 0
        Me.gbPortA.TabStop = False
        Me.gbPortA.Text = "Port A"
        '
        'gbPortC
        '
        Me.gbPortC.Controls.Add(Me.FlowLayoutPortB)
        Me.gbPortC.Dock = System.Windows.Forms.DockStyle.Fill
        Me.gbPortC.Location = New System.Drawing.Point(3, 69)
        Me.gbPortC.Name = "gbPortC"
        Me.gbPortC.Size = New System.Drawing.Size(409, 59)
        Me.gbPortC.TabIndex = 1
        Me.gbPortC.TabStop = False
        Me.gbPortC.Text = "Port C"
        '
        'FlowLayoutPortA
        '
        Me.FlowLayoutPortA.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FlowLayoutPortA.Location = New System.Drawing.Point(3, 16)
        Me.FlowLayoutPortA.Name = "FlowLayoutPortA"
        Me.FlowLayoutPortA.Size = New System.Drawing.Size(403, 41)
        Me.FlowLayoutPortA.TabIndex = 0
        '
        'FlowLayoutPortB
        '
        Me.FlowLayoutPortB.Dock = System.Windows.Forms.DockStyle.Fill
        Me.FlowLayoutPortB.Location = New System.Drawing.Point(3, 16)
        Me.FlowLayoutPortB.Name = "FlowLayoutPortB"
        Me.FlowLayoutPortB.Size = New System.Drawing.Size(403, 40)
        Me.FlowLayoutPortB.TabIndex = 0
        '
        'ES_Num_LabjackU12
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 13.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.Controls.Add(Me.gbEntréesSortiesNumériques)
        Me.Name = "ES_Num_LabjackU12"
        Me.Size = New System.Drawing.Size(421, 150)
        Me.gbEntréesSortiesNumériques.ResumeLayout(False)
        Me.TableLayoutPanel1.ResumeLayout(False)
        Me.gbPortA.ResumeLayout(False)
        Me.gbPortC.ResumeLayout(False)
        Me.ResumeLayout(False)

    End Sub
    Friend WithEvents gbEntréesSortiesNumériques As System.Windows.Forms.GroupBox
    Friend WithEvents TableLayoutPanel1 As System.Windows.Forms.TableLayoutPanel
    Friend WithEvents gbPortA As System.Windows.Forms.GroupBox
    Friend WithEvents gbPortC As System.Windows.Forms.GroupBox
    Friend WithEvents FlowLayoutPortA As System.Windows.Forms.FlowLayoutPanel
    Friend WithEvents FlowLayoutPortB As System.Windows.Forms.FlowLayoutPanel

End Class
