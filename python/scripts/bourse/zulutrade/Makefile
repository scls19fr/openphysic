PYTHON=python
#PYTHON=python3 # because of euro symbol

all:
	$(MAKE) MyHistory

.PHONY: clean

MyHistory:
	$(PYTHON) ZuluTradeMyHistory.py

MyHistoryCSV:
	$(PYTHON) cleanup.py ZuluTrade-TradeHistory.html out.html
	$(PYTHON) html2csv.py out.html
	#$(PYTHON) ZuluTradeMyHistory.py

History:
	$(PYTHON) ZuluTradeHistory.py
	
clean:
	$(RM) out.txt