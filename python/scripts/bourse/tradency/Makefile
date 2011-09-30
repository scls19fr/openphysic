PYTHON = python
#PYTHON = python2.7
#PYTHON = python3

all:
	$(MAKE) perf > Out_Performance.txt
	less Out_Performance.txt
	
perf:
	$(PYTHON) TradencyPerformance.py
	
myhist:
	$(PYTHON) TradencyMyHistory.py

hist:
	$(PYTHON) TradencyHistory.py


.PHONY: clean

clean:
	$(RM) Out_*.txt