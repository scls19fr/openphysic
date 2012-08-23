Input:
	Trade_History_Full.csv
		Full trade history from signal provider or expert advisor

Python script make_history_data.py
	Generate CSV files and MQL code with trade history for each symbol with only useful columns
	Data are sorted with DateOpen ascending (that's necessary for the EA)
	Input: Trade_History_Full.csv
	Outputs:
		Trade_History_out_History_SYMBOL.csv : filter by Symbol, sorted DateOpen ascending
		Trade_History_out__Symbols_List.txt : list of symbols
		Trade_History_out_History_all_symbols : only useful columns but sorted DateOpen ascending
	
MQL4 script scripts/OpenCSV.mq4
    Test to see if I'm able to read the CSV file (and that it's sorted correctly)

MQL4 Expert Advisor 
    ToDo
	
Python script make_openclose_data.py
	Generate CSV files and MQL code with trade actions (OPEN, CLOSE)
	(sequential)
	
	
ToDo:
put a PseudoTicket0 variable (instead of PseudoTicket) in files/Trade_History_out_OpenClose_EURUSD.csv
(from 0 to size-1)