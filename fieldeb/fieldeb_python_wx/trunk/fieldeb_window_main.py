from wxPython.wx import *

from fieldeb_charge import * # define an draw a charge "Charge"
from fieldeb_vector import * # define and draw vectors
from fieldeb_grain import * # define and draw grains
from fieldeb_grid import * # define and draw Grid
from fieldeb_colour import * # color scale




class MainWindow(wxFrame):
    def TO_DO(self):
        msg = "TO DO"
        title = "TO DO"
        d = wxMessageDialog(self, msg, title, wxOK)
        d.ShowModal()

    def Refresh_Panel(self):
        #DrawPanel(self, grid)
        self.Refresh()
    
    def CreateMenu(self):
        # Setting up the menu
        mnuBar = wxMenuBar() # creating a menu-bar
        
        # -> File
        mnuFile = wxMenu() # Creating the "File" menu
        mnuBar.Append(mnuFile, "&File") # Adding the "mnuFile" to the MenuBar
        # --> About
        ID_FileAbout = wxNewId() #101
        mnuFile.Append(ID_FileAbout, "&About", "About fieldE...")
        # attach the menu-event ID_ABOUT to the method self.OnAbout
        EVT_MENU(self, ID_FileAbout, self.OnFileAbout)
        # --> ---
        mnuFile.AppendSeparator()
        # --> Exit
        ID_FileExit = wxNewId() #102
        mnuFile.Append(ID_FileExit, "E&xit", "Close fieldE")
        EVT_MENU(self, ID_FileExit, self.OnFileExit)

        # -> Mode
        mnuMode = wxMenu()
        mnuBar.Append(mnuMode, "&Mode")
        # --> E
        ID_ModeE = wxNewId()
        mnuMode.AppendRadioItem(ID_ModeE, "E", "Electrostatic simulator")
        EVT_MENU(self, ID_ModeE, self.OnModeE)
        # --> B
        ID_ModeB = wxNewId()
        mnuMode.AppendRadioItem(ID_ModeB, "B", "Magnetostatic simulator")
        EVT_MENU(self, ID_ModeB, self.OnModeB)
                        
        # -> Image
        mnuImage = wxMenu()
        mnuBar.Append(mnuImage, "&Image")
        # --> Show Field...
        ID_ImageShowfield = wxNewId() #201
        mnuImage.AppendRadioItem(ID_ImageShowfield,
                        "Show &Field...",
                        "Show the electrostatic or magnetostic field")
        EVT_MENU(self, ID_ImageShowfield, self.OnImageShowfield)
        # --> Show Field lines...
        ID_ImageShowfieldlines = wxNewId() #202
        mnuImage.AppendRadioItem(ID_ImageShowfieldlines,
                        "Show Field &Lines...",
                        "Show the electrostatic or magnetostatic field lines")
        EVT_MENU(self, ID_ImageShowfieldlines, self.OnImageShowfieldlines) 
        # --> Show Equipotentials...
        ID_ImageShowequipotentials = wxNewId() #203
        mnuImage.AppendRadioItem(ID_ImageShowequipotentials,
                        "Show &Equipotentials...",
                        "Show the equipotentials lines")
        EVT_MENU(self, ID_ImageShowequipotentials, self.OnImageShowpotential)
        # --> ---
        mnuImage.AppendSeparator()
        # --> Clear Field & Charges
        #ID_ImageClearFieldandcharges = wxNewId() #204
        #mnuImage.Append(ID_ImageClearFieldandcharges,
        #                "C&lear Field and Charges",
        #                "Clear Field and Charges")
        # --> Clear Field
        #ID_ImageClearField = wxNewId() #205
        #mnuImage.Append(ID_ImageClearField,
        #                "Clea&r Field",
        #                "Clear only Field")
        # --> Clear Charges
        ID_ImageClearCharges = wxNewId()
        mnuImage.Append(ID_ImageClearCharges,
                        "&Clear charges or currents",
                        "Clear charges or currents")
        EVT_MENU(self, ID_ImageClearCharges, self.OnImageClearCharges)

        # -> Options
        mnuOptions = wxMenu()
        mnuBar.Append(mnuOptions, "&Options")
        # --> Field As Vector
        ID_OptionsFieldAsVectors = wxNewId() #301
        mnuOptions.AppendRadioItem(ID_OptionsFieldAsVectors,
                          "Field As &Vectors",
                          "Show field as vectors")
        EVT_MENU(self, ID_OptionsFieldAsVectors, self.OnOptionsFieldAsVectors)
        # --> Field As Grains
        ID_OptionsFieldAsGrains = wxNewId() #302
        mnuOptions.AppendRadioItem(ID_OptionsFieldAsGrains,
                          "Field As &Grains",
                          "Show field as grains")
        EVT_MENU(self, ID_OptionsFieldAsGrains, self.OnOptionsFieldAsGrains)
        # --> ---
        #mnuOptions.AppendSeparator()
        
        # -> Colors
        mnuColors = wxMenu()
        mnuBar.Append(mnuColors, "&Colors")
        # --> Use colors
        ID_ColorsColors = wxNewId()
        mnuColors.AppendRadioItem(ID_ColorsColors,
                          "Use &Colors",
                          "Use colors")
        EVT_MENU(self, ID_ColorsColors, self.OnColorsColors)
        
        # --> Use Black White and Gray
        ID_ColorsBWG = wxNewId() #303
        mnuColors.AppendRadioItem(ID_ColorsBWG,
                          "Use Black White and &Gray",
                          "Use Black White and &Gray")
        EVT_MENU(self, ID_ColorsBWG, self.OnColorsBWG)
        
        # --> Use Black and White
        ID_ColorsBW = wxNewId() #303
        mnuColors.AppendRadioItem(ID_ColorsBW,
                          "Use Black and White",
                          "Use &Black and White")
        EVT_MENU(self, ID_ColorsBW, self.OnColorsBW)

        # Adding the MenuBar to the Frame content
        self.SetMenuBar(mnuBar)



    def OnFileAbout(self, event=None):
        d = wxMessageDialog( self, "fieldEB v0.1 \n"
                             " \n"
                             " an electrostatic and magnetostic simulator \n"
                             " in Python with wxPython \n"
                             " by Sebastien Celles \n"
                             " under GNU/GPL licence \n"
                             " \n"
                             " http://www.gnu.org/licenses/gpl.html",
                             "About fieldEB...", wxOK)
                            # Create a message dialog box
        d.ShowModal() # Shows it
        d.Destroy() # finally destroy it when finished.

    def OnFileExit(self, event=None):
        self.Close(true)  # Close the frame.


        
    def OnModeE(self, event=None):
        #print "Mode E"
        global mode
        mode="E"
        self.Refresh_Panel()
       

        
    def OnModeB(self, event=None):
        #print "Mode B"
        global mode
        mode="B"
        self.Refresh_Panel()




        
    def OnImageShowfield(self, event):
        #Enter number of horizontal grid points :
        #(Value between 2 and 300)
        #default=15
        self.TO_DO()

    def OnImageShowfieldlines(self, event):
        #Enter number of fields line per charge :
        #(Value between 1 and 360)
        #default=30
        self.TO_DO()

    def OnImageShowpotential(self, event):
        #Highest potential :
        # default=50
        #Difference between two potentials
        # default=5
        #Create low resolution preview
        self.TO_DO()

    def OnImageClearCharges(self, event):
        global lst_of_charges
        lst_of_charges = []
        self.Refresh_Panel()

    def OnOptionsFieldAsVectors(self, event):
        global draw
        draw = "VECTORS"
        self.Refresh_Panel()

    def OnOptionsFieldAsGrains(self, event):
        global draw
        draw = "GRAINS"
        self.Refresh_Panel()



    def OnColorsColors(self, event):
        self.TO_DO()

    def OnColorsBWG(self, event):
        self.TO_DO()
        
    def OnColorsBW(self, event):
        self.TO_DO()
        
        

    def __init__(self, parent, id, title):   
        wxFrame.__init__(self, parent, wxID_ANY, title, size = ( 600,400), 
                         style=wxDEFAULT_FRAME_STYLE|wxNO_FULL_REPAINT_ON_RESIZE)     
        self.CreateMenu() # Make Menu fonction
        self.CreateStatusBar() # A Statusbar in the bottom of the window
        DrawPanel(self, grid) # Draw a panel on the frame


