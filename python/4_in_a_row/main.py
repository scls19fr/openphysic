#!/usr/bin/ev python

import sys
import os

def cls():
    os.system(['clear','cls'][os.name == 'nt'])

class FourInARow:
  player = 1
  
  dim = 4
  width = dim
  height = dim
  
  game = []
  
  turns = 0

  def __init__(self):
    self.game=[[0 for j in range(0,self.width)] for i in range(0,self.height)]
    

  def turn(self):
    if self.player==1:
      self.player=2
    elif self.player==2:
      self.player=1

  def test(self):
    return(-1)
      
  def play(self, j):
    if j>=self.width:
      raise(Exception("j dim error"))
      
  
#    if self.game[i][j]==0:
#      self.game[i][j] = self.player
      
      self.turns = self.turns + 1
      self.turn()
      
    else:
      raise(Exception("Col is full"))

  def display(self):
    cls()
    print("  "+"-"*self.width)

    for i in range(0,self.height):
      sys.stdout.write("{}|".format(i+1))
  
      for j in range(0,self.width):
        if self.game[i][j]==0:
          sys.stdout.write(".")
        elif self.game[i][j]==1:
          sys.stdout.write("1")
        elif self.game[i][j]==2:
          sys.stdout.write("2")
    
      print("|")

    sys.stdout.write("  ")
    for j in range(0,self.width):
      sys.stdout.write("-")
    print("")
    sys.stdout.write("  ")
    for j in range(0,self.width):
      sys.stdout.write("{}".format(j+1))
    print("")


myGame = FourInARow()

winner=-1
while winner==-1:
  #try:
    myGame.display()
    
    winner=myGame.test()
    if winner==-1:
      print("")
      print("""Player {} - turn {}""".format(myGame.player, myGame.turns+1))
      print("")
      print('Please enter a column')
      in_str=input(' (or q to quit): ') # raw_input

      myGame.play(in_str)
      
    elif winner==1 or winner==2:
      in_str=raw_input('Winner is player {}'.format(winner))
      
    elif winner==0:
      in_str=raw_input('Draw')
    
  #except:
    #pass
  #  None

#myGame.play(1,3)

#myGame.play(1,3)
#myGame.display()

