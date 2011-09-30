######################################################################
##
##                 Ced's Generic Makefile - X-Foot
##
## Copyright © 2001 - 2007, Cedric Ronvel  
##
## Contact: estariel@x-foot.net
##
## This library is free software; you can redistribute it and#or
## modify it under the terms of the GNU General Public
## License as published by the Free Software Foundation; either
## version 2 of the License, or (at your option) any later version.   
##
## This library is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
## General Public License for more details.
##
## You should have received a copy of the GNU General Public
## License along with this library; if not, write to the Free Software
## Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
##
#######################################################################







#---------------------------------------------------#
#                                                   #
#                Variable makefile                  #
#            Contain project definition             #
#                                                   #
#---------------------------------------------------#







#------------------#
# User directories #
#------------------#



# Exactly one directories per variable like SCRIPT_DIR = script/

ROOT_DIR = ./
XFOOT_ROOT_DIR = ../../
EXTERNALS_DIR = $(XFOOT_ROOT_DIR)externals/
GULL_DIR = $(EXTERNALS_DIR)GuLL/
INSTALL_DIR = $(ROOT_DIR)
AISDK_DIR = $(XFOOT_ROOT_DIR)aisdk/c++/







#-----------------#
# CGM directories #
#-----------------#

CGM_DIR = $(EXTERNALS_DIR)cgm/
BUILD_DIR = $(ROOT_DIR)projects/Make/build/
ADDON_DIR = $(ROOT_DIR)projects/Make/addon/







#---------------------#
# Sources directories #
#---------------------#



# As directories as you need with blank between
# like NON_RECURSIVE_SOURCE_LIST = src/gfx/ src/snd/ src/net/
# or like RECURSIVE_SOURCE_LIST = src/
# or like NON_RECURSIVE_SOURCE_LIST =
NON_RECURSIVE_SOURCE_LIST = $(ROOT_DIR)sources/ 
RECURSIVE_SOURCE_LIST = 

# All the external static libs ( .a ) to include, with blank between
EXT_STATIC_LIB = $(AISDK_DIR)libaisdk.a $(GULL_DIR)libgull.a 

# All the external headers to include, with blank between
EXT_NON_RECURSIVE_HEADER_LIST = $(GULL_DIR)sources/ $(XFOOT_ROOT_DIR)sources/common/ $(XFOOT_ROOT_DIR)sources/client/ 
EXT_RECURSIVE_HEADER_LIST = 







#----------------------------#
# Name of project and target #
#----------------------------#



NAME = X-Foot_Advanced_Example_Team
TARGET = $(ROOT_DIR)advanced_example







#---------------------#
# Compiler and linker #
#---------------------#



CXX = g++
LINKER = g++
DEP_MAKER = g++

ARCH =
CXXFLAGS = -Wno-deprecated `sdl-config --cflags` $(ARCH) -c -o
LINKFLAGS = -o
LIBS = `sdl-config --libs` -lSDL_net
DEP_MAKER_FLAGS = `sdl-config --cflags` -MM







#--------------------------------------#
# Option for the build processing mode #
#--------------------------------------#



# (i.e : standard, user, devel, debug, optimized )
DEFAULT_BUILD_MODE = user

W_ALL = -Wall -Wno-deprecated
W_FEW = -Wno-deprecated
W_NO  = -w
OPTIMIZATION = -O
DEBUG_FLAGS = -g






include $(CGM_DIR)main.makefile
