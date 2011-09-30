CC=gcc
CFLAGS=-pedantic -ansi -Wall

OBJECTS=main.o affichage.o


main: $(OBJECTS)
	$(CC) $(CFLAGS) $(OBJECTS) -o main

affichage.o: affichage.c affichage.h
	$(CC) $(CFLAGS) affichage.c -c

main.o: main.c affichage.h
	$(CC) $(CFLAGS) main.c -c


all:
	$(CC) -o main main.c affichage.c

.PHONY: clean

clean:
	$(RM) *.o main