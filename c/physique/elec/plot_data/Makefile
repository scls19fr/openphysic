all: 
	gcc main.c -o main
	./main > main.dat
	cat main.dat
	gnuplot -persist main.gp
	


clean:
	$(RM) *.o *~ main main.dat