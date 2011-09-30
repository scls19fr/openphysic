all:
	find ../../ -name "*.tex" -exec sed -ri -f main.sed {} \;

search:
	grep -ri '\$\$' *
	#grep -lri '\$\$' *