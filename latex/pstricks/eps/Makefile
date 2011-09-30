input=main

all:
	latex $(input).tex
	dvips -E -o $(input).eps $(input).dvi
	#epstool or psfixbb to get _always_ the correct bounding box
	#ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/ghostgum/epstool-3.08.tar.gz
	epstool --copy --bbox $(input).eps $(input)_tmp.eps
	mv $(input)_tmp.eps $(input).eps
	#psfixbb (Perl)
	#http://www.tug.org/tex-archive/support/psfixbb/
	#psfixbb $(input).eps

clean:
	$(RM) *.aux *~ *.log *.dvi *.eps