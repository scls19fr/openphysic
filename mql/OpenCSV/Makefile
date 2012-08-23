all:
	#$(MAKE) csv
	$(MAKE) mqh
	$(MAKE) openclose

csv:
	python make_clean_csv.py
	head files/Trade_History_out_EURUSD.csv

mqh:
	python make_mql_data.py
	#head include/Trade_History_out_code_EURUSD.mqh

openclose:
	python make_open_close.py

.PHONY: clean

clean:
	$(RM) files/Trade_History_out_*.csv
	$(RM) files/Trade_History_Symbols_List.txt
	$(RM) include/*.mqh
	$(RM) include/*.mql

