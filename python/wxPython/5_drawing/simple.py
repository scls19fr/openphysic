from wxPython.wx import *

class DrawPanel( wxPanel ):
    def __init__(self,parent):
        wxPanel.__init__(self,parent,-1)

        EVT_PAINT( self, self.OnPaint )

    def OnPaint( self, event=None ):
        dc = wxPaintDC( self )
        dc.Clear()
        dc.SetPen( wxPen("BLACK",4) )
        dc.DrawLine( 0,0,50,50 )

app = wxPySimpleApp()
frame = wxFrame( None, -1, "Draw on Frame" )
DrawPanel( frame )
frame.Show(1)
app.MainLoop()
