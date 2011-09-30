input=main

dvi_viewer=xdvi
ps_viewer=gv
pdf_viewer=open #acroread #xpdf

all:
	$(MAKE) view-pdf

.PHONY: clean view-ps view-pdf view-pdf-dvips view-pdf-pdflatex view-ps-2 $(input).dvi

$(input).dvi: #$(input).tex
	latex $(input).tex
	latex $(input).tex

$(input).ps: $(input).dvi
	dvips $< -o $@

$(input)_dvips.pdf: $(input).ps
	ps2pdf $< $@

$(input).pdf: $(input)_dvips.pdf
	mv $(input)_dvips.pdf $(input).pdf

#$(input).pdf: $(input).tex
#	pdflatex $(input).tex

view-dvi: $(input).dvi
	$(dvi_viewer) -bg white $< &

view-ps: $(input).ps
	$(ps_viewer) $< &

view-pdf: $(input).pdf
	$(pdf_viewer) $< &

clean:
	$(RM) *.aux *.log *.dvi *.ps *.pdf *~ *.out *.nav *.toc *.snm

transparents:
	# Modifier \documentclass dans le document
	latex $(input).tex
	dvips -P pdf $(input).dvi
	ps2pdf $(input).ps
	pdfnup --nup 4 $(input).pdf --orient landscape --outfile $(input)_suite_4.pdf
	$(pdf_viewer) $(input)_suite_4.pdf &