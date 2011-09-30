input=main_in
output=main_out

all:
	$(MAKE) dynamic
	#$(MAKE) static

.PHONY: clean static dynamic zip ftp

dynamic:
	php $(input).tex > $(output).tex
	latex $(output).tex
	xdvi $(output).dvi

static:
	latex $(input).tex
	xdvi $(input).dvi	

clean:
	$(RM) $(output).*
	$(RM) $(input).aux
	$(RM) $(input).log
	$(RM) $(input).dvi

zip:
	$(RM) main.zip
	zip -r main.zip *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/phys_latex/calc_num/calc_num_php main.zip