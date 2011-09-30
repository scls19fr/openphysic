all:
	gnuplot -persist *.gp

png:
	{ echo "set terminal png"; cat main.gp; } | gnuplot > main.png
