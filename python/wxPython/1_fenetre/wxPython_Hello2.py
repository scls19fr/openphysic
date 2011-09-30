from wxPython.wx import *


class MainWindow(wxFrame):
    def __init__(self,parent,id,title):
        wxFrame.__init__(self,parent,wxID_ANY, title, size = ( 300,200),
                                     style=wxDEFAULT_FRAME_STYLE|wxNO_FULL_REPAINT_ON_RESIZE)
        #self.control = wxTextCtrl(self, 1, style=wxTE_MULTILINE)
        self.Show(true)


app = wxPySimpleApp()
frame = MainWindow(None, -1, "Hello world 2 !")

app.MainLoop()
