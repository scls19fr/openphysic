all:
	$(MAKE) main.pdf

main.pdf: main.tex
	pdflatex $<

.PHONY:clean

clean:
	$(RM) main.aux main.log