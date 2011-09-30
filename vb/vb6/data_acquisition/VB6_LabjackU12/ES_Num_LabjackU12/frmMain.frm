VERSION 5.00
Begin VB.Form frmMain 
   BackColor       =   &H00E0E0E0&
   Caption         =   "Form1"
   ClientHeight    =   3870
   ClientLeft      =   60
   ClientTop       =   345
   ClientWidth     =   7755
   LinkTopic       =   "Form1"
   ScaleHeight     =   3870
   ScaleWidth      =   7755
   StartUpPosition =   3  'Windows Default
   Begin Test_ES_Num_LabjackU12.ES_Num ES_Num1 
      Height          =   2295
      Left            =   360
      TabIndex        =   1
      Top             =   240
      Width           =   5295
      _ExtentX        =   9340
      _ExtentY        =   4048
   End
   Begin VB.Timer Timer1 
      Interval        =   500
      Left            =   3960
      Top             =   3120
   End
   Begin VB.Label Label1 
      Caption         =   "Label1"
      Height          =   735
      Left            =   960
      TabIndex        =   0
      Top             =   2640
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Sub Form_Load()
    'Led1.allumer
    'Led1.éteindre

    'ES_Num1.Port(0) = 0
    ES_Num1.Port(0) = 15
    'ES_Num1.Port(0) = 255

End Sub

Private Sub Timer1_Timer()
    'Led1.inverser
    Label1.Caption = ES_Num1.Port(1)
End Sub
