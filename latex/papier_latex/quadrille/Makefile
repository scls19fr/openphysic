input=main

all:
	latex main.tex
	dvips main.dvi -o main.ps
	ps2pdf main.ps main.pdf
	#xpdf main.pdf

clean:
	$(RM) *.aux *.log *.dvi *.ps *.pdf *~