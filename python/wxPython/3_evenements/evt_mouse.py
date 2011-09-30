import sys
from wxPython.wx import *


class MouseDownTracker(wxEvtHandler):
    def __init__(self, log):
        wxEvtHandler.__init__(self)
        self.log = log
        EVT_LEFT_DOWN(self, self.OnMouseDown)

    def OnMouseDown(self, evt):
        pos = evt.GetPosition()
        window = self.GetNextHandler()
        self.log.write("Mouse down at %s on %s\n" % (pos, window.__class__.__name__))
        evt.Skip()


class MyPanel(wxPanel):
    def __init__(self, parent, Id, log):
        wxPanel.__init__(self, parent, Id)

        stxt = wxStaticText(self, -1, "Hello")
        tctl = wxTextCtrl(self, -1, "What's up Doc?", size=(150,-1))
        btn  = wxButton(self, -1, "Click Me!")

        stxt.PushEventHandler(MouseDownTracker(sys.stdout))
        tctl.PushEventHandler(MouseDownTracker(sys.stdout))
        btn.PushEventHandler(MouseDownTracker(sys.stdout))

        sizer = wxBoxSizer(wxVERTICAL)
        sizer.Add((25,25))

        row = wxBoxSizer(wxHORIZONTAL)
        row.Add((25,1))
        row.Add(stxt, 0, wxALL, 5)
        row.Add(tctl, 0, wxALL, 5)
        row.Add(btn, 0, wxALL, 5)
        sizer.Add(row)

        self.SetSizer(sizer)


app = wxPySimpleApp()
f = wxFrame(None, -1, "PushEventHandler Tester", size=(400,350))
p = MyPanel(f, -1, sys.stdout)
p.PushEventHandler(MouseDownTracker(sys.stdout))
f.Show()
app.MainLoop()