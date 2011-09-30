VERSION 5.00
Begin VB.Form frmMain 
   Caption         =   "Form1"
   ClientHeight    =   3060
   ClientLeft      =   120
   ClientTop       =   420
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3060
   ScaleWidth      =   4560
   StartUpPosition =   3  'Windows Default
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   1680
      TabIndex        =   0
      Top             =   1320
      Width           =   1215
   End
End
Attribute VB_Name = "frmMain"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
' How To Implement a Linked List in Visual Basic 6 ?
' Comment implémenter une liste chaîné en Visual Basic 6 ?
' Reference http://support.microsoft.com/kb/166394

Option Explicit

Dim head As Node               'object pointer to head of list

Private Sub Form_Load()
Dim curr As Node             'object pointer to current pos in
Dim i As Integer             'list used in For loop

'CREATE LIST
Set head = New Node          'object pointer to new node
head.key = 0                 'dummy head
Set curr = head              'keep head pointer here

For i = 1 To 20              'iterate n times to fill list
    Set curr.pnext = New Node  'insert new node after current
    Set curr = curr.pnext      'set current one = new node
    curr.key = i               'set new node key value
Next i
        
Set curr.pnext = New Node    'dummy tail
Set curr = curr.pnext        'move current to dummy tail
curr.key = 0                 'set value of dummy tail
Set curr.pnext = curr        'points to itself to identify end

Debug.Print "before: " & DumpList(head) 'print list
End Sub

Private Sub Command1_click()
'RERVERSE LIST
ReverseList head             'pass in head to ReverseList
Debug.Print "after: " & DumpList(head)  'print reversed list
End Sub

Private Sub ReverseList(ByRef head As Node)
'reverse entire list including dummy head and tail
'Note: head becomes tail, tail becomes head
Dim curr As Node             'object pointer to current node
Dim nexx As Node             'object pointer to next node
Set curr = head.pnext        'current to node after head
Set head.pnext = head        'turn head into tail

While Not curr.pnext Is curr 'walk entire list
    Set nexx = curr.pnext      'pointer to node after current
    Set curr.pnext = head      'current points back to head
    Set head = curr            'move head to current
    Set curr = nexx            'set current = next node
Wend
Set curr.pnext = head        'point new head to first node
Set head = curr              'return head to first position
End Sub

Private Function DumpList(ByRef head As Node) As String
'walk list and dump to debug window
Dim strOut As String         'temp var to hold string
Dim curr As Node             'object pointer to current node
Set curr = head.pnext        'skip dummy head
While Not curr.pnext Is curr 'walk rest of list to end
    strOut = strOut & " " & CStr(curr.key)
    Set curr = curr.pnext      'current pointer to next node
Wend
DumpList = strOut            'return string
End Function

