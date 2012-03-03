vOM virtual Order Management
(c) 2012 -Sebastien Celles
http://www.celles.net/

vOM is an Expert Advisor (EA) for Metaquotes MetaTrader 4 Trading Platform
Expert Advisor VurtualStopManager Conception (Hidden StopLoss and TakeProfit manager)

The purpose of thsi EA is management of trades on trader's side (instead of on broker).

All orders have individual virtual hidden StopLoss and hidden TakeProfit stored as global variables.

If virtual StopLoss or virtual TakeProfit of an order triggered then the expert will close appropriate order by the market.

Virtual Trailing Stop
Virtual Trailing Stop makes it possible to move hidden StopLoss by the market permanently on some fixed distance if the market goes to profit side and reached some profit checkpoint.

Virtual Breakeven
Virtual Breakeven makes it possible to lock StopLoss at some profit level if the market goes to profit side and reached some profit checkpoint.