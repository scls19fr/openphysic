all:
	flex main.l
	gcc lex.yy.c -lfl -ansi -pedantic -Wall
	./a.out < test.txt
