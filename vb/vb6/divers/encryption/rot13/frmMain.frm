VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "ROT13"
   ClientHeight    =   6060
   ClientLeft      =   60
   ClientTop       =   450
   ClientWidth     =   8955
   LinkTopic       =   "Form1"
   ScaleHeight     =   6060
   ScaleWidth      =   8955
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton cmdQuitter 
      Caption         =   "&Quitter"
      Height          =   615
      Left            =   3360
      TabIndex        =   4
      Top             =   5040
      Width           =   1455
   End
   Begin VB.CommandButton cmdDecoder 
      Caption         =   "<- &Décoder"
      Height          =   615
      Left            =   5160
      TabIndex        =   3
      Top             =   4080
      Width           =   1695
   End
   Begin VB.CommandButton cmdCoder 
      Caption         =   "&Coder ->"
      Height          =   615
      Left            =   1080
      TabIndex        =   2
      Top             =   4080
      Width           =   1695
   End
   Begin VB.TextBox txtCode 
      Height          =   3495
      Left            =   4440
      TabIndex        =   1
      Top             =   240
      Width           =   3735
   End
   Begin VB.TextBox txtOriginal 
      Height          =   3495
      Left            =   240
      TabIndex        =   0
      Top             =   240
      Width           =   3495
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Option Explicit

Dim strOriginal As String
Dim strCode As String
Dim i As Integer

' Chr
' Asc
' Mod

Private Sub cmdCoder_Click()
    strOriginal = Me.txtOriginal.Text
    strCode = strOriginal
    
    For i = 1 To Len(strCode)
        Mid(strCode, i, 1) = car_original_vers_car_code(Mid(strOriginal, i, 1))
    Next i
    
    txtCode.Text = strCode
End Sub

Private Sub cmdDecoder_Click()
    strCode = Me.txtCode.Text
    strOriginal = strCode
    
    For i = 1 To Len(strOriginal)
        Mid(strOriginal, i, 1) = car_code_vers_car_original(Mid(strCode, i, 1))
    Next i

    txtOriginal.Text = strOriginal
End Sub

Private Function car_original_vers_car_code(ByVal car As String) As String
    If Asc(car) >= 97 And Asc(car) <= 122 Then
        car_original_vers_car_code = Chr((Asc(car) - 97 + 13) Mod 26 + 97)
    Else
        car_original_vers_car_code = car
    End If
End Function

Private Function car_code_vers_car_original(ByVal car As String) As String
'    If Asc(car) >= 97 And Asc(car) <= 122 Then
'        code_vers_original = Chr((Asc(car) - 97 - 13) Mod 26 + 97)
'    Else
'        code_vers_original = car
'    End If
' C'est inutile !!
' L'avantage de ROT13, c'est le fait que le décalage soit de 13 ! L'alphabet comporte 26 lettres, et si on applique deux fois de suite le chiffrement, on obtient comme résultat le texte en clair.

    car_code_vers_car_original = car_original_vers_car_code(car)
End Function

Private Sub cmdQuitter_Click()
    End
End Sub

