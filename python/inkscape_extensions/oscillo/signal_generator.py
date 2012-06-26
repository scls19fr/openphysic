#!/usr/bin/env python

'''
Copyright 2012 Sebastien Celles <s.celles@gmail.com>

This file is part of Oscillo Extension for Inkscape.

Oscillo Extension for Inkscape is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

Oscillo Extension for Inkscape is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with Oscillo Extension for Inkscape. If not, see http://www.gnu.org/licenses/.
'''

from pylab import *

class CSignalGenerator:
	"""
	Classe simulant un GBF
	"""
	def __init__(self):
		"""
		Constructeur
		"""
		
		self.mode = 'sin'
		self.frequency = 1000.0 # Hz
		self.offset = 0.1 # V
		self.amplitude = 1.0 # V
		self.phase = 0.0 # deg
		self.dutycycle = 100 # %
		
		self.Nt = 1000 #2**8 # nb de points (echantillonnage)
		self.Ny = 2**8 # nb de points (quantification)

		self.t = arange(0, self.getPeriod(), self.getPeriod()/self.Nt)
		
		self.out = self.amplitude*sin(2*pi*self.t+self.phase*pi/180)+self.offset
		
		pass
		
	#def setMode(self, mode):
	#	pass
		# calcul sur une periode

	def getOutputModeDC(self, t):
		return(self.offset)
	
	def getOutputModeSin(self, t):
		return(self.amplitude*sin(2*pi*self.t+self.phase*pi/180)+self.offset)
	
	def calculate():
		pass

	def display(self):
		for attr in dir(self):
			print("siggen.%s = %s" % (attr, getattr(self, attr)))
		print(self.getPeriod())
		#t = arange(0, self.getPeriod()/self.N, self.getPeriod())
		print(len(self.t))
		print(self.t[self.Nt-1])

	def getSignal(self, t):
		if self.mode=='sin':
			#return(self.offset)
			return(t/t-1+self.offset)
			return(self.amplitude*sin(2*pi*t)+self.offset)
	
	def getPeriod(self):
		return(1/self.frequency)
