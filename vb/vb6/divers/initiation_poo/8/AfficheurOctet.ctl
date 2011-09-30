VERSION 5.00
Begin VB.UserControl AfficheurOctet 
   ClientHeight    =   300
   ClientLeft      =   0
   ClientTop       =   0
   ClientWidth     =   2835
   ScaleHeight     =   300
   ScaleWidth      =   2835
   Begin POO.LED LED1 
      Height          =   255
      Index           =   0
      Left            =   2520
      TabIndex        =   0
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   1
      Left            =   2160
      TabIndex        =   1
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   2
      Left            =   1800
      TabIndex        =   2
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   3
      Left            =   1440
      TabIndex        =   3
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   4
      Left            =   1080
      TabIndex        =   4
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   5
      Left            =   720
      TabIndex        =   5
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   6
      Left            =   360
      TabIndex        =   6
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
   Begin POO.LED LED1 
      Height          =   255
      Index           =   7
      Left            =   0
      TabIndex        =   7
      Top             =   0
      Width           =   255
      _ExtentX        =   450
      _ExtentY        =   450
   End
End
Attribute VB_Name = "AfficheurOctet"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = True
Attribute VB_PredeclaredId = False
Attribute VB_Exposed = False
Option Explicit

Dim m_N As Byte
Const Nbits As Byte = 8

Private Sub UserControl_Initialize()
    m_N = 1
End Sub


Public Property Let N(new_N As Byte)
    m_N = new_N
    dessiner
End Property

Public Property Get N() As Byte
    N = m_N
End Property

Public Sub dessiner()
    Dim N As Byte
    Dim i As Integer
    N = m_N ' copie afin de ne pas modifier la valeur de m_N
    For i = Nbits - 1 To 0 Step -1
        If N >= 2 ^ i Then ' bit à 1
            N = N - 2 ^ i
            LED1(i).allumer
        Else ' bit à 0
            LED1(i).eteindre
        End If
    Next i
End Sub
