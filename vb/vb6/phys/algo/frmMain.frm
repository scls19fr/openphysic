VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Algo"
   ClientHeight    =   4215
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8295
   LinkTopic       =   "Form1"
   ScaleHeight     =   4215
   ScaleWidth      =   8295
   StartUpPosition =   3  'Windows Default
   Begin VB.ListBox List3 
      Height          =   3960
      Left            =   5880
      TabIndex        =   3
      Top             =   120
      Width           =   2295
   End
   Begin VB.ListBox List2 
      Height          =   3960
      Left            =   3480
      TabIndex        =   2
      Top             =   120
      Width           =   2295
   End
   Begin VB.CommandButton cmdDo 
      Caption         =   "Calculer"
      Height          =   3975
      Left            =   2520
      TabIndex        =   1
      Top             =   120
      Width           =   855
   End
   Begin VB.ListBox List1 
      Height          =   3960
      Left            =   120
      TabIndex        =   0
      Top             =   120
      Width           =   2295
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim tabl() As Double
Const N As Integer = 20

Private Sub clear()
List1.clear
List2.clear
List3.clear

Randomize

ReDim tabl(0 To N - 1)

Dim i As Integer
Dim val As Double
For i = LBound(tabl) To UBound(tabl) ' UBound(t)=N-1
    val = Rnd
    tabl(i) = val
    List1.AddItem val
Next i

'Call Affiche(tabl())
List3.AddItem "Max=" & max(tabl())
List3.AddItem "Min=" & min(tabl())
List3.AddItem "Moy=" & mean(tabl())

' tri de tableau
sort tabl()
For i = LBound(tabl) To UBound(tabl) ' UBound(t)=N-1
    List2.AddItem tabl(i)
Next i
End Sub

Private Sub Form_Load()
clear
End Sub

Private Sub cmdDo_Click()
clear
End Sub




Public Sub Affiche(ByRef t() As Double)
Dim i As Integer
For i = 0 To UBound(t)
    Debug.Print t(i)
Next i
End Sub
