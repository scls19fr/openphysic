# ---------------------------------------------------------------------------------------------

# License

# Copyright (C) 2001 by Uwe Schmitt, uwe.schmitt@procoders.net

# Permission is hereby granted, free of charge, to any person obtaining a
# copy of this software, to deal in ZiaRC without restriction, including without limitation
# the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of ZiaRC, and to permit persons to whom the
# ZiaRC is furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of ZiaRC.

# The software is provided "as is", without warranty of any kind, express or
# implied, including but not limited to the warranties of merchantability,
# fitness for a particular purpose and noninfringement.  In no event shall
# Uwe Schmitt be liable for any claim, damages or other liability,
# whether in an action of contract, tort or otherwise, arising from, out of
# or in connection with ZiaRC or the use or other dealings in
# ZiaRC.

# ---------------------------------------------------------------------------------------------

# All information about installation at http://ziarc.procoders.net

# run ZiaRC by "python main_ziarc.py"

# ---------------------------------------------------------------------------------------------



##### class UndoQueue(): verwaltete objekte in liste für  ###################
####                     undo/redo operationen            ###################

import copy

class UndoQueue:

    def __init__(self, obj, enableundo=None, enableredo=None, maxlen=20):

	self.list = [obj]
	self.list_old = []

	self.idx = 0 
	self.idx_old = 0

	self.maxlen=maxlen
	self.enableundo=enableundo
	self.enableredo=enableredo

    def InitNew(self, obj):

	self.Push()
	self.list[self.idx]=obj
	# self.list: del self.list
	# self.list = [obj]
	# self.list_old = []
	# self.idx = 0
	# self.idx_old =0
	if self.enableundo: self.enableundo(1)
	if self.enableredo: self.enableredo(0)



    def GetActual(self):

	return self.list[self.idx]

    def IsStart(self):

	return self.idx<=0
      	

    def IsEnd(self):

	return self.idx == len(self.list)-1 

    def Forwards(self):

	if not self.IsEnd(): self.idx +=1

        blnenable=1
	if self.IsEnd(): blnenable=0
	if self.enableredo: self.enableredo(blnenable)
	self.enableundo(1)

	return self.list[self.idx]

    def Backwards(self):

	if not self.IsStart(): self.idx -=1

        blnenable=1
	if self.IsStart(): blnenable=0
	if self.enableundo: self.enableundo(blnenable)
	self.enableredo(1)

	return self.list[self.idx]


    def UndoPush(self):

	self.list = self.list_old
	self.idx  = self.idx_old

	return self.GetActual()


    def Push(self):

	
	self.list_old = self.list[:]
	self.idx_old = self.idx

	obj = self.list[self.idx]

	if self.idx == self.maxlen-1:

	    self.list = self.list[1:] + [copy.deepcopy(obj)]

	else:

	    self.idx+=1
	    self.list = self.list[:self.idx] + [copy.deepcopy(obj)]

	if self.enableredo: self.enableredo(0)
	if self.enableundo: self.enableundo(1)

	return self.list[self.idx]


