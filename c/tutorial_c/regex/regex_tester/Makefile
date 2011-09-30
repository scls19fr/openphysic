input=main

all: 
	gcc $(input).c -o $(input)
	./main '([a-z]+) ([0-9]+) ([a-z]+)' 'mardi 29 janvier'
	./main '([a-z]+) ([0-9]+) ([a-z]+)' 'MaRdI 29 janvier'
