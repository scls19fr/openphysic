all:
	$(MAKE) html

dvi:
	latex main.tex
	latex main.tex
	bibtex main
	latex main.tex
	xdvi main.dvi &

.PHONY: clean dvi html bib2html bibtex2html

clean:
	$(RM) *~ *.aux *.blg *.bbl *.log *.dvi

html:
	$(MAKE) bib2html

bib2html:
	# http://www.arakhne.org/IMG/deb/bib2html_4.3-1_all.deb (Perl)
	bib2html --svn --g Domain -f s-celles.bib
	firefox bib2html/index.html &

bibtex2html:
	# http://www.lri.fr/~filliatr/bibtex2html/index.en.html (OCalm)
	bibtex2html s-celles.bib
	firefox s-celles.html &

#noisbn:
#	perl -ne 'print unless /^\s*ISBN\s*=\s*[{][\d-]+[}],?\s*$/i' < s-celles-2.bib > s-celles.bib

svn:
	svn commit

ftp:
	#ncftpput (ncftp)
	ncftpput -u celles ftp.celles.net www/bib/bib2html bib2html/*

send:
	$(MAKE) svn
	$(MAKE) ftp