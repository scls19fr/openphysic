VERSION 5.00
Object = "{831FDD16-0C5C-11D2-A9FC-0000F8754DA1}#2.0#0"; "MSCOMCTL.OCX"
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   5235
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   9465
   LinkTopic       =   "Form1"
   ScaleHeight     =   5235
   ScaleWidth      =   9465
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdTester 
      Caption         =   "&Tester"
      Height          =   495
      Left            =   240
      TabIndex        =   3
      Top             =   4440
      Width           =   1215
   End
   Begin VB.PictureBox Picture1 
      BackColor       =   &H00FFFFFF&
      Height          =   3615
      Left            =   2160
      ScaleHeight     =   3555
      ScaleWidth      =   6675
      TabIndex        =   2
      Top             =   840
      Width           =   6735
   End
   Begin VB.Timer Timer1 
      Interval        =   100
      Left            =   7320
      Top             =   120
   End
   Begin VB.TextBox Text1 
      Height          =   375
      Left            =   600
      TabIndex        =   1
      Top             =   1080
      Width           =   615
   End
   Begin MSComctlLib.Slider Slider1 
      Height          =   2775
      Left            =   600
      TabIndex        =   0
      Top             =   1440
      Width           =   555
      _ExtentX        =   979
      _ExtentY        =   4895
      _Version        =   393216
      Orientation     =   1
      Max             =   100
      TickFrequency   =   10
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim t As Double ' temps
Dim I As Double ' Input = entree
Dim O As Double ' Output = sortie

Private Sub cmdTester_Click()
'Picture1.Line (0, 0)-(10, 100)
End Sub

Private Sub Form_Load()
    With Picture1
        .ScaleMode = 0
        .ScaleWidth = 60
        .ScaleHeight = -100
        .ScaleTop = 100
    End With

    Slider1_Change
End Sub

Private Sub Slider1_Change()
    I = Slider1.Value
    Text1.Text = I
End Sub

Private Sub Text1_Change()
If IsNumeric(Text1.Text) Then
    I = Text1.Text
    Slider1.Value = I
Else
    I = 0
    Slider1.Value = I
    Text1.Text = I
End If
End Sub

Private Sub Timer1_Timer()
t = t + Timer1.Interval / 1000
Picture1.DrawWidth = 3
Picture1.ForeColor = vbGreen
Picture1.PSet (t, I)
calculer
Picture1.ForeColor = vbRed
Picture1.PSet (t, O)
End Sub

Private Sub calculer()
O = I / 2
End Sub
