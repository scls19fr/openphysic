input=main

all:
	#$(MAKE) dvi
	$(MAKE) ps
	#$(MAKE) pdf
	#$(MAKE) pdf2pages
	#$(MAKE) ps2pages


dvi:
	latex $(input).tex
	xdvi $(input).dvi

ps:
	latex $(input).tex
	dvips $(input).dvi -o $(input).dvi
	gv $(input).ps

pdf:
	#dvips $(input) # ne fonctionne pas avec PSTricks
	ps2pdf $(input).ps $(input).pdf
	#pdflatex $(input).tex
	xpdf $(input).pdf

pdf2pages:
	ps2pdf main.ps main.pdf
	#pdflatex $(input).tex
	pdfnup --nup 2 $(input).pdf --orient landscape --outfile $(input)_suite_2.pdf
	xpdf $(input)_suite_2.pdf

ps2pages:
	latex $(input).tex
	dvips $(input)
	psnup -n 2 $(input).ps > $(input)_suite_2.ps
	gv $(input)_suite_2.ps


zip:
	$(RM) $(input).zip
	zip -r $(input).zip *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/phys_latex/oscillogrammes $(input).zip

clean:
	$(RM) *.pdf *.ps *~ semantic.cache* *.dvi *.aux *.log

