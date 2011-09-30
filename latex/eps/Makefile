input=main

all:
	latex $(input).tex
	dvips -E -o $(input).eps $(input).dvi
	#epstool to get _always_ the correct bounding box
	#ftp://mirror.cs.wisc.edu/pub/mirrors/ghost/ghostgum/epstool-3.08.tar.gz
	#epstool --copy --bbox main.eps main.tmp
	#mv main.tmp main.eps
	#psfixbb (Perl)
	#http://www.tug.org/tex-archive/support/psfixbb/


clean:
	$(RM) *.aux *~ *.log *.dvi *.eps