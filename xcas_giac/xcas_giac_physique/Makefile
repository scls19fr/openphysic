input=main

all:
	$(MAKE) $(input).pdf

$(input).pdf: $(input).tex
	pdflatex $<

.PHONY: clean $(input).pdf

clean:
	$(RM) *.aux *.log 