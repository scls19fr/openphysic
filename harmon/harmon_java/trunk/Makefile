FILENAME=harmon

#JAVAC=/usr/lib/sun-j2se5.0-jdk/bin/javac
#JAVA=/usr/lib/sun-j2se5.0-jdk/bin/java


JAVAC=javac
JAVA=java


EDIT=emacs


all:
	$(JAVAC) *.java

	#$(MAKE) run_console

	#$(MAKE) run_applet

	$(MAKE) jar_applet
	$(MAKE) run_applet_jar

	#$(MAKE) run_



run_console:
	$(JAVA) CMain_console

run_applet:
	appletviewer index.html

run_applet_jar:
	appletviewer index_jar.html


#run_...

edit:
	$(EDIT) *.java &

clean:
	$(RM) *.class *.jar

zip:
	$(RM) *.zip
	zip -r $(FILENAME)_java_source_code *

ftp:
	ncftpput -u s.cls ftpperso.free.fr realisations/$(FILENAME) *.jar *.zip

jar_applet:
	cp Manisfest_applet.txt Manifest.txt
	jar cmf Manisfest.txt $(FILENAME)_applet.jar *.class