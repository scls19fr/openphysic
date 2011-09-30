all:
	flex main.l
	bison -d --verbose main.y
	gcc main.c lex.yy.c main.tab.c -lfl -o main 
	./main

#lexyacc:
#	lex main.l
#	yacc -d main.y
#	gcc y.tab.c -lfl -o main -ansi -pedantic -Wall
#	./main
