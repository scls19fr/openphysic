#!/usr/bin/ev python

import sys
import os

def cls():
    os.system(['clear','cls'][os.name == 'nt'])

class TicTacToe:
  player = 1
  
  dim = 3 # <=9
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
    result = -1
    
    for i in range(0,self.height): # hz line
      if self.game[i][0]!=0 and self.game[i][0]==self.game[i][1] and self.game[i][1]==self.game[i][2]:
        return(self.game[i][0])

    for j in range(0,self.width): # vrt line
      if self.game[0][j]!=0 and self.game[0][j]==self.game[1][j] and self.game[1][j]==self.game[2][j]:
        return(self.game[0][j])

    # diagonals
    # \
    if self.game[0][0]!=0 and self.game[0][0]==self.game[1][1] and self.game[1][1]==self.game[2][2]:
      return(self.game[0][0])
    # /
    if self.game[2][0]!=0 and self.game[2][0]==self.game[1][1] and self.game[1][1]==self.game[0][2]:
      return(self.game[0][0])
    
        
#      temp = self.game(1,1)
#      for j in range(1,self.width)
#        if temp
    
    
  
    return(result) # -1 continue - 1 winner=P1 - 2 winner=P2 - 0 draw (match nul)
      
  def play(self, i, j):
    if i>=self.height:
      raise(Exception("i dim error"))
    if j>=self.width:
      raise(Exception("j dim error"))
      
  
    if self.game[i][j]==0:
      self.game[i][j] = self.player
      
      self.turns = self.turns + 1
      self.turn()
      
    else:
      raise(Exception("Cell is not empty"))

  def display(self):
    cls()
    sys.stdout.write("  ")
    for j in range(0,self.width):
      sys.stdout.write("{}".format(j+1))
    print("")
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


myGame = TicTacToe()


#myGame.play(1,2)

winner=-1
while winner==-1:
  #try:
    myGame.display()
    
    winner=myGame.test()
    if winner==-1:
      print("""Player {} - turn {}""".format(myGame.player, myGame.turns+1))
      print('Please enter a position')
      in_str=input(' as line,col (or q to quit): ') # raw_input

      i = in_str[0] - 1
      j = in_str[1] - 1

      myGame.play(i,j)
      
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

