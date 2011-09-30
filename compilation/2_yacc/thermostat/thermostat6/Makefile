CC=gcc
LEX=flex
YACC=bison

all:	main
	./main

main:	main.o lex.yy.o main.tab.o
	$(CC) $? -o $@

main.o:	main.c main.h main.tab.h

lex.yy.o:	lex.yy.c main.tab.h
	$(CC) -c $<

main.tab.o:	main.tab.c main.tab.h
	$(CC) -c $<

lex.yy.c:	main.l
	$(LEX) $<

main.tab.h:	main.y
	$(YACC) -d --verbose $<

main.tab.c:	main.tab.h


flexbison:
	flex main.l
	bison -d --verbose main.y
	gcc main.c lex.yy.c main.tab.c -lfl -o main 
	./main

#lexyacc:
#	lex main.l
#	yacc -d main.y
#	gcc y.tab.c -lfl -o main -ansi -pedantic -Wall
#	./main

.PHONY:	clean

clean:
	$(RM) main *.o main.tab.h main.tab.c lex.yy.c main.output