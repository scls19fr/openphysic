FILENAME=fieldeb

#JAVAC=/usr/lib/sun-j2se5.0-jdk/bin/javac
#JAVA=/usr/lib/sun-j2se5.0-jdk/bin/java

JAVAC=javac
JAVA=java


EDIT=emacs
#EDIT=open


all:
	$(JAVAC) *.java

run:
	$(JAVA) CMain

edit:
	$(EDIT) *.java &

clean:
	$(RM) *.class

zip:
	$(RM) *.zip
	zip -r $(FILENAME)_java_source_code *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/fieldeb *.zip