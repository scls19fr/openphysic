all:
	lex main.lex
	yacc -d main.yac
	gcc lex.yy.c y.tab.c -lfl -o main
	./main