a.out:	lexer.o parser.o ex.o ex.h tryparse.cc
	g++ -g lexer.o parser.o ex.o tryparse.cc
dist:	lexer.ll lexer.h parser.y ex.cc ex.h Makefile tryparse.cc
	tar cvfz parsesymb.tgz lexer.ll lexer.h parser.y ex.cc ex.h Makefile tryparse.cc
parser.h:	parser.y
	bison -y -d parser.y
	mv -f y.tab.c parser.cc
	mv -f y.tab.h parser.h 
parser.o:	parser.y
	bison -y -d parser.y
	mv -f y.tab.c parser.cc
	mv -f y.tab.h parser.h 
	g++ -g -c parser.cc
lexer.o:	lexer.ll parser.h
	flex -olexer.cc lexer.ll
	g++ -g -c lexer.cc
ex.o:	ex.cc ex.h
	g++ -g -c ex.cc
clean:
	rm -f lexer.o parser.o ex.o a.out lexer.cc parser.cc parser.h