all:
	lex main.lex
	gcc lex.yy.c -lfl -o main -ansi -pedantic -Wall
	./main < file.txt
