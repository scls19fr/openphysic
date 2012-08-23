all:
	$(MAKE) history
	$(MAKE) openclose

history:
	python make_history_data.py
	#head include/Trade_History_out_code_EURUSD.mqh

openclose:
	python make_openclose_data.py

.PHONY: clean

clean:
	$(RM) files/Trade_History_out_*.csv
	$(RM) files/Trade_History_Symbols_List.txt
	$(RM) include/*.mqh
	$(RM) include/*.mql
	$(RM) files/Trade_History_out__Symbols_List.txt

