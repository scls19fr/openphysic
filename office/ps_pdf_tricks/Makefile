# make input=...

input=main
N=2

all:
	$(MAKE) suite_ps
	$(MAKE) idem_ps
	$(MAKE) miroir_ps
	#$(MAKE) suite_pdf

pdftops:
	pdftops $(input).pdf

suite_ps:
	#Impression de N pages différentes par feuille
	psnup -n $(N) $(input).ps > $(input)_suite_$(N).ps

idem_ps:
	#Impression de N=2 pages identiques
	psselect -p1,1 $(input).ps | psnup -n 2 > $(input)_idem_2.ps

suite_pdf:
	#Impression de N pages différentes par feuille
	pdfnup --nup $(N) $(input).pdf --orient landscape --outfile $(input)_suite_$(N).pdf

idem_pdf:
	# TO DO

miroir_ps:
	#convert -flip $(input).ps $(input)_miroir.ps
	convert -flop $(input).ps $(input)_miroir.ps

miroir_pdf:
	# TO DO

livret_ps:
	psbook $(input).ps | psnup -2 -pa4 > $(input)_book.ps

livret_pdf:
	# TO_DO

.PHONY: clean

clean:
	$(RM) $(input)_suite_*.ps
	$(RM) $(input)_suite_*.pdf
	$(RM) $(input)_idem_*.ps
	$(RM) $(input)_idem_*.pdf
	$(RM) $(input)_miroir.ps
	$(RM) $(input)_miroir.pdf
	$(RM) $(input)_livret.ps
	$(RM) $(input)_livret.pdf

zip:
	$(MAKE) clean_zip
	$(MAKE) zip_all

zip_all:
	zip -r ps_pdf_tricks.zip *

clean_zip:
	-$(RM) *.zip
	-$(RM) $(FILENAME)_cpp.zip

ftp:
	ncftpput -u s.cls ftpperso.free.fr soft/office/ps_pdf *.zip
