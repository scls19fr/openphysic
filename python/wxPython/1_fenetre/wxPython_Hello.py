from wxPython.wx import *

app = wxPySimpleApp()
frame = wxFrame(None, -1, 'Hello', size = wxSize(400, 250))

frame.Show(1)

app.MainLoop()
