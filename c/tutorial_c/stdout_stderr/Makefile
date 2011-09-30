all:
	gcc main.c -o main -pedantic -ansi -Wall

run:
	./main > sortie 2> sortie_erreur

clean:
	$(RM) main sortie sortie_erreur

display:
	cat sortie
	cat sortie_erreur