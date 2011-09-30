CC=gcc
CFLAGS=
LDFLAGS=-lncurses

all:
	$(MAKE) main

main.o: main.c
	$(CC) $< -c $(CFLAGS)

main: main.o
	$(CC) $< -o $@ $(LDFLAGS)

.PHONY: clean

clean:
	$(RM) *.o main