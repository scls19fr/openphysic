PYTHON=python
#PYTHON=python3 # because of euro symbol

all:
	$(MAKE) clean
	$(MAKE) History

.PHONY: clean

History:
	$(PYTHON) CurrenseeHistory.py
	
clean:
	$(RM) *.sqlite