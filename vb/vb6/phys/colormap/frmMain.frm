VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Test ColorMap"
   ClientHeight    =   3090
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   3480
   LinkTopic       =   "Form1"
   ScaleHeight     =   3090
   ScaleWidth      =   3480
   StartUpPosition =   3  'Windows Default
   Begin VB.PictureBox Picture2 
      Height          =   615
      Left            =   1440
      ScaleHeight     =   555
      ScaleWidth      =   1515
      TabIndex        =   5
      Top             =   2040
      Width           =   1575
   End
   Begin VB.CommandButton cmdColor 
      Caption         =   "Color"
      Height          =   375
      Left            =   1920
      TabIndex        =   4
      Top             =   1440
      Width           =   615
   End
   Begin VB.TextBox txtN 
      Height          =   375
      Left            =   1920
      TabIndex        =   3
      Top             =   840
      Width           =   615
   End
   Begin VB.TextBox txtNMax 
      Height          =   375
      Left            =   2400
      TabIndex        =   2
      Top             =   360
      Width           =   615
   End
   Begin VB.TextBox txtNMin 
      Height          =   375
      Left            =   1440
      TabIndex        =   1
      Top             =   360
      Width           =   615
   End
   Begin VB.PictureBox Picture1 
      Height          =   2655
      Left            =   240
      ScaleHeight     =   2595
      ScaleWidth      =   675
      TabIndex        =   0
      Top             =   240
      Width           =   735
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim colormap As clsColorMap

Private Sub cmdColor_Click()
Dim nmin As Double
Dim nmax As Double
Dim n As Double
Dim x As Double

nmin = txtNMin.Text
nmax = txtNMax.Text
n = txtN.Text

x = (n - nmin) / (nmax - nmin)

'Picture2.BackColor = vbRed
Picture2.BackColor = colormap.colorAt(x)
End Sub

Private Sub Form_Load()
Picture1.ScaleMode = 0
Picture1.ScaleWidth = 1
Picture1.ScaleLeft = 0
Picture1.ScaleHeight = -1
Picture1.ScaleTop = 1

txtNMin.Text = 10
txtNMax.Text = 50
txtN.Text = 20


Set colormap = New clsColorMap


' tests
'colormap.colorAt(0,vbWhite)
'colormap.colorAt(1.,vbWhite)
'colormap.colorAt(0#) = vbGreen
'colormap.colorAt(0.5) = vbBlue
'colormap.colorAt(0.75) = vbYellow
'colormap.colorAt(0.9) = vbBlack
'colormap.colorAt(1#) = vbRed

' vert-jaune-rouge
'Set colormap = New clsColorMap
'colormap.colorAt(0#) = vbGreen
'colormap.colorAt(0.75) = vbYellow
'colormap.colorAt(1#) = vbRed

' blanc-bleu 50%
'Set colormap = New clsColorMap
'colormap.colorAt(0#) = vbWhite
'colormap.colorAt(1#) = vbBlue

' blanc - bleu 75% - bleu
'Set colormap = New clsColorMap
'Dim color As Long
'Dim R As Integer
'Dim G As Integer
'Dim B As Integer
'Dim pourcent As Double
'pourcent = 0.75
'getRGB vbBlue, R, G, B
'color = getColor(R, G, B * pourcent)
'colormap.colorAt(0#) = vbWhite
'colormap.colorAt(pourcent) = color
'colormap.colorAt(1#) = vbBlue


'Set colormap = New clsColorMap
colormap.colorAt(0#) = vbBlue
colormap.colorAt(0.5) = vbYellow '&H8080
colormap.colorAt(1#) = vbRed

End Sub


Private Sub Picture1_Paint()
'Picture1.Line (0, 0)-(1, 1)

Picture1.DrawWidth = 1

Dim x As Double
Const pas As Double = 0.001
For x = 0 To 1 Step pas
    Picture1.ForeColor = colormap.colorAt(x)
    Picture1.Line (0, x)-(1, x)
    'Debug.Print x
Next x

'colormap.PrintDebug

'Picture1.ForeColor = colormap.colorAt(0.75)
'Debug.Print colormap.colorAt(0.2)

End Sub
