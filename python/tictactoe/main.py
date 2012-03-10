#!/usr/bin/ev python

import sys

class TicTacToe:
  def __init__(self):
    self.width=4
    self.height=4

    self.game=[[0 for j in range(0,self.width)] for i in range(0,self.height)]
    
    self.game[1][2]=1
    self.game[1][3]=2
    
  def display(self):
    sys.stdout.write(" ")
    for j in range(0,self.width):
      sys.stdout.write("-")
    print("")

    for i in range(0,self.height):
      sys.stdout.write("|")
  
      for j in range(0,self.width):
        if self.game[i][j]==0:
          sys.stdout.write(" ")
        elif self.game[i][j]==1:
          sys.stdout.write("1")
        elif self.game[i][j]==2:
          sys.stdout.write("2")
    
      print("|")

    sys.stdout.write(" ")
    for j in range(0,self.width):
      sys.stdout.write("-")
    print("")  

myGame = TicTacToe()
myGame.display()



