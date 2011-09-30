all:
	$(MAKE) html
	#$(MAKE) pdf

html:
	python index.py
	firefox index.html

pdf:
	python main.py
	#cat main.tex
	pdflatex main.tex
	xpdf main.pdf -fullscreen

php:
	firefox http://127.0.0.1/trombi/index.php

.PHONY: clean

clean:
	$(RM) *.log *~ *.tex *.pdf *.aux *.html
