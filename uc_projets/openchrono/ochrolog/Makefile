all:
	$(MAKE) compile
	$(MAKE) run
	$(MAKE) plot

compile:
	javac *.java

run:
	java GenData > main.dat

plot:
	gnuplot -persist main.gp
	#gnuplot -persist rpm.gp
	#gnuplot -persist v.gp
	#gnuplot -persist ax.gp
	#gnuplot -persist ay.gp