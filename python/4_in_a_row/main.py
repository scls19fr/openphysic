#!/usr/bin/ev python

import sys
import os

def cls():
    os.system(['clear','cls'][os.name == 'nt'])

class FourInARow:
  player = 1
  
  dim = 4
  width = 7
  height = 6
  
  game = []
  nb = []
  
  turns = 0

  def __init__(self):
    self.game=[[0 for j in range(0,self.width)] for i in range(0,self.height)]
    self.nb=[0 for j in range(0,self.width)]
    

  def turn(self):
    if self.player==1:
      self.player=2
    elif self.player==2:
      self.player=1

  def test(self):
    return(-1)
    # ToDo
      
  def play(self, j):
    if j>=self.width:
      raise(Exception("j dim error"))
      
  
    if self.nb[j]<self.height:
      self.nb[j] = self.nb[j]+1
      self.game[self.height-self.nb[j]][j] = self.player
      
      self.turns = self.turns + 1
      self.turn()
      
    else:
      raise(Exception("Col is full"))

  def display(self):
    cls()

    sys.stdout.write("  ")
    for j in range(0,self.width):
      sys.stdout.write("{}".format(j+1))
    print("")
    print("  "+"-"*self.width)

    for i in range(0,self.height):
      sys.stdout.write("{}|".format(self.height-i))
  
      for j in range(0,self.width):
        if self.game[i][j]==0:
          sys.stdout.write(".")
        elif self.game[i][j]==1:
          sys.stdout.write("1")
        elif self.game[i][j]==2:
          sys.stdout.write("2")
    
      print("|{}".format(self.height-i))

    sys.stdout.write("  ")
    for j in range(0,self.width):
      sys.stdout.write("-")
    print("")
    sys.stdout.write("  ")
    for j in range(0,self.width):
      sys.stdout.write("{}".format(j+1))
    print("")
    
    #debug
    #print(self.game)
    #print(self.nb)


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

      j = in_str-1

      myGame.play(j)
      
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

