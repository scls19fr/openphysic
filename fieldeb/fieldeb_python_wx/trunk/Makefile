FILENAME=fieldeb

all:
	python -d $(FILENAME).py

clean:
	$(RM) *.pyc *.pyo

zip:
	$(RM) *.zip
	zip -r $(FILENAME)_python_source_code.zip *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/fieldeb *.zip screenshots/*

pylint:
	pylint *.py

pychecker:
	pychecker *.py

edit:
	emacs *.py &