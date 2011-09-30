input=main
open_pdf=open #xpdf

all:
	latex $(input).tex
	dvips $(input).dvi -o $(input).ps
	ps2pdf $(input).ps $(input).pdf
	$(open_pdf) $(input).pdf

clean:
	$(RM) *~ *.aux *.log *.dvi *.ps *.pdf