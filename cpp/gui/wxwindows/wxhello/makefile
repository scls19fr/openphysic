input=wxhello
CC=g++

all:
	$(CC)  -o $(input) `wx-config --libs` `wx-config --cxxflags` -Wall -W -ansi $(input).cpp

clean:
	$(RM) $(input) *~

run:
	./$(input)

