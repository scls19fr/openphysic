all:
	lex main.l
	yacc -d main.y
	gcc y.tab.c -lfl -o main -ansi -pedantic -Wall
	./main