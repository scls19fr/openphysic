input=main

all:
	$(MAKE) pdf

ps:
	latex $(input).tex
	dvips $(input).dvi -o $(input).ps
	gv $(input).ps --orient=landscape &

pdf:
	latex $(input).tex
	dvips $(input).dvi -o $(input).ps
	ps2pdf $(input).ps $(input).pdf
	xpdf $(input).pdf &

.PHONY: clean

clean:
	$(RM) *.dvi *.ps *.pdf