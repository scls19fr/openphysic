input=main

all:
	$(MAKE) $(input).pdf
	xpdf $(input).pdf &

$(input).pdf: $(input).tex
	pdflatex $<

.PHONY: clean $(input).pdf

clean:
	$(RM) *.aux *.log *.toc *.mtc* *~ *.pdf semantic.cache