all:
	#$(MAKE) csv
	$(MAKE) mqh

csv:
	python make_clean_csv.py
	head files/Trade_History_out_EURUSD.csv

mqh:
	python make_mql_data.py
	#head include/Trade_History_out_code_EURUSD.mqh


.PHONY: clean

clean:
	$(RM) files/Trade_History_out_*.csv
	$(RM) files/Trade_History_Symbols_List.txt
	$(RM) include/*.mqh
