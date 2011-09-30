input=main

all:
	latex $(input).tex
	dvips -o $(input).ps $(input).dvi
	gv $(input).ps

clean:
	$(RM) *.aux *~ *.log *.dvi *.ps