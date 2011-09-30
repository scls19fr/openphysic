input=main

all:
	#$(MAKE) view-pdf
	$(MAKE) view-ps

.PHONY: main.dvi clean view-ps view-pdf view-pdf-dvips view-pdf-pdflatex edit view-ps-2

$(input).dvi: #$(input).tex s-celles.sty elec_intro/main2.tex elec_sin/main2.tex
	latex $(input).tex

$(input).ps: $(input).dvi
	dvips $< -o $@

$(input)_dvips.pdf: $(input).ps
	ps2pdf $< $@
	cp $(input)_dvips.pdf $(input).pdf

view-ps: $(input).ps
	gv $< &

view-pdf:
	$(MAKE) view-pdf-dvips

view-pdf-dvips: $(input)_dvips.pdf
	xpdf $< &

view-pdf-pdflatex: $(input)_pdflatex.pdf
	xpdf $< &


clean:
	$(RM) *.aux *.log *.dvi *.ps *.pdf

edit:
	emacs *.tex Makefile *.sty &


$(input)_suite_2.ps: $(input).ps
	psnup -n 2 $< > $@

view-ps-2: $(input)_suite_2.ps
	gv $< &


$(input)_dvips_suite_2.pdf: $(input)_dvips.pdf
	pdfnup --nup 2 $< --orient landscape --outfile $@

view-pdf-dvips-2: $(input)_dvips_suite_2.pdf
	xpdf $< &

$(input)_pdflatex_suite_2.pdf: $(input)_pdflatex.pdf
	pdfnup --nup 2 $< --orient landscape --outfile $@

view-pdf-2:
	$(MAKE) view-pdf-dvips-2

view-pdf-pdflatex-2: $(input)_dvips_pdflatex_2.pdf
	xpdf $< &

zip:
	$(RM) $(input).zip
	zip -r $(input).zip *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/phys_latex $(input).zip *.ps *.pdf Makefile

get:
	rm -r $(input).zip
	wget http://s.cls.free.fr/realisations/phys_latex/$(input).zip
	unzip $(input).zip