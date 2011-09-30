## Process this file with automake to produce Makefile.in -*-Makefile-*-
AUTOMAKE_OPTIONS = foreign 1.2h

CLEANFILES = binary1 binary2 binary3 defaults.ini equipo2.dat field2xy.dat \
fit.log soundfit.par temp.set fontfile.ps fontfile_latex.ps

BINARY_FILES = binary1 binary2 binary3

DEMO = all.dem

GNUPLOT = gnuplot

all: $(BINARY_FILES)

$(BINARY_FILES): ../src/bf_test
	@echo Creating binary data files
	@../src/bf_test

check-local: check-noninteractive

check-interactive: $(BINARY_FILES)
	@if test -z "$(GNUTERM)" ; then \
	  ( bdir=`pwd` ; PATH=$$bdir/../src GNUPLOT_DRIVER_DIR=$$bdir/../src \
	    GNUPLOT_LIB=$(srcdir) $(GNUPLOT) $(DEMO) ); \
	else \
	  ( bdir=`pwd` ; PATH=$$bdir/../src GNUPLOT_DRIVER_DIR=$$bdir/../src \
	    GNUTERM=$(GNUTERM) GNUPLOT_LIB=$(srcdir) $(GNUPLOT) $(DEMO) ); \
	fi

check-noninteractive: $(BINARY_FILES)
	@if test -z "$(GNUTERM)" ; then \
	  ( bdir=`pwd` ; PATH=$$bdir/../src GNUPLOT_DRIVER_DIR=$$bdir/../src \
	    GNUPLOT_LIB=$(srcdir) $(GNUPLOT) $(DEMO) </dev/null ); \
	else \
	  ( bdir=`pwd` ; PATH=$$bdir/../src GNUPLOT_DRIVER_DIR=$$bdir/../src \
	    GNUTERM=$(GNUTERM) GNUPLOT_LIB=$(srcdir) $(GNUPLOT) $(DEMO) </dev/null ); \
	fi

#
# Several of the demos need manual intervention:
#	fontfile vector multiplt
#
html: airfoil.html arrowstyle.html binary.html bivariat.html candlesticks.html contours.html controls.html discrete.html electron.html enhancedtext.html fillcrvs.html fillstyle.html fit.html fontfile.html hidden.html mgr.html multimsh.html multiplt.html param.html pm3dcolors.html pm3d.html pm3dgamma.html polar.html poldat.html prob2.html prob.html random.html scatter.html simple.html singulr.html spline.html steps.html surface1.html surface2.html textcolor.html textrotate.html timedat.html using.html world.html

%.html: %.dem webify.pl
	./webify.pl $*

##m4-files-begin
EXTRA_DIST = Makefile.am.in reread.bor world.cor 1.dat 2.dat 3.dat \
arrowstyle.dat battery.dat big_peak.dat candlesticks.dat clip14in.dat \
glass.dat hemisphr.dat klein.dat lcdemo.dat moli3.dat scatter2.dat \
silver.dat soundvel.dat steps.dat timedat.dat triangle.dat using.dat \
whale.dat world.dat airfoil.dem all.dem animate.dem arrowstyle.dem \
binary.dem bivariat.dem borders.dem candlesticks.dem charset.dem \
contours.dem controls.dem discrete.dem electron.dem enhancedtext.dem \
fillcrvs.dem fillstyle.dem fit.dem fontfile.dem fontfile_latex.dem \
hidden.dem mgr.dem mousevariables.dem multimsh.dem multiplt.dem param.dem \
pm3d.dem pm3dcolors.dem pm3dgamma.dem polar.dem poldat.dem prob.dem \
prob2.dem random.dem scatter.dem simple.dem singulr.dem spline.dem \
steps.dem surface1.dem surface2.dem textcolor.dem textrotate.dem \
timedat.dem using.dem vector.dem world.dem density.fnc hexa.fnc line.fnc \
reflect.fnc stat.inc sound.par sound2.par start.par webify.pl gnuplot.rot 
##m4-files-end

Makefile.am: Makefile.am.in
	rm -f $@ $@t
	sed -n '1,/^##m4-files-begin/p' Makefile.am.in > $@t
	echo EXTRA_DIST = Makefile.am.in *.bor *.cor *.dat *.dem *.fnc *.inc \
	  sound.par sound2.par start.par webify.pl *.rot | fmt | \
	  (tr '\012' @; echo) | sed 's/@$$/%/;s/@/ \\@/g' | tr @% '\012 ' \
	  >> $@t
	sed -n '/^##m4-files-end/,$$p' $< >> $@t
	chmod a-w $@t
	mv $@t $@

