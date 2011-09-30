FILENAME=main

CC=gcc

SOURCES := $(wildcard *.c)
HEADERS := $(wildcard *.h)
OBJECTS := $(patsubst %.c,%.o,$(wildcard *.c))

all: $(FILENAME)

$(FILENAME) : $(OBJECTS)
	$(CC) $(OBJECTS) -o $(FILENAME)

%.o : %.c %.h
#	$(CC) -c $<

.PHONY: clean

clean:
	$(RM) *.o $(FILENAME)

full:
	gcc -o main *.c -Wall -pedantic
	./main

#-ansi