grid = Grid()
grid.colour = "BLACK"
lst_of_charges = [] # init list of charges
DEFAULT_CHARGE = 1000
CURRENT_CHARGE = 1000
Ke = 500 #TO DO : undef !!! proportional ... to defined...
Km = 500
n = 2 # E=K*q/r^n with n=2
#grid = Grid()
#grid.colour = "BLACK"



mode = "E"
# "E":electrostatic
# "B":magnetostatic

draw = "VECTORS"
# "VECTORS"
# "GRAINS"
# "RECTANGLES"

class DrawPanel(wxPanel):
    def __init__(self, parent, grid):
        wxPanel.__init__(self, parent, -1)
        EVT_PAINT( self, self.OnPaint )

        #Mouse Event
        EVT_RIGHT_DOWN(self, self.OnMouseRightClick)
        EVT_LEFT_DOWN(self, self.OnMouseLeftClick)
        EVT_LEFT_UP(self, self.OnMouseLeftUp)
        #EVT_RIGHT_UP(self, self.OnMouseRightUp)   

        EVT_MOTION(self, self.OnMouseMove)


    def OnMouseRightClick(self, event):
        #title = "delete a charge"
        pt = event.GetPosition()

        near = false    
        i = 0

        for chg in lst_of_charges:
            distance = sqrt((pt.x-chg.x)**2 + (pt.y-chg.y)**2)
            # TO DO : sort by distance
            #print str(distance) + " " + str(chg.radius)
            if distance < chg.radius:
                # Click near from a charge
                # Move this charge
                near = true
                j = i
            else:
                # Click not near from a charge
                # Add a personnal point of measure
                pass
            i = i + 1

        if near:
            del(lst_of_charges[j])
            self.Refresh() # lauch OnPaint event
        
    def OnMouseLeftUp(self, event):
        #print "OnMouseLeftUp"
        for chg in lst_of_charges:
            chg.movable = False
    
                
    def OnMouseLeftClick(self, event):
        near_of_a_charge = False
        
        pt = event.GetPosition()

        for chg in lst_of_charges:
            dist_carre = (chg.x-pt.x)**2 + (chg.y-pt.y)**2
            if dist_carre < chg.radius**2:
                 near_of_a_charge = True
                 chg.movable = True
                 break

        if not near_of_a_charge:
            title = "New electrical charge"
            msg = "Enter new electrical charge"        
            #d = wxMessageDialog(self, msg, title, wxOK+wxCANCEL)
            #d = wxDialog( self, -1,title,(-1,-1),(-1,-1),wxDEFAULT_DIALOG_STYLE)
            str_value = str(DEFAULT_CHARGE)
            d = wxTextEntryDialog(self, title, msg, str_value, wxOK | wxCANCEL | wxCENTRE, wxDefaultPosition)
        
            if ( d.ShowModal() == wxID_OK ) : # Show it (and press OK)
                charge = Charge()
                charge.x = pt.x
                charge.y = pt.y
                charge.charge = float(d.GetValue())
                lst_of_charges.append(charge)
                global CURRENT_CHARGE
                CURRENT_CHARGE = float(d.GetValue())
            else: # Cancel
                pass

            d.Destroy() # finally destroy it when finished.

            self.Refresh() # lauch OnPaint event
            
        else: # near of a charge
            #for chg in lst_of_charges:
            #    dist_carre = (chg.x-pt.x)**2 + (chg.y-pt.y)**2
            #    if dist_carre < chg.radius**2:
            #        chg.movable
            # TO DO
            self.Refresh()
        
        
        
        
        


    def OnMouseMove(self, event):
        pt = event.GetPosition()
        x = pt.x
        y = pt.y
        z = 0
        #print str(x) + " ; " + str(y)

        moving_mouse_without_charge = True;

        for chg in lst_of_charges:
            if chg.movable:
                moving_mouse_without_charge = False

        if moving_mouse_without_charge:
            # Update statusbar (calculate field at the point)
            pass
        else:
            for chg in lst_of_charges:
                if chg.movable:
                    chg.x = x
                    chg.y = y
                    chg.z = 0
            self.Refresh()
        

    def DrawCharges(self, dc):     
        for chg in lst_of_charges: # DRAW for each charge in list_of_charges
            chg.draw(dc, mode)

    def DrawField(self, dc, lst_of_points_of_grid, DRAW_NAME):
        E_max = 0
        for pt in lst_of_points_of_grid:
            Ex, Ey, Ez = 0, 0, 0
            Bx, By, Bz = 0, 0, 0

            # DRAW ONLY IF THERE IS NO CHARGE NEAR (r compared to radius)
            BOOL_DRAW = true
            
            for chg in lst_of_charges:
                rx = pt.x-chg.x
                ry = pt.y-chg.y
                rz = 0
                r = sqrt(rx**2+ry**2+rz**2)

                global draw
                if draw == "VECTORS":
                    if chg.charge > 0:
                        r_min = chg.radius * 3.0
                    else:
                        r_min = chg.radius * 8.0
                else:
                    r_min = chg.radius*2.0
                        
                if r < r_min: # a charge is near this point
                    BOOL_DRAW = false
                    
                # E-> = q/r^2 u-> = q/r^3 r->
                if r**(n+1) == 0:
                    BOOL_DRAW = false
                    break
                    
                Ex = Ex + Ke*chg.charge/(r**(n+1))*rx
                Ey = Ey + Ke*chg.charge/(r**(n+1))*ry
                Ez = Ez + Ke*chg.charge/(r**(n+1))*rz
                Bx = Bx - Km*chg.charge/(r**(n+1))*ry
                By = By + Km*chg.charge/(r**(n+1))*rx
                Bz = 0

            E = sqrt(Ex**2 + Ey**2 + Ez**2)
            E_max = Ke*1000/(60)**2

            B = sqrt(Bx**2 + By**2 + Bz**2)
            B_max = Km*1000/(60)**2


            
            if mode=="E": # Electrostatic
                Vect_x, Vect_y, Vect_z, Vect, Vect_max = Ex, Ey, Ez, E, E_max
            else: # mode=="B" Magnetostatic
                Vect_x, Vect_y, Vect_z, Vect, Vect_max = Bx, By, Bz, B, B_max

            if BOOL_DRAW:        
                if DRAW_NAME == "VECTORS":
                    vector = Vector()
                    vector.initial.position.x = pt.x
                    vector.initial.position.y = pt.y
                    vector.final.position.x = pt.x + Vect_x
                    vector.final.position.y = pt.y + Vect_y
                    vector.colour = get_colour_step(Vect, Vect_max)
                    vector.draw(dc)                    
                elif DRAW_NAME == "GRAINS":
                    grain = Grain()
                    grain.len = sqrt(grid.x_space**2 + grid.y_space**2)*0.7
                    grain.x = pt.x
                    grain.y = pt.y
                    grain.ux = Vect_x
                    grain.uy = Vect_y
                    grain.colour = get_colour_step(Vect, Vect_max)  #"BLUE"
                    grain.draw(dc)
                elif DRAW_NAME == "RECTANGLES":
                    pass
                else:
                    pass
                


    def OnPaint(self, event=None):
        dc = wxPaintDC(self)
        #print("OnPaint")
        brush = wxBrush("WHITE")
        dc.SetBackground(brush)
        dc.Clear()
        grid.draw(dc)
        lst_of_points_of_grid = grid.get(dc)
        lst_of_personnal_points = []
        lst_of_points = lst_of_points_of_grid + lst_of_personnal_points
        # TO DO : ADD personnal points to points of grid
        self.DrawCharges(dc)
        if (len(lst_of_charges) != 0): # TO DO
            global draw
            self.DrawField(dc, lst_of_points, draw)
            #self.DrawField(dc, lst_of_points, "GRAINS")
            self.DrawCharges(dc) # Draw Charges again to be on top
        
