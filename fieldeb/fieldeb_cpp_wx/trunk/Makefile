#SHELL = /bin/sh

#LC = LC_ALL=posix 
CXX = $(LC)g++

GUIFLAGS = `wx-config --cxxflags`
GUILIBS = `wx-config --libs`

OPTIMIZE = -O2
# -O2 : optimization level 2

DEBUG = -ansi -g -pg
# -g : debug (gdb, ddd, ...) -g1 ... -g3 (debug level)
# -p : prof
# -pg : gprof (profiler)
# -ansi
# -pedantic (ne pas utiliser avec wx2.5)

WARNINGS = -W -Wall
# -W (pas necessire)
# -Wall
# -Wno-unused (pas de warning pour les variables non utilisees)

CXXFLAGS = $(GUIFLAGS) $(WARNINGS) $(DEBUG)
#CXXFLAGS = $(GUIFLAGS) $(OPTIMIZE)

CXXLIBS = $(GUILIBS)

FILENAME = fieldeb
INSTALL_DIR = /usr/bin

SOURCES := $(wildcard *.cpp)
HEADERS := $(wildcard *.hpp)
OBJECTS := $(patsubst %.cpp,%.o,$(wildcard *.cpp))

CP = cp -f
ZIP = zip

EDITOR = emacs

#TIME := date +%Y-%m-%d-%H%M

$(FILENAME) : $(OBJECTS)
	$(CXX) $(CXXFLAGS) $(CXXLIBS) $(OBJECTS) -o $@


%.o : %.cpp %.hpp
	$(CXX) $(CXXFLAGS) -c $<
#	$(CXX) $(CXXFLAGS) -c $< -o $@


all:
	$(CXX) $(CXXFLAGS) $(CXXLIBS) *.cpp -o $(FILENAME)


.PHONY: start clean clean_obj clean_prog clean_tags install uninstall zip zip_all zip_exe doc doc_new doc_latex clean_doc debug debug_gdb debug_ddd profiler profiler_mem profiler_gprof tags etags ctags edit ftp



start:
	./$(FILENAME)
clean :
	$(MAKE) clean_obj
	$(MAKE) clean_prog
	-$(RM) core*
	-$(RM) gmon.out
	$(MAKE) clean_tags

clean_obj :
	-$(RM) $(OBJECTS)
clean_prog :
	-$(RM) $(FILENAME)

clean_tags:
	-$(RM) tags
	-$(RM) TAGS
	-$(RM) semantic.cache
	-$(RM) semantic.cache~

install :
	-$(CP) $(FILENAME) $(INSTALL_DIR)

uninstall :
	-$(RM) $(INSTALL_DIR)/$(FILENAME)

zip:
	$(MAKE) clean_zip
	$(MAKE) zip_all

#	$(MAKE) zip_exe

zip_all:
	$(ZIP) -r $(FILENAME)_cpp_source_code.zip *
	#$(ZIP) -r $(FILENAME)_cpp_source_code_$(TIME).zip *
#zip_exe:
#	$(ZIP) $(FILENAME)_cpp.zip $(FILENAME)

clean_zip:
	-$(RM) *.zip
	#-$(RM) $(FILENAME)_cpp.zip



fr_FR.po : $(SOURCES)
	xgettext $^ -a -o $@

fr_FR.mo : fr_FR.po
	msgfmt $< -o $@

clean_i18n :
	$(RM) *.mo *.po *.pot



doc_new:
	# Create a "Doxyfile" file
	doxygen -g

doc:
	doxygen Doxyfile

clean_doc:
	#$(RM) Doxyfile
	$(RM) html -r
	$(RM) latex -r

#doc_latex:
	#cd latex
	#latex/$(MAKE)


debug:
	$(MAKE) debug_ddd

debug_gdb:
	# g++ -g option is needed to debug with gdb
	gdb $(FILENAME)

debug_ddd:
	# g++ -g option is needed to debug with ddd
	ddd $(FILENAME)


profiler:
	$(MAKE) profiler_gprof

profiler_gprof:
	# g++ -pg option is needed to make a gmon.out file
	gprof $(FILENAME)

profiler_mem:
	# memprof
	memprof $(FILENAME)



tags:
	$(MAKE) etags

etags:
	etags --language=c++ *.cpp *.hpp

ctags:
	ctags *.cpp *.hpp


edit:
	#$(EDITOR) *.cpp *.hpp &
	$(EDITOR) $(SOURCES) $(HEADERS) &

help:
	devhelp &

ftp:
	#ncftpput (ncftp)
	ncftpput -u s.cls ftpperso.free.fr realisations/fieldeb fieldeb_cpp_source_code.zip

# see also ssh (scp)
