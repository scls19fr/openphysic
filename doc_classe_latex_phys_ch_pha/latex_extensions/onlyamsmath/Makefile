# $Id: Makefile,v 1.1.1.1 2006/01/01 14:06:22 scls19fr Exp $

.SUFFIXES: .sty .ins .dtx .dvi .ps


.ins.sty:
	latex $<

.dtx.dvi:
	latex $<
	latex $<
	makeindex -s gind.ist $(*D)/$(*F)
	makeindex -s gglo.ist -o $(*D)/$(*F).gls $(*D)/$(*F).glo
	latex $<

.dvi.ps:
	dvips -o $(*D)/$(*F).ps $(*D)/$(*F)


all: onlyamsmath onlyamsmath.dvi onlyamsmath.ps message 

onlyamsmathtest.dvi:
	latex onlyamsmathtest


onlyamsmath:
	latex onlyamsmath.ins



clean:
	@-rm -f onlyamsmath.{glo,gls,idx,ilg,ind,aux,log,toc}
	@-rm -f onlyamsmathtest.{log,aux}
	@-rm -f *~

distclean: clean
	@-rm -f onlyamsmath.{sty,dvi,ps}
	@-rm -f onlyamsmathtest.{dvi,ps}

tar:	all clean
	echo Lege onlyamsmath.tar.gz an
	-rm -f onlyamsmath.tar.gz
	cd ..; tar czf onlyamsmath.tar.gz \
	  onlyamsmath/README onlyamsmath/Makefile \
	  onlyamsmath/onlyamsmath.{dtx,ins,dvi} \
	  onlyamsmath/onlyamsmathtest.tex \
	  onlyamsmath/onlyamsmath.xml
	mv ../onlyamsmath.tar.gz .


message:
	@echo "Please copy onlyamsmath.sty to a directory"
	@echo "in the LaTeX search path"
	@echo "Then run \`latex onlyamsmathtest' to see an example"


