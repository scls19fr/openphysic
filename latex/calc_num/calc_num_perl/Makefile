input=main

all:
	perl $(input).pl
	latex $(input).tex
	xdvi $(input).dvi

.PHONY: clean

clean:
	$(RM) $(input).tex *~ semantic.cache *.aux *.log *.dvi