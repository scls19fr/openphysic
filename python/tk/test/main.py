from Tkinter import *

class App:
    def __init__(self, master):
        frame = Frame(master)
        frame.pack()
        self.button = Button(frame, text="ADD", command=self.job)
        self.button.pack(side=LEFT)
        #self.buttonquit = Button(frame, text="QUIT", command=frame.quit)
        self.buttonquit = Button(frame, text="QUIT", command=master.destroy)
        self.buttonquit.pack(side=LEFT)
        self.list = Listbox()
        self.list.pack()
    def job(self):
        self.list.insert(END, "Salut")

if "__main__"==__name__:
    root = Tk()
    app = App(root)
    root.mainloop()
    print "Fin" 
