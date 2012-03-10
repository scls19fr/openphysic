#!/usr/bin/ev python

import sys
import os

def cls():
    os.system(['clear','cls'][os.name == 'nt'])

class TicTacToe:
  player = 1
  width = 4
  height = 4
  
  game = []
  
  turns = 0

  def __init__(self):
    self.game=[[0 for j in range(0,self.width)] for i in range(0,self.height)]
    

  def turn(self):
    if self.player==1:
      self.player=2
    elif self.player==2:
      self.player=1
      
  def play(self, i, j):
    if self.game[i][j]==0:
      self.game[i][j]=self.player
      self.turns = self.turns + 1
      self.turn()
    else:
      raise(Exception("Cell is not empty"))

  def display(self):
    cls()
    sys.stdout.write(" ")
    for j in range(0,self.width):
      sys.stdout.write("-")
    print("")

    for i in range(0,self.height):
      sys.stdout.write("|")
  
      for j in range(0,self.width):
        if self.game[i][j]==0:
          sys.stdout.write(".")
        elif self.game[i][j]==1:
          sys.stdout.write("1")
        elif self.game[i][j]==2:
          sys.stdout.write("2")
    
      print("|")

    sys.stdout.write(" ")
    for j in range(0,self.width):
      sys.stdout.write("-")
    print("")  

    print("Player {}".format(myGame.player))

myGame = TicTacToe()


#myGame.play(1,2)


while True:
  try:
    myGame.display()
    print('Please enter a position')
    in_str=input(' as line,col (or q to quit): ') # raw_input

    i = in_str[0] - 1
    j = in_str[1] - 1

    myGame.play(i,j)
  
    
  except:
    pass

#myGame.play(1,3)

#myGame.play(1,3)
#myGame.display()

