#!/usr/bin/env python

import Tkinter
import tkMessageBox
from time import sleep
    
import pandas as pd
import numpy as np
from datetime import *

def conv_str_to_datetime(x):
  return(datetime.strptime(x, '%Y/%m/%d %H:%M:%S'))

def conv_str_to_pair(x):
  x=x.split('/')
  return(x[0]+x[1])
 
textFont1 = ("Arial", 10, "bold italic")
textFont2 = ("Arial", 16, "bold")
textFont3 = ("Arial", 8, "bold")
     
class LabelWidget(Tkinter.Entry):
    def __init__(self, master, x, y, text):
        self.text = Tkinter.StringVar()
        self.text.set(text)
        Tkinter.Entry.__init__(self, master=master)
        self.config(relief="ridge", font=textFont1,
                    bg="#ffffff000", fg="#000000fff",
                    readonlybackground="#ffffff000",
                    justify='center',width=8,
                    textvariable=self.text,
                    state="readonly")
        self.grid(column=x, row=y)
     
class EntryWidget(Tkinter.Entry):
    def __init__(self, master, x, y):
        Tkinter.Entry.__init__(self, master=master)
        self.value = Tkinter.StringVar()
        self.config(textvariable=self.value, width=8,
                    relief="ridge", font=textFont1,
                    bg="#ddddddddd", fg="#000000000",
                    justify='center')
        self.grid(column=x, row=y)
        self.value.set("")
     
# Temp function to call from menu
def temp():
    tkMessageBox.showerror("Not done", "This is a temporary message")
     
class EntryGrid(Tkinter.Tk):
    ''' Dialog box with Entry widgets arranged in columns and rows.'''
    def __init__(self, df, title="DataFrame Grid"):
        self.df = df
    
        colList = self.df.columns
        #rowList = self.df.icol(0)
        rowList = self.df.index.values
        
        #print(colList)

        #self.cols = colList[:]
        self.colList = colList[:]
        self.colList.insert(0, "")
        #self.colList.insert(1, "Index")
        self.rowList = rowList

       # print(colList)

        Tkinter.Tk.__init__(self)
        self.title(title)
     
        menubar = Tkinter.Menu()
        self.config(menu=menubar)
        optionsMenu = Tkinter.Menu(tearoff=0)
        menubar.add_cascade(label="Options", menu=optionsMenu)
        optionsMenu.add_command(label='Cmd1', command=temp)
        optionsMenu.add_command(label='Cmd2', command=temp)
        optionsMenu.add_command(label='Quit', command=self.destroy)
     
        self.mainFrame = Tkinter.Frame(self)
        self.mainFrame.config(padx='3.0m', pady='3.0m')
        self.mainFrame.grid()
        self.make_header()
     
        self.gridDict = {}
        
        """
        for i in range(1, len(self.colList)):
            for j in range(len(self.rowList)):
                w = EntryWidget(self.mainFrame, i, j+1)
                self.gridDict[(i-1,j)] = w.value
                def handler(event, col=i-1, row=j):
                    return self.__entryhandler(col, row)
                w.bind(sequence="<FocusOut>", func=handler)
        """
        
        """
        for i in range(len(self.colList)):
            for j in range(len(self.rowList)):
                #self.gridDict[(i,j)] = w.value
                print((i,j))
                self.gridDict[(i,j)] = self.df.iget_value(j, i)
        """        
		
        """
        i = indice col
		j = indice ligne ???
        """
		
        for i in range(len(self.colList)):
            for j in range(len(self.rowList)):
                w = EntryWidget(self.mainFrame, i+1, j+1)
                #w.value = "x"
                self.gridDict[(i,j)] = w.value
                #self.gridDict[(i,j)] = self.df.iget_value(j,i)
                def handler(event, col=i, row=j):
                    return self.__entryhandler(col, row)
                w.bind(sequence="<FocusOut>", func=handler)


        self.mainloop()
     
    def make_header(self):
        self.hdrDict = {}
        for i, label in enumerate(self.colList):
            def handler(event, col=i, row=0, text=label):
                return self.__headerhandler(col, row, text)
            w = LabelWidget(self.mainFrame, i+1, 0, label)
            self.hdrDict[(i,0)] = w
            w.bind(sequence="<KeyRelease>", func=handler)
     
        for i, label in enumerate(self.rowList):
            def handler(event, col=0, row=i+1, text=label):
                return self.__headerhandler(col, row, text)
            w = LabelWidget(self.mainFrame, 0, i+1, label)
            self.hdrDict[(0,i+1)] = w
            w.bind(sequence="<KeyRelease>", func=handler)
     
    def __entryhandler(self, col, row):
        s = self.gridDict[(col,row)].get()
        if s.upper().strip() == "EXIT":
            self.destroy()
        elif s.upper().strip() == "DEMO":
            self.demo()
        elif s.strip():
            self.gridDict[(col,row)].set(s.lower())
     
    def demo(self):
        ''' enter a number into each Entry field '''
        for i in range(len(self.cols)-1):
            for j in range(len(self.rowList)):
                #sleep(0.25)
                self.set(i,j,"")
                self.update_idletasks()
                sleep(0.1)
                self.set(i,j,i+1+j)
                self.update_idletasks()
     
    def __headerhandler(self, col, row, text):
        ''' has no effect when Entry state=readonly '''
        self.hdrDict[(col,row)].text.set(text)
     
    def get(self, x, y):
        return self.gridDict[(x,y)].get()
     
    def set(self, x, y, v):
        self.gridDict[(x,y)].set(v)
        return v
     
if __name__ == "__main__":
    df = pd.read_csv('Trade_History_denganyouqianle_19850320_20120805.csv', converters={'Date Open': conv_str_to_datetime, 'Date Close': conv_str_to_datetime, 'Currency': conv_str_to_pair})
    df = df[0:10]
    
    app = EntryGrid(df)
    dd = {}
    for key in app.gridDict:
        dd[key] = app.gridDict[key].get()
