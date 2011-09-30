input=main

all:
	$(MAKE) dvi

dvi:
	perltex --nosafe $(input).tex
	xdvi $(input).dvi

pdf:
	perltex --latex=pdflatex $(input).tex
	xpdf $(input).pdf

zip:
	$(RM) main.zip
	zip -r main.zip *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/phys_latex/calc_num/calc_num_perltex main.zip

PHONY:	clean

clean:
	$(RM) *.aux *.log *.dvi *.ps *.pdf semantic.cache