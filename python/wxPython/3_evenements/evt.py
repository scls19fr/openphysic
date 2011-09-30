import os
from wxPython.wx import *
ID_ABOUT=101
ID_EXIT=110
class MainWindow(wxFrame):
    def __init__(self,parent,id,title):
        wxFrame.__init__(self,parent,wxID_ANY, title, size = ( 200,100),

                                        style=wxDEFAULT_FRAME_STYLE|
                                        wxNO_FULL_REPAINT_ON_RESIZE)
        self.control = wxTextCtrl(self, 1, style=wxTE_MULTILINE)
        self.CreateStatusBar() # A StatusBar in the bottom of the window
        # Setting up the menu.
        filemenu= wxMenu()
        filemenu.Append(ID_ABOUT, "&About"," Information about this program")
        filemenu.AppendSeparator()
        filemenu.Append(ID_EXIT,"E&xit"," Terminate the program")
        # Creating the menubar.
        menuBar = wxMenuBar()
        menuBar.Append(filemenu,"&File") # Adding the "filemenu" to the MenuBar
        self.SetMenuBar(menuBar)  # Adding the MenuBar to the Frame content.
        EVT_MENU(self, ID_ABOUT, self.OnAbout) # attach the menu-event ID_ABOUT to the
                                                           # method self.OnAbout
        EVT_MENU(self, ID_EXIT, self.OnExit)   # attach the menu-event ID_EXIT to the
                                                           # method self.OnExit
        self.Show(true)
    def OnAbout(self,e):
        d= wxMessageDialog( self, " A sample editor \n"
                            " in wxPython","About Sample Editor", wxOK)
                            # Create a message dialog box
        d.ShowModal() # Shows it
        d.Destroy() # finally destroy it when finished.
    def OnExit(self,e):
        self.Close(true)  # Close the frame.
app = wxPySimpleApp()
frame = MainWindow(None, -1, "Sample editor")
app.MainLoop()
