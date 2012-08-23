//+------------------------------------------------------------------+
//|include/Trade_History_out_OpenClose__all_symbols.mqh
//|                                 Copyright (c) 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

int NbOrdersInFile = 1682;

int aPseudoTicket[1682];
int aAction[1682]; // 1=OPEN 0=CLOSE
int aType[1682];  // OP_BUY or OP_SELL
string aSymbol[1682];
double aLots[1682];
datetime aDate[1682];
double aPrice[1682];

int aReturn[1682];

int time_offset = 3;

void init_tab() {

   // ========== 0 ===== 840 ==========
   aPseudoTicket[0] = 1;
   aAction[0] = 1; // OPEN
   aReturn[1] = 0;
   aType[0] = OP_BUY; // BUY
   aTicket[0] = -1; // Ticket given by broker
   aSymbol[0] = "USDCAD";
   aLots[0] = 1.0;
   aDate[0] = D'2011.05.16 07:02:20'+time_offset*3600;
   aPrice[0] = 0.96882;

   // ========== 1 ===== 840 ==========
   aPseudoTicket[1] = 1;
   aAction[1] = 0; // CLOSE
   aType[1] = OP_BUY; // BUY
   aTicket[1] = -1; // Ticket given by broker
   aSymbol[1] = "USDCAD";
   aLots[1] = 1.0;
   aDate[1] = D'2011.05.16 10:00:22'+time_offset*3600;
   aPrice[1] = 0.97431;

   // ========== 2 ===== 838 ==========
   aPseudoTicket[2] = 2;
   aAction[2] = 1; // OPEN
   aReturn[2] = 2;
   aType[2] = OP_BUY; // BUY
   aTicket[2] = -1; // Ticket given by broker
   aSymbol[2] = "USDCAD";
   aLots[2] = 0.5;
   aDate[2] = D'2011.05.18 23:49:14'+time_offset*3600;
   aPrice[2] = 0.96953;

   // ========== 3 ===== 839 ==========
   aPseudoTicket[3] = 3;
   aAction[3] = 1; // OPEN
   aReturn[3] = 3;
   aType[3] = OP_SELL; // SELL
   aTicket[3] = -1; // Ticket given by broker
   aSymbol[3] = "GBPUSD";
   aLots[3] = 0.5;
   aDate[3] = D'2011.05.19 02:11:40'+time_offset*3600;
   aPrice[3] = 1.618;

   // ========== 4 ===== 839 ==========
   aPseudoTicket[4] = 3;
   aAction[4] = 0; // CLOSE
   aType[4] = OP_SELL; // SELL
   aTicket[4] = -1; // Ticket given by broker
   aSymbol[4] = "GBPUSD";
   aLots[4] = 0.5;
   aDate[4] = D'2011.05.19 19:45:50'+time_offset*3600;
   aPrice[4] = 1.623;

   // ========== 5 ===== 838 ==========
   aPseudoTicket[5] = 2;
   aAction[5] = 0; // CLOSE
   aType[5] = OP_BUY; // BUY
   aTicket[5] = -1; // Ticket given by broker
   aSymbol[5] = "USDCAD";
   aLots[5] = 0.5;
   aDate[5] = D'2011.05.23 08:33:42'+time_offset*3600;
   aPrice[5] = 0.97854;

   // ========== 6 ===== 836 ==========
   aPseudoTicket[6] = 4;
   aAction[6] = 1; // OPEN
   aReturn[4] = 6;
   aType[6] = OP_SELL; // SELL
   aTicket[6] = -1; // Ticket given by broker
   aSymbol[6] = "EURUSD";
   aLots[6] = 1.0;
   aDate[6] = D'2011.05.24 05:24:00'+time_offset*3600;
   aPrice[6] = 1.40736;

   // ========== 7 ===== 837 ==========
   aPseudoTicket[7] = 5;
   aAction[7] = 1; // OPEN
   aReturn[5] = 7;
   aType[7] = OP_BUY; // BUY
   aTicket[7] = -1; // Ticket given by broker
   aSymbol[7] = "USDCAD";
   aLots[7] = 1.0;
   aDate[7] = D'2011.05.24 09:41:03'+time_offset*3600;
   aPrice[7] = 0.97642;

   // ========== 8 ===== 837 ==========
   aPseudoTicket[8] = 5;
   aAction[8] = 0; // CLOSE
   aType[8] = OP_BUY; // BUY
   aTicket[8] = -1; // Ticket given by broker
   aSymbol[8] = "USDCAD";
   aLots[8] = 1.0;
   aDate[8] = D'2011.05.25 06:15:07'+time_offset*3600;
   aPrice[8] = 0.98144;

   // ========== 9 ===== 836 ==========
   aPseudoTicket[9] = 4;
   aAction[9] = 0; // CLOSE
   aType[9] = OP_SELL; // SELL
   aTicket[9] = -1; // Ticket given by broker
   aSymbol[9] = "EURUSD";
   aLots[9] = 1.0;
   aDate[9] = D'2011.05.25 06:30:32'+time_offset*3600;
   aPrice[9] = 1.40444;

   // ========== 10 ===== 835 ==========
   aPseudoTicket[10] = 6;
   aAction[10] = 1; // OPEN
   aReturn[6] = 10;
   aType[10] = OP_BUY; // BUY
   aTicket[10] = -1; // Ticket given by broker
   aSymbol[10] = "USDCHF";
   aLots[10] = 1.0;
   aDate[10] = D'2011.05.25 10:05:54'+time_offset*3600;
   aPrice[10] = 0.87688;

   // ========== 11 ===== 834 ==========
   aPseudoTicket[11] = 7;
   aAction[11] = 1; // OPEN
   aReturn[7] = 11;
   aType[11] = OP_BUY; // BUY
   aTicket[11] = -1; // Ticket given by broker
   aSymbol[11] = "USDCAD";
   aLots[11] = 1.0;
   aDate[11] = D'2011.05.26 02:39:00'+time_offset*3600;
   aPrice[11] = 0.9765;

   // ========== 12 ===== 835 ==========
   aPseudoTicket[12] = 6;
   aAction[12] = 0; // CLOSE
   aType[12] = OP_BUY; // BUY
   aTicket[12] = -1; // Ticket given by broker
   aSymbol[12] = "USDCHF";
   aLots[12] = 1.0;
   aDate[12] = D'2011.05.26 12:47:35'+time_offset*3600;
   aPrice[12] = 0.86718;

   // ========== 13 ===== 834 ==========
   aPseudoTicket[13] = 7;
   aAction[13] = 0; // CLOSE
   aType[13] = OP_BUY; // BUY
   aTicket[13] = -1; // Ticket given by broker
   aSymbol[13] = "USDCAD";
   aLots[13] = 1.0;
   aDate[13] = D'2011.05.26 23:04:30'+time_offset*3600;
   aPrice[13] = 0.97911;

   // ========== 14 ===== 833 ==========
   aPseudoTicket[14] = 8;
   aAction[14] = 1; // OPEN
   aReturn[8] = 14;
   aType[14] = OP_BUY; // BUY
   aTicket[14] = -1; // Ticket given by broker
   aSymbol[14] = "GBPUSD";
   aLots[14] = 1.0;
   aDate[14] = D'2011.06.01 16:30:02'+time_offset*3600;
   aPrice[14] = 1.636;

   // ========== 15 ===== 833 ==========
   aPseudoTicket[15] = 8;
   aAction[15] = 0; // CLOSE
   aType[15] = OP_BUY; // BUY
   aTicket[15] = -1; // Ticket given by broker
   aSymbol[15] = "GBPUSD";
   aLots[15] = 1.0;
   aDate[15] = D'2011.06.03 00:48:48'+time_offset*3600;
   aPrice[15] = 1.63707;

   // ========== 16 ===== 832 ==========
   aPseudoTicket[16] = 9;
   aAction[16] = 1; // OPEN
   aReturn[9] = 16;
   aType[16] = OP_SELL; // SELL
   aTicket[16] = -1; // Ticket given by broker
   aSymbol[16] = "USDCHF";
   aLots[16] = 1.0;
   aDate[16] = D'2011.06.03 04:35:02'+time_offset*3600;
   aPrice[16] = 0.84414;

   // ========== 17 ===== 832 ==========
   aPseudoTicket[17] = 9;
   aAction[17] = 0; // CLOSE
   aType[17] = OP_SELL; // SELL
   aTicket[17] = -1; // Ticket given by broker
   aSymbol[17] = "USDCHF";
   aLots[17] = 1.0;
   aDate[17] = D'2011.06.03 10:09:29'+time_offset*3600;
   aPrice[17] = 0.84103;

   // ========== 18 ===== 831 ==========
   aPseudoTicket[18] = 10;
   aAction[18] = 1; // OPEN
   aReturn[10] = 18;
   aType[18] = OP_SELL; // SELL
   aTicket[18] = -1; // Ticket given by broker
   aSymbol[18] = "EURUSD";
   aLots[18] = 1.0;
   aDate[18] = D'2011.06.09 12:48:24'+time_offset*3600;
   aPrice[18] = 1.45446;

   // ========== 19 ===== 831 ==========
   aPseudoTicket[19] = 10;
   aAction[19] = 0; // CLOSE
   aType[19] = OP_SELL; // SELL
   aTicket[19] = -1; // Ticket given by broker
   aSymbol[19] = "EURUSD";
   aLots[19] = 1.0;
   aDate[19] = D'2011.06.09 13:19:05'+time_offset*3600;
   aPrice[19] = 1.45;

   // ========== 20 ===== 830 ==========
   aPseudoTicket[20] = 11;
   aAction[20] = 1; // OPEN
   aReturn[11] = 20;
   aType[20] = OP_SELL; // SELL
   aTicket[20] = -1; // Ticket given by broker
   aSymbol[20] = "EURUSD";
   aLots[20] = 1.0;
   aDate[20] = D'2011.06.10 01:05:56'+time_offset*3600;
   aPrice[20] = 1.45337;

   // ========== 21 ===== 830 ==========
   aPseudoTicket[21] = 11;
   aAction[21] = 0; // CLOSE
   aType[21] = OP_SELL; // SELL
   aTicket[21] = -1; // Ticket given by broker
   aSymbol[21] = "EURUSD";
   aLots[21] = 1.0;
   aDate[21] = D'2011.06.10 05:04:16'+time_offset*3600;
   aPrice[21] = 1.44906;

   // ========== 22 ===== 829 ==========
   aPseudoTicket[22] = 12;
   aAction[22] = 1; // OPEN
   aReturn[12] = 22;
   aType[22] = OP_SELL; // SELL
   aTicket[22] = -1; // Ticket given by broker
   aSymbol[22] = "GBPUSD";
   aLots[22] = 1.0;
   aDate[22] = D'2011.06.10 11:16:09'+time_offset*3600;
   aPrice[22] = 1.63052;

   // ========== 23 ===== 829 ==========
   aPseudoTicket[23] = 12;
   aAction[23] = 0; // CLOSE
   aType[23] = OP_SELL; // SELL
   aTicket[23] = -1; // Ticket given by broker
   aSymbol[23] = "GBPUSD";
   aLots[23] = 1.0;
   aDate[23] = D'2011.06.10 13:24:47'+time_offset*3600;
   aPrice[23] = 1.62631;

   // ========== 24 ===== 828 ==========
   aPseudoTicket[24] = 13;
   aAction[24] = 1; // OPEN
   aReturn[13] = 24;
   aType[24] = OP_SELL; // SELL
   aTicket[24] = -1; // Ticket given by broker
   aSymbol[24] = "GBPUSD";
   aLots[24] = 1.0;
   aDate[24] = D'2011.06.13 12:56:01'+time_offset*3600;
   aPrice[24] = 1.63242;

   // ========== 25 ===== 828 ==========
   aPseudoTicket[25] = 13;
   aAction[25] = 0; // CLOSE
   aType[25] = OP_SELL; // SELL
   aTicket[25] = -1; // Ticket given by broker
   aSymbol[25] = "GBPUSD";
   aLots[25] = 1.0;
   aDate[25] = D'2011.06.13 19:42:58'+time_offset*3600;
   aPrice[25] = 1.63785;

   // ========== 26 ===== 827 ==========
   aPseudoTicket[26] = 14;
   aAction[26] = 1; // OPEN
   aReturn[14] = 26;
   aType[26] = OP_SELL; // SELL
   aTicket[26] = -1; // Ticket given by broker
   aSymbol[26] = "GBPUSD";
   aLots[26] = 1.0;
   aDate[26] = D'2011.06.14 03:56:26'+time_offset*3600;
   aPrice[26] = 1.64078;

   // ========== 27 ===== 826 ==========
   aPseudoTicket[27] = 15;
   aAction[27] = 1; // OPEN
   aReturn[15] = 27;
   aType[27] = OP_SELL; // SELL
   aTicket[27] = -1; // Ticket given by broker
   aSymbol[27] = "EURUSD";
   aLots[27] = 1.0;
   aDate[27] = D'2011.06.14 05:50:57'+time_offset*3600;
   aPrice[27] = 1.44354;

   // ========== 28 ===== 827 ==========
   aPseudoTicket[28] = 14;
   aAction[28] = 0; // CLOSE
   aType[28] = OP_SELL; // SELL
   aTicket[28] = -1; // Ticket given by broker
   aSymbol[28] = "GBPUSD";
   aLots[28] = 1.0;
   aDate[28] = D'2011.06.14 15:59:42'+time_offset*3600;
   aPrice[28] = 1.63877;

   // ========== 29 ===== 826 ==========
   aPseudoTicket[29] = 15;
   aAction[29] = 0; // CLOSE
   aType[29] = OP_SELL; // SELL
   aTicket[29] = -1; // Ticket given by broker
   aSymbol[29] = "EURUSD";
   aLots[29] = 1.0;
   aDate[29] = D'2011.06.15 01:46:22'+time_offset*3600;
   aPrice[29] = 1.44148;

   // ========== 30 ===== 825 ==========
   aPseudoTicket[30] = 16;
   aAction[30] = 1; // OPEN
   aReturn[16] = 30;
   aType[30] = OP_SELL; // SELL
   aTicket[30] = -1; // Ticket given by broker
   aSymbol[30] = "EURUSD";
   aLots[30] = 1.0;
   aDate[30] = D'2011.06.16 22:24:17'+time_offset*3600;
   aPrice[30] = 1.42035;

   // ========== 31 ===== 825 ==========
   aPseudoTicket[31] = 16;
   aAction[31] = 0; // CLOSE
   aType[31] = OP_SELL; // SELL
   aTicket[31] = -1; // Ticket given by broker
   aSymbol[31] = "EURUSD";
   aLots[31] = 1.0;
   aDate[31] = D'2011.06.17 04:30:05'+time_offset*3600;
   aPrice[31] = 1.41487;

   // ========== 32 ===== 824 ==========
   aPseudoTicket[32] = 17;
   aAction[32] = 1; // OPEN
   aReturn[17] = 32;
   aType[32] = OP_SELL; // SELL
   aTicket[32] = -1; // Ticket given by broker
   aSymbol[32] = "GBPUSD";
   aLots[32] = 1.0;
   aDate[32] = D'2011.06.17 10:47:47'+time_offset*3600;
   aPrice[32] = 1.61711;

   // ========== 33 ===== 824 ==========
   aPseudoTicket[33] = 17;
   aAction[33] = 0; // CLOSE
   aType[33] = OP_SELL; // SELL
   aTicket[33] = -1; // Ticket given by broker
   aSymbol[33] = "GBPUSD";
   aLots[33] = 1.0;
   aDate[33] = D'2011.06.20 01:00:43'+time_offset*3600;
   aPrice[33] = 1.61584;

   // ========== 34 ===== 823 ==========
   aPseudoTicket[34] = 18;
   aAction[34] = 1; // OPEN
   aReturn[18] = 34;
   aType[34] = OP_BUY; // BUY
   aTicket[34] = -1; // Ticket given by broker
   aSymbol[34] = "EURUSD";
   aLots[34] = 1.0;
   aDate[34] = D'2011.06.20 05:41:36'+time_offset*3600;
   aPrice[34] = 1.42279;

   // ========== 35 ===== 821 ==========
   aPseudoTicket[35] = 19;
   aAction[35] = 1; // OPEN
   aReturn[19] = 35;
   aType[35] = OP_SELL; // SELL
   aTicket[35] = -1; // Ticket given by broker
   aSymbol[35] = "GBPUSD";
   aLots[35] = 1.0;
   aDate[35] = D'2011.06.20 10:52:12'+time_offset*3600;
   aPrice[35] = 1.61782;

   // ========== 36 ===== 823 ==========
   aPseudoTicket[36] = 18;
   aAction[36] = 0; // CLOSE
   aType[36] = OP_BUY; // BUY
   aTicket[36] = -1; // Ticket given by broker
   aSymbol[36] = "EURUSD";
   aLots[36] = 1.0;
   aDate[36] = D'2011.06.20 10:52:15'+time_offset*3600;
   aPrice[36] = 1.42331;

   // ========== 37 ===== 822 ==========
   aPseudoTicket[37] = 20;
   aAction[37] = 1; // OPEN
   aReturn[20] = 37;
   aType[37] = OP_BUY; // BUY
   aTicket[37] = -1; // Ticket given by broker
   aSymbol[37] = "USDCAD";
   aLots[37] = 1.0;
   aDate[37] = D'2011.06.21 02:58:52'+time_offset*3600;
   aPrice[37] = 0.97872;

   // ========== 38 ===== 822 ==========
   aPseudoTicket[38] = 20;
   aAction[38] = 0; // CLOSE
   aType[38] = OP_BUY; // BUY
   aTicket[38] = -1; // Ticket given by broker
   aSymbol[38] = "USDCAD";
   aLots[38] = 1.0;
   aDate[38] = D'2011.06.21 12:30:00'+time_offset*3600;
   aPrice[38] = 0.97492;

   // ========== 39 ===== 820 ==========
   aPseudoTicket[39] = 21;
   aAction[39] = 1; // OPEN
   aReturn[21] = 39;
   aType[39] = OP_BUY; // BUY
   aTicket[39] = -1; // Ticket given by broker
   aSymbol[39] = "USDCHF";
   aLots[39] = 1.0;
   aDate[39] = D'2011.06.21 22:02:05'+time_offset*3600;
   aPrice[39] = 0.84133;

   // ========== 40 ===== 821 ==========
   aPseudoTicket[40] = 19;
   aAction[40] = 0; // CLOSE
   aType[40] = OP_SELL; // SELL
   aTicket[40] = -1; // Ticket given by broker
   aSymbol[40] = "GBPUSD";
   aLots[40] = 1.0;
   aDate[40] = D'2011.06.22 11:06:29'+time_offset*3600;
   aPrice[40] = 1.61264;

   // ========== 41 ===== 820 ==========
   aPseudoTicket[41] = 21;
   aAction[41] = 0; // CLOSE
   aType[41] = OP_BUY; // BUY
   aTicket[41] = -1; // Ticket given by broker
   aSymbol[41] = "USDCHF";
   aLots[41] = 1.0;
   aDate[41] = D'2011.06.22 13:40:28'+time_offset*3600;
   aPrice[41] = 0.83888;

   // ========== 42 ===== 819 ==========
   aPseudoTicket[42] = 22;
   aAction[42] = 1; // OPEN
   aReturn[22] = 42;
   aType[42] = OP_SELL; // SELL
   aTicket[42] = -1; // Ticket given by broker
   aSymbol[42] = "USDCHF";
   aLots[42] = 1.0;
   aDate[42] = D'2011.06.22 14:48:34'+time_offset*3600;
   aPrice[42] = 0.83525;

   // ========== 43 ===== 819 ==========
   aPseudoTicket[43] = 22;
   aAction[43] = 0; // CLOSE
   aType[43] = OP_SELL; // SELL
   aTicket[43] = -1; // Ticket given by broker
   aSymbol[43] = "USDCHF";
   aLots[43] = 1.0;
   aDate[43] = D'2011.06.22 16:00:34'+time_offset*3600;
   aPrice[43] = 0.83618;

   // ========== 44 ===== 817 ==========
   aPseudoTicket[44] = 23;
   aAction[44] = 1; // OPEN
   aReturn[23] = 44;
   aType[44] = OP_BUY; // BUY
   aTicket[44] = -1; // Ticket given by broker
   aSymbol[44] = "EURUSD";
   aLots[44] = 1.0;
   aDate[44] = D'2011.06.23 09:36:16'+time_offset*3600;
   aPrice[44] = 1.42506;

   // ========== 45 ===== 816 ==========
   aPseudoTicket[45] = 24;
   aAction[45] = 1; // OPEN
   aReturn[24] = 45;
   aType[45] = OP_BUY; // BUY
   aTicket[45] = -1; // Ticket given by broker
   aSymbol[45] = "EURUSD";
   aLots[45] = 1.0;
   aDate[45] = D'2011.06.23 12:17:42'+time_offset*3600;
   aPrice[45] = 1.421;

   // ========== 46 ===== 818 ==========
   aPseudoTicket[46] = 25;
   aAction[46] = 1; // OPEN
   aReturn[25] = 46;
   aType[46] = OP_BUY; // BUY
   aTicket[46] = -1; // Ticket given by broker
   aSymbol[46] = "EURUSD";
   aLots[46] = 1.0;
   aDate[46] = D'2011.06.23 14:26:22'+time_offset*3600;
   aPrice[46] = 1.41495;

   // ========== 47 ===== 817 ==========
   aPseudoTicket[47] = 23;
   aAction[47] = 0; // CLOSE
   aType[47] = OP_BUY; // BUY
   aTicket[47] = -1; // Ticket given by broker
   aSymbol[47] = "EURUSD";
   aLots[47] = 1.0;
   aDate[47] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPrice[47] = 1.4182;

   // ========== 48 ===== 818 ==========
   aPseudoTicket[48] = 25;
   aAction[48] = 0; // CLOSE
   aType[48] = OP_BUY; // BUY
   aTicket[48] = -1; // Ticket given by broker
   aSymbol[48] = "EURUSD";
   aLots[48] = 1.0;
   aDate[48] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPrice[48] = 1.4182;

   // ========== 49 ===== 816 ==========
   aPseudoTicket[49] = 24;
   aAction[49] = 0; // CLOSE
   aType[49] = OP_BUY; // BUY
   aTicket[49] = -1; // Ticket given by broker
   aSymbol[49] = "EURUSD";
   aLots[49] = 1.0;
   aDate[49] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPrice[49] = 1.4182;

   // ========== 50 ===== 814 ==========
   aPseudoTicket[50] = 26;
   aAction[50] = 1; // OPEN
   aReturn[26] = 50;
   aType[50] = OP_SELL; // SELL
   aTicket[50] = -1; // Ticket given by broker
   aSymbol[50] = "EURUSD";
   aLots[50] = 1.0;
   aDate[50] = D'2011.06.23 19:02:08'+time_offset*3600;
   aPrice[50] = 1.4225;

   // ========== 51 ===== 815 ==========
   aPseudoTicket[51] = 27;
   aAction[51] = 1; // OPEN
   aReturn[27] = 51;
   aType[51] = OP_SELL; // SELL
   aTicket[51] = -1; // Ticket given by broker
   aSymbol[51] = "GBPUSD";
   aLots[51] = 1.0;
   aDate[51] = D'2011.06.24 04:20:18'+time_offset*3600;
   aPrice[51] = 1.60209;

   // ========== 52 ===== 815 ==========
   aPseudoTicket[52] = 27;
   aAction[52] = 0; // CLOSE
   aType[52] = OP_SELL; // SELL
   aTicket[52] = -1; // Ticket given by broker
   aSymbol[52] = "GBPUSD";
   aLots[52] = 1.0;
   aDate[52] = D'2011.06.24 07:30:07'+time_offset*3600;
   aPrice[52] = 1.59663;

   // ========== 53 ===== 814 ==========
   aPseudoTicket[53] = 26;
   aAction[53] = 0; // CLOSE
   aType[53] = OP_SELL; // SELL
   aTicket[53] = -1; // Ticket given by broker
   aSymbol[53] = "EURUSD";
   aLots[53] = 1.0;
   aDate[53] = D'2011.06.24 08:18:48'+time_offset*3600;
   aPrice[53] = 1.42449;

   // ========== 54 ===== 813 ==========
   aPseudoTicket[54] = 28;
   aAction[54] = 1; // OPEN
   aReturn[28] = 54;
   aType[54] = OP_SELL; // SELL
   aTicket[54] = -1; // Ticket given by broker
   aSymbol[54] = "EURUSD";
   aLots[54] = 1.0;
   aDate[54] = D'2011.06.24 10:19:42'+time_offset*3600;
   aPrice[54] = 1.42233;

   // ========== 55 ===== 813 ==========
   aPseudoTicket[55] = 28;
   aAction[55] = 0; // CLOSE
   aType[55] = OP_SELL; // SELL
   aTicket[55] = -1; // Ticket given by broker
   aSymbol[55] = "EURUSD";
   aLots[55] = 1.0;
   aDate[55] = D'2011.06.24 10:59:16'+time_offset*3600;
   aPrice[55] = 1.4203;

   // ========== 56 ===== 812 ==========
   aPseudoTicket[56] = 29;
   aAction[56] = 1; // OPEN
   aReturn[29] = 56;
   aType[56] = OP_SELL; // SELL
   aTicket[56] = -1; // Ticket given by broker
   aSymbol[56] = "GBPUSD";
   aLots[56] = 1.0;
   aDate[56] = D'2011.06.24 11:31:07'+time_offset*3600;
   aPrice[56] = 1.60265;

   // ========== 57 ===== 812 ==========
   aPseudoTicket[57] = 29;
   aAction[57] = 0; // CLOSE
   aType[57] = OP_SELL; // SELL
   aTicket[57] = -1; // Ticket given by broker
   aSymbol[57] = "GBPUSD";
   aLots[57] = 1.0;
   aDate[57] = D'2011.06.24 17:25:42'+time_offset*3600;
   aPrice[57] = 1.59713;

   // ========== 58 ===== 811 ==========
   aPseudoTicket[58] = 30;
   aAction[58] = 1; // OPEN
   aReturn[30] = 58;
   aType[58] = OP_SELL; // SELL
   aTicket[58] = -1; // Ticket given by broker
   aSymbol[58] = "EURUSD";
   aLots[58] = 1.0;
   aDate[58] = D'2011.06.27 22:38:34'+time_offset*3600;
   aPrice[58] = 1.42979;

   // ========== 59 ===== 810 ==========
   aPseudoTicket[59] = 31;
   aAction[59] = 1; // OPEN
   aReturn[31] = 59;
   aType[59] = OP_SELL; // SELL
   aTicket[59] = -1; // Ticket given by broker
   aSymbol[59] = "AUDUSD";
   aLots[59] = 1.0;
   aDate[59] = D'2011.06.28 02:58:55'+time_offset*3600;
   aPrice[59] = 1.04705;

   // ========== 60 ===== 811 ==========
   aPseudoTicket[60] = 30;
   aAction[60] = 0; // CLOSE
   aType[60] = OP_SELL; // SELL
   aTicket[60] = -1; // Ticket given by broker
   aSymbol[60] = "EURUSD";
   aLots[60] = 1.0;
   aDate[60] = D'2011.06.28 03:42:03'+time_offset*3600;
   aPrice[60] = 1.42979;

   // ========== 61 ===== 810 ==========
   aPseudoTicket[61] = 31;
   aAction[61] = 0; // CLOSE
   aType[61] = OP_SELL; // SELL
   aTicket[61] = -1; // Ticket given by broker
   aSymbol[61] = "AUDUSD";
   aLots[61] = 1.0;
   aDate[61] = D'2011.06.28 04:31:28'+time_offset*3600;
   aPrice[61] = 1.04489;

   // ========== 62 ===== 809 ==========
   aPseudoTicket[62] = 32;
   aAction[62] = 1; // OPEN
   aReturn[32] = 62;
   aType[62] = OP_SELL; // SELL
   aTicket[62] = -1; // Ticket given by broker
   aSymbol[62] = "AUDUSD";
   aLots[62] = 1.0;
   aDate[62] = D'2011.06.28 12:41:33'+time_offset*3600;
   aPrice[62] = 1.04831;

   // ========== 63 ===== 809 ==========
   aPseudoTicket[63] = 32;
   aAction[63] = 0; // CLOSE
   aType[63] = OP_SELL; // SELL
   aTicket[63] = -1; // Ticket given by broker
   aSymbol[63] = "AUDUSD";
   aLots[63] = 1.0;
   aDate[63] = D'2011.06.28 14:30:33'+time_offset*3600;
   aPrice[63] = 1.05228;

   // ========== 64 ===== 808 ==========
   aPseudoTicket[64] = 33;
   aAction[64] = 1; // OPEN
   aReturn[33] = 64;
   aType[64] = OP_BUY; // BUY
   aTicket[64] = -1; // Ticket given by broker
   aSymbol[64] = "USDCAD";
   aLots[64] = 1.0;
   aDate[64] = D'2011.06.28 22:10:03'+time_offset*3600;
   aPrice[64] = 0.98117;

   // ========== 65 ===== 808 ==========
   aPseudoTicket[65] = 33;
   aAction[65] = 0; // CLOSE
   aType[65] = OP_BUY; // BUY
   aTicket[65] = -1; // Ticket given by broker
   aSymbol[65] = "USDCAD";
   aLots[65] = 1.0;
   aDate[65] = D'2011.06.29 11:16:41'+time_offset*3600;
   aPrice[65] = 0.97336;

   // ========== 66 ===== 807 ==========
   aPseudoTicket[66] = 34;
   aAction[66] = 1; // OPEN
   aReturn[34] = 66;
   aType[66] = OP_SELL; // SELL
   aTicket[66] = -1; // Ticket given by broker
   aSymbol[66] = "GBPUSD";
   aLots[66] = 1.0;
   aDate[66] = D'2011.06.29 11:34:10'+time_offset*3600;
   aPrice[66] = 1.60338;

   // ========== 67 ===== 806 ==========
   aPseudoTicket[67] = 35;
   aAction[67] = 1; // OPEN
   aReturn[35] = 67;
   aType[67] = OP_SELL; // SELL
   aTicket[67] = -1; // Ticket given by broker
   aSymbol[67] = "GBPUSD";
   aLots[67] = 1.0;
   aDate[67] = D'2011.06.30 03:01:25'+time_offset*3600;
   aPrice[67] = 1.61151;

   // ========== 68 ===== 807 ==========
   aPseudoTicket[68] = 34;
   aAction[68] = 0; // CLOSE
   aType[68] = OP_SELL; // SELL
   aTicket[68] = -1; // Ticket given by broker
   aSymbol[68] = "GBPUSD";
   aLots[68] = 1.0;
   aDate[68] = D'2011.06.30 08:23:53'+time_offset*3600;
   aPrice[68] = 1.60254;

   // ========== 69 ===== 806 ==========
   aPseudoTicket[69] = 35;
   aAction[69] = 0; // CLOSE
   aType[69] = OP_SELL; // SELL
   aTicket[69] = -1; // Ticket given by broker
   aSymbol[69] = "GBPUSD";
   aLots[69] = 1.0;
   aDate[69] = D'2011.06.30 08:27:32'+time_offset*3600;
   aPrice[69] = 1.60145;

   // ========== 70 ===== 805 ==========
   aPseudoTicket[70] = 36;
   aAction[70] = 1; // OPEN
   aReturn[36] = 70;
   aType[70] = OP_SELL; // SELL
   aTicket[70] = -1; // Ticket given by broker
   aSymbol[70] = "GBPUSD";
   aLots[70] = 1.0;
   aDate[70] = D'2011.07.06 05:18:44'+time_offset*3600;
   aPrice[70] = 1.60655;

   // ========== 71 ===== 804 ==========
   aPseudoTicket[71] = 37;
   aAction[71] = 1; // OPEN
   aReturn[37] = 71;
   aType[71] = OP_BUY; // BUY
   aTicket[71] = -1; // Ticket given by broker
   aSymbol[71] = "EURUSD";
   aLots[71] = 1.0;
   aDate[71] = D'2011.07.06 10:50:36'+time_offset*3600;
   aPrice[71] = 1.43404;

   // ========== 72 ===== 805 ==========
   aPseudoTicket[72] = 36;
   aAction[72] = 0; // CLOSE
   aType[72] = OP_SELL; // SELL
   aTicket[72] = -1; // Ticket given by broker
   aSymbol[72] = "GBPUSD";
   aLots[72] = 1.0;
   aDate[72] = D'2011.07.06 14:32:06'+time_offset*3600;
   aPrice[72] = 1.59701;

   // ========== 73 ===== 804 ==========
   aPseudoTicket[73] = 37;
   aAction[73] = 0; // CLOSE
   aType[73] = OP_BUY; // BUY
   aTicket[73] = -1; // Ticket given by broker
   aSymbol[73] = "EURUSD";
   aLots[73] = 1.0;
   aDate[73] = D'2011.07.06 23:46:26'+time_offset*3600;
   aPrice[73] = 1.43262;

   // ========== 74 ===== 803 ==========
   aPseudoTicket[74] = 38;
   aAction[74] = 1; // OPEN
   aReturn[38] = 74;
   aType[74] = OP_SELL; // SELL
   aTicket[74] = -1; // Ticket given by broker
   aSymbol[74] = "EURUSD";
   aLots[74] = 1.0;
   aDate[74] = D'2011.07.07 06:50:26'+time_offset*3600;
   aPrice[74] = 1.43334;

   // ========== 75 ===== 803 ==========
   aPseudoTicket[75] = 38;
   aAction[75] = 0; // CLOSE
   aType[75] = OP_SELL; // SELL
   aTicket[75] = -1; // Ticket given by broker
   aSymbol[75] = "EURUSD";
   aLots[75] = 1.0;
   aDate[75] = D'2011.07.07 08:10:29'+time_offset*3600;
   aPrice[75] = 1.43022;

   // ========== 76 ===== 802 ==========
   aPseudoTicket[76] = 39;
   aAction[76] = 1; // OPEN
   aReturn[39] = 76;
   aType[76] = OP_BUY; // BUY
   aTicket[76] = -1; // Ticket given by broker
   aSymbol[76] = "AUDUSD";
   aLots[76] = 1.0;
   aDate[76] = D'2011.07.07 12:56:31'+time_offset*3600;
   aPrice[76] = 1.07666;

   // ========== 77 ===== 802 ==========
   aPseudoTicket[77] = 39;
   aAction[77] = 0; // CLOSE
   aType[77] = OP_BUY; // BUY
   aTicket[77] = -1; // Ticket given by broker
   aSymbol[77] = "AUDUSD";
   aLots[77] = 1.0;
   aDate[77] = D'2011.07.07 15:05:18'+time_offset*3600;
   aPrice[77] = 1.07675;

   // ========== 78 ===== 801 ==========
   aPseudoTicket[78] = 40;
   aAction[78] = 1; // OPEN
   aReturn[40] = 78;
   aType[78] = OP_SELL; // SELL
   aTicket[78] = -1; // Ticket given by broker
   aSymbol[78] = "USDCAD";
   aLots[78] = 1.0;
   aDate[78] = D'2011.07.08 10:30:07'+time_offset*3600;
   aPrice[78] = 0.95962;

   // ========== 79 ===== 801 ==========
   aPseudoTicket[79] = 40;
   aAction[79] = 0; // CLOSE
   aType[79] = OP_SELL; // SELL
   aTicket[79] = -1; // Ticket given by broker
   aSymbol[79] = "USDCAD";
   aLots[79] = 1.0;
   aDate[79] = D'2011.07.08 11:20:55'+time_offset*3600;
   aPrice[79] = 0.95855;

   // ========== 80 ===== 800 ==========
   aPseudoTicket[80] = 41;
   aAction[80] = 1; // OPEN
   aReturn[41] = 80;
   aType[80] = OP_BUY; // BUY
   aTicket[80] = -1; // Ticket given by broker
   aSymbol[80] = "GBPUSD";
   aLots[80] = 1.0;
   aDate[80] = D'2011.07.08 12:39:30'+time_offset*3600;
   aPrice[80] = 1.60089;

   // ========== 81 ===== 800 ==========
   aPseudoTicket[81] = 41;
   aAction[81] = 0; // CLOSE
   aType[81] = OP_BUY; // BUY
   aTicket[81] = -1; // Ticket given by broker
   aSymbol[81] = "GBPUSD";
   aLots[81] = 1.0;
   aDate[81] = D'2011.07.08 14:49:21'+time_offset*3600;
   aPrice[81] = 1.60599;

   // ========== 82 ===== 799 ==========
   aPseudoTicket[82] = 42;
   aAction[82] = 1; // OPEN
   aReturn[42] = 82;
   aType[82] = OP_BUY; // BUY
   aTicket[82] = -1; // Ticket given by broker
   aSymbol[82] = "AUDUSD";
   aLots[82] = 1.0;
   aDate[82] = D'2011.07.11 09:26:40'+time_offset*3600;
   aPrice[82] = 1.06991;

   // ========== 83 ===== 799 ==========
   aPseudoTicket[83] = 42;
   aAction[83] = 0; // CLOSE
   aType[83] = OP_BUY; // BUY
   aTicket[83] = -1; // Ticket given by broker
   aSymbol[83] = "AUDUSD";
   aLots[83] = 1.0;
   aDate[83] = D'2011.07.12 02:04:01'+time_offset*3600;
   aPrice[83] = 1.059;

   // ========== 84 ===== 798 ==========
   aPseudoTicket[84] = 43;
   aAction[84] = 1; // OPEN
   aReturn[43] = 84;
   aType[84] = OP_BUY; // BUY
   aTicket[84] = -1; // Ticket given by broker
   aSymbol[84] = "AUDUSD";
   aLots[84] = 1.0;
   aDate[84] = D'2011.07.12 03:02:08'+time_offset*3600;
   aPrice[84] = 1.05892;

   // ========== 85 ===== 798 ==========
   aPseudoTicket[85] = 43;
   aAction[85] = 0; // CLOSE
   aType[85] = OP_BUY; // BUY
   aTicket[85] = -1; // Ticket given by broker
   aSymbol[85] = "AUDUSD";
   aLots[85] = 1.0;
   aDate[85] = D'2011.07.12 07:14:23'+time_offset*3600;
   aPrice[85] = 1.05419;

   // ========== 86 ===== 796 ==========
   aPseudoTicket[86] = 44;
   aAction[86] = 1; // OPEN
   aReturn[44] = 86;
   aType[86] = OP_SELL; // SELL
   aTicket[86] = -1; // Ticket given by broker
   aSymbol[86] = "USDJPY";
   aLots[86] = 1.0;
   aDate[86] = D'2011.07.12 08:16:31'+time_offset*3600;
   aPrice[86] = 79.451;

   // ========== 87 ===== 797 ==========
   aPseudoTicket[87] = 45;
   aAction[87] = 1; // OPEN
   aReturn[45] = 87;
   aType[87] = OP_SELL; // SELL
   aTicket[87] = -1; // Ticket given by broker
   aSymbol[87] = "EURUSD";
   aLots[87] = 1.0;
   aDate[87] = D'2011.07.12 18:11:30'+time_offset*3600;
   aPrice[87] = 1.4037;

   // ========== 88 ===== 797 ==========
   aPseudoTicket[88] = 45;
   aAction[88] = 0; // CLOSE
   aType[88] = OP_SELL; // SELL
   aTicket[88] = -1; // Ticket given by broker
   aSymbol[88] = "EURUSD";
   aLots[88] = 1.0;
   aDate[88] = D'2011.07.12 19:26:40'+time_offset*3600;
   aPrice[88] = 1.3987;

   // ========== 89 ===== 794 ==========
   aPseudoTicket[89] = 46;
   aAction[89] = 1; // OPEN
   aReturn[46] = 89;
   aType[89] = OP_SELL; // SELL
   aTicket[89] = -1; // Ticket given by broker
   aSymbol[89] = "GBPUSD";
   aLots[89] = 1.0;
   aDate[89] = D'2011.07.13 03:07:13'+time_offset*3600;
   aPrice[89] = 1.59366;

   // ========== 90 ===== 796 ==========
   aPseudoTicket[90] = 44;
   aAction[90] = 0; // CLOSE
   aType[90] = OP_SELL; // SELL
   aTicket[90] = -1; // Ticket given by broker
   aSymbol[90] = "USDJPY";
   aLots[90] = 1.0;
   aDate[90] = D'2011.07.13 09:17:25'+time_offset*3600;
   aPrice[90] = 79.297;

   // ========== 91 ===== 792 ==========
   aPseudoTicket[91] = 47;
   aAction[91] = 1; // OPEN
   aReturn[47] = 91;
   aType[91] = OP_SELL; // SELL
   aTicket[91] = -1; // Ticket given by broker
   aSymbol[91] = "EURUSD";
   aLots[91] = 1.0;
   aDate[91] = D'2011.07.13 09:35:48'+time_offset*3600;
   aPrice[91] = 1.40938;

   // ========== 92 ===== 795 ==========
   aPseudoTicket[92] = 48;
   aAction[92] = 1; // OPEN
   aReturn[48] = 92;
   aType[92] = OP_SELL; // SELL
   aTicket[92] = -1; // Ticket given by broker
   aSymbol[92] = "EURUSD";
   aLots[92] = 1.0;
   aDate[92] = D'2011.07.13 10:03:16'+time_offset*3600;
   aPrice[92] = 1.41012;

   // ========== 93 ===== 795 ==========
   aPseudoTicket[93] = 48;
   aAction[93] = 0; // CLOSE
   aType[93] = OP_SELL; // SELL
   aTicket[93] = -1; // Ticket given by broker
   aSymbol[93] = "EURUSD";
   aLots[93] = 1.0;
   aDate[93] = D'2011.07.13 11:29:13'+time_offset*3600;
   aPrice[93] = 1.40689;

   // ========== 94 ===== 794 ==========
   aPseudoTicket[94] = 46;
   aAction[94] = 0; // CLOSE
   aType[94] = OP_SELL; // SELL
   aTicket[94] = -1; // Ticket given by broker
   aSymbol[94] = "GBPUSD";
   aLots[94] = 1.0;
   aDate[94] = D'2011.07.13 11:56:05'+time_offset*3600;
   aPrice[94] = 1.59642;

   // ========== 95 ===== 789 ==========
   aPseudoTicket[95] = 49;
   aAction[95] = 1; // OPEN
   aReturn[49] = 95;
   aType[95] = OP_SELL; // SELL
   aTicket[95] = -1; // Ticket given by broker
   aSymbol[95] = "EURUSD";
   aLots[95] = 1.0;
   aDate[95] = D'2011.07.13 22:10:39'+time_offset*3600;
   aPrice[95] = 1.4222;

   // ========== 96 ===== 793 ==========
   aPseudoTicket[96] = 50;
   aAction[96] = 1; // OPEN
   aReturn[50] = 96;
   aType[96] = OP_SELL; // SELL
   aTicket[96] = -1; // Ticket given by broker
   aSymbol[96] = "USDJPY";
   aLots[96] = 1.0;
   aDate[96] = D'2011.07.13 23:17:10'+time_offset*3600;
   aPrice[96] = 78.9;

   // ========== 97 ===== 790 ==========
   aPseudoTicket[97] = 51;
   aAction[97] = 1; // OPEN
   aReturn[51] = 97;
   aType[97] = OP_SELL; // SELL
   aTicket[97] = -1; // Ticket given by broker
   aSymbol[97] = "EURUSD";
   aLots[97] = 1.0;
   aDate[97] = D'2011.07.13 23:43:09'+time_offset*3600;
   aPrice[97] = 1.42465;

   // ========== 98 ===== 793 ==========
   aPseudoTicket[98] = 50;
   aAction[98] = 0; // CLOSE
   aType[98] = OP_SELL; // SELL
   aTicket[98] = -1; // Ticket given by broker
   aSymbol[98] = "USDJPY";
   aLots[98] = 1.0;
   aDate[98] = D'2011.07.13 23:53:52'+time_offset*3600;
   aPrice[98] = 78.861;

   // ========== 99 ===== 791 ==========
   aPseudoTicket[99] = 52;
   aAction[99] = 1; // OPEN
   aReturn[52] = 99;
   aType[99] = OP_SELL; // SELL
   aTicket[99] = -1; // Ticket given by broker
   aSymbol[99] = "EURUSD";
   aLots[99] = 1.0;
   aDate[99] = D'2011.07.13 23:53:59'+time_offset*3600;
   aPrice[99] = 1.4272;

   // ========== 100 ===== 792 ==========
   aPseudoTicket[100] = 47;
   aAction[100] = 0; // CLOSE
   aType[100] = OP_SELL; // SELL
   aTicket[100] = -1; // Ticket given by broker
   aSymbol[100] = "EURUSD";
   aLots[100] = 1.0;
   aDate[100] = D'2011.07.14 03:23:03'+time_offset*3600;
   aPrice[100] = 1.42222;

   // ========== 101 ===== 782 ==========
   aPseudoTicket[101] = 53;
   aAction[101] = 1; // OPEN
   aReturn[53] = 101;
   aType[101] = OP_SELL; // SELL
   aTicket[101] = -1; // Ticket given by broker
   aSymbol[101] = "USDCHF";
   aLots[101] = 1.0;
   aDate[101] = D'2011.07.14 03:23:07'+time_offset*3600;
   aPrice[101] = 0.81165;

   // ========== 102 ===== 791 ==========
   aPseudoTicket[102] = 52;
   aAction[102] = 0; // CLOSE
   aType[102] = OP_SELL; // SELL
   aTicket[102] = -1; // Ticket given by broker
   aSymbol[102] = "EURUSD";
   aLots[102] = 1.0;
   aDate[102] = D'2011.07.14 04:01:49'+time_offset*3600;
   aPrice[102] = 1.42134;

   // ========== 103 ===== 790 ==========
   aPseudoTicket[103] = 51;
   aAction[103] = 0; // CLOSE
   aType[103] = OP_SELL; // SELL
   aTicket[103] = -1; // Ticket given by broker
   aSymbol[103] = "EURUSD";
   aLots[103] = 1.0;
   aDate[103] = D'2011.07.14 05:58:14'+time_offset*3600;
   aPrice[103] = 1.41961;

   // ========== 104 ===== 789 ==========
   aPseudoTicket[104] = 49;
   aAction[104] = 0; // CLOSE
   aType[104] = OP_SELL; // SELL
   aTicket[104] = -1; // Ticket given by broker
   aSymbol[104] = "EURUSD";
   aLots[104] = 1.0;
   aDate[104] = D'2011.07.14 06:00:49'+time_offset*3600;
   aPrice[104] = 1.41805;

   // ========== 105 ===== 788 ==========
   aPseudoTicket[105] = 54;
   aAction[105] = 1; // OPEN
   aReturn[54] = 105;
   aType[105] = OP_BUY; // BUY
   aTicket[105] = -1; // Ticket given by broker
   aSymbol[105] = "EURUSD";
   aLots[105] = 1.0;
   aDate[105] = D'2011.07.14 06:06:40'+time_offset*3600;
   aPrice[105] = 1.41784;

   // ========== 106 ===== 788 ==========
   aPseudoTicket[106] = 54;
   aAction[106] = 0; // CLOSE
   aType[106] = OP_BUY; // BUY
   aTicket[106] = -1; // Ticket given by broker
   aSymbol[106] = "EURUSD";
   aLots[106] = 1.0;
   aDate[106] = D'2011.07.14 07:03:06'+time_offset*3600;
   aPrice[106] = 1.41847;

   // ========== 107 ===== 787 ==========
   aPseudoTicket[107] = 55;
   aAction[107] = 1; // OPEN
   aReturn[55] = 107;
   aType[107] = OP_BUY; // BUY
   aTicket[107] = -1; // Ticket given by broker
   aSymbol[107] = "GBPUSD";
   aLots[107] = 1.0;
   aDate[107] = D'2011.07.14 11:15:29'+time_offset*3600;
   aPrice[107] = 1.61148;

   // ========== 108 ===== 787 ==========
   aPseudoTicket[108] = 55;
   aAction[108] = 0; // CLOSE
   aType[108] = OP_BUY; // BUY
   aTicket[108] = -1; // Ticket given by broker
   aSymbol[108] = "GBPUSD";
   aLots[108] = 1.0;
   aDate[108] = D'2011.07.14 13:08:48'+time_offset*3600;
   aPrice[108] = 1.61316;

   // ========== 109 ===== 786 ==========
   aPseudoTicket[109] = 56;
   aAction[109] = 1; // OPEN
   aReturn[56] = 109;
   aType[109] = OP_SELL; // SELL
   aTicket[109] = -1; // Ticket given by broker
   aSymbol[109] = "USDCHF";
   aLots[109] = 1.0;
   aDate[109] = D'2011.07.14 13:20:11'+time_offset*3600;
   aPrice[109] = 0.81717;

   // ========== 110 ===== 786 ==========
   aPseudoTicket[110] = 56;
   aAction[110] = 0; // CLOSE
   aType[110] = OP_SELL; // SELL
   aTicket[110] = -1; // Ticket given by broker
   aSymbol[110] = "USDCHF";
   aLots[110] = 1.0;
   aDate[110] = D'2011.07.14 16:29:37'+time_offset*3600;
   aPrice[110] = 0.81649;

   // ========== 111 ===== 783 ==========
   aPseudoTicket[111] = 57;
   aAction[111] = 1; // OPEN
   aReturn[57] = 111;
   aType[111] = OP_SELL; // SELL
   aTicket[111] = -1; // Ticket given by broker
   aSymbol[111] = "USDCHF";
   aLots[111] = 1.0;
   aDate[111] = D'2011.07.15 06:09:46'+time_offset*3600;
   aPrice[111] = 0.81569;

   // ========== 112 ===== 784 ==========
   aPseudoTicket[112] = 58;
   aAction[112] = 1; // OPEN
   aReturn[58] = 112;
   aType[112] = OP_SELL; // SELL
   aTicket[112] = -1; // Ticket given by broker
   aSymbol[112] = "USDCHF";
   aLots[112] = 1.0;
   aDate[112] = D'2011.07.15 07:47:11'+time_offset*3600;
   aPrice[112] = 0.81752;

   // ========== 113 ===== 785 ==========
   aPseudoTicket[113] = 59;
   aAction[113] = 1; // OPEN
   aReturn[59] = 113;
   aType[113] = OP_SELL; // SELL
   aTicket[113] = -1; // Ticket given by broker
   aSymbol[113] = "GBPUSD";
   aLots[113] = 1.0;
   aDate[113] = D'2011.07.15 12:52:10'+time_offset*3600;
   aPrice[113] = 1.60755;

   // ========== 114 ===== 785 ==========
   aPseudoTicket[114] = 59;
   aAction[114] = 0; // CLOSE
   aType[114] = OP_SELL; // SELL
   aTicket[114] = -1; // Ticket given by broker
   aSymbol[114] = "GBPUSD";
   aLots[114] = 1.0;
   aDate[114] = D'2011.07.15 13:01:27'+time_offset*3600;
   aPrice[114] = 1.60991;

   // ========== 115 ===== 784 ==========
   aPseudoTicket[115] = 58;
   aAction[115] = 0; // CLOSE
   aType[115] = OP_SELL; // SELL
   aTicket[115] = -1; // Ticket given by broker
   aSymbol[115] = "USDCHF";
   aLots[115] = 1.0;
   aDate[115] = D'2011.07.17 21:14:25'+time_offset*3600;
   aPrice[115] = 0.80986;

   // ========== 116 ===== 783 ==========
   aPseudoTicket[116] = 57;
   aAction[116] = 0; // CLOSE
   aType[116] = OP_SELL; // SELL
   aTicket[116] = -1; // Ticket given by broker
   aSymbol[116] = "USDCHF";
   aLots[116] = 1.0;
   aDate[116] = D'2011.07.17 21:31:56'+time_offset*3600;
   aPrice[116] = 0.80998;

   // ========== 117 ===== 781 ==========
   aPseudoTicket[117] = 60;
   aAction[117] = 1; // OPEN
   aReturn[60] = 117;
   aType[117] = OP_SELL; // SELL
   aTicket[117] = -1; // Ticket given by broker
   aSymbol[117] = "USDCHF";
   aLots[117] = 1.0;
   aDate[117] = D'2011.07.18 09:22:53'+time_offset*3600;
   aPrice[117] = 0.81631;

   // ========== 118 ===== 782 ==========
   aPseudoTicket[118] = 53;
   aAction[118] = 0; // CLOSE
   aType[118] = OP_SELL; // SELL
   aTicket[118] = -1; // Ticket given by broker
   aSymbol[118] = "USDCHF";
   aLots[118] = 1.0;
   aDate[118] = D'2011.07.19 06:28:06'+time_offset*3600;
   aPrice[118] = 0.821;

   // ========== 119 ===== 781 ==========
   aPseudoTicket[119] = 60;
   aAction[119] = 0; // CLOSE
   aType[119] = OP_SELL; // SELL
   aTicket[119] = -1; // Ticket given by broker
   aSymbol[119] = "USDCHF";
   aLots[119] = 1.0;
   aDate[119] = D'2011.07.19 06:28:07'+time_offset*3600;
   aPrice[119] = 0.821;

   // ========== 120 ===== 780 ==========
   aPseudoTicket[120] = 61;
   aAction[120] = 1; // OPEN
   aReturn[61] = 120;
   aType[120] = OP_BUY; // BUY
   aTicket[120] = -1; // Ticket given by broker
   aSymbol[120] = "EURUSD";
   aLots[120] = 1.0;
   aDate[120] = D'2011.07.19 07:20:59'+time_offset*3600;
   aPrice[120] = 1.41482;

   // ========== 121 ===== 779 ==========
   aPseudoTicket[121] = 62;
   aAction[121] = 1; // OPEN
   aReturn[62] = 121;
   aType[121] = OP_BUY; // BUY
   aTicket[121] = -1; // Ticket given by broker
   aSymbol[121] = "EURUSD";
   aLots[121] = 1.0;
   aDate[121] = D'2011.07.19 11:19:28'+time_offset*3600;
   aPrice[121] = 1.41682;

   // ========== 122 ===== 780 ==========
   aPseudoTicket[122] = 61;
   aAction[122] = 0; // CLOSE
   aType[122] = OP_BUY; // BUY
   aTicket[122] = -1; // Ticket given by broker
   aSymbol[122] = "EURUSD";
   aLots[122] = 1.0;
   aDate[122] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPrice[122] = 1.412;

   // ========== 123 ===== 779 ==========
   aPseudoTicket[123] = 62;
   aAction[123] = 0; // CLOSE
   aType[123] = OP_BUY; // BUY
   aTicket[123] = -1; // Ticket given by broker
   aSymbol[123] = "EURUSD";
   aLots[123] = 1.0;
   aDate[123] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPrice[123] = 1.412;

   // ========== 124 ===== 778 ==========
   aPseudoTicket[124] = 63;
   aAction[124] = 1; // OPEN
   aReturn[63] = 124;
   aType[124] = OP_SELL; // SELL
   aTicket[124] = -1; // Ticket given by broker
   aSymbol[124] = "USDCHF";
   aLots[124] = 1.0;
   aDate[124] = D'2011.07.19 19:16:07'+time_offset*3600;
   aPrice[124] = 0.8265;

   // ========== 125 ===== 776 ==========
   aPseudoTicket[125] = 64;
   aAction[125] = 1; // OPEN
   aReturn[64] = 125;
   aType[125] = OP_SELL; // SELL
   aTicket[125] = -1; // Ticket given by broker
   aSymbol[125] = "USDJPY";
   aLots[125] = 1.0;
   aDate[125] = D'2011.07.20 04:50:58'+time_offset*3600;
   aPrice[125] = 79.132;

   // ========== 126 ===== 777 ==========
   aPseudoTicket[126] = 65;
   aAction[126] = 1; // OPEN
   aReturn[65] = 126;
   aType[126] = OP_BUY; // BUY
   aTicket[126] = -1; // Ticket given by broker
   aSymbol[126] = "EURUSD";
   aLots[126] = 1.0;
   aDate[126] = D'2011.07.20 06:35:58'+time_offset*3600;
   aPrice[126] = 1.41849;

   // ========== 127 ===== 778 ==========
   aPseudoTicket[127] = 63;
   aAction[127] = 0; // CLOSE
   aType[127] = OP_SELL; // SELL
   aTicket[127] = -1; // Ticket given by broker
   aSymbol[127] = "USDCHF";
   aLots[127] = 1.0;
   aDate[127] = D'2011.07.20 07:12:21'+time_offset*3600;
   aPrice[127] = 0.8235;

   // ========== 128 ===== 777 ==========
   aPseudoTicket[128] = 65;
   aAction[128] = 0; // CLOSE
   aType[128] = OP_BUY; // BUY
   aTicket[128] = -1; // Ticket given by broker
   aSymbol[128] = "EURUSD";
   aLots[128] = 1.0;
   aDate[128] = D'2011.07.20 07:16:27'+time_offset*3600;
   aPrice[128] = 1.4164;

   // ========== 129 ===== 775 ==========
   aPseudoTicket[129] = 66;
   aAction[129] = 1; // OPEN
   aReturn[66] = 129;
   aType[129] = OP_SELL; // SELL
   aTicket[129] = -1; // Ticket given by broker
   aSymbol[129] = "USDJPY";
   aLots[129] = 1.0;
   aDate[129] = D'2011.07.20 08:40:30'+time_offset*3600;
   aPrice[129] = 78.785;

   // ========== 130 ===== 776 ==========
   aPseudoTicket[130] = 64;
   aAction[130] = 0; // CLOSE
   aType[130] = OP_SELL; // SELL
   aTicket[130] = -1; // Ticket given by broker
   aSymbol[130] = "USDJPY";
   aLots[130] = 1.0;
   aDate[130] = D'2011.07.21 03:52:15'+time_offset*3600;
   aPrice[130] = 78.69;

   // ========== 131 ===== 775 ==========
   aPseudoTicket[131] = 66;
   aAction[131] = 0; // CLOSE
   aType[131] = OP_SELL; // SELL
   aTicket[131] = -1; // Ticket given by broker
   aSymbol[131] = "USDJPY";
   aLots[131] = 1.0;
   aDate[131] = D'2011.07.21 05:36:00'+time_offset*3600;
   aPrice[131] = 78.868;

   // ========== 132 ===== 774 ==========
   aPseudoTicket[132] = 67;
   aAction[132] = 1; // OPEN
   aReturn[67] = 132;
   aType[132] = OP_BUY; // BUY
   aTicket[132] = -1; // Ticket given by broker
   aSymbol[132] = "EURUSD";
   aLots[132] = 1.0;
   aDate[132] = D'2011.07.21 09:06:48'+time_offset*3600;
   aPrice[132] = 1.4195;

   // ========== 133 ===== 774 ==========
   aPseudoTicket[133] = 67;
   aAction[133] = 0; // CLOSE
   aType[133] = OP_BUY; // BUY
   aTicket[133] = -1; // Ticket given by broker
   aSymbol[133] = "EURUSD";
   aLots[133] = 1.0;
   aDate[133] = D'2011.07.21 11:35:33'+time_offset*3600;
   aPrice[133] = 1.41811;

   // ========== 134 ===== 773 ==========
   aPseudoTicket[134] = 68;
   aAction[134] = 1; // OPEN
   aReturn[68] = 134;
   aType[134] = OP_SELL; // SELL
   aTicket[134] = -1; // Ticket given by broker
   aSymbol[134] = "EURUSD";
   aLots[134] = 1.0;
   aDate[134] = D'2011.07.21 11:39:01'+time_offset*3600;
   aPrice[134] = 1.41763;

   // ========== 135 ===== 773 ==========
   aPseudoTicket[135] = 68;
   aAction[135] = 0; // CLOSE
   aType[135] = OP_SELL; // SELL
   aTicket[135] = -1; // Ticket given by broker
   aSymbol[135] = "EURUSD";
   aLots[135] = 1.0;
   aDate[135] = D'2011.07.21 12:12:40'+time_offset*3600;
   aPrice[135] = 1.42214;

   // ========== 136 ===== 772 ==========
   aPseudoTicket[136] = 69;
   aAction[136] = 1; // OPEN
   aReturn[69] = 136;
   aType[136] = OP_BUY; // BUY
   aTicket[136] = -1; // Ticket given by broker
   aSymbol[136] = "EURUSD";
   aLots[136] = 1.0;
   aDate[136] = D'2011.07.21 13:24:41'+time_offset*3600;
   aPrice[136] = 1.43315;

   // ========== 137 ===== 772 ==========
   aPseudoTicket[137] = 69;
   aAction[137] = 0; // CLOSE
   aType[137] = OP_BUY; // BUY
   aTicket[137] = -1; // Ticket given by broker
   aSymbol[137] = "EURUSD";
   aLots[137] = 1.0;
   aDate[137] = D'2011.07.21 21:11:47'+time_offset*3600;
   aPrice[137] = 1.44305;

   // ========== 138 ===== 771 ==========
   aPseudoTicket[138] = 70;
   aAction[138] = 1; // OPEN
   aReturn[70] = 138;
   aType[138] = OP_BUY; // BUY
   aTicket[138] = -1; // Ticket given by broker
   aSymbol[138] = "EURUSD";
   aLots[138] = 1.0;
   aDate[138] = D'2011.07.22 02:26:05'+time_offset*3600;
   aPrice[138] = 1.43888;

   // ========== 139 ===== 770 ==========
   aPseudoTicket[139] = 71;
   aAction[139] = 1; // OPEN
   aReturn[71] = 139;
   aType[139] = OP_BUY; // BUY
   aTicket[139] = -1; // Ticket given by broker
   aSymbol[139] = "USDCHF";
   aLots[139] = 1.0;
   aDate[139] = D'2011.07.22 07:29:27'+time_offset*3600;
   aPrice[139] = 0.82281;

   // ========== 140 ===== 771 ==========
   aPseudoTicket[140] = 70;
   aAction[140] = 0; // CLOSE
   aType[140] = OP_BUY; // BUY
   aTicket[140] = -1; // Ticket given by broker
   aSymbol[140] = "EURUSD";
   aLots[140] = 1.0;
   aDate[140] = D'2011.07.22 07:33:02'+time_offset*3600;
   aPrice[140] = 1.44238;

   // ========== 141 ===== 770 ==========
   aPseudoTicket[141] = 71;
   aAction[141] = 0; // CLOSE
   aType[141] = OP_BUY; // BUY
   aTicket[141] = -1; // Ticket given by broker
   aSymbol[141] = "USDCHF";
   aLots[141] = 1.0;
   aDate[141] = D'2011.07.22 11:32:39'+time_offset*3600;
   aPrice[141] = 0.82016;

   // ========== 142 ===== 768 ==========
   aPseudoTicket[142] = 72;
   aAction[142] = 1; // OPEN
   aReturn[72] = 142;
   aType[142] = OP_BUY; // BUY
   aTicket[142] = -1; // Ticket given by broker
   aSymbol[142] = "EURUSD";
   aLots[142] = 1.0;
   aDate[142] = D'2011.07.22 11:56:02'+time_offset*3600;
   aPrice[142] = 1.4384;

   // ========== 143 ===== 769 ==========
   aPseudoTicket[143] = 73;
   aAction[143] = 1; // OPEN
   aReturn[73] = 143;
   aType[143] = OP_BUY; // BUY
   aTicket[143] = -1; // Ticket given by broker
   aSymbol[143] = "EURUSD";
   aLots[143] = 1.0;
   aDate[143] = D'2011.07.22 13:46:17'+time_offset*3600;
   aPrice[143] = 1.434;

   // ========== 144 ===== 769 ==========
   aPseudoTicket[144] = 73;
   aAction[144] = 0; // CLOSE
   aType[144] = OP_BUY; // BUY
   aTicket[144] = -1; // Ticket given by broker
   aSymbol[144] = "EURUSD";
   aLots[144] = 1.0;
   aDate[144] = D'2011.07.24 21:01:28'+time_offset*3600;
   aPrice[144] = 1.4386;

   // ========== 145 ===== 768 ==========
   aPseudoTicket[145] = 72;
   aAction[145] = 0; // CLOSE
   aType[145] = OP_BUY; // BUY
   aTicket[145] = -1; // Ticket given by broker
   aSymbol[145] = "EURUSD";
   aLots[145] = 1.0;
   aDate[145] = D'2011.07.24 21:05:26'+time_offset*3600;
   aPrice[145] = 1.4387;

   // ========== 146 ===== 766 ==========
   aPseudoTicket[146] = 74;
   aAction[146] = 1; // OPEN
   aReturn[74] = 146;
   aType[146] = OP_BUY; // BUY
   aTicket[146] = -1; // Ticket given by broker
   aSymbol[146] = "EURUSD";
   aLots[146] = 1.0;
   aDate[146] = D'2011.07.25 07:07:10'+time_offset*3600;
   aPrice[146] = 1.43508;

   // ========== 147 ===== 767 ==========
   aPseudoTicket[147] = 75;
   aAction[147] = 1; // OPEN
   aReturn[75] = 147;
   aType[147] = OP_SELL; // SELL
   aTicket[147] = -1; // Ticket given by broker
   aSymbol[147] = "USDCHF";
   aLots[147] = 1.0;
   aDate[147] = D'2011.07.25 08:07:52'+time_offset*3600;
   aPrice[147] = 0.80632;

   // ========== 148 ===== 767 ==========
   aPseudoTicket[148] = 75;
   aAction[148] = 0; // CLOSE
   aType[148] = OP_SELL; // SELL
   aTicket[148] = -1; // Ticket given by broker
   aSymbol[148] = "USDCHF";
   aLots[148] = 1.0;
   aDate[148] = D'2011.07.26 03:34:33'+time_offset*3600;
   aPrice[148] = 0.80186;

   // ========== 149 ===== 766 ==========
   aPseudoTicket[149] = 74;
   aAction[149] = 0; // CLOSE
   aType[149] = OP_BUY; // BUY
   aTicket[149] = -1; // Ticket given by broker
   aSymbol[149] = "EURUSD";
   aLots[149] = 1.0;
   aDate[149] = D'2011.07.26 06:50:21'+time_offset*3600;
   aPrice[149] = 1.45126;

   // ========== 150 ===== 765 ==========
   aPseudoTicket[150] = 76;
   aAction[150] = 1; // OPEN
   aReturn[76] = 150;
   aType[150] = OP_BUY; // BUY
   aTicket[150] = -1; // Ticket given by broker
   aSymbol[150] = "EURUSD";
   aLots[150] = 1.0;
   aDate[150] = D'2011.07.26 09:07:28'+time_offset*3600;
   aPrice[150] = 1.44751;

   // ========== 151 ===== 764 ==========
   aPseudoTicket[151] = 77;
   aAction[151] = 1; // OPEN
   aReturn[77] = 151;
   aType[151] = OP_BUY; // BUY
   aTicket[151] = -1; // Ticket given by broker
   aSymbol[151] = "EURUSD";
   aLots[151] = 1.0;
   aDate[151] = D'2011.07.26 12:07:54'+time_offset*3600;
   aPrice[151] = 1.44781;

   // ========== 152 ===== 765 ==========
   aPseudoTicket[152] = 76;
   aAction[152] = 0; // CLOSE
   aType[152] = OP_BUY; // BUY
   aTicket[152] = -1; // Ticket given by broker
   aSymbol[152] = "EURUSD";
   aLots[152] = 1.0;
   aDate[152] = D'2011.07.26 12:08:02'+time_offset*3600;
   aPrice[152] = 1.44765;

   // ========== 153 ===== 764 ==========
   aPseudoTicket[153] = 77;
   aAction[153] = 0; // CLOSE
   aType[153] = OP_BUY; // BUY
   aTicket[153] = -1; // Ticket given by broker
   aSymbol[153] = "EURUSD";
   aLots[153] = 1.0;
   aDate[153] = D'2011.07.26 12:08:46'+time_offset*3600;
   aPrice[153] = 1.44788;

   // ========== 154 ===== 763 ==========
   aPseudoTicket[154] = 78;
   aAction[154] = 1; // OPEN
   aReturn[78] = 154;
   aType[154] = OP_BUY; // BUY
   aTicket[154] = -1; // Ticket given by broker
   aSymbol[154] = "EURUSD";
   aLots[154] = 1.0;
   aDate[154] = D'2011.07.26 12:09:21'+time_offset*3600;
   aPrice[154] = 1.4479;

   // ========== 155 ===== 763 ==========
   aPseudoTicket[155] = 78;
   aAction[155] = 0; // CLOSE
   aType[155] = OP_BUY; // BUY
   aTicket[155] = -1; // Ticket given by broker
   aSymbol[155] = "EURUSD";
   aLots[155] = 1.0;
   aDate[155] = D'2011.07.26 12:09:49'+time_offset*3600;
   aPrice[155] = 1.44759;

   // ========== 156 ===== 762 ==========
   aPseudoTicket[156] = 79;
   aAction[156] = 1; // OPEN
   aReturn[79] = 156;
   aType[156] = OP_SELL; // SELL
   aTicket[156] = -1; // Ticket given by broker
   aSymbol[156] = "EURUSD";
   aLots[156] = 1.0;
   aDate[156] = D'2011.07.26 12:09:54'+time_offset*3600;
   aPrice[156] = 1.44753;

   // ========== 157 ===== 762 ==========
   aPseudoTicket[157] = 79;
   aAction[157] = 0; // CLOSE
   aType[157] = OP_SELL; // SELL
   aTicket[157] = -1; // Ticket given by broker
   aSymbol[157] = "EURUSD";
   aLots[157] = 1.0;
   aDate[157] = D'2011.07.26 12:10:12'+time_offset*3600;
   aPrice[157] = 1.44773;

   // ========== 158 ===== 761 ==========
   aPseudoTicket[158] = 80;
   aAction[158] = 1; // OPEN
   aReturn[80] = 158;
   aType[158] = OP_BUY; // BUY
   aTicket[158] = -1; // Ticket given by broker
   aSymbol[158] = "EURUSD";
   aLots[158] = 1.0;
   aDate[158] = D'2011.07.26 12:10:19'+time_offset*3600;
   aPrice[158] = 1.44774;

   // ========== 159 ===== 761 ==========
   aPseudoTicket[159] = 80;
   aAction[159] = 0; // CLOSE
   aType[159] = OP_BUY; // BUY
   aTicket[159] = -1; // Ticket given by broker
   aSymbol[159] = "EURUSD";
   aLots[159] = 1.0;
   aDate[159] = D'2011.07.26 12:10:29'+time_offset*3600;
   aPrice[159] = 1.44776;

   // ========== 160 ===== 760 ==========
   aPseudoTicket[160] = 81;
   aAction[160] = 1; // OPEN
   aReturn[81] = 160;
   aType[160] = OP_BUY; // BUY
   aTicket[160] = -1; // Ticket given by broker
   aSymbol[160] = "EURUSD";
   aLots[160] = 1.0;
   aDate[160] = D'2011.07.26 13:01:13'+time_offset*3600;
   aPrice[160] = 1.44681;

   // ========== 161 ===== 760 ==========
   aPseudoTicket[161] = 81;
   aAction[161] = 0; // CLOSE
   aType[161] = OP_BUY; // BUY
   aTicket[161] = -1; // Ticket given by broker
   aSymbol[161] = "EURUSD";
   aLots[161] = 1.0;
   aDate[161] = D'2011.07.26 18:44:45'+time_offset*3600;
   aPrice[161] = 1.45133;

   // ========== 162 ===== 759 ==========
   aPseudoTicket[162] = 82;
   aAction[162] = 1; // OPEN
   aReturn[82] = 162;
   aType[162] = OP_BUY; // BUY
   aTicket[162] = -1; // Ticket given by broker
   aSymbol[162] = "EURUSD";
   aLots[162] = 1.0;
   aDate[162] = D'2011.07.27 11:32:30'+time_offset*3600;
   aPrice[162] = 1.44602;

   // ========== 163 ===== 759 ==========
   aPseudoTicket[163] = 82;
   aAction[163] = 0; // CLOSE
   aType[163] = OP_BUY; // BUY
   aTicket[163] = -1; // Ticket given by broker
   aSymbol[163] = "EURUSD";
   aLots[163] = 1.0;
   aDate[163] = D'2011.07.27 15:10:41'+time_offset*3600;
   aPrice[163] = 1.436;

   // ========== 164 ===== 758 ==========
   aPseudoTicket[164] = 83;
   aAction[164] = 1; // OPEN
   aReturn[83] = 164;
   aType[164] = OP_BUY; // BUY
   aTicket[164] = -1; // Ticket given by broker
   aSymbol[164] = "EURUSD";
   aLots[164] = 1.0;
   aDate[164] = D'2011.07.27 16:09:51'+time_offset*3600;
   aPrice[164] = 1.434;

   // ========== 165 ===== 757 ==========
   aPseudoTicket[165] = 84;
   aAction[165] = 1; // OPEN
   aReturn[84] = 165;
   aType[165] = OP_BUY; // BUY
   aTicket[165] = -1; // Ticket given by broker
   aSymbol[165] = "GBPUSD";
   aLots[165] = 1.0;
   aDate[165] = D'2011.07.28 02:55:58'+time_offset*3600;
   aPrice[165] = 1.63239;

   // ========== 166 ===== 758 ==========
   aPseudoTicket[166] = 83;
   aAction[166] = 0; // CLOSE
   aType[166] = OP_BUY; // BUY
   aTicket[166] = -1; // Ticket given by broker
   aSymbol[166] = "EURUSD";
   aLots[166] = 1.0;
   aDate[166] = D'2011.07.28 04:34:21'+time_offset*3600;
   aPrice[166] = 1.43607;

   // ========== 167 ===== 757 ==========
   aPseudoTicket[167] = 84;
   aAction[167] = 0; // CLOSE
   aType[167] = OP_BUY; // BUY
   aTicket[167] = -1; // Ticket given by broker
   aSymbol[167] = "GBPUSD";
   aLots[167] = 1.0;
   aDate[167] = D'2011.07.28 04:35:19'+time_offset*3600;
   aPrice[167] = 1.63314;

   // ========== 168 ===== 756 ==========
   aPseudoTicket[168] = 85;
   aAction[168] = 1; // OPEN
   aReturn[85] = 168;
   aType[168] = OP_SELL; // SELL
   aTicket[168] = -1; // Ticket given by broker
   aSymbol[168] = "EURUSD";
   aLots[168] = 1.0;
   aDate[168] = D'2011.07.28 09:53:06'+time_offset*3600;
   aPrice[168] = 1.43234;

   // ========== 169 ===== 756 ==========
   aPseudoTicket[169] = 85;
   aAction[169] = 0; // CLOSE
   aType[169] = OP_SELL; // SELL
   aTicket[169] = -1; // Ticket given by broker
   aSymbol[169] = "EURUSD";
   aLots[169] = 1.0;
   aDate[169] = D'2011.07.29 02:31:19'+time_offset*3600;
   aPrice[169] = 1.429;

   // ========== 170 ===== 753 ==========
   aPseudoTicket[170] = 86;
   aAction[170] = 1; // OPEN
   aReturn[86] = 170;
   aType[170] = OP_BUY; // BUY
   aTicket[170] = -1; // Ticket given by broker
   aSymbol[170] = "AUDUSD";
   aLots[170] = 1.0;
   aDate[170] = D'2011.07.29 03:00:26'+time_offset*3600;
   aPrice[170] = 1.0976;

   // ========== 171 ===== 755 ==========
   aPseudoTicket[171] = 87;
   aAction[171] = 1; // OPEN
   aReturn[87] = 171;
   aType[171] = OP_SELL; // SELL
   aTicket[171] = -1; // Ticket given by broker
   aSymbol[171] = "USDCAD";
   aLots[171] = 1.0;
   aDate[171] = D'2011.07.29 06:21:28'+time_offset*3600;
   aPrice[171] = 0.95115;

   // ========== 172 ===== 755 ==========
   aPseudoTicket[172] = 87;
   aAction[172] = 0; // CLOSE
   aType[172] = OP_SELL; // SELL
   aTicket[172] = -1; // Ticket given by broker
   aSymbol[172] = "USDCAD";
   aLots[172] = 1.0;
   aDate[172] = D'2011.07.29 12:31:42'+time_offset*3600;
   aPrice[172] = 0.95433;

   // ========== 173 ===== 754 ==========
   aPseudoTicket[173] = 88;
   aAction[173] = 1; // OPEN
   aReturn[88] = 173;
   aType[173] = OP_BUY; // BUY
   aTicket[173] = -1; // Ticket given by broker
   aSymbol[173] = "USDCAD";
   aLots[173] = 1.0;
   aDate[173] = D'2011.07.29 12:39:29'+time_offset*3600;
   aPrice[173] = 0.95606;

   // ========== 174 ===== 752 ==========
   aPseudoTicket[174] = 89;
   aAction[174] = 1; // OPEN
   aReturn[89] = 174;
   aType[174] = OP_BUY; // BUY
   aTicket[174] = -1; // Ticket given by broker
   aSymbol[174] = "GBPUSD";
   aLots[174] = 1.0;
   aDate[174] = D'2011.07.29 13:30:51'+time_offset*3600;
   aPrice[174] = 1.63988;

   // ========== 175 ===== 754 ==========
   aPseudoTicket[175] = 88;
   aAction[175] = 0; // CLOSE
   aType[175] = OP_BUY; // BUY
   aTicket[175] = -1; // Ticket given by broker
   aSymbol[175] = "USDCAD";
   aLots[175] = 1.0;
   aDate[175] = D'2011.07.29 14:57:37'+time_offset*3600;
   aPrice[175] = 0.95387;

   // ========== 176 ===== 753 ==========
   aPseudoTicket[176] = 86;
   aAction[176] = 0; // CLOSE
   aType[176] = OP_BUY; // BUY
   aTicket[176] = -1; // Ticket given by broker
   aSymbol[176] = "AUDUSD";
   aLots[176] = 1.0;
   aDate[176] = D'2011.07.29 15:07:40'+time_offset*3600;
   aPrice[176] = 1.09967;

   // ========== 177 ===== 752 ==========
   aPseudoTicket[177] = 89;
   aAction[177] = 0; // CLOSE
   aType[177] = OP_BUY; // BUY
   aTicket[177] = -1; // Ticket given by broker
   aSymbol[177] = "GBPUSD";
   aLots[177] = 1.0;
   aDate[177] = D'2011.07.29 15:10:12'+time_offset*3600;
   aPrice[177] = 1.6451;

   // ========== 178 ===== 750 ==========
   aPseudoTicket[178] = 90;
   aAction[178] = 1; // OPEN
   aReturn[90] = 178;
   aType[178] = OP_SELL; // SELL
   aTicket[178] = -1; // Ticket given by broker
   aSymbol[178] = "AUDUSD";
   aLots[178] = 1.0;
   aDate[178] = D'2011.07.31 23:11:23'+time_offset*3600;
   aPrice[178] = 1.10127;

   // ========== 179 ===== 751 ==========
   aPseudoTicket[179] = 91;
   aAction[179] = 1; // OPEN
   aReturn[91] = 179;
   aType[179] = OP_SELL; // SELL
   aTicket[179] = -1; // Ticket given by broker
   aSymbol[179] = "USDCHF";
   aLots[179] = 1.0;
   aDate[179] = D'2011.08.01 00:57:02'+time_offset*3600;
   aPrice[179] = 0.79489;

   // ========== 180 ===== 751 ==========
   aPseudoTicket[180] = 91;
   aAction[180] = 0; // CLOSE
   aType[180] = OP_SELL; // SELL
   aTicket[180] = -1; // Ticket given by broker
   aSymbol[180] = "USDCHF";
   aLots[180] = 1.0;
   aDate[180] = D'2011.08.01 04:19:10'+time_offset*3600;
   aPrice[180] = 0.79076;

   // ========== 181 ===== 750 ==========
   aPseudoTicket[181] = 90;
   aAction[181] = 0; // CLOSE
   aType[181] = OP_SELL; // SELL
   aTicket[181] = -1; // Ticket given by broker
   aSymbol[181] = "AUDUSD";
   aLots[181] = 1.0;
   aDate[181] = D'2011.08.01 09:33:22'+time_offset*3600;
   aPrice[181] = 1.10393;

   // ========== 182 ===== 749 ==========
   aPseudoTicket[182] = 92;
   aAction[182] = 1; // OPEN
   aReturn[92] = 182;
   aType[182] = OP_SELL; // SELL
   aTicket[182] = -1; // Ticket given by broker
   aSymbol[182] = "EURUSD";
   aLots[182] = 1.0;
   aDate[182] = D'2011.08.01 09:33:28'+time_offset*3600;
   aPrice[182] = 1.443;

   // ========== 183 ===== 749 ==========
   aPseudoTicket[183] = 92;
   aAction[183] = 0; // CLOSE
   aType[183] = OP_SELL; // SELL
   aTicket[183] = -1; // Ticket given by broker
   aSymbol[183] = "EURUSD";
   aLots[183] = 1.0;
   aDate[183] = D'2011.08.01 14:05:37'+time_offset*3600;
   aPrice[183] = 1.42876;

   // ========== 184 ===== 748 ==========
   aPseudoTicket[184] = 93;
   aAction[184] = 1; // OPEN
   aReturn[93] = 184;
   aType[184] = OP_SELL; // SELL
   aTicket[184] = -1; // Ticket given by broker
   aSymbol[184] = "USDCHF";
   aLots[184] = 1.0;
   aDate[184] = D'2011.08.01 20:04:41'+time_offset*3600;
   aPrice[184] = 0.7835;

   // ========== 185 ===== 747 ==========
   aPseudoTicket[185] = 94;
   aAction[185] = 1; // OPEN
   aReturn[94] = 185;
   aType[185] = OP_SELL; // SELL
   aTicket[185] = -1; // Ticket given by broker
   aSymbol[185] = "EURUSD";
   aLots[185] = 1.0;
   aDate[185] = D'2011.08.02 00:31:44'+time_offset*3600;
   aPrice[185] = 1.42684;

   // ========== 186 ===== 748 ==========
   aPseudoTicket[186] = 93;
   aAction[186] = 0; // CLOSE
   aType[186] = OP_SELL; // SELL
   aTicket[186] = -1; // Ticket given by broker
   aSymbol[186] = "USDCHF";
   aLots[186] = 1.0;
   aDate[186] = D'2011.08.02 04:56:52'+time_offset*3600;
   aPrice[186] = 0.78147;

   // ========== 187 ===== 747 ==========
   aPseudoTicket[187] = 94;
   aAction[187] = 0; // CLOSE
   aType[187] = OP_SELL; // SELL
   aTicket[187] = -1; // Ticket given by broker
   aSymbol[187] = "EURUSD";
   aLots[187] = 1.0;
   aDate[187] = D'2011.08.02 06:29:43'+time_offset*3600;
   aPrice[187] = 1.42419;

   // ========== 188 ===== 746 ==========
   aPseudoTicket[188] = 95;
   aAction[188] = 1; // OPEN
   aReturn[95] = 188;
   aType[188] = OP_SELL; // SELL
   aTicket[188] = -1; // Ticket given by broker
   aSymbol[188] = "EURUSD";
   aLots[188] = 1.0;
   aDate[188] = D'2011.08.02 09:26:21'+time_offset*3600;
   aPrice[188] = 1.41713;

   // ========== 189 ===== 744 ==========
   aPseudoTicket[189] = 96;
   aAction[189] = 1; // OPEN
   aReturn[96] = 189;
   aType[189] = OP_BUY; // BUY
   aTicket[189] = -1; // Ticket given by broker
   aSymbol[189] = "AUDUSD";
   aLots[189] = 1.0;
   aDate[189] = D'2011.08.02 12:19:39'+time_offset*3600;
   aPrice[189] = 1.08343;

   // ========== 190 ===== 746 ==========
   aPseudoTicket[190] = 95;
   aAction[190] = 0; // CLOSE
   aType[190] = OP_SELL; // SELL
   aTicket[190] = -1; // Ticket given by broker
   aSymbol[190] = "EURUSD";
   aLots[190] = 1.0;
   aDate[190] = D'2011.08.02 12:32:15'+time_offset*3600;
   aPrice[190] = 1.41688;

   // ========== 191 ===== 745 ==========
   aPseudoTicket[191] = 97;
   aAction[191] = 1; // OPEN
   aReturn[97] = 191;
   aType[191] = OP_BUY; // BUY
   aTicket[191] = -1; // Ticket given by broker
   aSymbol[191] = "AUDUSD";
   aLots[191] = 1.0;
   aDate[191] = D'2011.08.02 21:37:28'+time_offset*3600;
   aPrice[191] = 1.07824;

   // ========== 192 ===== 745 ==========
   aPseudoTicket[192] = 97;
   aAction[192] = 0; // CLOSE
   aType[192] = OP_BUY; // BUY
   aTicket[192] = -1; // Ticket given by broker
   aSymbol[192] = "AUDUSD";
   aLots[192] = 1.0;
   aDate[192] = D'2011.08.02 22:39:54'+time_offset*3600;
   aPrice[192] = 1.07601;

   // ========== 193 ===== 744 ==========
   aPseudoTicket[193] = 96;
   aAction[193] = 0; // CLOSE
   aType[193] = OP_BUY; // BUY
   aTicket[193] = -1; // Ticket given by broker
   aSymbol[193] = "AUDUSD";
   aLots[193] = 1.0;
   aDate[193] = D'2011.08.02 22:39:58'+time_offset*3600;
   aPrice[193] = 1.07596;

   // ========== 194 ===== 742 ==========
   aPseudoTicket[194] = 98;
   aAction[194] = 1; // OPEN
   aReturn[98] = 194;
   aType[194] = OP_BUY; // BUY
   aTicket[194] = -1; // Ticket given by broker
   aSymbol[194] = "AUDUSD";
   aLots[194] = 1.0;
   aDate[194] = D'2011.08.02 22:55:28'+time_offset*3600;
   aPrice[194] = 1.07394;

   // ========== 195 ===== 743 ==========
   aPseudoTicket[195] = 99;
   aAction[195] = 1; // OPEN
   aReturn[99] = 195;
   aType[195] = OP_BUY; // BUY
   aTicket[195] = -1; // Ticket given by broker
   aSymbol[195] = "AUDUSD";
   aLots[195] = 1.0;
   aDate[195] = D'2011.08.03 00:19:04'+time_offset*3600;
   aPrice[195] = 1.07294;

   // ========== 196 ===== 743 ==========
   aPseudoTicket[196] = 99;
   aAction[196] = 0; // CLOSE
   aType[196] = OP_BUY; // BUY
   aTicket[196] = -1; // Ticket given by broker
   aSymbol[196] = "AUDUSD";
   aLots[196] = 1.0;
   aDate[196] = D'2011.08.03 01:30:28'+time_offset*3600;
   aPrice[196] = 1.06851;

   // ========== 197 ===== 742 ==========
   aPseudoTicket[197] = 98;
   aAction[197] = 0; // CLOSE
   aType[197] = OP_BUY; // BUY
   aTicket[197] = -1; // Ticket given by broker
   aSymbol[197] = "AUDUSD";
   aLots[197] = 1.0;
   aDate[197] = D'2011.08.03 01:30:31'+time_offset*3600;
   aPrice[197] = 1.06897;

   // ========== 198 ===== 741 ==========
   aPseudoTicket[198] = 100;
   aAction[198] = 1; // OPEN
   aReturn[100] = 198;
   aType[198] = OP_SELL; // SELL
   aTicket[198] = -1; // Ticket given by broker
   aSymbol[198] = "GBPUSD";
   aLots[198] = 1.0;
   aDate[198] = D'2011.08.03 07:53:45'+time_offset*3600;
   aPrice[198] = 1.63029;

   // ========== 199 ===== 741 ==========
   aPseudoTicket[199] = 100;
   aAction[199] = 0; // CLOSE
   aType[199] = OP_SELL; // SELL
   aTicket[199] = -1; // Ticket given by broker
   aSymbol[199] = "GBPUSD";
   aLots[199] = 1.0;
   aDate[199] = D'2011.08.03 08:28:48'+time_offset*3600;
   aPrice[199] = 1.63575;

   // ========== 200 ===== 740 ==========
   aPseudoTicket[200] = 101;
   aAction[200] = 1; // OPEN
   aReturn[101] = 200;
   aType[200] = OP_BUY; // BUY
   aTicket[200] = -1; // Ticket given by broker
   aSymbol[200] = "GBPUSD";
   aLots[200] = 1.0;
   aDate[200] = D'2011.08.03 08:31:59'+time_offset*3600;
   aPrice[200] = 1.6365;

   // ========== 201 ===== 740 ==========
   aPseudoTicket[201] = 101;
   aAction[201] = 0; // CLOSE
   aType[201] = OP_BUY; // BUY
   aTicket[201] = -1; // Ticket given by broker
   aSymbol[201] = "GBPUSD";
   aLots[201] = 1.0;
   aDate[201] = D'2011.08.03 11:13:26'+time_offset*3600;
   aPrice[201] = 1.63873;

   // ========== 202 ===== 738 ==========
   aPseudoTicket[202] = 102;
   aAction[202] = 1; // OPEN
   aReturn[102] = 202;
   aType[202] = OP_SELL; // SELL
   aTicket[202] = -1; // Ticket given by broker
   aSymbol[202] = "AUDUSD";
   aLots[202] = 1.0;
   aDate[202] = D'2011.08.03 14:06:10'+time_offset*3600;
   aPrice[202] = 1.07283;

   // ========== 203 ===== 739 ==========
   aPseudoTicket[203] = 103;
   aAction[203] = 1; // OPEN
   aReturn[103] = 203;
   aType[203] = OP_BUY; // BUY
   aTicket[203] = -1; // Ticket given by broker
   aSymbol[203] = "GBPUSD";
   aLots[203] = 1.0;
   aDate[203] = D'2011.08.03 14:59:45'+time_offset*3600;
   aPrice[203] = 1.6413;

   // ========== 204 ===== 739 ==========
   aPseudoTicket[204] = 103;
   aAction[204] = 0; // CLOSE
   aType[204] = OP_BUY; // BUY
   aTicket[204] = -1; // Ticket given by broker
   aSymbol[204] = "GBPUSD";
   aLots[204] = 1.0;
   aDate[204] = D'2011.08.03 16:20:14'+time_offset*3600;
   aPrice[204] = 1.64071;

   // ========== 205 ===== 737 ==========
   aPseudoTicket[205] = 104;
   aAction[205] = 1; // OPEN
   aReturn[104] = 205;
   aType[205] = OP_SELL; // SELL
   aTicket[205] = -1; // Ticket given by broker
   aSymbol[205] = "USDCHF";
   aLots[205] = 1.0;
   aDate[205] = D'2011.08.04 07:34:02'+time_offset*3600;
   aPrice[205] = 0.77823;

   // ========== 206 ===== 738 ==========
   aPseudoTicket[206] = 102;
   aAction[206] = 0; // CLOSE
   aType[206] = OP_SELL; // SELL
   aTicket[206] = -1; // Ticket given by broker
   aSymbol[206] = "AUDUSD";
   aLots[206] = 1.0;
   aDate[206] = D'2011.08.04 08:25:13'+time_offset*3600;
   aPrice[206] = 1.06337;

   // ========== 207 ===== 737 ==========
   aPseudoTicket[207] = 104;
   aAction[207] = 0; // CLOSE
   aType[207] = OP_SELL; // SELL
   aTicket[207] = -1; // Ticket given by broker
   aSymbol[207] = "USDCHF";
   aLots[207] = 1.0;
   aDate[207] = D'2011.08.04 09:36:41'+time_offset*3600;
   aPrice[207] = 0.77758;

   // ========== 208 ===== 736 ==========
   aPseudoTicket[208] = 105;
   aAction[208] = 1; // OPEN
   aReturn[105] = 208;
   aType[208] = OP_SELL; // SELL
   aTicket[208] = -1; // Ticket given by broker
   aSymbol[208] = "USDJPY";
   aLots[208] = 1.0;
   aDate[208] = D'2011.08.04 10:30:14'+time_offset*3600;
   aPrice[208] = 80.029;

   // ========== 209 ===== 736 ==========
   aPseudoTicket[209] = 105;
   aAction[209] = 0; // CLOSE
   aType[209] = OP_SELL; // SELL
   aTicket[209] = -1; // Ticket given by broker
   aSymbol[209] = "USDJPY";
   aLots[209] = 1.0;
   aDate[209] = D'2011.08.04 12:15:23'+time_offset*3600;
   aPrice[209] = 79.642;

   // ========== 210 ===== 735 ==========
   aPseudoTicket[210] = 106;
   aAction[210] = 1; // OPEN
   aReturn[106] = 210;
   aType[210] = OP_BUY; // BUY
   aTicket[210] = -1; // Ticket given by broker
   aSymbol[210] = "USDJPY";
   aLots[210] = 1.0;
   aDate[210] = D'2011.08.04 13:46:20'+time_offset*3600;
   aPrice[210] = 79.148;

   // ========== 211 ===== 735 ==========
   aPseudoTicket[211] = 106;
   aAction[211] = 0; // CLOSE
   aType[211] = OP_BUY; // BUY
   aTicket[211] = -1; // Ticket given by broker
   aSymbol[211] = "USDJPY";
   aLots[211] = 1.0;
   aDate[211] = D'2011.08.04 20:12:29'+time_offset*3600;
   aPrice[211] = 79.111;

   // ========== 212 ===== 733 ==========
   aPseudoTicket[212] = 107;
   aAction[212] = 1; // OPEN
   aReturn[107] = 212;
   aType[212] = OP_BUY; // BUY
   aTicket[212] = -1; // Ticket given by broker
   aSymbol[212] = "AUDUSD";
   aLots[212] = 1.0;
   aDate[212] = D'2011.08.04 20:14:56'+time_offset*3600;
   aPrice[212] = 1.0464;

   // ========== 213 ===== 734 ==========
   aPseudoTicket[213] = 108;
   aAction[213] = 1; // OPEN
   aReturn[108] = 213;
   aType[213] = OP_BUY; // BUY
   aTicket[213] = -1; // Ticket given by broker
   aSymbol[213] = "EURUSD";
   aLots[213] = 1.0;
   aDate[213] = D'2011.08.04 23:41:13'+time_offset*3600;
   aPrice[213] = 1.4073;

   // ========== 214 ===== 734 ==========
   aPseudoTicket[214] = 108;
   aAction[214] = 0; // CLOSE
   aType[214] = OP_BUY; // BUY
   aTicket[214] = -1; // Ticket given by broker
   aSymbol[214] = "EURUSD";
   aLots[214] = 1.0;
   aDate[214] = D'2011.08.05 02:01:11'+time_offset*3600;
   aPrice[214] = 1.41058;

   // ========== 215 ===== 733 ==========
   aPseudoTicket[215] = 107;
   aAction[215] = 0; // CLOSE
   aType[215] = OP_BUY; // BUY
   aTicket[215] = -1; // Ticket given by broker
   aSymbol[215] = "AUDUSD";
   aLots[215] = 1.0;
   aDate[215] = D'2011.08.05 02:01:27'+time_offset*3600;
   aPrice[215] = 1.04886;

   // ========== 216 ===== 732 ==========
   aPseudoTicket[216] = 109;
   aAction[216] = 1; // OPEN
   aReturn[109] = 216;
   aType[216] = OP_SELL; // SELL
   aTicket[216] = -1; // Ticket given by broker
   aSymbol[216] = "EURUSD";
   aLots[216] = 1.0;
   aDate[216] = D'2011.08.05 07:27:46'+time_offset*3600;
   aPrice[216] = 1.4155;

   // ========== 217 ===== 732 ==========
   aPseudoTicket[217] = 109;
   aAction[217] = 0; // CLOSE
   aType[217] = OP_SELL; // SELL
   aTicket[217] = -1; // Ticket given by broker
   aSymbol[217] = "EURUSD";
   aLots[217] = 1.0;
   aDate[217] = D'2011.08.05 07:41:04'+time_offset*3600;
   aPrice[217] = 1.41435;

   // ========== 218 ===== 731 ==========
   aPseudoTicket[218] = 110;
   aAction[218] = 1; // OPEN
   aReturn[110] = 218;
   aType[218] = OP_SELL; // SELL
   aTicket[218] = -1; // Ticket given by broker
   aSymbol[218] = "USDCAD";
   aLots[218] = 1.0;
   aDate[218] = D'2011.08.05 08:06:54'+time_offset*3600;
   aPrice[218] = 0.97969;

   // ========== 219 ===== 730 ==========
   aPseudoTicket[219] = 111;
   aAction[219] = 1; // OPEN
   aReturn[111] = 219;
   aType[219] = OP_SELL; // SELL
   aTicket[219] = -1; // Ticket given by broker
   aSymbol[219] = "EURUSD";
   aLots[219] = 1.0;
   aDate[219] = D'2011.08.05 09:20:21'+time_offset*3600;
   aPrice[219] = 1.41623;

   // ========== 220 ===== 731 ==========
   aPseudoTicket[220] = 110;
   aAction[220] = 0; // CLOSE
   aType[220] = OP_SELL; // SELL
   aTicket[220] = -1; // Ticket given by broker
   aSymbol[220] = "USDCAD";
   aLots[220] = 1.0;
   aDate[220] = D'2011.08.05 09:34:16'+time_offset*3600;
   aPrice[220] = 0.97943;

   // ========== 221 ===== 730 ==========
   aPseudoTicket[221] = 111;
   aAction[221] = 0; // CLOSE
   aType[221] = OP_SELL; // SELL
   aTicket[221] = -1; // Ticket given by broker
   aSymbol[221] = "EURUSD";
   aLots[221] = 1.0;
   aDate[221] = D'2011.08.05 10:03:22'+time_offset*3600;
   aPrice[221] = 1.41301;

   // ========== 222 ===== 729 ==========
   aPseudoTicket[222] = 112;
   aAction[222] = 1; // OPEN
   aReturn[112] = 222;
   aType[222] = OP_SELL; // SELL
   aTicket[222] = -1; // Ticket given by broker
   aSymbol[222] = "EURUSD";
   aLots[222] = 1.0;
   aDate[222] = D'2011.08.05 11:15:11'+time_offset*3600;
   aPrice[222] = 1.41649;

   // ========== 223 ===== 729 ==========
   aPseudoTicket[223] = 112;
   aAction[223] = 0; // CLOSE
   aType[223] = OP_SELL; // SELL
   aTicket[223] = -1; // Ticket given by broker
   aSymbol[223] = "EURUSD";
   aLots[223] = 1.0;
   aDate[223] = D'2011.08.05 13:20:52'+time_offset*3600;
   aPrice[223] = 1.42;

   // ========== 224 ===== 728 ==========
   aPseudoTicket[224] = 113;
   aAction[224] = 1; // OPEN
   aReturn[113] = 224;
   aType[224] = OP_BUY; // BUY
   aTicket[224] = -1; // Ticket given by broker
   aSymbol[224] = "GBPUSD";
   aLots[224] = 1.0;
   aDate[224] = D'2011.08.05 13:31:47'+time_offset*3600;
   aPrice[224] = 1.63458;

   // ========== 225 ===== 728 ==========
   aPseudoTicket[225] = 113;
   aAction[225] = 0; // CLOSE
   aType[225] = OP_BUY; // BUY
   aTicket[225] = -1; // Ticket given by broker
   aSymbol[225] = "GBPUSD";
   aLots[225] = 1.0;
   aDate[225] = D'2011.08.05 13:47:00'+time_offset*3600;
   aPrice[225] = 1.63228;

   // ========== 226 ===== 727 ==========
   aPseudoTicket[226] = 114;
   aAction[226] = 1; // OPEN
   aReturn[114] = 226;
   aType[226] = OP_SELL; // SELL
   aTicket[226] = -1; // Ticket given by broker
   aSymbol[226] = "AUDUSD";
   aLots[226] = 1.0;
   aDate[226] = D'2011.08.05 13:55:40'+time_offset*3600;
   aPrice[226] = 1.04476;

   // ========== 227 ===== 726 ==========
   aPseudoTicket[227] = 115;
   aAction[227] = 1; // OPEN
   aReturn[115] = 227;
   aType[227] = OP_BUY; // BUY
   aTicket[227] = -1; // Ticket given by broker
   aSymbol[227] = "GBPUSD";
   aLots[227] = 1.0;
   aDate[227] = D'2011.08.05 14:14:15'+time_offset*3600;
   aPrice[227] = 1.63631;

   // ========== 228 ===== 727 ==========
   aPseudoTicket[228] = 114;
   aAction[228] = 0; // CLOSE
   aType[228] = OP_SELL; // SELL
   aTicket[228] = -1; // Ticket given by broker
   aSymbol[228] = "AUDUSD";
   aLots[228] = 1.0;
   aDate[228] = D'2011.08.05 15:01:44'+time_offset*3600;
   aPrice[228] = 1.04431;

   // ========== 229 ===== 726 ==========
   aPseudoTicket[229] = 115;
   aAction[229] = 0; // CLOSE
   aType[229] = OP_BUY; // BUY
   aTicket[229] = -1; // Ticket given by broker
   aSymbol[229] = "GBPUSD";
   aLots[229] = 1.0;
   aDate[229] = D'2011.08.05 15:40:50'+time_offset*3600;
   aPrice[229] = 1.63673;

   // ========== 230 ===== 725 ==========
   aPseudoTicket[230] = 116;
   aAction[230] = 1; // OPEN
   aReturn[116] = 230;
   aType[230] = OP_SELL; // SELL
   aTicket[230] = -1; // Ticket given by broker
   aSymbol[230] = "AUDUSD";
   aLots[230] = 1.0;
   aDate[230] = D'2011.08.05 15:47:13'+time_offset*3600;
   aPrice[230] = 1.04;

   // ========== 231 ===== 725 ==========
   aPseudoTicket[231] = 116;
   aAction[231] = 0; // CLOSE
   aType[231] = OP_SELL; // SELL
   aTicket[231] = -1; // Ticket given by broker
   aSymbol[231] = "AUDUSD";
   aLots[231] = 1.0;
   aDate[231] = D'2011.08.05 16:10:55'+time_offset*3600;
   aPrice[231] = 1.04556;

   // ========== 232 ===== 724 ==========
   aPseudoTicket[232] = 117;
   aAction[232] = 1; // OPEN
   aReturn[117] = 232;
   aType[232] = OP_BUY; // BUY
   aTicket[232] = -1; // Ticket given by broker
   aSymbol[232] = "EURUSD";
   aLots[232] = 1.0;
   aDate[232] = D'2011.08.05 16:39:23'+time_offset*3600;
   aPrice[232] = 1.42395;

   // ========== 233 ===== 724 ==========
   aPseudoTicket[233] = 117;
   aAction[233] = 0; // CLOSE
   aType[233] = OP_BUY; // BUY
   aTicket[233] = -1; // Ticket given by broker
   aSymbol[233] = "EURUSD";
   aLots[233] = 1.0;
   aDate[233] = D'2011.08.07 21:16:44'+time_offset*3600;
   aPrice[233] = 1.43911;

   // ========== 234 ===== 723 ==========
   aPseudoTicket[234] = 118;
   aAction[234] = 1; // OPEN
   aReturn[118] = 234;
   aType[234] = OP_BUY; // BUY
   aTicket[234] = -1; // Ticket given by broker
   aSymbol[234] = "EURUSD";
   aLots[234] = 1.0;
   aDate[234] = D'2011.08.07 22:58:42'+time_offset*3600;
   aPrice[234] = 1.43;

   // ========== 235 ===== 723 ==========
   aPseudoTicket[235] = 118;
   aAction[235] = 0; // CLOSE
   aType[235] = OP_BUY; // BUY
   aTicket[235] = -1; // Ticket given by broker
   aSymbol[235] = "EURUSD";
   aLots[235] = 1.0;
   aDate[235] = D'2011.08.08 01:12:04'+time_offset*3600;
   aPrice[235] = 1.4351;

   // ========== 236 ===== 722 ==========
   aPseudoTicket[236] = 119;
   aAction[236] = 1; // OPEN
   aReturn[119] = 236;
   aType[236] = OP_SELL; // SELL
   aTicket[236] = -1; // Ticket given by broker
   aSymbol[236] = "USDCAD";
   aLots[236] = 1.0;
   aDate[236] = D'2011.08.08 19:53:35'+time_offset*3600;
   aPrice[236] = 0.99018;

   // ========== 237 ===== 722 ==========
   aPseudoTicket[237] = 119;
   aAction[237] = 0; // CLOSE
   aType[237] = OP_SELL; // SELL
   aTicket[237] = -1; // Ticket given by broker
   aSymbol[237] = "USDCAD";
   aLots[237] = 1.0;
   aDate[237] = D'2011.08.09 02:28:59'+time_offset*3600;
   aPrice[237] = 1.0;

   // ========== 238 ===== 721 ==========
   aPseudoTicket[238] = 120;
   aAction[238] = 1; // OPEN
   aReturn[120] = 238;
   aType[238] = OP_SELL; // SELL
   aTicket[238] = -1; // Ticket given by broker
   aSymbol[238] = "USDCAD";
   aLots[238] = 1.0;
   aDate[238] = D'2011.08.09 03:16:50'+time_offset*3600;
   aPrice[238] = 0.99883;

   // ========== 239 ===== 720 ==========
   aPseudoTicket[239] = 121;
   aAction[239] = 1; // OPEN
   aReturn[121] = 239;
   aType[239] = OP_SELL; // SELL
   aTicket[239] = -1; // Ticket given by broker
   aSymbol[239] = "AUDUSD";
   aLots[239] = 1.0;
   aDate[239] = D'2011.08.09 05:06:07'+time_offset*3600;
   aPrice[239] = 1.0131;

   // ========== 240 ===== 721 ==========
   aPseudoTicket[240] = 120;
   aAction[240] = 0; // CLOSE
   aType[240] = OP_SELL; // SELL
   aTicket[240] = -1; // Ticket given by broker
   aSymbol[240] = "USDCAD";
   aLots[240] = 1.0;
   aDate[240] = D'2011.08.09 06:04:58'+time_offset*3600;
   aPrice[240] = 0.99469;

   // ========== 241 ===== 720 ==========
   aPseudoTicket[241] = 121;
   aAction[241] = 0; // CLOSE
   aType[241] = OP_SELL; // SELL
   aTicket[241] = -1; // Ticket given by broker
   aSymbol[241] = "AUDUSD";
   aLots[241] = 1.0;
   aDate[241] = D'2011.08.09 07:00:08'+time_offset*3600;
   aPrice[241] = 1.0231;

   // ========== 242 ===== 719 ==========
   aPseudoTicket[242] = 122;
   aAction[242] = 1; // OPEN
   aReturn[122] = 242;
   aType[242] = OP_SELL; // SELL
   aTicket[242] = -1; // Ticket given by broker
   aSymbol[242] = "AUDUSD";
   aLots[242] = 1.0;
   aDate[242] = D'2011.08.09 07:06:44'+time_offset*3600;
   aPrice[242] = 1.02241;

   // ========== 243 ===== 719 ==========
   aPseudoTicket[243] = 122;
   aAction[243] = 0; // CLOSE
   aType[243] = OP_SELL; // SELL
   aTicket[243] = -1; // Ticket given by broker
   aSymbol[243] = "AUDUSD";
   aLots[243] = 1.0;
   aDate[243] = D'2011.08.09 07:44:57'+time_offset*3600;
   aPrice[243] = 1.01488;

   // ========== 244 ===== 718 ==========
   aPseudoTicket[244] = 123;
   aAction[244] = 1; // OPEN
   aReturn[123] = 244;
   aType[244] = OP_BUY; // BUY
   aTicket[244] = -1; // Ticket given by broker
   aSymbol[244] = "USDJPY";
   aLots[244] = 1.0;
   aDate[244] = D'2011.08.09 10:00:33'+time_offset*3600;
   aPrice[244] = 77.064;

   // ========== 245 ===== 718 ==========
   aPseudoTicket[245] = 123;
   aAction[245] = 0; // CLOSE
   aType[245] = OP_BUY; // BUY
   aTicket[245] = -1; // Ticket given by broker
   aSymbol[245] = "USDJPY";
   aLots[245] = 1.0;
   aDate[245] = D'2011.08.09 13:37:18'+time_offset*3600;
   aPrice[245] = 77.221;

   // ========== 246 ===== 717 ==========
   aPseudoTicket[246] = 124;
   aAction[246] = 1; // OPEN
   aReturn[124] = 246;
   aType[246] = OP_SELL; // SELL
   aTicket[246] = -1; // Ticket given by broker
   aSymbol[246] = "AUDUSD";
   aLots[246] = 1.0;
   aDate[246] = D'2011.08.09 20:20:12'+time_offset*3600;
   aPrice[246] = 1.03526;

   // ========== 247 ===== 715 ==========
   aPseudoTicket[247] = 125;
   aAction[247] = 1; // OPEN
   aReturn[125] = 247;
   aType[247] = OP_BUY; // BUY
   aTicket[247] = -1; // Ticket given by broker
   aSymbol[247] = "EURUSD";
   aLots[247] = 1.0;
   aDate[247] = D'2011.08.09 23:47:00'+time_offset*3600;
   aPrice[247] = 1.43699;

   // ========== 248 ===== 717 ==========
   aPseudoTicket[248] = 124;
   aAction[248] = 0; // CLOSE
   aType[248] = OP_SELL; // SELL
   aTicket[248] = -1; // Ticket given by broker
   aSymbol[248] = "AUDUSD";
   aLots[248] = 1.0;
   aDate[248] = D'2011.08.10 00:02:38'+time_offset*3600;
   aPrice[248] = 1.03419;

   // ========== 249 ===== 716 ==========
   aPseudoTicket[249] = 126;
   aAction[249] = 1; // OPEN
   aReturn[126] = 249;
   aType[249] = OP_SELL; // SELL
   aTicket[249] = -1; // Ticket given by broker
   aSymbol[249] = "USDCHF";
   aLots[249] = 1.0;
   aDate[249] = D'2011.08.10 05:34:29'+time_offset*3600;
   aPrice[249] = 0.7267;

   // ========== 250 ===== 716 ==========
   aPseudoTicket[250] = 126;
   aAction[250] = 0; // CLOSE
   aType[250] = OP_SELL; // SELL
   aTicket[250] = -1; // Ticket given by broker
   aSymbol[250] = "USDCHF";
   aLots[250] = 1.0;
   aDate[250] = D'2011.08.10 06:40:05'+time_offset*3600;
   aPrice[250] = 0.7217;

   // ========== 251 ===== 714 ==========
   aPseudoTicket[251] = 127;
   aAction[251] = 1; // OPEN
   aReturn[127] = 251;
   aType[251] = OP_BUY; // BUY
   aTicket[251] = -1; // Ticket given by broker
   aSymbol[251] = "USDJPY";
   aLots[251] = 1.0;
   aDate[251] = D'2011.08.10 08:09:40'+time_offset*3600;
   aPrice[251] = 76.67;

   // ========== 252 ===== 715 ==========
   aPseudoTicket[252] = 125;
   aAction[252] = 0; // CLOSE
   aType[252] = OP_BUY; // BUY
   aTicket[252] = -1; // Ticket given by broker
   aSymbol[252] = "EURUSD";
   aLots[252] = 1.0;
   aDate[252] = D'2011.08.10 09:40:03'+time_offset*3600;
   aPrice[252] = 1.4384;

   // ========== 253 ===== 712 ==========
   aPseudoTicket[253] = 128;
   aAction[253] = 1; // OPEN
   aReturn[128] = 253;
   aType[253] = OP_SELL; // SELL
   aTicket[253] = -1; // Ticket given by broker
   aSymbol[253] = "EURUSD";
   aLots[253] = 1.0;
   aDate[253] = D'2011.08.10 12:51:52'+time_offset*3600;
   aPrice[253] = 1.43023;

   // ========== 254 ===== 714 ==========
   aPseudoTicket[254] = 127;
   aAction[254] = 0; // CLOSE
   aType[254] = OP_BUY; // BUY
   aTicket[254] = -1; // Ticket given by broker
   aSymbol[254] = "USDJPY";
   aLots[254] = 1.0;
   aDate[254] = D'2011.08.10 14:50:19'+time_offset*3600;
   aPrice[254] = 76.516;

   // ========== 255 ===== 713 ==========
   aPseudoTicket[255] = 129;
   aAction[255] = 1; // OPEN
   aReturn[129] = 255;
   aType[255] = OP_SELL; // SELL
   aTicket[255] = -1; // Ticket given by broker
   aSymbol[255] = "GBPUSD";
   aLots[255] = 1.0;
   aDate[255] = D'2011.08.10 16:07:18'+time_offset*3600;
   aPrice[255] = 1.61817;

   // ========== 256 ===== 713 ==========
   aPseudoTicket[256] = 129;
   aAction[256] = 0; // CLOSE
   aType[256] = OP_SELL; // SELL
   aTicket[256] = -1; // Ticket given by broker
   aSymbol[256] = "GBPUSD";
   aLots[256] = 1.0;
   aDate[256] = D'2011.08.10 22:19:04'+time_offset*3600;
   aPrice[256] = 1.61267;

   // ========== 257 ===== 712 ==========
   aPseudoTicket[257] = 128;
   aAction[257] = 0; // CLOSE
   aType[257] = OP_SELL; // SELL
   aTicket[257] = -1; // Ticket given by broker
   aSymbol[257] = "EURUSD";
   aLots[257] = 1.0;
   aDate[257] = D'2011.08.10 22:20:12'+time_offset*3600;
   aPrice[257] = 1.4146;

   // ========== 258 ===== 709 ==========
   aPseudoTicket[258] = 130;
   aAction[258] = 1; // OPEN
   aReturn[130] = 258;
   aType[258] = OP_SELL; // SELL
   aTicket[258] = -1; // Ticket given by broker
   aSymbol[258] = "EURUSD";
   aLots[258] = 1.0;
   aDate[258] = D'2011.08.11 01:48:26'+time_offset*3600;
   aPrice[258] = 1.421;

   // ========== 259 ===== 711 ==========
   aPseudoTicket[259] = 131;
   aAction[259] = 1; // OPEN
   aReturn[131] = 259;
   aType[259] = OP_BUY; // BUY
   aTicket[259] = -1; // Ticket given by broker
   aSymbol[259] = "USDCHF";
   aLots[259] = 1.0;
   aDate[259] = D'2011.08.11 05:57:22'+time_offset*3600;
   aPrice[259] = 0.73175;

   // ========== 260 ===== 711 ==========
   aPseudoTicket[260] = 131;
   aAction[260] = 0; // CLOSE
   aType[260] = OP_BUY; // BUY
   aTicket[260] = -1; // Ticket given by broker
   aSymbol[260] = "USDCHF";
   aLots[260] = 1.0;
   aDate[260] = D'2011.08.11 06:11:36'+time_offset*3600;
   aPrice[260] = 0.72875;

   // ========== 261 ===== 710 ==========
   aPseudoTicket[261] = 132;
   aAction[261] = 1; // OPEN
   aReturn[132] = 261;
   aType[261] = OP_SELL; // SELL
   aTicket[261] = -1; // Ticket given by broker
   aSymbol[261] = "GBPUSD";
   aLots[261] = 1.0;
   aDate[261] = D'2011.08.11 06:43:29'+time_offset*3600;
   aPrice[261] = 1.61966;

   // ========== 262 ===== 710 ==========
   aPseudoTicket[262] = 132;
   aAction[262] = 0; // CLOSE
   aType[262] = OP_SELL; // SELL
   aTicket[262] = -1; // Ticket given by broker
   aSymbol[262] = "GBPUSD";
   aLots[262] = 1.0;
   aDate[262] = D'2011.08.11 08:11:24'+time_offset*3600;
   aPrice[262] = 1.61825;

   // ========== 263 ===== 709 ==========
   aPseudoTicket[263] = 130;
   aAction[263] = 0; // CLOSE
   aType[263] = OP_SELL; // SELL
   aTicket[263] = -1; // Ticket given by broker
   aSymbol[263] = "EURUSD";
   aLots[263] = 1.0;
   aDate[263] = D'2011.08.11 10:03:13'+time_offset*3600;
   aPrice[263] = 1.41711;

   // ========== 264 ===== 708 ==========
   aPseudoTicket[264] = 133;
   aAction[264] = 1; // OPEN
   aReturn[133] = 264;
   aType[264] = OP_SELL; // SELL
   aTicket[264] = -1; // Ticket given by broker
   aSymbol[264] = "EURUSD";
   aLots[264] = 1.0;
   aDate[264] = D'2011.08.11 11:42:13'+time_offset*3600;
   aPrice[264] = 1.41499;

   // ========== 265 ===== 708 ==========
   aPseudoTicket[265] = 133;
   aAction[265] = 0; // CLOSE
   aType[265] = OP_SELL; // SELL
   aTicket[265] = -1; // Ticket given by broker
   aSymbol[265] = "EURUSD";
   aLots[265] = 1.0;
   aDate[265] = D'2011.08.11 13:00:36'+time_offset*3600;
   aPrice[265] = 1.41671;

   // ========== 266 ===== 707 ==========
   aPseudoTicket[266] = 134;
   aAction[266] = 1; // OPEN
   aReturn[134] = 266;
   aType[266] = OP_SELL; // SELL
   aTicket[266] = -1; // Ticket given by broker
   aSymbol[266] = "USDCHF";
   aLots[266] = 1.0;
   aDate[266] = D'2011.08.11 14:00:22'+time_offset*3600;
   aPrice[266] = 0.76761;

   // ========== 267 ===== 707 ==========
   aPseudoTicket[267] = 134;
   aAction[267] = 0; // CLOSE
   aType[267] = OP_SELL; // SELL
   aTicket[267] = -1; // Ticket given by broker
   aSymbol[267] = "USDCHF";
   aLots[267] = 1.0;
   aDate[267] = D'2011.08.11 14:45:59'+time_offset*3600;
   aPrice[267] = 0.76084;

   // ========== 268 ===== 706 ==========
   aPseudoTicket[268] = 135;
   aAction[268] = 1; // OPEN
   aReturn[135] = 268;
   aType[268] = OP_SELL; // SELL
   aTicket[268] = -1; // Ticket given by broker
   aSymbol[268] = "EURUSD";
   aLots[268] = 1.0;
   aDate[268] = D'2011.08.12 07:11:56'+time_offset*3600;
   aPrice[268] = 1.41596;

   // ========== 269 ===== 706 ==========
   aPseudoTicket[269] = 135;
   aAction[269] = 0; // CLOSE
   aType[269] = OP_SELL; // SELL
   aTicket[269] = -1; // Ticket given by broker
   aSymbol[269] = "EURUSD";
   aLots[269] = 1.0;
   aDate[269] = D'2011.08.12 07:32:55'+time_offset*3600;
   aPrice[269] = 1.41792;

   // ========== 270 ===== 705 ==========
   aPseudoTicket[270] = 136;
   aAction[270] = 1; // OPEN
   aReturn[136] = 270;
   aType[270] = OP_BUY; // BUY
   aTicket[270] = -1; // Ticket given by broker
   aSymbol[270] = "GBPUSD";
   aLots[270] = 1.0;
   aDate[270] = D'2011.08.12 09:10:00'+time_offset*3600;
   aPrice[270] = 1.62892;

   // ========== 271 ===== 705 ==========
   aPseudoTicket[271] = 136;
   aAction[271] = 0; // CLOSE
   aType[271] = OP_BUY; // BUY
   aTicket[271] = -1; // Ticket given by broker
   aSymbol[271] = "GBPUSD";
   aLots[271] = 1.0;
   aDate[271] = D'2011.08.12 13:36:19'+time_offset*3600;
   aPrice[271] = 1.62906;

   // ========== 272 ===== 704 ==========
   aPseudoTicket[272] = 137;
   aAction[272] = 1; // OPEN
   aReturn[137] = 272;
   aType[272] = OP_BUY; // BUY
   aTicket[272] = -1; // Ticket given by broker
   aSymbol[272] = "USDCHF";
   aLots[272] = 1.0;
   aDate[272] = D'2011.08.12 14:47:48'+time_offset*3600;
   aPrice[272] = 0.77358;

   // ========== 273 ===== 704 ==========
   aPseudoTicket[273] = 137;
   aAction[273] = 0; // CLOSE
   aType[273] = OP_BUY; // BUY
   aTicket[273] = -1; // Ticket given by broker
   aSymbol[273] = "USDCHF";
   aLots[273] = 1.0;
   aDate[273] = D'2011.08.12 15:36:25'+time_offset*3600;
   aPrice[273] = 0.768;

   // ========== 274 ===== 702 ==========
   aPseudoTicket[274] = 138;
   aAction[274] = 1; // OPEN
   aReturn[138] = 274;
   aType[274] = OP_SELL; // SELL
   aTicket[274] = -1; // Ticket given by broker
   aSymbol[274] = "USDCHF";
   aLots[274] = 1.0;
   aDate[274] = D'2011.08.15 00:18:17'+time_offset*3600;
   aPrice[274] = 0.78765;

   // ========== 275 ===== 703 ==========
   aPseudoTicket[275] = 139;
   aAction[275] = 1; // OPEN
   aReturn[139] = 275;
   aType[275] = OP_SELL; // SELL
   aTicket[275] = -1; // Ticket given by broker
   aSymbol[275] = "USDCHF";
   aLots[275] = 1.0;
   aDate[275] = D'2011.08.15 06:11:24'+time_offset*3600;
   aPrice[275] = 0.79818;

   // ========== 276 ===== 703 ==========
   aPseudoTicket[276] = 139;
   aAction[276] = 0; // CLOSE
   aType[276] = OP_SELL; // SELL
   aTicket[276] = -1; // Ticket given by broker
   aSymbol[276] = "USDCHF";
   aLots[276] = 1.0;
   aDate[276] = D'2011.08.15 12:54:02'+time_offset*3600;
   aPrice[276] = 0.7877;

   // ========== 277 ===== 698 ==========
   aPseudoTicket[277] = 140;
   aAction[277] = 1; // OPEN
   aReturn[140] = 277;
   aType[277] = OP_BUY; // BUY
   aTicket[277] = -1; // Ticket given by broker
   aSymbol[277] = "EURUSD";
   aLots[277] = 1.0;
   aDate[277] = D'2011.08.15 12:55:01'+time_offset*3600;
   aPrice[277] = 1.43703;

   // ========== 278 ===== 702 ==========
   aPseudoTicket[278] = 138;
   aAction[278] = 0; // CLOSE
   aType[278] = OP_SELL; // SELL
   aTicket[278] = -1; // Ticket given by broker
   aSymbol[278] = "USDCHF";
   aLots[278] = 1.0;
   aDate[278] = D'2011.08.15 13:18:19'+time_offset*3600;
   aPrice[278] = 0.78452;

   // ========== 279 ===== 701 ==========
   aPseudoTicket[279] = 141;
   aAction[279] = 1; // OPEN
   aReturn[141] = 279;
   aType[279] = OP_SELL; // SELL
   aTicket[279] = -1; // Ticket given by broker
   aSymbol[279] = "AUDUSD";
   aLots[279] = 1.0;
   aDate[279] = D'2011.08.16 02:40:45'+time_offset*3600;
   aPrice[279] = 1.0496;

   // ========== 280 ===== 701 ==========
   aPseudoTicket[280] = 141;
   aAction[280] = 0; // CLOSE
   aType[280] = OP_SELL; // SELL
   aTicket[280] = -1; // Ticket given by broker
   aSymbol[280] = "AUDUSD";
   aLots[280] = 1.0;
   aDate[280] = D'2011.08.16 03:21:48'+time_offset*3600;
   aPrice[280] = 1.04856;

   // ========== 281 ===== 700 ==========
   aPseudoTicket[281] = 142;
   aAction[281] = 1; // OPEN
   aReturn[142] = 281;
   aType[281] = OP_BUY; // BUY
   aTicket[281] = -1; // Ticket given by broker
   aSymbol[281] = "EURUSD";
   aLots[281] = 1.0;
   aDate[281] = D'2011.08.16 05:41:18'+time_offset*3600;
   aPrice[281] = 1.44165;

   // ========== 282 ===== 700 ==========
   aPseudoTicket[282] = 142;
   aAction[282] = 0; // CLOSE
   aType[282] = OP_BUY; // BUY
   aTicket[282] = -1; // Ticket given by broker
   aSymbol[282] = "EURUSD";
   aLots[282] = 1.0;
   aDate[282] = D'2011.08.16 13:53:55'+time_offset*3600;
   aPrice[282] = 1.4389;

   // ========== 283 ===== 699 ==========
   aPseudoTicket[283] = 143;
   aAction[283] = 1; // OPEN
   aReturn[143] = 283;
   aType[283] = OP_SELL; // SELL
   aTicket[283] = -1; // Ticket given by broker
   aSymbol[283] = "USDCHF";
   aLots[283] = 1.0;
   aDate[283] = D'2011.08.17 07:01:47'+time_offset*3600;
   aPrice[283] = 0.79118;

   // ========== 284 ===== 699 ==========
   aPseudoTicket[284] = 143;
   aAction[284] = 0; // CLOSE
   aType[284] = OP_SELL; // SELL
   aTicket[284] = -1; // Ticket given by broker
   aSymbol[284] = "USDCHF";
   aLots[284] = 1.0;
   aDate[284] = D'2011.08.17 07:05:17'+time_offset*3600;
   aPrice[284] = 0.78702;

   // ========== 285 ===== 698 ==========
   aPseudoTicket[285] = 140;
   aAction[285] = 0; // CLOSE
   aType[285] = OP_BUY; // BUY
   aTicket[285] = -1; // Ticket given by broker
   aSymbol[285] = "EURUSD";
   aLots[285] = 1.0;
   aDate[285] = D'2011.08.17 07:06:17'+time_offset*3600;
   aPrice[285] = 1.435;

   // ========== 286 ===== 697 ==========
   aPseudoTicket[286] = 144;
   aAction[286] = 1; // OPEN
   aReturn[144] = 286;
   aType[286] = OP_SELL; // SELL
   aTicket[286] = -1; // Ticket given by broker
   aSymbol[286] = "EURUSD";
   aLots[286] = 1.0;
   aDate[286] = D'2011.08.17 07:07:00'+time_offset*3600;
   aPrice[286] = 1.43362;

   // ========== 287 ===== 697 ==========
   aPseudoTicket[287] = 144;
   aAction[287] = 0; // CLOSE
   aType[287] = OP_SELL; // SELL
   aTicket[287] = -1; // Ticket given by broker
   aSymbol[287] = "EURUSD";
   aLots[287] = 1.0;
   aDate[287] = D'2011.08.17 07:27:32'+time_offset*3600;
   aPrice[287] = 1.438;

   // ========== 288 ===== 696 ==========
   aPseudoTicket[288] = 145;
   aAction[288] = 1; // OPEN
   aReturn[145] = 288;
   aType[288] = OP_BUY; // BUY
   aTicket[288] = -1; // Ticket given by broker
   aSymbol[288] = "EURUSD";
   aLots[288] = 1.0;
   aDate[288] = D'2011.08.17 08:06:25'+time_offset*3600;
   aPrice[288] = 1.44041;

   // ========== 289 ===== 695 ==========
   aPseudoTicket[289] = 146;
   aAction[289] = 1; // OPEN
   aReturn[146] = 289;
   aType[289] = OP_SELL; // SELL
   aTicket[289] = -1; // Ticket given by broker
   aSymbol[289] = "AUDUSD";
   aLots[289] = 1.0;
   aDate[289] = D'2011.08.17 14:10:39'+time_offset*3600;
   aPrice[289] = 1.05851;

   // ========== 290 ===== 696 ==========
   aPseudoTicket[290] = 145;
   aAction[290] = 0; // CLOSE
   aType[290] = OP_BUY; // BUY
   aTicket[290] = -1; // Ticket given by broker
   aSymbol[290] = "EURUSD";
   aLots[290] = 1.0;
   aDate[290] = D'2011.08.17 15:16:27'+time_offset*3600;
   aPrice[290] = 1.44327;

   // ========== 291 ===== 694 ==========
   aPseudoTicket[291] = 147;
   aAction[291] = 1; // OPEN
   aReturn[147] = 291;
   aType[291] = OP_BUY; // BUY
   aTicket[291] = -1; // Ticket given by broker
   aSymbol[291] = "EURUSD";
   aLots[291] = 1.0;
   aDate[291] = D'2011.08.17 15:36:51'+time_offset*3600;
   aPrice[291] = 1.44309;

   // ========== 292 ===== 695 ==========
   aPseudoTicket[292] = 146;
   aAction[292] = 0; // CLOSE
   aType[292] = OP_SELL; // SELL
   aTicket[292] = -1; // Ticket given by broker
   aSymbol[292] = "AUDUSD";
   aLots[292] = 1.0;
   aDate[292] = D'2011.08.17 15:37:28'+time_offset*3600;
   aPrice[292] = 1.05658;

   // ========== 293 ===== 693 ==========
   aPseudoTicket[293] = 148;
   aAction[293] = 1; // OPEN
   aReturn[148] = 293;
   aType[293] = OP_BUY; // BUY
   aTicket[293] = -1; // Ticket given by broker
   aSymbol[293] = "EURUSD";
   aLots[293] = 1.0;
   aDate[293] = D'2011.08.18 00:03:13'+time_offset*3600;
   aPrice[293] = 1.44142;

   // ========== 294 ===== 694 ==========
   aPseudoTicket[294] = 147;
   aAction[294] = 0; // CLOSE
   aType[294] = OP_BUY; // BUY
   aTicket[294] = -1; // Ticket given by broker
   aSymbol[294] = "EURUSD";
   aLots[294] = 1.0;
   aDate[294] = D'2011.08.18 01:16:14'+time_offset*3600;
   aPrice[294] = 1.44;

   // ========== 295 ===== 693 ==========
   aPseudoTicket[295] = 148;
   aAction[295] = 0; // CLOSE
   aType[295] = OP_BUY; // BUY
   aTicket[295] = -1; // Ticket given by broker
   aSymbol[295] = "EURUSD";
   aLots[295] = 1.0;
   aDate[295] = D'2011.08.18 06:07:35'+time_offset*3600;
   aPrice[295] = 1.439;

   // ========== 296 ===== 692 ==========
   aPseudoTicket[296] = 149;
   aAction[296] = 1; // OPEN
   aReturn[149] = 296;
   aType[296] = OP_BUY; // BUY
   aTicket[296] = -1; // Ticket given by broker
   aSymbol[296] = "GBPUSD";
   aLots[296] = 1.0;
   aDate[296] = D'2011.08.18 10:40:40'+time_offset*3600;
   aPrice[296] = 1.64966;

   // ========== 297 ===== 692 ==========
   aPseudoTicket[297] = 149;
   aAction[297] = 0; // CLOSE
   aType[297] = OP_BUY; // BUY
   aTicket[297] = -1; // Ticket given by broker
   aSymbol[297] = "GBPUSD";
   aLots[297] = 1.0;
   aDate[297] = D'2011.08.18 13:13:21'+time_offset*3600;
   aPrice[297] = 1.65169;

   // ========== 298 ===== 690 ==========
   aPseudoTicket[298] = 150;
   aAction[298] = 1; // OPEN
   aReturn[150] = 298;
   aType[298] = OP_SELL; // SELL
   aTicket[298] = -1; // Ticket given by broker
   aSymbol[298] = "GBPUSD";
   aLots[298] = 1.0;
   aDate[298] = D'2011.08.18 13:44:47'+time_offset*3600;
   aPrice[298] = 1.64829;

   // ========== 299 ===== 691 ==========
   aPseudoTicket[299] = 151;
   aAction[299] = 1; // OPEN
   aReturn[151] = 299;
   aType[299] = OP_SELL; // SELL
   aTicket[299] = -1; // Ticket given by broker
   aSymbol[299] = "USDCHF";
   aLots[299] = 1.0;
   aDate[299] = D'2011.08.18 14:01:57'+time_offset*3600;
   aPrice[299] = 0.78768;

   // ========== 300 ===== 691 ==========
   aPseudoTicket[300] = 151;
   aAction[300] = 0; // CLOSE
   aType[300] = OP_SELL; // SELL
   aTicket[300] = -1; // Ticket given by broker
   aSymbol[300] = "USDCHF";
   aLots[300] = 1.0;
   aDate[300] = D'2011.08.18 14:24:13'+time_offset*3600;
   aPrice[300] = 0.78912;

   // ========== 301 ===== 690 ==========
   aPseudoTicket[301] = 150;
   aAction[301] = 0; // CLOSE
   aType[301] = OP_SELL; // SELL
   aTicket[301] = -1; // Ticket given by broker
   aSymbol[301] = "GBPUSD";
   aLots[301] = 1.0;
   aDate[301] = D'2011.08.18 14:30:10'+time_offset*3600;
   aPrice[301] = 1.64479;

   // ========== 302 ===== 689 ==========
   aPseudoTicket[302] = 152;
   aAction[302] = 1; // OPEN
   aReturn[152] = 302;
   aType[302] = OP_SELL; // SELL
   aTicket[302] = -1; // Ticket given by broker
   aSymbol[302] = "EURUSD";
   aLots[302] = 1.0;
   aDate[302] = D'2011.08.18 14:50:48'+time_offset*3600;
   aPrice[302] = 1.43041;

   // ========== 303 ===== 689 ==========
   aPseudoTicket[303] = 152;
   aAction[303] = 0; // CLOSE
   aType[303] = OP_SELL; // SELL
   aTicket[303] = -1; // Ticket given by broker
   aSymbol[303] = "EURUSD";
   aLots[303] = 1.0;
   aDate[303] = D'2011.08.19 00:14:43'+time_offset*3600;
   aPrice[303] = 1.43028;

   // ========== 304 ===== 686 ==========
   aPseudoTicket[304] = 153;
   aAction[304] = 1; // OPEN
   aReturn[153] = 304;
   aType[304] = OP_SELL; // SELL
   aTicket[304] = -1; // Ticket given by broker
   aSymbol[304] = "EURUSD";
   aLots[304] = 1.0;
   aDate[304] = D'2011.08.19 02:02:11'+time_offset*3600;
   aPrice[304] = 1.4314;

   // ========== 305 ===== 688 ==========
   aPseudoTicket[305] = 154;
   aAction[305] = 1; // OPEN
   aReturn[154] = 305;
   aType[305] = OP_SELL; // SELL
   aTicket[305] = -1; // Ticket given by broker
   aSymbol[305] = "USDCHF";
   aLots[305] = 1.0;
   aDate[305] = D'2011.08.19 06:56:28'+time_offset*3600;
   aPrice[305] = 0.79049;

   // ========== 306 ===== 688 ==========
   aPseudoTicket[306] = 154;
   aAction[306] = 0; // CLOSE
   aType[306] = OP_SELL; // SELL
   aTicket[306] = -1; // Ticket given by broker
   aSymbol[306] = "USDCHF";
   aLots[306] = 1.0;
   aDate[306] = D'2011.08.19 07:50:35'+time_offset*3600;
   aPrice[306] = 0.78996;

   // ========== 307 ===== 687 ==========
   aPseudoTicket[307] = 155;
   aAction[307] = 1; // OPEN
   aReturn[155] = 307;
   aType[307] = OP_SELL; // SELL
   aTicket[307] = -1; // Ticket given by broker
   aSymbol[307] = "EURUSD";
   aLots[307] = 1.0;
   aDate[307] = D'2011.08.19 08:26:22'+time_offset*3600;
   aPrice[307] = 1.42904;

   // ========== 308 ===== 687 ==========
   aPseudoTicket[308] = 155;
   aAction[308] = 0; // CLOSE
   aType[308] = OP_SELL; // SELL
   aTicket[308] = -1; // Ticket given by broker
   aSymbol[308] = "EURUSD";
   aLots[308] = 1.0;
   aDate[308] = D'2011.08.19 08:27:31'+time_offset*3600;
   aPrice[308] = 1.42898;

   // ========== 309 ===== 686 ==========
   aPseudoTicket[309] = 153;
   aAction[309] = 0; // CLOSE
   aType[309] = OP_SELL; // SELL
   aTicket[309] = -1; // Ticket given by broker
   aSymbol[309] = "EURUSD";
   aLots[309] = 1.0;
   aDate[309] = D'2011.08.19 09:03:48'+time_offset*3600;
   aPrice[309] = 1.43324;

   // ========== 310 ===== 685 ==========
   aPseudoTicket[310] = 156;
   aAction[310] = 1; // OPEN
   aReturn[156] = 310;
   aType[310] = OP_SELL; // SELL
   aTicket[310] = -1; // Ticket given by broker
   aSymbol[310] = "EURUSD";
   aLots[310] = 1.0;
   aDate[310] = D'2011.08.19 11:08:12'+time_offset*3600;
   aPrice[310] = 1.43119;

   // ========== 311 ===== 685 ==========
   aPseudoTicket[311] = 156;
   aAction[311] = 0; // CLOSE
   aType[311] = OP_SELL; // SELL
   aTicket[311] = -1; // Ticket given by broker
   aSymbol[311] = "EURUSD";
   aLots[311] = 1.0;
   aDate[311] = D'2011.08.19 11:50:54'+time_offset*3600;
   aPrice[311] = 1.43572;

   // ========== 312 ===== 684 ==========
   aPseudoTicket[312] = 157;
   aAction[312] = 1; // OPEN
   aReturn[157] = 312;
   aType[312] = OP_BUY; // BUY
   aTicket[312] = -1; // Ticket given by broker
   aSymbol[312] = "EURUSD";
   aLots[312] = 1.0;
   aDate[312] = D'2011.08.19 12:07:17'+time_offset*3600;
   aPrice[312] = 1.43935;

   // ========== 313 ===== 683 ==========
   aPseudoTicket[313] = 158;
   aAction[313] = 1; // OPEN
   aReturn[158] = 313;
   aType[313] = OP_SELL; // SELL
   aTicket[313] = -1; // Ticket given by broker
   aSymbol[313] = "AUDUSD";
   aLots[313] = 1.0;
   aDate[313] = D'2011.08.19 12:13:24'+time_offset*3600;
   aPrice[313] = 1.04373;

   // ========== 314 ===== 684 ==========
   aPseudoTicket[314] = 157;
   aAction[314] = 0; // CLOSE
   aType[314] = OP_BUY; // BUY
   aTicket[314] = -1; // Ticket given by broker
   aSymbol[314] = "EURUSD";
   aLots[314] = 1.0;
   aDate[314] = D'2011.08.19 13:52:08'+time_offset*3600;
   aPrice[314] = 1.44157;

   // ========== 315 ===== 682 ==========
   aPseudoTicket[315] = 159;
   aAction[315] = 1; // OPEN
   aReturn[159] = 315;
   aType[315] = OP_BUY; // BUY
   aTicket[315] = -1; // Ticket given by broker
   aSymbol[315] = "GBPUSD";
   aLots[315] = 1.0;
   aDate[315] = D'2011.08.19 17:29:04'+time_offset*3600;
   aPrice[315] = 1.652;

   // ========== 316 ===== 683 ==========
   aPseudoTicket[316] = 158;
   aAction[316] = 0; // CLOSE
   aType[316] = OP_SELL; // SELL
   aTicket[316] = -1; // Ticket given by broker
   aSymbol[316] = "AUDUSD";
   aLots[316] = 1.0;
   aDate[316] = D'2011.08.19 17:41:47'+time_offset*3600;
   aPrice[316] = 1.04214;

   // ========== 317 ===== 681 ==========
   aPseudoTicket[317] = 160;
   aAction[317] = 1; // OPEN
   aReturn[160] = 317;
   aType[317] = OP_BUY; // BUY
   aTicket[317] = -1; // Ticket given by broker
   aSymbol[317] = "EURUSD";
   aLots[317] = 1.0;
   aDate[317] = D'2011.08.22 06:33:47'+time_offset*3600;
   aPrice[317] = 1.4355;

   // ========== 318 ===== 682 ==========
   aPseudoTicket[318] = 159;
   aAction[318] = 0; // CLOSE
   aType[318] = OP_BUY; // BUY
   aTicket[318] = -1; // Ticket given by broker
   aSymbol[318] = "GBPUSD";
   aLots[318] = 1.0;
   aDate[318] = D'2011.08.22 07:10:49'+time_offset*3600;
   aPrice[318] = 1.64975;

   // ========== 319 ===== 681 ==========
   aPseudoTicket[319] = 160;
   aAction[319] = 0; // CLOSE
   aType[319] = OP_BUY; // BUY
   aTicket[319] = -1; // Ticket given by broker
   aSymbol[319] = "EURUSD";
   aLots[319] = 1.0;
   aDate[319] = D'2011.08.22 08:49:22'+time_offset*3600;
   aPrice[319] = 1.43987;

   // ========== 320 ===== 680 ==========
   aPseudoTicket[320] = 161;
   aAction[320] = 1; // OPEN
   aReturn[161] = 320;
   aType[320] = OP_BUY; // BUY
   aTicket[320] = -1; // Ticket given by broker
   aSymbol[320] = "GBPUSD";
   aLots[320] = 1.0;
   aDate[320] = D'2011.08.23 07:21:59'+time_offset*3600;
   aPrice[320] = 1.65166;

   // ========== 321 ===== 679 ==========
   aPseudoTicket[321] = 162;
   aAction[321] = 1; // OPEN
   aReturn[162] = 321;
   aType[321] = OP_BUY; // BUY
   aTicket[321] = -1; // Ticket given by broker
   aSymbol[321] = "EURUSD";
   aLots[321] = 1.0;
   aDate[321] = D'2011.08.23 07:30:05'+time_offset*3600;
   aPrice[321] = 1.44215;

   // ========== 322 ===== 680 ==========
   aPseudoTicket[322] = 161;
   aAction[322] = 0; // CLOSE
   aType[322] = OP_BUY; // BUY
   aTicket[322] = -1; // Ticket given by broker
   aSymbol[322] = "GBPUSD";
   aLots[322] = 1.0;
   aDate[322] = D'2011.08.23 07:46:33'+time_offset*3600;
   aPrice[322] = 1.65189;

   // ========== 323 ===== 678 ==========
   aPseudoTicket[323] = 163;
   aAction[323] = 1; // OPEN
   aReturn[163] = 323;
   aType[323] = OP_BUY; // BUY
   aTicket[323] = -1; // Ticket given by broker
   aSymbol[323] = "EURUSD";
   aLots[323] = 1.0;
   aDate[323] = D'2011.08.23 09:02:16'+time_offset*3600;
   aPrice[323] = 1.44455;

   // ========== 324 ===== 678 ==========
   aPseudoTicket[324] = 163;
   aAction[324] = 0; // CLOSE
   aType[324] = OP_BUY; // BUY
   aTicket[324] = -1; // Ticket given by broker
   aSymbol[324] = "EURUSD";
   aLots[324] = 1.0;
   aDate[324] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPrice[324] = 1.4394;

   // ========== 325 ===== 679 ==========
   aPseudoTicket[325] = 162;
   aAction[325] = 0; // CLOSE
   aType[325] = OP_BUY; // BUY
   aTicket[325] = -1; // Ticket given by broker
   aSymbol[325] = "EURUSD";
   aLots[325] = 1.0;
   aDate[325] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPrice[325] = 1.4394;

   // ========== 326 ===== 677 ==========
   aPseudoTicket[326] = 164;
   aAction[326] = 1; // OPEN
   aReturn[164] = 326;
   aType[326] = OP_SELL; // SELL
   aTicket[326] = -1; // Ticket given by broker
   aSymbol[326] = "AUDUSD";
   aLots[326] = 1.0;
   aDate[326] = D'2011.08.23 21:39:05'+time_offset*3600;
   aPrice[326] = 1.05274;

   // ========== 327 ===== 677 ==========
   aPseudoTicket[327] = 164;
   aAction[327] = 0; // CLOSE
   aType[327] = OP_SELL; // SELL
   aTicket[327] = -1; // Ticket given by broker
   aSymbol[327] = "AUDUSD";
   aLots[327] = 1.0;
   aDate[327] = D'2011.08.23 23:50:04'+time_offset*3600;
   aPrice[327] = 1.05201;

   // ========== 328 ===== 676 ==========
   aPseudoTicket[328] = 165;
   aAction[328] = 1; // OPEN
   aReturn[165] = 328;
   aType[328] = OP_BUY; // BUY
   aTicket[328] = -1; // Ticket given by broker
   aSymbol[328] = "EURUSD";
   aLots[328] = 1.0;
   aDate[328] = D'2011.08.24 08:28:39'+time_offset*3600;
   aPrice[328] = 1.44425;

   // ========== 329 ===== 676 ==========
   aPseudoTicket[329] = 165;
   aAction[329] = 0; // CLOSE
   aType[329] = OP_BUY; // BUY
   aTicket[329] = -1; // Ticket given by broker
   aSymbol[329] = "EURUSD";
   aLots[329] = 1.0;
   aDate[329] = D'2011.08.24 10:06:57'+time_offset*3600;
   aPrice[329] = 1.44681;

   // ========== 330 ===== 675 ==========
   aPseudoTicket[330] = 166;
   aAction[330] = 1; // OPEN
   aReturn[166] = 330;
   aType[330] = OP_SELL; // SELL
   aTicket[330] = -1; // Ticket given by broker
   aSymbol[330] = "GBPUSD";
   aLots[330] = 1.0;
   aDate[330] = D'2011.08.24 11:35:47'+time_offset*3600;
   aPrice[330] = 1.64698;

   // ========== 331 ===== 675 ==========
   aPseudoTicket[331] = 166;
   aAction[331] = 0; // CLOSE
   aType[331] = OP_SELL; // SELL
   aTicket[331] = -1; // Ticket given by broker
   aSymbol[331] = "GBPUSD";
   aLots[331] = 1.0;
   aDate[331] = D'2011.08.24 11:50:01'+time_offset*3600;
   aPrice[331] = 1.6472;

   // ========== 332 ===== 674 ==========
   aPseudoTicket[332] = 167;
   aAction[332] = 1; // OPEN
   aReturn[167] = 332;
   aType[332] = OP_BUY; // BUY
   aTicket[332] = -1; // Ticket given by broker
   aSymbol[332] = "EURUSD";
   aLots[332] = 1.0;
   aDate[332] = D'2011.08.24 12:33:06'+time_offset*3600;
   aPrice[332] = 1.44684;

   // ========== 333 ===== 673 ==========
   aPseudoTicket[333] = 168;
   aAction[333] = 1; // OPEN
   aReturn[168] = 333;
   aType[333] = OP_BUY; // BUY
   aTicket[333] = -1; // Ticket given by broker
   aSymbol[333] = "USDCHF";
   aLots[333] = 1.0;
   aDate[333] = D'2011.08.24 14:39:01'+time_offset*3600;
   aPrice[333] = 0.79075;

   // ========== 334 ===== 674 ==========
   aPseudoTicket[334] = 167;
   aAction[334] = 0; // CLOSE
   aType[334] = OP_BUY; // BUY
   aTicket[334] = -1; // Ticket given by broker
   aSymbol[334] = "EURUSD";
   aLots[334] = 1.0;
   aDate[334] = D'2011.08.24 14:45:45'+time_offset*3600;
   aPrice[334] = 1.44347;

   // ========== 335 ===== 673 ==========
   aPseudoTicket[335] = 168;
   aAction[335] = 0; // CLOSE
   aType[335] = OP_BUY; // BUY
   aTicket[335] = -1; // Ticket given by broker
   aSymbol[335] = "USDCHF";
   aLots[335] = 1.0;
   aDate[335] = D'2011.08.24 23:14:26'+time_offset*3600;
   aPrice[335] = 0.79577;

   // ========== 336 ===== 672 ==========
   aPseudoTicket[336] = 169;
   aAction[336] = 1; // OPEN
   aReturn[169] = 336;
   aType[336] = OP_BUY; // BUY
   aTicket[336] = -1; // Ticket given by broker
   aSymbol[336] = "EURUSD";
   aLots[336] = 1.0;
   aDate[336] = D'2011.08.25 07:08:39'+time_offset*3600;
   aPrice[336] = 1.4446;

   // ========== 337 ===== 672 ==========
   aPseudoTicket[337] = 169;
   aAction[337] = 0; // CLOSE
   aType[337] = OP_BUY; // BUY
   aTicket[337] = -1; // Ticket given by broker
   aSymbol[337] = "EURUSD";
   aLots[337] = 1.0;
   aDate[337] = D'2011.08.25 09:05:01'+time_offset*3600;
   aPrice[337] = 1.44329;

   // ========== 338 ===== 669 ==========
   aPseudoTicket[338] = 170;
   aAction[338] = 1; // OPEN
   aReturn[170] = 338;
   aType[338] = OP_SELL; // SELL
   aTicket[338] = -1; // Ticket given by broker
   aSymbol[338] = "USDJPY";
   aLots[338] = 1.0;
   aDate[338] = D'2011.08.25 09:06:29'+time_offset*3600;
   aPrice[338] = 77.099;

   // ========== 339 ===== 671 ==========
   aPseudoTicket[339] = 171;
   aAction[339] = 1; // OPEN
   aReturn[171] = 339;
   aType[339] = OP_SELL; // SELL
   aTicket[339] = -1; // Ticket given by broker
   aSymbol[339] = "GBPUSD";
   aLots[339] = 1.0;
   aDate[339] = D'2011.08.25 13:08:15'+time_offset*3600;
   aPrice[339] = 1.63312;

   // ========== 340 ===== 671 ==========
   aPseudoTicket[340] = 171;
   aAction[340] = 0; // CLOSE
   aType[340] = OP_SELL; // SELL
   aTicket[340] = -1; // Ticket given by broker
   aSymbol[340] = "GBPUSD";
   aLots[340] = 1.0;
   aDate[340] = D'2011.08.25 13:10:36'+time_offset*3600;
   aPrice[340] = 1.6356;

   // ========== 341 ===== 670 ==========
   aPseudoTicket[341] = 172;
   aAction[341] = 1; // OPEN
   aReturn[172] = 341;
   aType[341] = OP_BUY; // BUY
   aTicket[341] = -1; // Ticket given by broker
   aSymbol[341] = "EURUSD";
   aLots[341] = 1.0;
   aDate[341] = D'2011.08.25 13:16:46'+time_offset*3600;
   aPrice[341] = 1.44586;

   // ========== 342 ===== 670 ==========
   aPseudoTicket[342] = 172;
   aAction[342] = 0; // CLOSE
   aType[342] = OP_BUY; // BUY
   aTicket[342] = -1; // Ticket given by broker
   aSymbol[342] = "EURUSD";
   aLots[342] = 1.0;
   aDate[342] = D'2011.08.25 13:53:26'+time_offset*3600;
   aPrice[342] = 1.4418;

   // ========== 343 ===== 669 ==========
   aPseudoTicket[343] = 170;
   aAction[343] = 0; // CLOSE
   aType[343] = OP_SELL; // SELL
   aTicket[343] = -1; // Ticket given by broker
   aSymbol[343] = "USDJPY";
   aLots[343] = 1.0;
   aDate[343] = D'2011.08.25 17:47:11'+time_offset*3600;
   aPrice[343] = 77.59;

   // ========== 344 ===== 668 ==========
   aPseudoTicket[344] = 173;
   aAction[344] = 1; // OPEN
   aReturn[173] = 344;
   aType[344] = OP_SELL; // SELL
   aTicket[344] = -1; // Ticket given by broker
   aSymbol[344] = "EURUSD";
   aLots[344] = 1.0;
   aDate[344] = D'2011.08.25 22:49:05'+time_offset*3600;
   aPrice[344] = 1.4373;

   // ========== 345 ===== 668 ==========
   aPseudoTicket[345] = 173;
   aAction[345] = 0; // CLOSE
   aType[345] = OP_SELL; // SELL
   aTicket[345] = -1; // Ticket given by broker
   aSymbol[345] = "EURUSD";
   aLots[345] = 1.0;
   aDate[345] = D'2011.08.26 00:44:27'+time_offset*3600;
   aPrice[345] = 1.44;

   // ========== 346 ===== 667 ==========
   aPseudoTicket[346] = 174;
   aAction[346] = 1; // OPEN
   aReturn[174] = 346;
   aType[346] = OP_BUY; // BUY
   aTicket[346] = -1; // Ticket given by broker
   aSymbol[346] = "EURUSD";
   aLots[346] = 1.0;
   aDate[346] = D'2011.08.26 00:58:01'+time_offset*3600;
   aPrice[346] = 1.44164;

   // ========== 347 ===== 667 ==========
   aPseudoTicket[347] = 174;
   aAction[347] = 0; // CLOSE
   aType[347] = OP_BUY; // BUY
   aTicket[347] = -1; // Ticket given by broker
   aSymbol[347] = "EURUSD";
   aLots[347] = 1.0;
   aDate[347] = D'2011.08.26 03:35:22'+time_offset*3600;
   aPrice[347] = 1.44103;

   // ========== 348 ===== 666 ==========
   aPseudoTicket[348] = 175;
   aAction[348] = 1; // OPEN
   aReturn[175] = 348;
   aType[348] = OP_SELL; // SELL
   aTicket[348] = -1; // Ticket given by broker
   aSymbol[348] = "EURUSD";
   aLots[348] = 1.0;
   aDate[348] = D'2011.08.26 05:40:35'+time_offset*3600;
   aPrice[348] = 1.4426;

   // ========== 349 ===== 665 ==========
   aPseudoTicket[349] = 176;
   aAction[349] = 1; // OPEN
   aReturn[176] = 349;
   aType[349] = OP_SELL; // SELL
   aTicket[349] = -1; // Ticket given by broker
   aSymbol[349] = "USDCHF";
   aLots[349] = 1.0;
   aDate[349] = D'2011.08.26 07:02:31'+time_offset*3600;
   aPrice[349] = 0.78931;

   // ========== 350 ===== 666 ==========
   aPseudoTicket[350] = 175;
   aAction[350] = 0; // CLOSE
   aType[350] = OP_SELL; // SELL
   aTicket[350] = -1; // Ticket given by broker
   aSymbol[350] = "EURUSD";
   aLots[350] = 1.0;
   aDate[350] = D'2011.08.26 08:31:22'+time_offset*3600;
   aPrice[350] = 1.44467;

   // ========== 351 ===== 665 ==========
   aPseudoTicket[351] = 176;
   aAction[351] = 0; // CLOSE
   aType[351] = OP_SELL; // SELL
   aTicket[351] = -1; // Ticket given by broker
   aSymbol[351] = "USDCHF";
   aLots[351] = 1.0;
   aDate[351] = D'2011.08.26 09:38:24'+time_offset*3600;
   aPrice[351] = 0.7939;

   // ========== 352 ===== 664 ==========
   aPseudoTicket[352] = 177;
   aAction[352] = 1; // OPEN
   aReturn[177] = 352;
   aType[352] = OP_BUY; // BUY
   aTicket[352] = -1; // Ticket given by broker
   aSymbol[352] = "EURUSD";
   aLots[352] = 1.0;
   aDate[352] = D'2011.08.26 13:49:23'+time_offset*3600;
   aPrice[352] = 1.44411;

   // ========== 353 ===== 664 ==========
   aPseudoTicket[353] = 177;
   aAction[353] = 0; // CLOSE
   aType[353] = OP_BUY; // BUY
   aTicket[353] = -1; // Ticket given by broker
   aSymbol[353] = "EURUSD";
   aLots[353] = 1.0;
   aDate[353] = D'2011.08.26 14:02:34'+time_offset*3600;
   aPrice[353] = 1.43996;

   // ========== 354 ===== 663 ==========
   aPseudoTicket[354] = 178;
   aAction[354] = 1; // OPEN
   aReturn[178] = 354;
   aType[354] = OP_BUY; // BUY
   aTicket[354] = -1; // Ticket given by broker
   aSymbol[354] = "USDCHF";
   aLots[354] = 1.0;
   aDate[354] = D'2011.08.26 14:25:22'+time_offset*3600;
   aPrice[354] = 0.79999;

   // ========== 355 ===== 662 ==========
   aPseudoTicket[355] = 179;
   aAction[355] = 1; // OPEN
   aReturn[179] = 355;
   aType[355] = OP_SELL; // SELL
   aTicket[355] = -1; // Ticket given by broker
   aSymbol[355] = "EURUSD";
   aLots[355] = 1.0;
   aDate[355] = D'2011.08.26 14:46:57'+time_offset*3600;
   aPrice[355] = 1.4353;

   // ========== 356 ===== 663 ==========
   aPseudoTicket[356] = 178;
   aAction[356] = 0; // CLOSE
   aType[356] = OP_BUY; // BUY
   aTicket[356] = -1; // Ticket given by broker
   aSymbol[356] = "USDCHF";
   aLots[356] = 1.0;
   aDate[356] = D'2011.08.26 15:37:06'+time_offset*3600;
   aPrice[356] = 0.80465;

   // ========== 357 ===== 662 ==========
   aPseudoTicket[357] = 179;
   aAction[357] = 0; // CLOSE
   aType[357] = OP_SELL; // SELL
   aTicket[357] = -1; // Ticket given by broker
   aSymbol[357] = "EURUSD";
   aLots[357] = 1.0;
   aDate[357] = D'2011.08.26 15:45:37'+time_offset*3600;
   aPrice[357] = 1.44592;

   // ========== 358 ===== 659 ==========
   aPseudoTicket[358] = 180;
   aAction[358] = 1; // OPEN
   aReturn[180] = 358;
   aType[358] = OP_BUY; // BUY
   aTicket[358] = -1; // Ticket given by broker
   aSymbol[358] = "EURUSD";
   aLots[358] = 1.0;
   aDate[358] = D'2011.08.26 15:45:46'+time_offset*3600;
   aPrice[358] = 1.44709;

   // ========== 359 ===== 661 ==========
   aPseudoTicket[359] = 181;
   aAction[359] = 1; // OPEN
   aReturn[181] = 359;
   aType[359] = OP_SELL; // SELL
   aTicket[359] = -1; // Ticket given by broker
   aSymbol[359] = "GBPUSD";
   aLots[359] = 1.0;
   aDate[359] = D'2011.08.29 11:26:06'+time_offset*3600;
   aPrice[359] = 1.63974;

   // ========== 360 ===== 661 ==========
   aPseudoTicket[360] = 181;
   aAction[360] = 0; // CLOSE
   aType[360] = OP_SELL; // SELL
   aTicket[360] = -1; // Ticket given by broker
   aSymbol[360] = "GBPUSD";
   aLots[360] = 1.0;
   aDate[360] = D'2011.08.29 11:43:33'+time_offset*3600;
   aPrice[360] = 1.63951;

   // ========== 361 ===== 660 ==========
   aPseudoTicket[361] = 182;
   aAction[361] = 1; // OPEN
   aReturn[182] = 361;
   aType[361] = OP_SELL; // SELL
   aTicket[361] = -1; // Ticket given by broker
   aSymbol[361] = "GBPUSD";
   aLots[361] = 1.0;
   aDate[361] = D'2011.08.29 14:27:46'+time_offset*3600;
   aPrice[361] = 1.6439;

   // ========== 362 ===== 660 ==========
   aPseudoTicket[362] = 182;
   aAction[362] = 0; // CLOSE
   aType[362] = OP_SELL; // SELL
   aTicket[362] = -1; // Ticket given by broker
   aSymbol[362] = "GBPUSD";
   aLots[362] = 1.0;
   aDate[362] = D'2011.08.30 01:27:52'+time_offset*3600;
   aPrice[362] = 1.64084;

   // ========== 363 ===== 659 ==========
   aPseudoTicket[363] = 180;
   aAction[363] = 0; // CLOSE
   aType[363] = OP_BUY; // BUY
   aTicket[363] = -1; // Ticket given by broker
   aSymbol[363] = "EURUSD";
   aLots[363] = 1.0;
   aDate[363] = D'2011.08.30 06:09:04'+time_offset*3600;
   aPrice[363] = 1.45149;

   // ========== 364 ===== 658 ==========
   aPseudoTicket[364] = 183;
   aAction[364] = 1; // OPEN
   aReturn[183] = 364;
   aType[364] = OP_BUY; // BUY
   aTicket[364] = -1; // Ticket given by broker
   aSymbol[364] = "EURUSD";
   aLots[364] = 1.0;
   aDate[364] = D'2011.08.30 08:33:18'+time_offset*3600;
   aPrice[364] = 1.44406;

   // ========== 365 ===== 658 ==========
   aPseudoTicket[365] = 183;
   aAction[365] = 0; // CLOSE
   aType[365] = OP_BUY; // BUY
   aTicket[365] = -1; // Ticket given by broker
   aSymbol[365] = "EURUSD";
   aLots[365] = 1.0;
   aDate[365] = D'2011.08.30 09:46:08'+time_offset*3600;
   aPrice[365] = 1.44108;

   // ========== 366 ===== 657 ==========
   aPseudoTicket[366] = 184;
   aAction[366] = 1; // OPEN
   aReturn[184] = 366;
   aType[366] = OP_SELL; // SELL
   aTicket[366] = -1; // Ticket given by broker
   aSymbol[366] = "GBPUSD";
   aLots[366] = 1.0;
   aDate[366] = D'2011.08.31 08:32:19'+time_offset*3600;
   aPrice[366] = 1.62669;

   // ========== 367 ===== 657 ==========
   aPseudoTicket[367] = 184;
   aAction[367] = 0; // CLOSE
   aType[367] = OP_SELL; // SELL
   aTicket[367] = -1; // Ticket given by broker
   aSymbol[367] = "GBPUSD";
   aLots[367] = 1.0;
   aDate[367] = D'2011.08.31 09:29:35'+time_offset*3600;
   aPrice[367] = 1.62898;

   // ========== 368 ===== 656 ==========
   aPseudoTicket[368] = 185;
   aAction[368] = 1; // OPEN
   aReturn[185] = 368;
   aType[368] = OP_SELL; // SELL
   aTicket[368] = -1; // Ticket given by broker
   aSymbol[368] = "EURUSD";
   aLots[368] = 1.0;
   aDate[368] = D'2011.08.31 15:47:35'+time_offset*3600;
   aPrice[368] = 1.44093;

   // ========== 369 ===== 656 ==========
   aPseudoTicket[369] = 185;
   aAction[369] = 0; // CLOSE
   aType[369] = OP_SELL; // SELL
   aTicket[369] = -1; // Ticket given by broker
   aSymbol[369] = "EURUSD";
   aLots[369] = 1.0;
   aDate[369] = D'2011.08.31 19:03:53'+time_offset*3600;
   aPrice[369] = 1.43777;

   // ========== 370 ===== 655 ==========
   aPseudoTicket[370] = 186;
   aAction[370] = 1; // OPEN
   aReturn[186] = 370;
   aType[370] = OP_BUY; // BUY
   aTicket[370] = -1; // Ticket given by broker
   aSymbol[370] = "AUDUSD";
   aLots[370] = 1.0;
   aDate[370] = D'2011.09.01 01:33:08'+time_offset*3600;
   aPrice[370] = 1.07131;

   // ========== 371 ===== 655 ==========
   aPseudoTicket[371] = 186;
   aAction[371] = 0; // CLOSE
   aType[371] = OP_BUY; // BUY
   aTicket[371] = -1; // Ticket given by broker
   aSymbol[371] = "AUDUSD";
   aLots[371] = 1.0;
   aDate[371] = D'2011.09.01 03:23:06'+time_offset*3600;
   aPrice[371] = 1.0696;

   // ========== 372 ===== 652 ==========
   aPseudoTicket[372] = 187;
   aAction[372] = 1; // OPEN
   aReturn[187] = 372;
   aType[372] = OP_BUY; // BUY
   aTicket[372] = -1; // Ticket given by broker
   aSymbol[372] = "USDCAD";
   aLots[372] = 1.0;
   aDate[372] = D'2011.09.01 05:34:00'+time_offset*3600;
   aPrice[372] = 0.97758;

   // ========== 373 ===== 654 ==========
   aPseudoTicket[373] = 188;
   aAction[373] = 1; // OPEN
   aReturn[188] = 373;
   aType[373] = OP_SELL; // SELL
   aTicket[373] = -1; // Ticket given by broker
   aSymbol[373] = "EURUSD";
   aLots[373] = 1.0;
   aDate[373] = D'2011.09.01 07:16:58'+time_offset*3600;
   aPrice[373] = 1.43236;

   // ========== 374 ===== 654 ==========
   aPseudoTicket[374] = 188;
   aAction[374] = 0; // CLOSE
   aType[374] = OP_SELL; // SELL
   aTicket[374] = -1; // Ticket given by broker
   aSymbol[374] = "EURUSD";
   aLots[374] = 1.0;
   aDate[374] = D'2011.09.01 22:39:28'+time_offset*3600;
   aPrice[374] = 1.42623;

   // ========== 375 ===== 653 ==========
   aPseudoTicket[375] = 189;
   aAction[375] = 1; // OPEN
   aReturn[189] = 375;
   aType[375] = OP_SELL; // SELL
   aTicket[375] = -1; // Ticket given by broker
   aSymbol[375] = "GBPUSD";
   aLots[375] = 1.0;
   aDate[375] = D'2011.09.02 12:23:42'+time_offset*3600;
   aPrice[375] = 1.62177;

   // ========== 376 ===== 653 ==========
   aPseudoTicket[376] = 189;
   aAction[376] = 0; // CLOSE
   aType[376] = OP_SELL; // SELL
   aTicket[376] = -1; // Ticket given by broker
   aSymbol[376] = "GBPUSD";
   aLots[376] = 1.0;
   aDate[376] = D'2011.09.02 13:23:22'+time_offset*3600;
   aPrice[376] = 1.61987;

   // ========== 377 ===== 651 ==========
   aPseudoTicket[377] = 190;
   aAction[377] = 1; // OPEN
   aReturn[190] = 377;
   aType[377] = OP_SELL; // SELL
   aTicket[377] = -1; // Ticket given by broker
   aSymbol[377] = "USDCHF";
   aLots[377] = 1.0;
   aDate[377] = D'2011.09.02 15:17:33'+time_offset*3600;
   aPrice[377] = 0.785;

   // ========== 378 ===== 652 ==========
   aPseudoTicket[378] = 187;
   aAction[378] = 0; // CLOSE
   aType[378] = OP_BUY; // BUY
   aTicket[378] = -1; // Ticket given by broker
   aSymbol[378] = "USDCAD";
   aLots[378] = 1.0;
   aDate[378] = D'2011.09.04 22:45:02'+time_offset*3600;
   aPrice[378] = 0.9867;

   // ========== 379 ===== 648 ==========
   aPseudoTicket[379] = 191;
   aAction[379] = 1; // OPEN
   aReturn[191] = 379;
   aType[379] = OP_BUY; // BUY
   aTicket[379] = -1; // Ticket given by broker
   aSymbol[379] = "AUDUSD";
   aLots[379] = 1.0;
   aDate[379] = D'2011.09.05 01:28:26'+time_offset*3600;
   aPrice[379] = 1.05785;

   // ========== 380 ===== 651 ==========
   aPseudoTicket[380] = 190;
   aAction[380] = 0; // CLOSE
   aType[380] = OP_SELL; // SELL
   aTicket[380] = -1; // Ticket given by broker
   aSymbol[380] = "USDCHF";
   aLots[380] = 1.0;
   aDate[380] = D'2011.09.05 09:17:11'+time_offset*3600;
   aPrice[380] = 0.78777;

   // ========== 381 ===== 649 ==========
   aPseudoTicket[381] = 192;
   aAction[381] = 1; // OPEN
   aReturn[192] = 381;
   aType[381] = OP_BUY; // BUY
   aTicket[381] = -1; // Ticket given by broker
   aSymbol[381] = "EURUSD";
   aLots[381] = 1.0;
   aDate[381] = D'2011.09.06 04:59:11'+time_offset*3600;
   aPrice[381] = 1.40595;

   // ========== 382 ===== 650 ==========
   aPseudoTicket[382] = 193;
   aAction[382] = 1; // OPEN
   aReturn[193] = 382;
   aType[382] = OP_BUY; // BUY
   aTicket[382] = -1; // Ticket given by broker
   aSymbol[382] = "USDCHF";
   aLots[382] = 1.0;
   aDate[382] = D'2011.09.06 07:04:34'+time_offset*3600;
   aPrice[382] = 0.79255;

   // ========== 383 ===== 650 ==========
   aPseudoTicket[383] = 193;
   aAction[383] = 0; // CLOSE
   aType[383] = OP_BUY; // BUY
   aTicket[383] = -1; // Ticket given by broker
   aSymbol[383] = "USDCHF";
   aLots[383] = 1.0;
   aDate[383] = D'2011.09.06 07:18:55'+time_offset*3600;
   aPrice[383] = 0.79302;

   // ========== 384 ===== 649 ==========
   aPseudoTicket[384] = 192;
   aAction[384] = 0; // CLOSE
   aType[384] = OP_BUY; // BUY
   aTicket[384] = -1; // Ticket given by broker
   aSymbol[384] = "EURUSD";
   aLots[384] = 1.0;
   aDate[384] = D'2011.09.06 08:02:11'+time_offset*3600;
   aPrice[384] = 1.413;

   // ========== 385 ===== 647 ==========
   aPseudoTicket[385] = 194;
   aAction[385] = 1; // OPEN
   aReturn[194] = 385;
   aType[385] = OP_SELL; // SELL
   aTicket[385] = -1; // Ticket given by broker
   aSymbol[385] = "EURUSD";
   aLots[385] = 1.0;
   aDate[385] = D'2011.09.06 08:02:27'+time_offset*3600;
   aPrice[385] = 1.4179;

   // ========== 386 ===== 648 ==========
   aPseudoTicket[386] = 191;
   aAction[386] = 0; // CLOSE
   aType[386] = OP_BUY; // BUY
   aTicket[386] = -1; // Ticket given by broker
   aSymbol[386] = "AUDUSD";
   aLots[386] = 1.0;
   aDate[386] = D'2011.09.06 08:02:40'+time_offset*3600;
   aPrice[386] = 1.059;

   // ========== 387 ===== 647 ==========
   aPseudoTicket[387] = 194;
   aAction[387] = 0; // CLOSE
   aType[387] = OP_SELL; // SELL
   aTicket[387] = -1; // Ticket given by broker
   aSymbol[387] = "EURUSD";
   aLots[387] = 1.0;
   aDate[387] = D'2011.09.06 08:02:46'+time_offset*3600;
   aPrice[387] = 1.4279;

   // ========== 388 ===== 646 ==========
   aPseudoTicket[388] = 195;
   aAction[388] = 1; // OPEN
   aReturn[195] = 388;
   aType[388] = OP_SELL; // SELL
   aTicket[388] = -1; // Ticket given by broker
   aSymbol[388] = "USDCHF";
   aLots[388] = 1.0;
   aDate[388] = D'2011.09.06 08:13:07'+time_offset*3600;
   aPrice[388] = 0.85063;

   // ========== 389 ===== 646 ==========
   aPseudoTicket[389] = 195;
   aAction[389] = 0; // CLOSE
   aType[389] = OP_SELL; // SELL
   aTicket[389] = -1; // Ticket given by broker
   aSymbol[389] = "USDCHF";
   aLots[389] = 1.0;
   aDate[389] = D'2011.09.06 09:16:29'+time_offset*3600;
   aPrice[389] = 0.84509;

   // ========== 390 ===== 645 ==========
   aPseudoTicket[390] = 196;
   aAction[390] = 1; // OPEN
   aReturn[196] = 390;
   aType[390] = OP_SELL; // SELL
   aTicket[390] = -1; // Ticket given by broker
   aSymbol[390] = "EURUSD";
   aLots[390] = 1.0;
   aDate[390] = D'2011.09.06 09:32:54'+time_offset*3600;
   aPrice[390] = 1.4211;

   // ========== 391 ===== 645 ==========
   aPseudoTicket[391] = 196;
   aAction[391] = 0; // CLOSE
   aType[391] = OP_SELL; // SELL
   aTicket[391] = -1; // Ticket given by broker
   aSymbol[391] = "EURUSD";
   aLots[391] = 1.0;
   aDate[391] = D'2011.09.06 10:12:05'+time_offset*3600;
   aPrice[391] = 1.4175;

   // ========== 392 ===== 644 ==========
   aPseudoTicket[392] = 197;
   aAction[392] = 1; // OPEN
   aReturn[197] = 392;
   aType[392] = OP_BUY; // BUY
   aTicket[392] = -1; // Ticket given by broker
   aSymbol[392] = "EURUSD";
   aLots[392] = 1.0;
   aDate[392] = D'2011.09.06 11:49:25'+time_offset*3600;
   aPrice[392] = 1.41331;

   // ========== 393 ===== 643 ==========
   aPseudoTicket[393] = 198;
   aAction[393] = 1; // OPEN
   aReturn[198] = 393;
   aType[393] = OP_SELL; // SELL
   aTicket[393] = -1; // Ticket given by broker
   aSymbol[393] = "USDCHF";
   aLots[393] = 1.0;
   aDate[393] = D'2011.09.06 12:14:10'+time_offset*3600;
   aPrice[393] = 0.85342;

   // ========== 394 ===== 644 ==========
   aPseudoTicket[394] = 197;
   aAction[394] = 0; // CLOSE
   aType[394] = OP_BUY; // BUY
   aTicket[394] = -1; // Ticket given by broker
   aSymbol[394] = "EURUSD";
   aLots[394] = 1.0;
   aDate[394] = D'2011.09.06 22:27:34'+time_offset*3600;
   aPrice[394] = 1.40011;

   // ========== 395 ===== 640 ==========
   aPseudoTicket[395] = 199;
   aAction[395] = 1; // OPEN
   aReturn[199] = 395;
   aType[395] = OP_SELL; // SELL
   aTicket[395] = -1; // Ticket given by broker
   aSymbol[395] = "EURUSD";
   aLots[395] = 1.0;
   aDate[395] = D'2011.09.07 06:04:52'+time_offset*3600;
   aPrice[395] = 1.40595;

   // ========== 396 ===== 641 ==========
   aPseudoTicket[396] = 200;
   aAction[396] = 1; // OPEN
   aReturn[200] = 396;
   aType[396] = OP_SELL; // SELL
   aTicket[396] = -1; // Ticket given by broker
   aSymbol[396] = "EURUSD";
   aLots[396] = 1.0;
   aDate[396] = D'2011.09.07 06:38:15'+time_offset*3600;
   aPrice[396] = 1.40716;

   // ========== 397 ===== 643 ==========
   aPseudoTicket[397] = 198;
   aAction[397] = 0; // CLOSE
   aType[397] = OP_SELL; // SELL
   aTicket[397] = -1; // Ticket given by broker
   aSymbol[397] = "USDCHF";
   aLots[397] = 1.0;
   aDate[397] = D'2011.09.07 06:43:13'+time_offset*3600;
   aPrice[397] = 0.85644;

   // ========== 398 ===== 642 ==========
   aPseudoTicket[398] = 201;
   aAction[398] = 1; // OPEN
   aReturn[201] = 398;
   aType[398] = OP_SELL; // SELL
   aTicket[398] = -1; // Ticket given by broker
   aSymbol[398] = "GBPUSD";
   aLots[398] = 1.0;
   aDate[398] = D'2011.09.07 08:07:51'+time_offset*3600;
   aPrice[398] = 1.60147;

   // ========== 399 ===== 642 ==========
   aPseudoTicket[399] = 201;
   aAction[399] = 0; // CLOSE
   aType[399] = OP_SELL; // SELL
   aTicket[399] = -1; // Ticket given by broker
   aSymbol[399] = "GBPUSD";
   aLots[399] = 1.0;
   aDate[399] = D'2011.09.07 08:48:57'+time_offset*3600;
   aPrice[399] = 1.59955;

   // ========== 400 ===== 641 ==========
   aPseudoTicket[400] = 200;
   aAction[400] = 0; // CLOSE
   aType[400] = OP_SELL; // SELL
   aTicket[400] = -1; // Ticket given by broker
   aSymbol[400] = "EURUSD";
   aLots[400] = 1.0;
   aDate[400] = D'2011.09.07 08:49:17'+time_offset*3600;
   aPrice[400] = 1.4088;

   // ========== 401 ===== 640 ==========
   aPseudoTicket[401] = 199;
   aAction[401] = 0; // CLOSE
   aType[401] = OP_SELL; // SELL
   aTicket[401] = -1; // Ticket given by broker
   aSymbol[401] = "EURUSD";
   aLots[401] = 1.0;
   aDate[401] = D'2011.09.07 08:49:21'+time_offset*3600;
   aPrice[401] = 1.40888;

   // ========== 402 ===== 639 ==========
   aPseudoTicket[402] = 202;
   aAction[402] = 1; // OPEN
   aReturn[202] = 402;
   aType[402] = OP_SELL; // SELL
   aTicket[402] = -1; // Ticket given by broker
   aSymbol[402] = "GBPUSD";
   aLots[402] = 1.0;
   aDate[402] = D'2011.09.07 09:08:34'+time_offset*3600;
   aPrice[402] = 1.6009;

   // ========== 403 ===== 638 ==========
   aPseudoTicket[403] = 203;
   aAction[403] = 1; // OPEN
   aReturn[203] = 403;
   aType[403] = OP_SELL; // SELL
   aTicket[403] = -1; // Ticket given by broker
   aSymbol[403] = "EURUSD";
   aLots[403] = 1.0;
   aDate[403] = D'2011.09.07 09:08:53'+time_offset*3600;
   aPrice[403] = 1.41001;

   // ========== 404 ===== 639 ==========
   aPseudoTicket[404] = 202;
   aAction[404] = 0; // CLOSE
   aType[404] = OP_SELL; // SELL
   aTicket[404] = -1; // Ticket given by broker
   aSymbol[404] = "GBPUSD";
   aLots[404] = 1.0;
   aDate[404] = D'2011.09.07 10:28:17'+time_offset*3600;
   aPrice[404] = 1.59747;

   // ========== 405 ===== 638 ==========
   aPseudoTicket[405] = 203;
   aAction[405] = 0; // CLOSE
   aType[405] = OP_SELL; // SELL
   aTicket[405] = -1; // Ticket given by broker
   aSymbol[405] = "EURUSD";
   aLots[405] = 1.0;
   aDate[405] = D'2011.09.07 10:43:01'+time_offset*3600;
   aPrice[405] = 1.40444;

   // ========== 406 ===== 637 ==========
   aPseudoTicket[406] = 204;
   aAction[406] = 1; // OPEN
   aReturn[204] = 406;
   aType[406] = OP_BUY; // BUY
   aTicket[406] = -1; // Ticket given by broker
   aSymbol[406] = "USDCAD";
   aLots[406] = 1.0;
   aDate[406] = D'2011.09.07 11:50:38'+time_offset*3600;
   aPrice[406] = 0.98642;

   // ========== 407 ===== 637 ==========
   aPseudoTicket[407] = 204;
   aAction[407] = 0; // CLOSE
   aType[407] = OP_BUY; // BUY
   aTicket[407] = -1; // Ticket given by broker
   aSymbol[407] = "USDCAD";
   aLots[407] = 1.0;
   aDate[407] = D'2011.09.07 15:58:48'+time_offset*3600;
   aPrice[407] = 0.98804;

   // ========== 408 ===== 634 ==========
   aPseudoTicket[408] = 205;
   aAction[408] = 1; // OPEN
   aReturn[205] = 408;
   aType[408] = OP_BUY; // BUY
   aTicket[408] = -1; // Ticket given by broker
   aSymbol[408] = "USDCAD";
   aLots[408] = 1.0;
   aDate[408] = D'2011.09.08 08:19:53'+time_offset*3600;
   aPrice[408] = 0.98523;

   // ========== 409 ===== 636 ==========
   aPseudoTicket[409] = 206;
   aAction[409] = 1; // OPEN
   aReturn[206] = 409;
   aType[409] = OP_SELL; // SELL
   aTicket[409] = -1; // Ticket given by broker
   aSymbol[409] = "USDCHF";
   aLots[409] = 1.0;
   aDate[409] = D'2011.09.08 09:23:25'+time_offset*3600;
   aPrice[409] = 0.86253;

   // ========== 410 ===== 636 ==========
   aPseudoTicket[410] = 206;
   aAction[410] = 0; // CLOSE
   aType[410] = OP_SELL; // SELL
   aTicket[410] = -1; // Ticket given by broker
   aSymbol[410] = "USDCHF";
   aLots[410] = 1.0;
   aDate[410] = D'2011.09.08 11:05:03'+time_offset*3600;
   aPrice[410] = 0.86412;

   // ========== 411 ===== 635 ==========
   aPseudoTicket[411] = 207;
   aAction[411] = 1; // OPEN
   aReturn[207] = 411;
   aType[411] = OP_SELL; // SELL
   aTicket[411] = -1; // Ticket given by broker
   aSymbol[411] = "EURUSD";
   aLots[411] = 1.0;
   aDate[411] = D'2011.09.08 12:35:08'+time_offset*3600;
   aPrice[411] = 1.40056;

   // ========== 412 ===== 635 ==========
   aPseudoTicket[412] = 207;
   aAction[412] = 0; // CLOSE
   aType[412] = OP_SELL; // SELL
   aTicket[412] = -1; // Ticket given by broker
   aSymbol[412] = "EURUSD";
   aLots[412] = 1.0;
   aDate[412] = D'2011.09.08 13:20:02'+time_offset*3600;
   aPrice[412] = 1.39956;

   // ========== 413 ===== 634 ==========
   aPseudoTicket[413] = 205;
   aAction[413] = 0; // CLOSE
   aType[413] = OP_BUY; // BUY
   aTicket[413] = -1; // Ticket given by broker
   aSymbol[413] = "USDCAD";
   aLots[413] = 1.0;
   aDate[413] = D'2011.09.08 14:15:00'+time_offset*3600;
   aPrice[413] = 0.9847;

   // ========== 414 ===== 633 ==========
   aPseudoTicket[414] = 208;
   aAction[414] = 1; // OPEN
   aReturn[208] = 414;
   aType[414] = OP_BUY; // BUY
   aTicket[414] = -1; // Ticket given by broker
   aSymbol[414] = "GBPUSD";
   aLots[414] = 1.0;
   aDate[414] = D'2011.09.08 19:16:14'+time_offset*3600;
   aPrice[414] = 1.59538;

   // ========== 415 ===== 632 ==========
   aPseudoTicket[415] = 209;
   aAction[415] = 1; // OPEN
   aReturn[209] = 415;
   aType[415] = OP_SELL; // SELL
   aTicket[415] = -1; // Ticket given by broker
   aSymbol[415] = "USDJPY";
   aLots[415] = 1.0;
   aDate[415] = D'2011.09.09 05:31:37'+time_offset*3600;
   aPrice[415] = 77.465;

   // ========== 416 ===== 633 ==========
   aPseudoTicket[416] = 208;
   aAction[416] = 0; // CLOSE
   aType[416] = OP_BUY; // BUY
   aTicket[416] = -1; // Ticket given by broker
   aSymbol[416] = "GBPUSD";
   aLots[416] = 1.0;
   aDate[416] = D'2011.09.09 06:40:10'+time_offset*3600;
   aPrice[416] = 1.59574;

   // ========== 417 ===== 632 ==========
   aPseudoTicket[417] = 209;
   aAction[417] = 0; // CLOSE
   aType[417] = OP_SELL; // SELL
   aTicket[417] = -1; // Ticket given by broker
   aSymbol[417] = "USDJPY";
   aLots[417] = 1.0;
   aDate[417] = D'2011.09.09 18:42:03'+time_offset*3600;
   aPrice[417] = 77.431;

   // ========== 418 ===== 630 ==========
   aPseudoTicket[418] = 210;
   aAction[418] = 1; // OPEN
   aReturn[210] = 418;
   aType[418] = OP_SELL; // SELL
   aTicket[418] = -1; // Ticket given by broker
   aSymbol[418] = "USDCHF";
   aLots[418] = 1.0;
   aDate[418] = D'2011.09.11 23:00:02'+time_offset*3600;
   aPrice[418] = 0.88673;

   // ========== 419 ===== 631 ==========
   aPseudoTicket[419] = 211;
   aAction[419] = 1; // OPEN
   aReturn[211] = 419;
   aType[419] = OP_BUY; // BUY
   aTicket[419] = -1; // Ticket given by broker
   aSymbol[419] = "EURUSD";
   aLots[419] = 1.0;
   aDate[419] = D'2011.09.12 02:19:19'+time_offset*3600;
   aPrice[419] = 1.35867;

   // ========== 420 ===== 631 ==========
   aPseudoTicket[420] = 211;
   aAction[420] = 0; // CLOSE
   aType[420] = OP_BUY; // BUY
   aTicket[420] = -1; // Ticket given by broker
   aSymbol[420] = "EURUSD";
   aLots[420] = 1.0;
   aDate[420] = D'2011.09.12 09:49:10'+time_offset*3600;
   aPrice[420] = 1.364;

   // ========== 421 ===== 630 ==========
   aPseudoTicket[421] = 210;
   aAction[421] = 0; // CLOSE
   aType[421] = OP_SELL; // SELL
   aTicket[421] = -1; // Ticket given by broker
   aSymbol[421] = "USDCHF";
   aLots[421] = 1.0;
   aDate[421] = D'2011.09.12 09:58:51'+time_offset*3600;
   aPrice[421] = 0.8842;

   // ========== 422 ===== 628 ==========
   aPseudoTicket[422] = 212;
   aAction[422] = 1; // OPEN
   aReturn[212] = 422;
   aType[422] = OP_BUY; // BUY
   aTicket[422] = -1; // Ticket given by broker
   aSymbol[422] = "USDCHF";
   aLots[422] = 1.0;
   aDate[422] = D'2011.09.12 11:48:58'+time_offset*3600;
   aPrice[422] = 0.88254;

   // ========== 423 ===== 629 ==========
   aPseudoTicket[423] = 213;
   aAction[423] = 1; // OPEN
   aReturn[213] = 423;
   aType[423] = OP_SELL; // SELL
   aTicket[423] = -1; // Ticket given by broker
   aSymbol[423] = "AUDUSD";
   aLots[423] = 1.0;
   aDate[423] = D'2011.09.12 14:08:12'+time_offset*3600;
   aPrice[423] = 1.03776;

   // ========== 424 ===== 629 ==========
   aPseudoTicket[424] = 213;
   aAction[424] = 0; // CLOSE
   aType[424] = OP_SELL; // SELL
   aTicket[424] = -1; // Ticket given by broker
   aSymbol[424] = "AUDUSD";
   aLots[424] = 1.0;
   aDate[424] = D'2011.09.12 15:02:02'+time_offset*3600;
   aPrice[424] = 1.03307;

   // ========== 425 ===== 628 ==========
   aPseudoTicket[425] = 212;
   aAction[425] = 0; // CLOSE
   aType[425] = OP_BUY; // BUY
   aTicket[425] = -1; // Ticket given by broker
   aSymbol[425] = "USDCHF";
   aLots[425] = 1.0;
   aDate[425] = D'2011.09.12 15:03:04'+time_offset*3600;
   aPrice[425] = 0.88459;

   // ========== 426 ===== 627 ==========
   aPseudoTicket[426] = 214;
   aAction[426] = 1; // OPEN
   aReturn[214] = 426;
   aType[426] = OP_BUY; // BUY
   aTicket[426] = -1; // Ticket given by broker
   aSymbol[426] = "USDCAD";
   aLots[426] = 1.0;
   aDate[426] = D'2011.09.13 02:43:49'+time_offset*3600;
   aPrice[426] = 0.99186;

   // ========== 427 ===== 627 ==========
   aPseudoTicket[427] = 214;
   aAction[427] = 0; // CLOSE
   aType[427] = OP_BUY; // BUY
   aTicket[427] = -1; // Ticket given by broker
   aSymbol[427] = "USDCAD";
   aLots[427] = 1.0;
   aDate[427] = D'2011.09.13 08:11:33'+time_offset*3600;
   aPrice[427] = 0.996;

   // ========== 428 ===== 626 ==========
   aPseudoTicket[428] = 215;
   aAction[428] = 1; // OPEN
   aReturn[215] = 428;
   aType[428] = OP_SELL; // SELL
   aTicket[428] = -1; // Ticket given by broker
   aSymbol[428] = "GBPUSD";
   aLots[428] = 1.0;
   aDate[428] = D'2011.09.14 11:16:36'+time_offset*3600;
   aPrice[428] = 1.58024;

   // ========== 429 ===== 626 ==========
   aPseudoTicket[429] = 215;
   aAction[429] = 0; // CLOSE
   aType[429] = OP_SELL; // SELL
   aTicket[429] = -1; // Ticket given by broker
   aSymbol[429] = "GBPUSD";
   aLots[429] = 1.0;
   aDate[429] = D'2011.09.14 14:11:28'+time_offset*3600;
   aPrice[429] = 1.57872;

   // ========== 430 ===== 625 ==========
   aPseudoTicket[430] = 216;
   aAction[430] = 1; // OPEN
   aReturn[216] = 430;
   aType[430] = OP_SELL; // SELL
   aTicket[430] = -1; // Ticket given by broker
   aSymbol[430] = "EURUSD";
   aLots[430] = 1.0;
   aDate[430] = D'2011.09.15 10:00:41'+time_offset*3600;
   aPrice[430] = 1.38097;

   // ========== 431 ===== 624 ==========
   aPseudoTicket[431] = 217;
   aAction[431] = 1; // OPEN
   aReturn[217] = 431;
   aType[431] = OP_BUY; // BUY
   aTicket[431] = -1; // Ticket given by broker
   aSymbol[431] = "USDCHF";
   aLots[431] = 1.0;
   aDate[431] = D'2011.09.15 10:39:44'+time_offset*3600;
   aPrice[431] = 0.87294;

   // ========== 432 ===== 625 ==========
   aPseudoTicket[432] = 216;
   aAction[432] = 0; // CLOSE
   aType[432] = OP_SELL; // SELL
   aTicket[432] = -1; // Ticket given by broker
   aSymbol[432] = "EURUSD";
   aLots[432] = 1.0;
   aDate[432] = D'2011.09.15 12:37:45'+time_offset*3600;
   aPrice[432] = 1.37962;

   // ========== 433 ===== 623 ==========
   aPseudoTicket[433] = 218;
   aAction[433] = 1; // OPEN
   aReturn[218] = 433;
   aType[433] = OP_BUY; // BUY
   aTicket[433] = -1; // Ticket given by broker
   aSymbol[433] = "EURUSD";
   aLots[433] = 1.0;
   aDate[433] = D'2011.09.15 13:06:25'+time_offset*3600;
   aPrice[433] = 1.385;

   // ========== 434 ===== 624 ==========
   aPseudoTicket[434] = 217;
   aAction[434] = 0; // CLOSE
   aType[434] = OP_BUY; // BUY
   aTicket[434] = -1; // Ticket given by broker
   aSymbol[434] = "USDCHF";
   aLots[434] = 1.0;
   aDate[434] = D'2011.09.15 13:07:22'+time_offset*3600;
   aPrice[434] = 0.86936;

   // ========== 435 ===== 623 ==========
   aPseudoTicket[435] = 218;
   aAction[435] = 0; // CLOSE
   aType[435] = OP_BUY; // BUY
   aTicket[435] = -1; // Ticket given by broker
   aSymbol[435] = "EURUSD";
   aLots[435] = 1.0;
   aDate[435] = D'2011.09.15 13:10:42'+time_offset*3600;
   aPrice[435] = 1.38595;

   // ========== 436 ===== 622 ==========
   aPseudoTicket[436] = 219;
   aAction[436] = 1; // OPEN
   aReturn[219] = 436;
   aType[436] = OP_SELL; // SELL
   aTicket[436] = -1; // Ticket given by broker
   aSymbol[436] = "USDCHF";
   aLots[436] = 1.0;
   aDate[436] = D'2011.09.15 13:11:22'+time_offset*3600;
   aPrice[436] = 0.86978;

   // ========== 437 ===== 622 ==========
   aPseudoTicket[437] = 219;
   aAction[437] = 0; // CLOSE
   aType[437] = OP_SELL; // SELL
   aTicket[437] = -1; // Ticket given by broker
   aSymbol[437] = "USDCHF";
   aLots[437] = 1.0;
   aDate[437] = D'2011.09.15 13:28:40'+time_offset*3600;
   aPrice[437] = 0.86864;

   // ========== 438 ===== 621 ==========
   aPseudoTicket[438] = 220;
   aAction[438] = 1; // OPEN
   aReturn[220] = 438;
   aType[438] = OP_SELL; // SELL
   aTicket[438] = -1; // Ticket given by broker
   aSymbol[438] = "EURUSD";
   aLots[438] = 1.0;
   aDate[438] = D'2011.09.15 13:30:17'+time_offset*3600;
   aPrice[438] = 1.38852;

   // ========== 439 ===== 620 ==========
   aPseudoTicket[439] = 221;
   aAction[439] = 1; // OPEN
   aReturn[221] = 439;
   aType[439] = OP_SELL; // SELL
   aTicket[439] = -1; // Ticket given by broker
   aSymbol[439] = "USDJPY";
   aLots[439] = 1.0;
   aDate[439] = D'2011.09.15 15:50:53'+time_offset*3600;
   aPrice[439] = 76.701;

   // ========== 440 ===== 621 ==========
   aPseudoTicket[440] = 220;
   aAction[440] = 0; // CLOSE
   aType[440] = OP_SELL; // SELL
   aTicket[440] = -1; // Ticket given by broker
   aSymbol[440] = "EURUSD";
   aLots[440] = 1.0;
   aDate[440] = D'2011.09.15 21:57:16'+time_offset*3600;
   aPrice[440] = 1.38838;

   // ========== 441 ===== 618 ==========
   aPseudoTicket[441] = 222;
   aAction[441] = 1; // OPEN
   aReturn[222] = 441;
   aType[441] = OP_SELL; // SELL
   aTicket[441] = -1; // Ticket given by broker
   aSymbol[441] = "AUDUSD";
   aLots[441] = 1.0;
   aDate[441] = D'2011.09.16 13:03:42'+time_offset*3600;
   aPrice[441] = 1.03494;

   // ========== 442 ===== 619 ==========
   aPseudoTicket[442] = 223;
   aAction[442] = 1; // OPEN
   aReturn[223] = 442;
   aType[442] = OP_SELL; // SELL
   aTicket[442] = -1; // Ticket given by broker
   aSymbol[442] = "AUDUSD";
   aLots[442] = 1.0;
   aDate[442] = D'2011.09.16 14:07:01'+time_offset*3600;
   aPrice[442] = 1.03746;

   // ========== 443 ===== 620 ==========
   aPseudoTicket[443] = 221;
   aAction[443] = 0; // CLOSE
   aType[443] = OP_SELL; // SELL
   aTicket[443] = -1; // Ticket given by broker
   aSymbol[443] = "USDJPY";
   aLots[443] = 1.0;
   aDate[443] = D'2011.09.16 14:36:15'+time_offset*3600;
   aPrice[443] = 76.964;

   // ========== 444 ===== 619 ==========
   aPseudoTicket[444] = 223;
   aAction[444] = 0; // CLOSE
   aType[444] = OP_SELL; // SELL
   aTicket[444] = -1; // Ticket given by broker
   aSymbol[444] = "AUDUSD";
   aLots[444] = 1.0;
   aDate[444] = D'2011.09.16 18:32:22'+time_offset*3600;
   aPrice[444] = 1.03658;

   // ========== 445 ===== 618 ==========
   aPseudoTicket[445] = 222;
   aAction[445] = 0; // CLOSE
   aType[445] = OP_SELL; // SELL
   aTicket[445] = -1; // Ticket given by broker
   aSymbol[445] = "AUDUSD";
   aLots[445] = 1.0;
   aDate[445] = D'2011.09.18 21:20:04'+time_offset*3600;
   aPrice[445] = 1.0299;

   // ========== 446 ===== 617 ==========
   aPseudoTicket[446] = 224;
   aAction[446] = 1; // OPEN
   aReturn[224] = 446;
   aType[446] = OP_BUY; // BUY
   aTicket[446] = -1; // Ticket given by broker
   aSymbol[446] = "GBPUSD";
   aLots[446] = 1.0;
   aDate[446] = D'2011.09.20 09:54:51'+time_offset*3600;
   aPrice[446] = 1.57279;

   // ========== 447 ===== 617 ==========
   aPseudoTicket[447] = 224;
   aAction[447] = 0; // CLOSE
   aType[447] = OP_BUY; // BUY
   aTicket[447] = -1; // Ticket given by broker
   aSymbol[447] = "GBPUSD";
   aLots[447] = 1.0;
   aDate[447] = D'2011.09.20 11:25:45'+time_offset*3600;
   aPrice[447] = 1.56866;

   // ========== 448 ===== 616 ==========
   aPseudoTicket[448] = 225;
   aAction[448] = 1; // OPEN
   aReturn[225] = 448;
   aType[448] = OP_BUY; // BUY
   aTicket[448] = -1; // Ticket given by broker
   aSymbol[448] = "USDCHF";
   aLots[448] = 1.0;
   aDate[448] = D'2011.09.20 13:01:50'+time_offset*3600;
   aPrice[448] = 0.88919;

   // ========== 449 ===== 616 ==========
   aPseudoTicket[449] = 225;
   aAction[449] = 0; // CLOSE
   aType[449] = OP_BUY; // BUY
   aTicket[449] = -1; // Ticket given by broker
   aSymbol[449] = "USDCHF";
   aLots[449] = 1.0;
   aDate[449] = D'2011.09.20 15:58:01'+time_offset*3600;
   aPrice[449] = 0.88712;

   // ========== 450 ===== 615 ==========
   aPseudoTicket[450] = 226;
   aAction[450] = 1; // OPEN
   aReturn[226] = 450;
   aType[450] = OP_SELL; // SELL
   aTicket[450] = -1; // Ticket given by broker
   aSymbol[450] = "GBPUSD";
   aLots[450] = 1.0;
   aDate[450] = D'2011.09.21 01:29:22'+time_offset*3600;
   aPrice[450] = 1.57347;

   // ========== 451 ===== 615 ==========
   aPseudoTicket[451] = 226;
   aAction[451] = 0; // CLOSE
   aType[451] = OP_SELL; // SELL
   aTicket[451] = -1; // Ticket given by broker
   aSymbol[451] = "GBPUSD";
   aLots[451] = 1.0;
   aDate[451] = D'2011.09.21 04:48:19'+time_offset*3600;
   aPrice[451] = 1.5731;

   // ========== 452 ===== 613 ==========
   aPseudoTicket[452] = 227;
   aAction[452] = 1; // OPEN
   aReturn[227] = 452;
   aType[452] = OP_BUY; // BUY
   aTicket[452] = -1; // Ticket given by broker
   aSymbol[452] = "GBPUSD";
   aLots[452] = 1.0;
   aDate[452] = D'2011.09.22 08:40:24'+time_offset*3600;
   aPrice[452] = 1.54505;

   // ========== 453 ===== 614 ==========
   aPseudoTicket[453] = 228;
   aAction[453] = 1; // OPEN
   aReturn[228] = 453;
   aType[453] = OP_SELL; // SELL
   aTicket[453] = -1; // Ticket given by broker
   aSymbol[453] = "EURUSD";
   aLots[453] = 1.0;
   aDate[453] = D'2011.09.22 17:34:59'+time_offset*3600;
   aPrice[453] = 1.34776;

   // ========== 454 ===== 614 ==========
   aPseudoTicket[454] = 228;
   aAction[454] = 0; // CLOSE
   aType[454] = OP_SELL; // SELL
   aTicket[454] = -1; // Ticket given by broker
   aSymbol[454] = "EURUSD";
   aLots[454] = 1.0;
   aDate[454] = D'2011.09.22 19:25:21'+time_offset*3600;
   aPrice[454] = 1.34401;

   // ========== 455 ===== 612 ==========
   aPseudoTicket[455] = 229;
   aAction[455] = 1; // OPEN
   aReturn[229] = 455;
   aType[455] = OP_SELL; // SELL
   aTicket[455] = -1; // Ticket given by broker
   aSymbol[455] = "AUDUSD";
   aLots[455] = 1.0;
   aDate[455] = D'2011.09.22 23:50:11'+time_offset*3600;
   aPrice[455] = 0.98046;

   // ========== 456 ===== 613 ==========
   aPseudoTicket[456] = 227;
   aAction[456] = 0; // CLOSE
   aType[456] = OP_BUY; // BUY
   aTicket[456] = -1; // Ticket given by broker
   aSymbol[456] = "GBPUSD";
   aLots[456] = 1.0;
   aDate[456] = D'2011.09.23 00:02:18'+time_offset*3600;
   aPrice[456] = 1.53968;

   // ========== 457 ===== 610 ==========
   aPseudoTicket[457] = 230;
   aAction[457] = 1; // OPEN
   aReturn[230] = 457;
   aType[457] = OP_SELL; // SELL
   aTicket[457] = -1; // Ticket given by broker
   aSymbol[457] = "GBPUSD";
   aLots[457] = 1.0;
   aDate[457] = D'2011.09.23 00:15:08'+time_offset*3600;
   aPrice[457] = 1.5423;

   // ========== 458 ===== 611 ==========
   aPseudoTicket[458] = 231;
   aAction[458] = 1; // OPEN
   aReturn[231] = 458;
   aType[458] = OP_BUY; // BUY
   aTicket[458] = -1; // Ticket given by broker
   aSymbol[458] = "USDCAD";
   aLots[458] = 1.0;
   aDate[458] = D'2011.09.23 00:21:37'+time_offset*3600;
   aPrice[458] = 1.02284;

   // ========== 459 ===== 612 ==========
   aPseudoTicket[459] = 229;
   aAction[459] = 0; // CLOSE
   aType[459] = OP_SELL; // SELL
   aTicket[459] = -1; // Ticket given by broker
   aSymbol[459] = "AUDUSD";
   aLots[459] = 1.0;
   aDate[459] = D'2011.09.23 01:55:39'+time_offset*3600;
   aPrice[459] = 0.97748;

   // ========== 460 ===== 611 ==========
   aPseudoTicket[460] = 231;
   aAction[460] = 0; // CLOSE
   aType[460] = OP_BUY; // BUY
   aTicket[460] = -1; // Ticket given by broker
   aSymbol[460] = "USDCAD";
   aLots[460] = 1.0;
   aDate[460] = D'2011.09.23 02:10:50'+time_offset*3600;
   aPrice[460] = 1.02723;

   // ========== 461 ===== 610 ==========
   aPseudoTicket[461] = 230;
   aAction[461] = 0; // CLOSE
   aType[461] = OP_SELL; // SELL
   aTicket[461] = -1; // Ticket given by broker
   aSymbol[461] = "GBPUSD";
   aLots[461] = 1.0;
   aDate[461] = D'2011.09.23 05:48:56'+time_offset*3600;
   aPrice[461] = 1.53925;

   // ========== 462 ===== 609 ==========
   aPseudoTicket[462] = 232;
   aAction[462] = 1; // OPEN
   aReturn[232] = 462;
   aType[462] = OP_SELL; // SELL
   aTicket[462] = -1; // Ticket given by broker
   aSymbol[462] = "GBPUSD";
   aLots[462] = 1.0;
   aDate[462] = D'2011.09.23 07:05:37'+time_offset*3600;
   aPrice[462] = 1.54268;

   // ========== 463 ===== 609 ==========
   aPseudoTicket[463] = 232;
   aAction[463] = 0; // CLOSE
   aType[463] = OP_SELL; // SELL
   aTicket[463] = -1; // Ticket given by broker
   aSymbol[463] = "GBPUSD";
   aLots[463] = 1.0;
   aDate[463] = D'2011.09.23 12:12:00'+time_offset*3600;
   aPrice[463] = 1.5407;

   // ========== 464 ===== 608 ==========
   aPseudoTicket[464] = 233;
   aAction[464] = 1; // OPEN
   aReturn[233] = 464;
   aType[464] = OP_SELL; // SELL
   aTicket[464] = -1; // Ticket given by broker
   aSymbol[464] = "EURUSD";
   aLots[464] = 1.0;
   aDate[464] = D'2011.09.26 08:55:30'+time_offset*3600;
   aPrice[464] = 1.34569;

   // ========== 465 ===== 607 ==========
   aPseudoTicket[465] = 234;
   aAction[465] = 1; // OPEN
   aReturn[234] = 465;
   aType[465] = OP_SELL; // SELL
   aTicket[465] = -1; // Ticket given by broker
   aSymbol[465] = "AUDUSD";
   aLots[465] = 1.0;
   aDate[465] = D'2011.09.26 09:11:39'+time_offset*3600;
   aPrice[465] = 0.97592;

   // ========== 466 ===== 608 ==========
   aPseudoTicket[466] = 233;
   aAction[466] = 0; // CLOSE
   aType[466] = OP_SELL; // SELL
   aTicket[466] = -1; // Ticket given by broker
   aSymbol[466] = "EURUSD";
   aLots[466] = 1.0;
   aDate[466] = D'2011.09.26 09:41:24'+time_offset*3600;
   aPrice[466] = 1.34551;

   // ========== 467 ===== 606 ==========
   aPseudoTicket[467] = 235;
   aAction[467] = 1; // OPEN
   aReturn[235] = 467;
   aType[467] = OP_SELL; // SELL
   aTicket[467] = -1; // Ticket given by broker
   aSymbol[467] = "GBPUSD";
   aLots[467] = 1.0;
   aDate[467] = D'2011.09.26 10:56:45'+time_offset*3600;
   aPrice[467] = 1.55191;

   // ========== 468 ===== 607 ==========
   aPseudoTicket[468] = 234;
   aAction[468] = 0; // CLOSE
   aType[468] = OP_SELL; // SELL
   aTicket[468] = -1; // Ticket given by broker
   aSymbol[468] = "AUDUSD";
   aLots[468] = 1.0;
   aDate[468] = D'2011.09.26 14:01:37'+time_offset*3600;
   aPrice[468] = 0.9723;

   // ========== 469 ===== 606 ==========
   aPseudoTicket[469] = 235;
   aAction[469] = 0; // CLOSE
   aType[469] = OP_SELL; // SELL
   aTicket[469] = -1; // Ticket given by broker
   aSymbol[469] = "GBPUSD";
   aLots[469] = 1.0;
   aDate[469] = D'2011.09.26 15:06:33'+time_offset*3600;
   aPrice[469] = 1.557;

   // ========== 470 ===== 605 ==========
   aPseudoTicket[470] = 236;
   aAction[470] = 1; // OPEN
   aReturn[236] = 470;
   aType[470] = OP_SELL; // SELL
   aTicket[470] = -1; // Ticket given by broker
   aSymbol[470] = "GBPUSD";
   aLots[470] = 1.0;
   aDate[470] = D'2011.09.27 02:09:47'+time_offset*3600;
   aPrice[470] = 1.55726;

   // ========== 471 ===== 605 ==========
   aPseudoTicket[471] = 236;
   aAction[471] = 0; // CLOSE
   aType[471] = OP_SELL; // SELL
   aTicket[471] = -1; // Ticket given by broker
   aSymbol[471] = "GBPUSD";
   aLots[471] = 1.0;
   aDate[471] = D'2011.09.27 08:53:22'+time_offset*3600;
   aPrice[471] = 1.55415;

   // ========== 472 ===== 603 ==========
   aPseudoTicket[472] = 237;
   aAction[472] = 1; // OPEN
   aReturn[237] = 472;
   aType[472] = OP_SELL; // SELL
   aTicket[472] = -1; // Ticket given by broker
   aSymbol[472] = "AUDUSD";
   aLots[472] = 1.0;
   aDate[472] = D'2011.09.27 11:26:28'+time_offset*3600;
   aPrice[472] = 0.99078;

   // ========== 473 ===== 604 ==========
   aPseudoTicket[473] = 238;
   aAction[473] = 1; // OPEN
   aReturn[238] = 473;
   aType[473] = OP_BUY; // BUY
   aTicket[473] = -1; // Ticket given by broker
   aSymbol[473] = "GBPUSD";
   aLots[473] = 1.0;
   aDate[473] = D'2011.09.27 11:41:14'+time_offset*3600;
   aPrice[473] = 1.56287;

   // ========== 474 ===== 604 ==========
   aPseudoTicket[474] = 238;
   aAction[474] = 0; // CLOSE
   aType[474] = OP_BUY; // BUY
   aTicket[474] = -1; // Ticket given by broker
   aSymbol[474] = "GBPUSD";
   aLots[474] = 1.0;
   aDate[474] = D'2011.09.27 13:00:36'+time_offset*3600;
   aPrice[474] = 1.56192;

   // ========== 475 ===== 603 ==========
   aPseudoTicket[475] = 237;
   aAction[475] = 0; // CLOSE
   aType[475] = OP_SELL; // SELL
   aTicket[475] = -1; // Ticket given by broker
   aSymbol[475] = "AUDUSD";
   aLots[475] = 1.0;
   aDate[475] = D'2011.09.27 21:42:12'+time_offset*3600;
   aPrice[475] = 0.9914;

   // ========== 476 ===== 602 ==========
   aPseudoTicket[476] = 239;
   aAction[476] = 1; // OPEN
   aReturn[239] = 476;
   aType[476] = OP_SELL; // SELL
   aTicket[476] = -1; // Ticket given by broker
   aSymbol[476] = "AUDUSD";
   aLots[476] = 1.0;
   aDate[476] = D'2011.09.29 07:20:10'+time_offset*3600;
   aPrice[476] = 0.98279;

   // ========== 477 ===== 602 ==========
   aPseudoTicket[477] = 239;
   aAction[477] = 0; // CLOSE
   aType[477] = OP_SELL; // SELL
   aTicket[477] = -1; // Ticket given by broker
   aSymbol[477] = "AUDUSD";
   aLots[477] = 1.0;
   aDate[477] = D'2011.09.29 11:42:02'+time_offset*3600;
   aPrice[477] = 0.98204;

   // ========== 478 ===== 601 ==========
   aPseudoTicket[478] = 240;
   aAction[478] = 1; // OPEN
   aReturn[240] = 478;
   aType[478] = OP_SELL; // SELL
   aTicket[478] = -1; // Ticket given by broker
   aSymbol[478] = "EURUSD";
   aLots[478] = 1.0;
   aDate[478] = D'2011.09.30 07:10:04'+time_offset*3600;
   aPrice[478] = 1.34938;

   // ========== 479 ===== 601 ==========
   aPseudoTicket[479] = 240;
   aAction[479] = 0; // CLOSE
   aType[479] = OP_SELL; // SELL
   aTicket[479] = -1; // Ticket given by broker
   aSymbol[479] = "EURUSD";
   aLots[479] = 1.0;
   aDate[479] = D'2011.09.30 12:17:08'+time_offset*3600;
   aPrice[479] = 1.35036;

   // ========== 480 ===== 599 ==========
   aPseudoTicket[480] = 241;
   aAction[480] = 1; // OPEN
   aReturn[241] = 480;
   aType[480] = OP_SELL; // SELL
   aTicket[480] = -1; // Ticket given by broker
   aSymbol[480] = "USDCAD";
   aLots[480] = 1.0;
   aDate[480] = D'2011.09.30 13:01:12'+time_offset*3600;
   aPrice[480] = 1.04357;

   // ========== 481 ===== 600 ==========
   aPseudoTicket[481] = 242;
   aAction[481] = 1; // OPEN
   aReturn[242] = 481;
   aType[481] = OP_SELL; // SELL
   aTicket[481] = -1; // Ticket given by broker
   aSymbol[481] = "GBPUSD";
   aLots[481] = 1.0;
   aDate[481] = D'2011.09.30 13:37:07'+time_offset*3600;
   aPrice[481] = 1.55317;

   // ========== 482 ===== 600 ==========
   aPseudoTicket[482] = 242;
   aAction[482] = 0; // CLOSE
   aType[482] = OP_SELL; // SELL
   aTicket[482] = -1; // Ticket given by broker
   aSymbol[482] = "GBPUSD";
   aLots[482] = 1.0;
   aDate[482] = D'2011.09.30 14:05:36'+time_offset*3600;
   aPrice[482] = 1.55655;

   // ========== 483 ===== 599 ==========
   aPseudoTicket[483] = 241;
   aAction[483] = 0; // CLOSE
   aType[483] = OP_SELL; // SELL
   aTicket[483] = -1; // Ticket given by broker
   aSymbol[483] = "USDCAD";
   aLots[483] = 1.0;
   aDate[483] = D'2011.09.30 14:24:44'+time_offset*3600;
   aPrice[483] = 1.0375;

   // ========== 484 ===== 598 ==========
   aPseudoTicket[484] = 243;
   aAction[484] = 1; // OPEN
   aReturn[243] = 484;
   aType[484] = OP_SELL; // SELL
   aTicket[484] = -1; // Ticket given by broker
   aSymbol[484] = "EURUSD";
   aLots[484] = 1.0;
   aDate[484] = D'2011.10.03 18:18:53'+time_offset*3600;
   aPrice[484] = 1.32382;

   // ========== 485 ===== 598 ==========
   aPseudoTicket[485] = 243;
   aAction[485] = 0; // CLOSE
   aType[485] = OP_SELL; // SELL
   aTicket[485] = -1; // Ticket given by broker
   aSymbol[485] = "EURUSD";
   aLots[485] = 1.0;
   aDate[485] = D'2011.10.03 19:25:48'+time_offset*3600;
   aPrice[485] = 1.32075;

   // ========== 486 ===== 597 ==========
   aPseudoTicket[486] = 244;
   aAction[486] = 1; // OPEN
   aReturn[244] = 486;
   aType[486] = OP_BUY; // BUY
   aTicket[486] = -1; // Ticket given by broker
   aSymbol[486] = "AUDUSD";
   aLots[486] = 1.0;
   aDate[486] = D'2011.10.04 14:15:07'+time_offset*3600;
   aPrice[486] = 0.9433;

   // ========== 487 ===== 595 ==========
   aPseudoTicket[487] = 245;
   aAction[487] = 1; // OPEN
   aReturn[245] = 487;
   aType[487] = OP_SELL; // SELL
   aTicket[487] = -1; // Ticket given by broker
   aSymbol[487] = "USDCAD";
   aLots[487] = 1.0;
   aDate[487] = D'2011.10.04 15:17:03'+time_offset*3600;
   aPrice[487] = 1.05981;

   // ========== 488 ===== 597 ==========
   aPseudoTicket[488] = 244;
   aAction[488] = 0; // CLOSE
   aType[488] = OP_BUY; // BUY
   aTicket[488] = -1; // Ticket given by broker
   aSymbol[488] = "AUDUSD";
   aLots[488] = 1.0;
   aDate[488] = D'2011.10.04 16:01:26'+time_offset*3600;
   aPrice[488] = 0.94561;

   // ========== 489 ===== 596 ==========
   aPseudoTicket[489] = 246;
   aAction[489] = 1; // OPEN
   aReturn[246] = 489;
   aType[489] = OP_SELL; // SELL
   aTicket[489] = -1; // Ticket given by broker
   aSymbol[489] = "EURUSD";
   aLots[489] = 1.0;
   aDate[489] = D'2011.10.04 16:09:28'+time_offset*3600;
   aPrice[489] = 1.33045;

   // ========== 490 ===== 596 ==========
   aPseudoTicket[490] = 246;
   aAction[490] = 0; // CLOSE
   aType[490] = OP_SELL; // SELL
   aTicket[490] = -1; // Ticket given by broker
   aSymbol[490] = "EURUSD";
   aLots[490] = 1.0;
   aDate[490] = D'2011.10.04 16:42:19'+time_offset*3600;
   aPrice[490] = 1.32918;

   // ========== 491 ===== 595 ==========
   aPseudoTicket[491] = 245;
   aAction[491] = 0; // CLOSE
   aType[491] = OP_SELL; // SELL
   aTicket[491] = -1; // Ticket given by broker
   aSymbol[491] = "USDCAD";
   aLots[491] = 1.0;
   aDate[491] = D'2011.10.04 16:51:27'+time_offset*3600;
   aPrice[491] = 1.06018;

   // ========== 492 ===== 593 ==========
   aPseudoTicket[492] = 247;
   aAction[492] = 1; // OPEN
   aReturn[247] = 492;
   aType[492] = OP_SELL; // SELL
   aTicket[492] = -1; // Ticket given by broker
   aSymbol[492] = "USDCHF";
   aLots[492] = 1.0;
   aDate[492] = D'2011.10.05 00:43:30'+time_offset*3600;
   aPrice[492] = 0.91997;

   // ========== 493 ===== 594 ==========
   aPseudoTicket[493] = 248;
   aAction[493] = 1; // OPEN
   aReturn[248] = 493;
   aType[493] = OP_BUY; // BUY
   aTicket[493] = -1; // Ticket given by broker
   aSymbol[493] = "USDCAD";
   aLots[493] = 1.0;
   aDate[493] = D'2011.10.05 09:06:03'+time_offset*3600;
   aPrice[493] = 1.05312;

   // ========== 494 ===== 594 ==========
   aPseudoTicket[494] = 248;
   aAction[494] = 0; // CLOSE
   aType[494] = OP_BUY; // BUY
   aTicket[494] = -1; // Ticket given by broker
   aSymbol[494] = "USDCAD";
   aLots[494] = 1.0;
   aDate[494] = D'2011.10.05 09:30:55'+time_offset*3600;
   aPrice[494] = 1.05403;

   // ========== 495 ===== 593 ==========
   aPseudoTicket[495] = 247;
   aAction[495] = 0; // CLOSE
   aType[495] = OP_SELL; // SELL
   aTicket[495] = -1; // Ticket given by broker
   aSymbol[495] = "USDCHF";
   aLots[495] = 1.0;
   aDate[495] = D'2011.10.05 10:31:42'+time_offset*3600;
   aPrice[495] = 0.91834;

   // ========== 496 ===== 592 ==========
   aPseudoTicket[496] = 249;
   aAction[496] = 1; // OPEN
   aReturn[249] = 496;
   aType[496] = OP_SELL; // SELL
   aTicket[496] = -1; // Ticket given by broker
   aSymbol[496] = "AUDUSD";
   aLots[496] = 1.0;
   aDate[496] = D'2011.10.05 12:13:06'+time_offset*3600;
   aPrice[496] = 0.95802;

   // ========== 497 ===== 590 ==========
   aPseudoTicket[497] = 250;
   aAction[497] = 1; // OPEN
   aReturn[250] = 497;
   aType[497] = OP_BUY; // BUY
   aTicket[497] = -1; // Ticket given by broker
   aSymbol[497] = "USDCAD";
   aLots[497] = 1.0;
   aDate[497] = D'2011.10.05 15:55:14'+time_offset*3600;
   aPrice[497] = 1.046;

   // ========== 498 ===== 592 ==========
   aPseudoTicket[498] = 249;
   aAction[498] = 0; // CLOSE
   aType[498] = OP_SELL; // SELL
   aTicket[498] = -1; // Ticket given by broker
   aSymbol[498] = "AUDUSD";
   aLots[498] = 1.0;
   aDate[498] = D'2011.10.06 06:17:10'+time_offset*3600;
   aPrice[498] = 0.968;

   // ========== 499 ===== 591 ==========
   aPseudoTicket[499] = 251;
   aAction[499] = 1; // OPEN
   aReturn[251] = 499;
   aType[499] = OP_BUY; // BUY
   aTicket[499] = -1; // Ticket given by broker
   aSymbol[499] = "USDCAD";
   aLots[499] = 1.0;
   aDate[499] = D'2011.10.06 07:01:38'+time_offset*3600;
   aPrice[499] = 1.04133;

   // ========== 500 ===== 591 ==========
   aPseudoTicket[500] = 251;
   aAction[500] = 0; // CLOSE
   aType[500] = OP_BUY; // BUY
   aTicket[500] = -1; // Ticket given by broker
   aSymbol[500] = "USDCAD";
   aLots[500] = 1.0;
   aDate[500] = D'2011.10.06 08:14:57'+time_offset*3600;
   aPrice[500] = 1.03875;

   // ========== 501 ===== 590 ==========
   aPseudoTicket[501] = 250;
   aAction[501] = 0; // CLOSE
   aType[501] = OP_BUY; // BUY
   aTicket[501] = -1; // Ticket given by broker
   aSymbol[501] = "USDCAD";
   aLots[501] = 1.0;
   aDate[501] = D'2011.10.06 08:15:27'+time_offset*3600;
   aPrice[501] = 1.03855;

   // ========== 502 ===== 588 ==========
   aPseudoTicket[502] = 252;
   aAction[502] = 1; // OPEN
   aReturn[252] = 502;
   aType[502] = OP_SELL; // SELL
   aTicket[502] = -1; // Ticket given by broker
   aSymbol[502] = "USDCHF";
   aLots[502] = 1.0;
   aDate[502] = D'2011.10.06 08:20:34'+time_offset*3600;
   aPrice[502] = 0.92418;

   // ========== 503 ===== 589 ==========
   aPseudoTicket[503] = 253;
   aAction[503] = 1; // OPEN
   aReturn[253] = 503;
   aType[503] = OP_SELL; // SELL
   aTicket[503] = -1; // Ticket given by broker
   aSymbol[503] = "GBPUSD";
   aLots[503] = 1.0;
   aDate[503] = D'2011.10.06 11:12:52'+time_offset*3600;
   aPrice[503] = 1.52814;

   // ========== 504 ===== 589 ==========
   aPseudoTicket[504] = 253;
   aAction[504] = 0; // CLOSE
   aType[504] = OP_SELL; // SELL
   aTicket[504] = -1; // Ticket given by broker
   aSymbol[504] = "GBPUSD";
   aLots[504] = 1.0;
   aDate[504] = D'2011.10.06 23:03:29'+time_offset*3600;
   aPrice[504] = 1.54328;

   // ========== 505 ===== 588 ==========
   aPseudoTicket[505] = 252;
   aAction[505] = 0; // CLOSE
   aType[505] = OP_SELL; // SELL
   aTicket[505] = -1; // Ticket given by broker
   aSymbol[505] = "USDCHF";
   aLots[505] = 1.0;
   aDate[505] = D'2011.10.06 23:43:41'+time_offset*3600;
   aPrice[505] = 0.91968;

   // ========== 506 ===== 582 ==========
   aPseudoTicket[506] = 254;
   aAction[506] = 1; // OPEN
   aReturn[254] = 506;
   aType[506] = OP_SELL; // SELL
   aTicket[506] = -1; // Ticket given by broker
   aSymbol[506] = "AUDUSD";
   aLots[506] = 1.0;
   aDate[506] = D'2011.10.07 04:49:34'+time_offset*3600;
   aPrice[506] = 0.97827;

   // ========== 507 ===== 587 ==========
   aPseudoTicket[507] = 255;
   aAction[507] = 1; // OPEN
   aReturn[255] = 507;
   aType[507] = OP_BUY; // BUY
   aTicket[507] = -1; // Ticket given by broker
   aSymbol[507] = "EURUSD";
   aLots[507] = 1.0;
   aDate[507] = D'2011.10.07 07:22:54'+time_offset*3600;
   aPrice[507] = 1.34636;

   // ========== 508 ===== 587 ==========
   aPseudoTicket[508] = 255;
   aAction[508] = 0; // CLOSE
   aType[508] = OP_BUY; // BUY
   aTicket[508] = -1; // Ticket given by broker
   aSymbol[508] = "EURUSD";
   aLots[508] = 1.0;
   aDate[508] = D'2011.10.07 07:49:07'+time_offset*3600;
   aPrice[508] = 1.34405;

   // ========== 509 ===== 586 ==========
   aPseudoTicket[509] = 256;
   aAction[509] = 1; // OPEN
   aReturn[256] = 509;
   aType[509] = OP_BUY; // BUY
   aTicket[509] = -1; // Ticket given by broker
   aSymbol[509] = "USDCHF";
   aLots[509] = 1.0;
   aDate[509] = D'2011.10.07 13:02:51'+time_offset*3600;
   aPrice[509] = 0.91965;

   // ========== 510 ===== 586 ==========
   aPseudoTicket[510] = 256;
   aAction[510] = 0; // CLOSE
   aType[510] = OP_BUY; // BUY
   aTicket[510] = -1; // Ticket given by broker
   aSymbol[510] = "USDCHF";
   aLots[510] = 1.0;
   aDate[510] = D'2011.10.07 14:52:31'+time_offset*3600;
   aPrice[510] = 0.9155;

   // ========== 511 ===== 583 ==========
   aPseudoTicket[511] = 257;
   aAction[511] = 1; // OPEN
   aReturn[257] = 511;
   aType[511] = OP_SELL; // SELL
   aTicket[511] = -1; // Ticket given by broker
   aSymbol[511] = "USDCHF";
   aLots[511] = 1.0;
   aDate[511] = D'2011.10.07 14:52:48'+time_offset*3600;
   aPrice[511] = 0.91526;

   // ========== 512 ===== 584 ==========
   aPseudoTicket[512] = 258;
   aAction[512] = 1; // OPEN
   aReturn[258] = 512;
   aType[512] = OP_SELL; // SELL
   aTicket[512] = -1; // Ticket given by broker
   aSymbol[512] = "USDCHF";
   aLots[512] = 1.0;
   aDate[512] = D'2011.10.07 14:57:05'+time_offset*3600;
   aPrice[512] = 0.91523;

   // ========== 513 ===== 585 ==========
   aPseudoTicket[513] = 259;
   aAction[513] = 1; // OPEN
   aReturn[259] = 513;
   aType[513] = OP_SELL; // SELL
   aTicket[513] = -1; // Ticket given by broker
   aSymbol[513] = "USDCHF";
   aLots[513] = 1.0;
   aDate[513] = D'2011.10.07 14:58:04'+time_offset*3600;
   aPrice[513] = 0.91487;

   // ========== 514 ===== 585 ==========
   aPseudoTicket[514] = 259;
   aAction[514] = 0; // CLOSE
   aType[514] = OP_SELL; // SELL
   aTicket[514] = -1; // Ticket given by broker
   aSymbol[514] = "USDCHF";
   aLots[514] = 1.0;
   aDate[514] = D'2011.10.07 16:03:52'+time_offset*3600;
   aPrice[514] = 0.91891;

   // ========== 515 ===== 584 ==========
   aPseudoTicket[515] = 258;
   aAction[515] = 0; // CLOSE
   aType[515] = OP_SELL; // SELL
   aTicket[515] = -1; // Ticket given by broker
   aSymbol[515] = "USDCHF";
   aLots[515] = 1.0;
   aDate[515] = D'2011.10.07 16:03:55'+time_offset*3600;
   aPrice[515] = 0.91828;

   // ========== 516 ===== 583 ==========
   aPseudoTicket[516] = 257;
   aAction[516] = 0; // CLOSE
   aType[516] = OP_SELL; // SELL
   aTicket[516] = -1; // Ticket given by broker
   aSymbol[516] = "USDCHF";
   aLots[516] = 1.0;
   aDate[516] = D'2011.10.07 16:04:08'+time_offset*3600;
   aPrice[516] = 0.91834;

   // ========== 517 ===== 582 ==========
   aPseudoTicket[517] = 254;
   aAction[517] = 0; // CLOSE
   aType[517] = OP_SELL; // SELL
   aTicket[517] = -1; // Ticket given by broker
   aSymbol[517] = "AUDUSD";
   aLots[517] = 1.0;
   aDate[517] = D'2011.10.07 16:04:30'+time_offset*3600;
   aPrice[517] = 0.98302;

   // ========== 518 ===== 579 ==========
   aPseudoTicket[518] = 260;
   aAction[518] = 1; // OPEN
   aReturn[260] = 518;
   aType[518] = OP_BUY; // BUY
   aTicket[518] = -1; // Ticket given by broker
   aSymbol[518] = "USDCHF";
   aLots[518] = 1.0;
   aDate[518] = D'2011.10.07 16:04:44'+time_offset*3600;
   aPrice[518] = 0.91778;

   // ========== 519 ===== 578 ==========
   aPseudoTicket[519] = 261;
   aAction[519] = 1; // OPEN
   aReturn[261] = 519;
   aType[519] = OP_BUY; // BUY
   aTicket[519] = -1; // Ticket given by broker
   aSymbol[519] = "USDCHF";
   aLots[519] = 1.0;
   aDate[519] = D'2011.10.07 16:05:16'+time_offset*3600;
   aPrice[519] = 0.91786;

   // ========== 520 ===== 580 ==========
   aPseudoTicket[520] = 262;
   aAction[520] = 1; // OPEN
   aReturn[262] = 520;
   aType[520] = OP_BUY; // BUY
   aTicket[520] = -1; // Ticket given by broker
   aSymbol[520] = "USDCHF";
   aLots[520] = 1.0;
   aDate[520] = D'2011.10.07 16:05:56'+time_offset*3600;
   aPrice[520] = 0.91798;

   // ========== 521 ===== 581 ==========
   aPseudoTicket[521] = 263;
   aAction[521] = 1; // OPEN
   aReturn[263] = 521;
   aType[521] = OP_BUY; // BUY
   aTicket[521] = -1; // Ticket given by broker
   aSymbol[521] = "USDCHF";
   aLots[521] = 1.0;
   aDate[521] = D'2011.10.07 16:06:46'+time_offset*3600;
   aPrice[521] = 0.9175;

   // ========== 522 ===== 581 ==========
   aPseudoTicket[522] = 263;
   aAction[522] = 0; // CLOSE
   aType[522] = OP_BUY; // BUY
   aTicket[522] = -1; // Ticket given by broker
   aSymbol[522] = "USDCHF";
   aLots[522] = 1.0;
   aDate[522] = D'2011.10.07 18:45:49'+time_offset*3600;
   aPrice[522] = 0.92661;

   // ========== 523 ===== 580 ==========
   aPseudoTicket[523] = 262;
   aAction[523] = 0; // CLOSE
   aType[523] = OP_BUY; // BUY
   aTicket[523] = -1; // Ticket given by broker
   aSymbol[523] = "USDCHF";
   aLots[523] = 1.0;
   aDate[523] = D'2011.10.07 18:56:07'+time_offset*3600;
   aPrice[523] = 0.92737;

   // ========== 524 ===== 579 ==========
   aPseudoTicket[524] = 260;
   aAction[524] = 0; // CLOSE
   aType[524] = OP_BUY; // BUY
   aTicket[524] = -1; // Ticket given by broker
   aSymbol[524] = "USDCHF";
   aLots[524] = 1.0;
   aDate[524] = D'2011.10.07 19:15:39'+time_offset*3600;
   aPrice[524] = 0.92721;

   // ========== 525 ===== 578 ==========
   aPseudoTicket[525] = 261;
   aAction[525] = 0; // CLOSE
   aType[525] = OP_BUY; // BUY
   aTicket[525] = -1; // Ticket given by broker
   aSymbol[525] = "USDCHF";
   aLots[525] = 1.0;
   aDate[525] = D'2011.10.07 19:59:29'+time_offset*3600;
   aPrice[525] = 0.92668;

   // ========== 526 ===== 575 ==========
   aPseudoTicket[526] = 264;
   aAction[526] = 1; // OPEN
   aReturn[264] = 526;
   aType[526] = OP_SELL; // SELL
   aTicket[526] = -1; // Ticket given by broker
   aSymbol[526] = "AUDUSD";
   aLots[526] = 1.0;
   aDate[526] = D'2011.10.10 01:08:54'+time_offset*3600;
   aPrice[526] = 0.98374;

   // ========== 527 ===== 576 ==========
   aPseudoTicket[527] = 265;
   aAction[527] = 1; // OPEN
   aReturn[265] = 527;
   aType[527] = OP_SELL; // SELL
   aTicket[527] = -1; // Ticket given by broker
   aSymbol[527] = "EURUSD";
   aLots[527] = 1.0;
   aDate[527] = D'2011.10.10 01:37:33'+time_offset*3600;
   aPrice[527] = 1.3459;

   // ========== 528 ===== 577 ==========
   aPseudoTicket[528] = 266;
   aAction[528] = 1; // OPEN
   aReturn[266] = 528;
   aType[528] = OP_SELL; // SELL
   aTicket[528] = -1; // Ticket given by broker
   aSymbol[528] = "EURUSD";
   aLots[528] = 1.0;
   aDate[528] = D'2011.10.10 14:08:04'+time_offset*3600;
   aPrice[528] = 1.36553;

   // ========== 529 ===== 577 ==========
   aPseudoTicket[529] = 266;
   aAction[529] = 0; // CLOSE
   aType[529] = OP_SELL; // SELL
   aTicket[529] = -1; // Ticket given by broker
   aSymbol[529] = "EURUSD";
   aLots[529] = 1.0;
   aDate[529] = D'2011.10.10 22:42:15'+time_offset*3600;
   aPrice[529] = 1.36329;

   // ========== 530 ===== 576 ==========
   aPseudoTicket[530] = 265;
   aAction[530] = 0; // CLOSE
   aType[530] = OP_SELL; // SELL
   aTicket[530] = -1; // Ticket given by broker
   aSymbol[530] = "EURUSD";
   aLots[530] = 1.0;
   aDate[530] = D'2011.10.11 01:02:18'+time_offset*3600;
   aPrice[530] = 1.36277;

   // ========== 531 ===== 575 ==========
   aPseudoTicket[531] = 264;
   aAction[531] = 0; // CLOSE
   aType[531] = OP_SELL; // SELL
   aTicket[531] = -1; // Ticket given by broker
   aSymbol[531] = "AUDUSD";
   aLots[531] = 1.0;
   aDate[531] = D'2011.10.11 08:26:29'+time_offset*3600;
   aPrice[531] = 0.99345;

   // ========== 532 ===== 574 ==========
   aPseudoTicket[532] = 267;
   aAction[532] = 1; // OPEN
   aReturn[267] = 532;
   aType[532] = OP_BUY; // BUY
   aTicket[532] = -1; // Ticket given by broker
   aSymbol[532] = "EURUSD";
   aLots[532] = 1.0;
   aDate[532] = D'2011.10.11 08:56:08'+time_offset*3600;
   aPrice[532] = 1.35995;

   // ========== 533 ===== 574 ==========
   aPseudoTicket[533] = 267;
   aAction[533] = 0; // CLOSE
   aType[533] = OP_BUY; // BUY
   aTicket[533] = -1; // Ticket given by broker
   aSymbol[533] = "EURUSD";
   aLots[533] = 1.0;
   aDate[533] = D'2011.10.11 09:17:24'+time_offset*3600;
   aPrice[533] = 1.3599;

   // ========== 534 ===== 573 ==========
   aPseudoTicket[534] = 268;
   aAction[534] = 1; // OPEN
   aReturn[268] = 534;
   aType[534] = OP_BUY; // BUY
   aTicket[534] = -1; // Ticket given by broker
   aSymbol[534] = "EURUSD";
   aLots[534] = 1.0;
   aDate[534] = D'2011.10.11 10:28:46'+time_offset*3600;
   aPrice[534] = 1.35975;

   // ========== 535 ===== 571 ==========
   aPseudoTicket[535] = 269;
   aAction[535] = 1; // OPEN
   aReturn[269] = 535;
   aType[535] = OP_SELL; // SELL
   aTicket[535] = -1; // Ticket given by broker
   aSymbol[535] = "USDCHF";
   aLots[535] = 1.0;
   aDate[535] = D'2011.10.11 10:31:22'+time_offset*3600;
   aPrice[535] = 0.91091;

   // ========== 536 ===== 573 ==========
   aPseudoTicket[536] = 268;
   aAction[536] = 0; // CLOSE
   aType[536] = OP_BUY; // BUY
   aTicket[536] = -1; // Ticket given by broker
   aSymbol[536] = "EURUSD";
   aLots[536] = 1.0;
   aDate[536] = D'2011.10.11 15:58:40'+time_offset*3600;
   aPrice[536] = 1.36585;

   // ========== 537 ===== 572 ==========
   aPseudoTicket[537] = 270;
   aAction[537] = 1; // OPEN
   aReturn[270] = 537;
   aType[537] = OP_BUY; // BUY
   aTicket[537] = -1; // Ticket given by broker
   aSymbol[537] = "EURUSD";
   aLots[537] = 1.0;
   aDate[537] = D'2011.10.12 08:15:59'+time_offset*3600;
   aPrice[537] = 1.37282;

   // ========== 538 ===== 572 ==========
   aPseudoTicket[538] = 270;
   aAction[538] = 0; // CLOSE
   aType[538] = OP_BUY; // BUY
   aTicket[538] = -1; // Ticket given by broker
   aSymbol[538] = "EURUSD";
   aLots[538] = 1.0;
   aDate[538] = D'2011.10.12 08:21:18'+time_offset*3600;
   aPrice[538] = 1.3738;

   // ========== 539 ===== 571 ==========
   aPseudoTicket[539] = 269;
   aAction[539] = 0; // CLOSE
   aType[539] = OP_SELL; // SELL
   aTicket[539] = -1; // Ticket given by broker
   aSymbol[539] = "USDCHF";
   aLots[539] = 1.0;
   aDate[539] = D'2011.10.12 08:43:44'+time_offset*3600;
   aPrice[539] = 0.90124;

   // ========== 540 ===== 565 ==========
   aPseudoTicket[540] = 271;
   aAction[540] = 1; // OPEN
   aReturn[271] = 540;
   aType[540] = OP_SELL; // SELL
   aTicket[540] = -1; // Ticket given by broker
   aSymbol[540] = "AUDUSD";
   aLots[540] = 1.0;
   aDate[540] = D'2011.10.12 13:01:24'+time_offset*3600;
   aPrice[540] = 1.01334;

   // ========== 541 ===== 570 ==========
   aPseudoTicket[541] = 272;
   aAction[541] = 1; // OPEN
   aReturn[272] = 541;
   aType[541] = OP_BUY; // BUY
   aTicket[541] = -1; // Ticket given by broker
   aSymbol[541] = "USDJPY";
   aLots[541] = 1.0;
   aDate[541] = D'2011.10.12 13:09:58'+time_offset*3600;
   aPrice[541] = 77.314;

   // ========== 542 ===== 569 ==========
   aPseudoTicket[542] = 273;
   aAction[542] = 1; // OPEN
   aReturn[273] = 542;
   aType[542] = OP_SELL; // SELL
   aTicket[542] = -1; // Ticket given by broker
   aSymbol[542] = "AUDUSD";
   aLots[542] = 1.0;
   aDate[542] = D'2011.10.12 14:28:14'+time_offset*3600;
   aPrice[542] = 1.01651;

   // ========== 543 ===== 567 ==========
   aPseudoTicket[543] = 274;
   aAction[543] = 1; // OPEN
   aReturn[274] = 543;
   aType[543] = OP_SELL; // SELL
   aTicket[543] = -1; // Ticket given by broker
   aSymbol[543] = "AUDUSD";
   aLots[543] = 1.0;
   aDate[543] = D'2011.10.12 17:06:21'+time_offset*3600;
   aPrice[543] = 1.01963;

   // ========== 544 ===== 570 ==========
   aPseudoTicket[544] = 272;
   aAction[544] = 0; // CLOSE
   aType[544] = OP_BUY; // BUY
   aTicket[544] = -1; // Ticket given by broker
   aSymbol[544] = "USDJPY";
   aLots[544] = 1.0;
   aDate[544] = D'2011.10.12 18:45:35'+time_offset*3600;
   aPrice[544] = 77.335;

   // ========== 545 ===== 568 ==========
   aPseudoTicket[545] = 275;
   aAction[545] = 1; // OPEN
   aReturn[275] = 545;
   aType[545] = OP_SELL; // SELL
   aTicket[545] = -1; // Ticket given by broker
   aSymbol[545] = "AUDUSD";
   aLots[545] = 1.0;
   aDate[545] = D'2011.10.12 18:45:43'+time_offset*3600;
   aPrice[545] = 1.01947;

   // ========== 546 ===== 569 ==========
   aPseudoTicket[546] = 273;
   aAction[546] = 0; // CLOSE
   aType[546] = OP_SELL; // SELL
   aTicket[546] = -1; // Ticket given by broker
   aSymbol[546] = "AUDUSD";
   aLots[546] = 1.0;
   aDate[546] = D'2011.10.12 21:47:11'+time_offset*3600;
   aPrice[546] = 1.0133;

   // ========== 547 ===== 568 ==========
   aPseudoTicket[547] = 275;
   aAction[547] = 0; // CLOSE
   aType[547] = OP_SELL; // SELL
   aTicket[547] = -1; // Ticket given by broker
   aSymbol[547] = "AUDUSD";
   aLots[547] = 1.0;
   aDate[547] = D'2011.10.12 21:48:59'+time_offset*3600;
   aPrice[547] = 1.013;

   // ========== 548 ===== 567 ==========
   aPseudoTicket[548] = 274;
   aAction[548] = 0; // CLOSE
   aType[548] = OP_SELL; // SELL
   aTicket[548] = -1; // Ticket given by broker
   aSymbol[548] = "AUDUSD";
   aLots[548] = 1.0;
   aDate[548] = D'2011.10.12 22:07:57'+time_offset*3600;
   aPrice[548] = 1.01458;

   // ========== 549 ===== 566 ==========
   aPseudoTicket[549] = 276;
   aAction[549] = 1; // OPEN
   aReturn[276] = 549;
   aType[549] = OP_SELL; // SELL
   aTicket[549] = -1; // Ticket given by broker
   aSymbol[549] = "AUDUSD";
   aLots[549] = 1.0;
   aDate[549] = D'2011.10.13 00:31:20'+time_offset*3600;
   aPrice[549] = 1.02241;

   // ========== 550 ===== 566 ==========
   aPseudoTicket[550] = 276;
   aAction[550] = 0; // CLOSE
   aType[550] = OP_SELL; // SELL
   aTicket[550] = -1; // Ticket given by broker
   aSymbol[550] = "AUDUSD";
   aLots[550] = 1.0;
   aDate[550] = D'2011.10.13 01:10:46'+time_offset*3600;
   aPrice[550] = 1.01933;

   // ========== 551 ===== 565 ==========
   aPseudoTicket[551] = 271;
   aAction[551] = 0; // CLOSE
   aType[551] = OP_SELL; // SELL
   aTicket[551] = -1; // Ticket given by broker
   aSymbol[551] = "AUDUSD";
   aLots[551] = 1.0;
   aDate[551] = D'2011.10.13 06:00:14'+time_offset*3600;
   aPrice[551] = 1.0188;

   // ========== 552 ===== 564 ==========
   aPseudoTicket[552] = 277;
   aAction[552] = 1; // OPEN
   aReturn[277] = 552;
   aType[552] = OP_BUY; // BUY
   aTicket[552] = -1; // Ticket given by broker
   aSymbol[552] = "EURUSD";
   aLots[552] = 1.0;
   aDate[552] = D'2011.10.13 07:27:46'+time_offset*3600;
   aPrice[552] = 1.38193;

   // ========== 553 ===== 564 ==========
   aPseudoTicket[553] = 277;
   aAction[553] = 0; // CLOSE
   aType[553] = OP_BUY; // BUY
   aTicket[553] = -1; // Ticket given by broker
   aSymbol[553] = "EURUSD";
   aLots[553] = 1.0;
   aDate[553] = D'2011.10.13 08:05:47'+time_offset*3600;
   aPrice[553] = 1.37923;

   // ========== 554 ===== 560 ==========
   aPseudoTicket[554] = 278;
   aAction[554] = 1; // OPEN
   aReturn[278] = 554;
   aType[554] = OP_SELL; // SELL
   aTicket[554] = -1; // Ticket given by broker
   aSymbol[554] = "AUDUSD";
   aLots[554] = 1.0;
   aDate[554] = D'2011.10.13 08:29:46'+time_offset*3600;
   aPrice[554] = 1.01674;

   // ========== 555 ===== 562 ==========
   aPseudoTicket[555] = 279;
   aAction[555] = 1; // OPEN
   aReturn[279] = 555;
   aType[555] = OP_SELL; // SELL
   aTicket[555] = -1; // Ticket given by broker
   aSymbol[555] = "AUDUSD";
   aLots[555] = 1.0;
   aDate[555] = D'2011.10.13 08:31:11'+time_offset*3600;
   aPrice[555] = 1.01737;

   // ========== 556 ===== 563 ==========
   aPseudoTicket[556] = 280;
   aAction[556] = 1; // OPEN
   aReturn[280] = 556;
   aType[556] = OP_SELL; // SELL
   aTicket[556] = -1; // Ticket given by broker
   aSymbol[556] = "AUDUSD";
   aLots[556] = 1.0;
   aDate[556] = D'2011.10.13 08:32:08'+time_offset*3600;
   aPrice[556] = 1.01736;

   // ========== 557 ===== 563 ==========
   aPseudoTicket[557] = 280;
   aAction[557] = 0; // CLOSE
   aType[557] = OP_SELL; // SELL
   aTicket[557] = -1; // Ticket given by broker
   aSymbol[557] = "AUDUSD";
   aLots[557] = 1.0;
   aDate[557] = D'2011.10.13 08:40:24'+time_offset*3600;
   aPrice[557] = 1.01433;

   // ========== 558 ===== 556 ==========
   aPseudoTicket[558] = 281;
   aAction[558] = 1; // OPEN
   aReturn[281] = 558;
   aType[558] = OP_SELL; // SELL
   aTicket[558] = -1; // Ticket given by broker
   aSymbol[558] = "USDJPY";
   aLots[558] = 1.0;
   aDate[558] = D'2011.10.13 08:57:15'+time_offset*3600;
   aPrice[558] = 76.799;

   // ========== 559 ===== 557 ==========
   aPseudoTicket[559] = 282;
   aAction[559] = 1; // OPEN
   aReturn[282] = 559;
   aType[559] = OP_SELL; // SELL
   aTicket[559] = -1; // Ticket given by broker
   aSymbol[559] = "USDJPY";
   aLots[559] = 1.0;
   aDate[559] = D'2011.10.13 09:00:38'+time_offset*3600;
   aPrice[559] = 76.824;

   // ========== 560 ===== 562 ==========
   aPseudoTicket[560] = 279;
   aAction[560] = 0; // CLOSE
   aType[560] = OP_SELL; // SELL
   aTicket[560] = -1; // Ticket given by broker
   aSymbol[560] = "AUDUSD";
   aLots[560] = 1.0;
   aDate[560] = D'2011.10.13 09:04:18'+time_offset*3600;
   aPrice[560] = 1.01671;

   // ========== 561 ===== 561 ==========
   aPseudoTicket[561] = 283;
   aAction[561] = 1; // OPEN
   aReturn[283] = 561;
   aType[561] = OP_SELL; // SELL
   aTicket[561] = -1; // Ticket given by broker
   aSymbol[561] = "EURUSD";
   aLots[561] = 1.0;
   aDate[561] = D'2011.10.13 09:34:00'+time_offset*3600;
   aPrice[561] = 1.37345;

   // ========== 562 ===== 561 ==========
   aPseudoTicket[562] = 283;
   aAction[562] = 0; // CLOSE
   aType[562] = OP_SELL; // SELL
   aTicket[562] = -1; // Ticket given by broker
   aSymbol[562] = "EURUSD";
   aLots[562] = 1.0;
   aDate[562] = D'2011.10.13 10:06:28'+time_offset*3600;
   aPrice[562] = 1.37211;

   // ========== 563 ===== 560 ==========
   aPseudoTicket[563] = 278;
   aAction[563] = 0; // CLOSE
   aType[563] = OP_SELL; // SELL
   aTicket[563] = -1; // Ticket given by broker
   aSymbol[563] = "AUDUSD";
   aLots[563] = 1.0;
   aDate[563] = D'2011.10.13 10:22:56'+time_offset*3600;
   aPrice[563] = 1.01468;

   // ========== 564 ===== 558 ==========
   aPseudoTicket[564] = 284;
   aAction[564] = 1; // OPEN
   aReturn[284] = 564;
   aType[564] = OP_SELL; // SELL
   aTicket[564] = -1; // Ticket given by broker
   aSymbol[564] = "USDCHF";
   aLots[564] = 1.0;
   aDate[564] = D'2011.10.13 13:28:57'+time_offset*3600;
   aPrice[564] = 0.90023;

   // ========== 565 ===== 559 ==========
   aPseudoTicket[565] = 285;
   aAction[565] = 1; // OPEN
   aReturn[285] = 565;
   aType[565] = OP_SELL; // SELL
   aTicket[565] = -1; // Ticket given by broker
   aSymbol[565] = "USDCHF";
   aLots[565] = 1.0;
   aDate[565] = D'2011.10.13 13:35:31'+time_offset*3600;
   aPrice[565] = 0.901;

   // ========== 566 ===== 559 ==========
   aPseudoTicket[566] = 285;
   aAction[566] = 0; // CLOSE
   aType[566] = OP_SELL; // SELL
   aTicket[566] = -1; // Ticket given by broker
   aSymbol[566] = "USDCHF";
   aLots[566] = 1.0;
   aDate[566] = D'2011.10.13 15:25:18'+time_offset*3600;
   aPrice[566] = 0.90014;

   // ========== 567 ===== 558 ==========
   aPseudoTicket[567] = 284;
   aAction[567] = 0; // CLOSE
   aType[567] = OP_SELL; // SELL
   aTicket[567] = -1; // Ticket given by broker
   aSymbol[567] = "USDCHF";
   aLots[567] = 1.0;
   aDate[567] = D'2011.10.13 15:40:38'+time_offset*3600;
   aPrice[567] = 0.9005;

   // ========== 568 ===== 557 ==========
   aPseudoTicket[568] = 282;
   aAction[568] = 0; // CLOSE
   aType[568] = OP_SELL; // SELL
   aTicket[568] = -1; // Ticket given by broker
   aSymbol[568] = "USDJPY";
   aLots[568] = 1.0;
   aDate[568] = D'2011.10.13 15:59:16'+time_offset*3600;
   aPrice[568] = 76.89;

   // ========== 569 ===== 556 ==========
   aPseudoTicket[569] = 281;
   aAction[569] = 0; // CLOSE
   aType[569] = OP_SELL; // SELL
   aTicket[569] = -1; // Ticket given by broker
   aSymbol[569] = "USDJPY";
   aLots[569] = 1.0;
   aDate[569] = D'2011.10.14 00:43:53'+time_offset*3600;
   aPrice[569] = 76.963;

   // ========== 570 ===== 554 ==========
   aPseudoTicket[570] = 286;
   aAction[570] = 1; // OPEN
   aReturn[286] = 570;
   aType[570] = OP_BUY; // BUY
   aTicket[570] = -1; // Ticket given by broker
   aSymbol[570] = "USDCAD";
   aLots[570] = 1.0;
   aDate[570] = D'2011.10.14 04:27:28'+time_offset*3600;
   aPrice[570] = 1.02152;

   // ========== 571 ===== 555 ==========
   aPseudoTicket[571] = 287;
   aAction[571] = 1; // OPEN
   aReturn[287] = 571;
   aType[571] = OP_SELL; // SELL
   aTicket[571] = -1; // Ticket given by broker
   aSymbol[571] = "EURUSD";
   aLots[571] = 1.0;
   aDate[571] = D'2011.10.14 05:57:31'+time_offset*3600;
   aPrice[571] = 1.3785;

   // ========== 572 ===== 555 ==========
   aPseudoTicket[572] = 287;
   aAction[572] = 0; // CLOSE
   aType[572] = OP_SELL; // SELL
   aTicket[572] = -1; // Ticket given by broker
   aSymbol[572] = "EURUSD";
   aLots[572] = 1.0;
   aDate[572] = D'2011.10.14 08:32:56'+time_offset*3600;
   aPrice[572] = 1.38082;

   // ========== 573 ===== 554 ==========
   aPseudoTicket[573] = 286;
   aAction[573] = 0; // CLOSE
   aType[573] = OP_BUY; // BUY
   aTicket[573] = -1; // Ticket given by broker
   aSymbol[573] = "USDCAD";
   aLots[573] = 1.0;
   aDate[573] = D'2011.10.14 08:33:11'+time_offset*3600;
   aPrice[573] = 1.01732;

   // ========== 574 ===== 550 ==========
   aPseudoTicket[574] = 288;
   aAction[574] = 1; // OPEN
   aReturn[288] = 574;
   aType[574] = OP_BUY; // BUY
   aTicket[574] = -1; // Ticket given by broker
   aSymbol[574] = "USDCAD";
   aLots[574] = 1.0;
   aDate[574] = D'2011.10.14 08:53:53'+time_offset*3600;
   aPrice[574] = 1.01779;

   // ========== 575 ===== 553 ==========
   aPseudoTicket[575] = 289;
   aAction[575] = 1; // OPEN
   aReturn[289] = 575;
   aType[575] = OP_BUY; // BUY
   aTicket[575] = -1; // Ticket given by broker
   aSymbol[575] = "USDCAD";
   aLots[575] = 1.0;
   aDate[575] = D'2011.10.14 09:01:15'+time_offset*3600;
   aPrice[575] = 1.01824;

   // ========== 576 ===== 552 ==========
   aPseudoTicket[576] = 290;
   aAction[576] = 1; // OPEN
   aReturn[290] = 576;
   aType[576] = OP_BUY; // BUY
   aTicket[576] = -1; // Ticket given by broker
   aSymbol[576] = "USDCAD";
   aLots[576] = 1.0;
   aDate[576] = D'2011.10.14 09:37:04'+time_offset*3600;
   aPrice[576] = 1.01686;

   // ========== 577 ===== 551 ==========
   aPseudoTicket[577] = 291;
   aAction[577] = 1; // OPEN
   aReturn[291] = 577;
   aType[577] = OP_BUY; // BUY
   aTicket[577] = -1; // Ticket given by broker
   aSymbol[577] = "USDCAD";
   aLots[577] = 1.0;
   aDate[577] = D'2011.10.14 09:48:30'+time_offset*3600;
   aPrice[577] = 1.01663;

   // ========== 578 ===== 552 ==========
   aPseudoTicket[578] = 290;
   aAction[578] = 0; // CLOSE
   aType[578] = OP_BUY; // BUY
   aTicket[578] = -1; // Ticket given by broker
   aSymbol[578] = "USDCAD";
   aLots[578] = 1.0;
   aDate[578] = D'2011.10.14 12:30:00'+time_offset*3600;
   aPrice[578] = 1.013;

   // ========== 579 ===== 553 ==========
   aPseudoTicket[579] = 289;
   aAction[579] = 0; // CLOSE
   aType[579] = OP_BUY; // BUY
   aTicket[579] = -1; // Ticket given by broker
   aSymbol[579] = "USDCAD";
   aLots[579] = 1.0;
   aDate[579] = D'2011.10.14 12:30:00'+time_offset*3600;
   aPrice[579] = 1.013;

   // ========== 580 ===== 551 ==========
   aPseudoTicket[580] = 291;
   aAction[580] = 0; // CLOSE
   aType[580] = OP_BUY; // BUY
   aTicket[580] = -1; // Ticket given by broker
   aSymbol[580] = "USDCAD";
   aLots[580] = 1.0;
   aDate[580] = D'2011.10.14 12:30:00'+time_offset*3600;
   aPrice[580] = 1.013;

   // ========== 581 ===== 550 ==========
   aPseudoTicket[581] = 288;
   aAction[581] = 0; // CLOSE
   aType[581] = OP_BUY; // BUY
   aTicket[581] = -1; // Ticket given by broker
   aSymbol[581] = "USDCAD";
   aLots[581] = 1.0;
   aDate[581] = D'2011.10.14 12:37:58'+time_offset*3600;
   aPrice[581] = 1.01159;

   // ========== 582 ===== 549 ==========
   aPseudoTicket[582] = 292;
   aAction[582] = 1; // OPEN
   aReturn[292] = 582;
   aType[582] = OP_BUY; // BUY
   aTicket[582] = -1; // Ticket given by broker
   aSymbol[582] = "EURUSD";
   aLots[582] = 1.0;
   aDate[582] = D'2011.10.14 13:15:06'+time_offset*3600;
   aPrice[582] = 1.38507;

   // ========== 583 ===== 549 ==========
   aPseudoTicket[583] = 292;
   aAction[583] = 0; // CLOSE
   aType[583] = OP_BUY; // BUY
   aTicket[583] = -1; // Ticket given by broker
   aSymbol[583] = "EURUSD";
   aLots[583] = 1.0;
   aDate[583] = D'2011.10.14 14:31:03'+time_offset*3600;
   aPrice[583] = 1.38727;

   // ========== 584 ===== 548 ==========
   aPseudoTicket[584] = 293;
   aAction[584] = 1; // OPEN
   aReturn[293] = 584;
   aType[584] = OP_BUY; // BUY
   aTicket[584] = -1; // Ticket given by broker
   aSymbol[584] = "USDCAD";
   aLots[584] = 1.0;
   aDate[584] = D'2011.10.17 05:55:11'+time_offset*3600;
   aPrice[584] = 1.00856;

   // ========== 585 ===== 548 ==========
   aPseudoTicket[585] = 293;
   aAction[585] = 0; // CLOSE
   aType[585] = OP_BUY; // BUY
   aTicket[585] = -1; // Ticket given by broker
   aSymbol[585] = "USDCAD";
   aLots[585] = 1.0;
   aDate[585] = D'2011.10.17 11:19:34'+time_offset*3600;
   aPrice[585] = 1.01269;

   // ========== 586 ===== 544 ==========
   aPseudoTicket[586] = 294;
   aAction[586] = 1; // OPEN
   aReturn[294] = 586;
   aType[586] = OP_BUY; // BUY
   aTicket[586] = -1; // Ticket given by broker
   aSymbol[586] = "USDCAD";
   aLots[586] = 1.0;
   aDate[586] = D'2011.10.18 21:05:51'+time_offset*3600;
   aPrice[586] = 1.01475;

   // ========== 587 ===== 547 ==========
   aPseudoTicket[587] = 295;
   aAction[587] = 1; // OPEN
   aReturn[295] = 587;
   aType[587] = OP_BUY; // BUY
   aTicket[587] = -1; // Ticket given by broker
   aSymbol[587] = "USDCAD";
   aLots[587] = 1.0;
   aDate[587] = D'2011.10.19 01:55:57'+time_offset*3600;
   aPrice[587] = 1.01426;

   // ========== 588 ===== 545 ==========
   aPseudoTicket[588] = 296;
   aAction[588] = 1; // OPEN
   aReturn[296] = 588;
   aType[588] = OP_BUY; // BUY
   aTicket[588] = -1; // Ticket given by broker
   aSymbol[588] = "USDCAD";
   aLots[588] = 1.0;
   aDate[588] = D'2011.10.19 02:43:07'+time_offset*3600;
   aPrice[588] = 1.01328;

   // ========== 589 ===== 546 ==========
   aPseudoTicket[589] = 297;
   aAction[589] = 1; // OPEN
   aReturn[297] = 589;
   aType[589] = OP_BUY; // BUY
   aTicket[589] = -1; // Ticket given by broker
   aSymbol[589] = "USDCAD";
   aLots[589] = 1.0;
   aDate[589] = D'2011.10.19 03:15:44'+time_offset*3600;
   aPrice[589] = 1.0124;

   // ========== 590 ===== 547 ==========
   aPseudoTicket[590] = 295;
   aAction[590] = 0; // CLOSE
   aType[590] = OP_BUY; // BUY
   aTicket[590] = -1; // Ticket given by broker
   aSymbol[590] = "USDCAD";
   aLots[590] = 1.0;
   aDate[590] = D'2011.10.19 18:34:04'+time_offset*3600;
   aPrice[590] = 1.01842;

   // ========== 591 ===== 546 ==========
   aPseudoTicket[591] = 297;
   aAction[591] = 0; // CLOSE
   aType[591] = OP_BUY; // BUY
   aTicket[591] = -1; // Ticket given by broker
   aSymbol[591] = "USDCAD";
   aLots[591] = 1.0;
   aDate[591] = D'2011.10.20 01:12:03'+time_offset*3600;
   aPrice[591] = 1.02025;

   // ========== 592 ===== 545 ==========
   aPseudoTicket[592] = 296;
   aAction[592] = 0; // CLOSE
   aType[592] = OP_BUY; // BUY
   aTicket[592] = -1; // Ticket given by broker
   aSymbol[592] = "USDCAD";
   aLots[592] = 1.0;
   aDate[592] = D'2011.10.20 01:38:55'+time_offset*3600;
   aPrice[592] = 1.02048;

   // ========== 593 ===== 544 ==========
   aPseudoTicket[593] = 294;
   aAction[593] = 0; // CLOSE
   aType[593] = OP_BUY; // BUY
   aTicket[593] = -1; // Ticket given by broker
   aSymbol[593] = "USDCAD";
   aLots[593] = 1.0;
   aDate[593] = D'2011.10.20 01:39:19'+time_offset*3600;
   aPrice[593] = 1.02042;

   // ========== 594 ===== 543 ==========
   aPseudoTicket[594] = 298;
   aAction[594] = 1; // OPEN
   aReturn[298] = 594;
   aType[594] = OP_SELL; // SELL
   aTicket[594] = -1; // Ticket given by broker
   aSymbol[594] = "USDCHF";
   aLots[594] = 1.0;
   aDate[594] = D'2011.10.20 06:12:31'+time_offset*3600;
   aPrice[594] = 0.90777;

   // ========== 595 ===== 543 ==========
   aPseudoTicket[595] = 298;
   aAction[595] = 0; // CLOSE
   aType[595] = OP_SELL; // SELL
   aTicket[595] = -1; // Ticket given by broker
   aSymbol[595] = "USDCHF";
   aLots[595] = 1.0;
   aDate[595] = D'2011.10.20 07:15:37'+time_offset*3600;
   aPrice[595] = 0.90553;

   // ========== 596 ===== 542 ==========
   aPseudoTicket[596] = 299;
   aAction[596] = 1; // OPEN
   aReturn[299] = 596;
   aType[596] = OP_BUY; // BUY
   aTicket[596] = -1; // Ticket given by broker
   aSymbol[596] = "USDCHF";
   aLots[596] = 1.0;
   aDate[596] = D'2011.10.20 10:28:48'+time_offset*3600;
   aPrice[596] = 0.89434;

   // ========== 597 ===== 542 ==========
   aPseudoTicket[597] = 299;
   aAction[597] = 0; // CLOSE
   aType[597] = OP_BUY; // BUY
   aTicket[597] = -1; // Ticket given by broker
   aSymbol[597] = "USDCHF";
   aLots[597] = 1.0;
   aDate[597] = D'2011.10.20 10:36:08'+time_offset*3600;
   aPrice[597] = 0.895;

   // ========== 598 ===== 541 ==========
   aPseudoTicket[598] = 300;
   aAction[598] = 1; // OPEN
   aReturn[300] = 598;
   aType[598] = OP_SELL; // SELL
   aTicket[598] = -1; // Ticket given by broker
   aSymbol[598] = "USDCHF";
   aLots[598] = 1.0;
   aDate[598] = D'2011.10.21 04:00:11'+time_offset*3600;
   aPrice[598] = 0.88912;

   // ========== 599 ===== 541 ==========
   aPseudoTicket[599] = 300;
   aAction[599] = 0; // CLOSE
   aType[599] = OP_SELL; // SELL
   aTicket[599] = -1; // Ticket given by broker
   aSymbol[599] = "USDCHF";
   aLots[599] = 1.0;
   aDate[599] = D'2011.10.21 05:38:50'+time_offset*3600;
   aPrice[599] = 0.88896;

   // ========== 600 ===== 538 ==========
   aPseudoTicket[600] = 301;
   aAction[600] = 1; // OPEN
   aReturn[301] = 600;
   aType[600] = OP_SELL; // SELL
   aTicket[600] = -1; // Ticket given by broker
   aSymbol[600] = "USDJPY";
   aLots[600] = 1.0;
   aDate[600] = D'2011.10.21 12:55:08'+time_offset*3600;
   aPrice[600] = 76.437;

   // ========== 601 ===== 536 ==========
   aPseudoTicket[601] = 302;
   aAction[601] = 1; // OPEN
   aReturn[302] = 601;
   aType[601] = OP_SELL; // SELL
   aTicket[601] = -1; // Ticket given by broker
   aSymbol[601] = "USDJPY";
   aLots[601] = 1.0;
   aDate[601] = D'2011.10.21 13:25:38'+time_offset*3600;
   aPrice[601] = 76.099;

   // ========== 602 ===== 540 ==========
   aPseudoTicket[602] = 303;
   aAction[602] = 1; // OPEN
   aReturn[303] = 602;
   aType[602] = OP_BUY; // BUY
   aTicket[602] = -1; // Ticket given by broker
   aSymbol[602] = "GBPUSD";
   aLots[602] = 1.0;
   aDate[602] = D'2011.10.24 10:39:24'+time_offset*3600;
   aPrice[602] = 1.59253;

   // ========== 603 ===== 540 ==========
   aPseudoTicket[603] = 303;
   aAction[603] = 0; // CLOSE
   aType[603] = OP_BUY; // BUY
   aTicket[603] = -1; // Ticket given by broker
   aSymbol[603] = "GBPUSD";
   aLots[603] = 1.0;
   aDate[603] = D'2011.10.24 10:54:56'+time_offset*3600;
   aPrice[603] = 1.59243;

   // ========== 604 ===== 539 ==========
   aPseudoTicket[604] = 304;
   aAction[604] = 1; // OPEN
   aReturn[304] = 604;
   aType[604] = OP_BUY; // BUY
   aTicket[604] = -1; // Ticket given by broker
   aSymbol[604] = "GBPUSD";
   aLots[604] = 1.0;
   aDate[604] = D'2011.10.24 13:21:40'+time_offset*3600;
   aPrice[604] = 1.5905;

   // ========== 605 ===== 539 ==========
   aPseudoTicket[605] = 304;
   aAction[605] = 0; // CLOSE
   aType[605] = OP_BUY; // BUY
   aTicket[605] = -1; // Ticket given by broker
   aSymbol[605] = "GBPUSD";
   aLots[605] = 1.0;
   aDate[605] = D'2011.10.24 15:44:05'+time_offset*3600;
   aPrice[605] = 1.599;

   // ========== 606 ===== 538 ==========
   aPseudoTicket[606] = 301;
   aAction[606] = 0; // CLOSE
   aType[606] = OP_SELL; // SELL
   aTicket[606] = -1; // Ticket given by broker
   aSymbol[606] = "USDJPY";
   aLots[606] = 1.0;
   aDate[606] = D'2011.10.24 20:51:59'+time_offset*3600;
   aPrice[606] = 76.099;

   // ========== 607 ===== 537 ==========
   aPseudoTicket[607] = 305;
   aAction[607] = 1; // OPEN
   aReturn[305] = 607;
   aType[607] = OP_SELL; // SELL
   aTicket[607] = -1; // Ticket given by broker
   aSymbol[607] = "EURUSD";
   aLots[607] = 1.0;
   aDate[607] = D'2011.10.25 12:03:39'+time_offset*3600;
   aPrice[607] = 1.3913;

   // ========== 608 ===== 537 ==========
   aPseudoTicket[608] = 305;
   aAction[608] = 0; // CLOSE
   aType[608] = OP_SELL; // SELL
   aTicket[608] = -1; // Ticket given by broker
   aSymbol[608] = "EURUSD";
   aLots[608] = 1.0;
   aDate[608] = D'2011.10.25 12:26:54'+time_offset*3600;
   aPrice[608] = 1.39159;

   // ========== 609 ===== 536 ==========
   aPseudoTicket[609] = 302;
   aAction[609] = 0; // CLOSE
   aType[609] = OP_SELL; // SELL
   aTicket[609] = -1; // Ticket given by broker
   aSymbol[609] = "USDJPY";
   aLots[609] = 1.0;
   aDate[609] = D'2011.10.25 19:47:49'+time_offset*3600;
   aPrice[609] = 75.967;

   // ========== 610 ===== 535 ==========
   aPseudoTicket[610] = 306;
   aAction[610] = 1; // OPEN
   aReturn[306] = 610;
   aType[610] = OP_BUY; // BUY
   aTicket[610] = -1; // Ticket given by broker
   aSymbol[610] = "USDCHF";
   aLots[610] = 1.0;
   aDate[610] = D'2011.10.25 19:51:35'+time_offset*3600;
   aPrice[610] = 0.87908;

   // ========== 611 ===== 535 ==========
   aPseudoTicket[611] = 306;
   aAction[611] = 0; // CLOSE
   aType[611] = OP_BUY; // BUY
   aTicket[611] = -1; // Ticket given by broker
   aSymbol[611] = "USDCHF";
   aLots[611] = 1.0;
   aDate[611] = D'2011.10.25 23:50:04'+time_offset*3600;
   aPrice[611] = 0.87873;

   // ========== 612 ===== 534 ==========
   aPseudoTicket[612] = 307;
   aAction[612] = 1; // OPEN
   aReturn[307] = 612;
   aType[612] = OP_BUY; // BUY
   aTicket[612] = -1; // Ticket given by broker
   aSymbol[612] = "AUDUSD";
   aLots[612] = 1.0;
   aDate[612] = D'2011.10.26 00:37:07'+time_offset*3600;
   aPrice[612] = 1.03831;

   // ========== 613 ===== 534 ==========
   aPseudoTicket[613] = 307;
   aAction[613] = 0; // CLOSE
   aType[613] = OP_BUY; // BUY
   aTicket[613] = -1; // Ticket given by broker
   aSymbol[613] = "AUDUSD";
   aLots[613] = 1.0;
   aDate[613] = D'2011.10.26 01:12:55'+time_offset*3600;
   aPrice[613] = 1.03752;

   // ========== 614 ===== 532 ==========
   aPseudoTicket[614] = 308;
   aAction[614] = 1; // OPEN
   aReturn[308] = 614;
   aType[614] = OP_BUY; // BUY
   aTicket[614] = -1; // Ticket given by broker
   aSymbol[614] = "AUDUSD";
   aLots[614] = 1.0;
   aDate[614] = D'2011.10.26 03:21:04'+time_offset*3600;
   aPrice[614] = 1.0371;

   // ========== 615 ===== 533 ==========
   aPseudoTicket[615] = 309;
   aAction[615] = 1; // OPEN
   aReturn[309] = 615;
   aType[615] = OP_BUY; // BUY
   aTicket[615] = -1; // Ticket given by broker
   aSymbol[615] = "AUDUSD";
   aLots[615] = 1.0;
   aDate[615] = D'2011.10.26 08:33:44'+time_offset*3600;
   aPrice[615] = 1.03563;

   // ========== 616 ===== 533 ==========
   aPseudoTicket[616] = 309;
   aAction[616] = 0; // CLOSE
   aType[616] = OP_BUY; // BUY
   aTicket[616] = -1; // Ticket given by broker
   aSymbol[616] = "AUDUSD";
   aLots[616] = 1.0;
   aDate[616] = D'2011.10.26 11:35:19'+time_offset*3600;
   aPrice[616] = 1.03776;

   // ========== 617 ===== 532 ==========
   aPseudoTicket[617] = 308;
   aAction[617] = 0; // CLOSE
   aType[617] = OP_BUY; // BUY
   aTicket[617] = -1; // Ticket given by broker
   aSymbol[617] = "AUDUSD";
   aLots[617] = 1.0;
   aDate[617] = D'2011.10.26 11:35:24'+time_offset*3600;
   aPrice[617] = 1.03774;

   // ========== 618 ===== 527 ==========
   aPseudoTicket[618] = 310;
   aAction[618] = 1; // OPEN
   aReturn[310] = 618;
   aType[618] = OP_BUY; // BUY
   aTicket[618] = -1; // Ticket given by broker
   aSymbol[618] = "USDCAD";
   aLots[618] = 1.0;
   aDate[618] = D'2011.10.26 20:52:40'+time_offset*3600;
   aPrice[618] = 1.00408;

   // ========== 619 ===== 530 ==========
   aPseudoTicket[619] = 311;
   aAction[619] = 1; // OPEN
   aReturn[311] = 619;
   aType[619] = OP_BUY; // BUY
   aTicket[619] = -1; // Ticket given by broker
   aSymbol[619] = "USDCAD";
   aLots[619] = 1.0;
   aDate[619] = D'2011.10.27 00:09:20'+time_offset*3600;
   aPrice[619] = 1.002;

   // ========== 620 ===== 528 ==========
   aPseudoTicket[620] = 312;
   aAction[620] = 1; // OPEN
   aReturn[312] = 620;
   aType[620] = OP_BUY; // BUY
   aTicket[620] = -1; // Ticket given by broker
   aSymbol[620] = "USDCAD";
   aLots[620] = 1.0;
   aDate[620] = D'2011.10.27 01:43:19'+time_offset*3600;
   aPrice[620] = 1.00095;

   // ========== 621 ===== 531 ==========
   aPseudoTicket[621] = 313;
   aAction[621] = 1; // OPEN
   aReturn[313] = 621;
   aType[621] = OP_BUY; // BUY
   aTicket[621] = -1; // Ticket given by broker
   aSymbol[621] = "EURUSD";
   aLots[621] = 1.0;
   aDate[621] = D'2011.10.27 03:00:14'+time_offset*3600;
   aPrice[621] = 1.39581;

   // ========== 622 ===== 531 ==========
   aPseudoTicket[622] = 313;
   aAction[622] = 0; // CLOSE
   aType[622] = OP_BUY; // BUY
   aTicket[622] = -1; // Ticket given by broker
   aSymbol[622] = "EURUSD";
   aLots[622] = 1.0;
   aDate[622] = D'2011.10.27 04:30:33'+time_offset*3600;
   aPrice[622] = 1.39681;

   // ========== 623 ===== 529 ==========
   aPseudoTicket[623] = 314;
   aAction[623] = 1; // OPEN
   aReturn[314] = 623;
   aType[623] = OP_BUY; // BUY
   aTicket[623] = -1; // Ticket given by broker
   aSymbol[623] = "USDCAD";
   aLots[623] = 1.0;
   aDate[623] = D'2011.10.27 05:14:27'+time_offset*3600;
   aPrice[623] = 0.99918;

   // ========== 624 ===== 528 ==========
   aPseudoTicket[624] = 312;
   aAction[624] = 0; // CLOSE
   aType[624] = OP_BUY; // BUY
   aTicket[624] = -1; // Ticket given by broker
   aSymbol[624] = "USDCAD";
   aLots[624] = 1.0;
   aDate[624] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPrice[624] = 0.996;

   // ========== 625 ===== 527 ==========
   aPseudoTicket[625] = 310;
   aAction[625] = 0; // CLOSE
   aType[625] = OP_BUY; // BUY
   aTicket[625] = -1; // Ticket given by broker
   aSymbol[625] = "USDCAD";
   aLots[625] = 1.0;
   aDate[625] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPrice[625] = 0.996;

   // ========== 626 ===== 530 ==========
   aPseudoTicket[626] = 311;
   aAction[626] = 0; // CLOSE
   aType[626] = OP_BUY; // BUY
   aTicket[626] = -1; // Ticket given by broker
   aSymbol[626] = "USDCAD";
   aLots[626] = 1.0;
   aDate[626] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPrice[626] = 0.996;

   // ========== 627 ===== 529 ==========
   aPseudoTicket[627] = 314;
   aAction[627] = 0; // CLOSE
   aType[627] = OP_BUY; // BUY
   aTicket[627] = -1; // Ticket given by broker
   aSymbol[627] = "USDCAD";
   aLots[627] = 1.0;
   aDate[627] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPrice[627] = 0.996;

   // ========== 628 ===== 524 ==========
   aPseudoTicket[628] = 315;
   aAction[628] = 1; // OPEN
   aReturn[315] = 628;
   aType[628] = OP_SELL; // SELL
   aTicket[628] = -1; // Ticket given by broker
   aSymbol[628] = "AUDUSD";
   aLots[628] = 1.0;
   aDate[628] = D'2011.10.27 10:40:50'+time_offset*3600;
   aPrice[628] = 1.06189;

   // ========== 629 ===== 523 ==========
   aPseudoTicket[629] = 316;
   aAction[629] = 1; // OPEN
   aReturn[316] = 629;
   aType[629] = OP_SELL; // SELL
   aTicket[629] = -1; // Ticket given by broker
   aSymbol[629] = "AUDUSD";
   aLots[629] = 1.0;
   aDate[629] = D'2011.10.27 13:19:15'+time_offset*3600;
   aPrice[629] = 1.06841;

   // ========== 630 ===== 525 ==========
   aPseudoTicket[630] = 317;
   aAction[630] = 1; // OPEN
   aReturn[317] = 630;
   aType[630] = OP_SELL; // SELL
   aTicket[630] = -1; // Ticket given by broker
   aSymbol[630] = "AUDUSD";
   aLots[630] = 1.0;
   aDate[630] = D'2011.10.27 13:57:26'+time_offset*3600;
   aPrice[630] = 1.0687;

   // ========== 631 ===== 526 ==========
   aPseudoTicket[631] = 318;
   aAction[631] = 1; // OPEN
   aReturn[318] = 631;
   aType[631] = OP_SELL; // SELL
   aTicket[631] = -1; // Ticket given by broker
   aSymbol[631] = "AUDUSD";
   aLots[631] = 1.0;
   aDate[631] = D'2011.10.27 14:44:34'+time_offset*3600;
   aPrice[631] = 1.06634;

   // ========== 632 ===== 526 ==========
   aPseudoTicket[632] = 318;
   aAction[632] = 0; // CLOSE
   aType[632] = OP_SELL; // SELL
   aTicket[632] = -1; // Ticket given by broker
   aSymbol[632] = "AUDUSD";
   aLots[632] = 1.0;
   aDate[632] = D'2011.10.28 02:51:19'+time_offset*3600;
   aPrice[632] = 1.067;

   // ========== 633 ===== 525 ==========
   aPseudoTicket[633] = 317;
   aAction[633] = 0; // CLOSE
   aType[633] = OP_SELL; // SELL
   aTicket[633] = -1; // Ticket given by broker
   aSymbol[633] = "AUDUSD";
   aLots[633] = 1.0;
   aDate[633] = D'2011.10.28 02:51:19'+time_offset*3600;
   aPrice[633] = 1.067;

   // ========== 634 ===== 523 ==========
   aPseudoTicket[634] = 316;
   aAction[634] = 0; // CLOSE
   aType[634] = OP_SELL; // SELL
   aTicket[634] = -1; // Ticket given by broker
   aSymbol[634] = "AUDUSD";
   aLots[634] = 1.0;
   aDate[634] = D'2011.10.28 03:19:54'+time_offset*3600;
   aPrice[634] = 1.066;

   // ========== 635 ===== 524 ==========
   aPseudoTicket[635] = 315;
   aAction[635] = 0; // CLOSE
   aType[635] = OP_SELL; // SELL
   aTicket[635] = -1; // Ticket given by broker
   aSymbol[635] = "AUDUSD";
   aLots[635] = 1.0;
   aDate[635] = D'2011.10.28 03:19:54'+time_offset*3600;
   aPrice[635] = 1.066;

   // ========== 636 ===== 522 ==========
   aPseudoTicket[636] = 319;
   aAction[636] = 1; // OPEN
   aReturn[319] = 636;
   aType[636] = OP_BUY; // BUY
   aTicket[636] = -1; // Ticket given by broker
   aSymbol[636] = "EURUSD";
   aLots[636] = 1.0;
   aDate[636] = D'2011.10.28 07:42:16'+time_offset*3600;
   aPrice[636] = 1.41674;

   // ========== 637 ===== 522 ==========
   aPseudoTicket[637] = 319;
   aAction[637] = 0; // CLOSE
   aType[637] = OP_BUY; // BUY
   aTicket[637] = -1; // Ticket given by broker
   aSymbol[637] = "EURUSD";
   aLots[637] = 1.0;
   aDate[637] = D'2011.10.28 08:41:04'+time_offset*3600;
   aPrice[637] = 1.41822;

   // ========== 638 ===== 521 ==========
   aPseudoTicket[638] = 320;
   aAction[638] = 1; // OPEN
   aReturn[320] = 638;
   aType[638] = OP_BUY; // BUY
   aTicket[638] = -1; // Ticket given by broker
   aSymbol[638] = "EURUSD";
   aLots[638] = 1.0;
   aDate[638] = D'2011.10.28 10:26:26'+time_offset*3600;
   aPrice[638] = 1.41505;

   // ========== 639 ===== 521 ==========
   aPseudoTicket[639] = 320;
   aAction[639] = 0; // CLOSE
   aType[639] = OP_BUY; // BUY
   aTicket[639] = -1; // Ticket given by broker
   aSymbol[639] = "EURUSD";
   aLots[639] = 1.0;
   aDate[639] = D'2011.10.28 12:32:40'+time_offset*3600;
   aPrice[639] = 1.41679;

   // ========== 640 ===== 520 ==========
   aPseudoTicket[640] = 321;
   aAction[640] = 1; // OPEN
   aReturn[321] = 640;
   aType[640] = OP_BUY; // BUY
   aTicket[640] = -1; // Ticket given by broker
   aSymbol[640] = "EURUSD";
   aLots[640] = 1.0;
   aDate[640] = D'2011.10.30 23:43:13'+time_offset*3600;
   aPrice[640] = 1.41464;

   // ========== 641 ===== 518 ==========
   aPseudoTicket[641] = 322;
   aAction[641] = 1; // OPEN
   aReturn[322] = 641;
   aType[641] = OP_BUY; // BUY
   aTicket[641] = -1; // Ticket given by broker
   aSymbol[641] = "USDJPY";
   aLots[641] = 1.0;
   aDate[641] = D'2011.10.31 01:34:15'+time_offset*3600;
   aPrice[641] = 78.165;

   // ========== 642 ===== 517 ==========
   aPseudoTicket[642] = 323;
   aAction[642] = 1; // OPEN
   aReturn[323] = 642;
   aType[642] = OP_BUY; // BUY
   aTicket[642] = -1; // Ticket given by broker
   aSymbol[642] = "USDJPY";
   aLots[642] = 1.0;
   aDate[642] = D'2011.10.31 02:01:34'+time_offset*3600;
   aPrice[642] = 78.213;

   // ========== 643 ===== 519 ==========
   aPseudoTicket[643] = 324;
   aAction[643] = 1; // OPEN
   aReturn[324] = 643;
   aType[643] = OP_BUY; // BUY
   aTicket[643] = -1; // Ticket given by broker
   aSymbol[643] = "USDJPY";
   aLots[643] = 1.0;
   aDate[643] = D'2011.10.31 02:05:07'+time_offset*3600;
   aPrice[643] = 77.936;

   // ========== 644 ===== 520 ==========
   aPseudoTicket[644] = 321;
   aAction[644] = 0; // CLOSE
   aType[644] = OP_BUY; // BUY
   aTicket[644] = -1; // Ticket given by broker
   aSymbol[644] = "EURUSD";
   aLots[644] = 1.0;
   aDate[644] = D'2011.10.31 02:19:00'+time_offset*3600;
   aPrice[644] = 1.40792;

   // ========== 645 ===== 519 ==========
   aPseudoTicket[645] = 324;
   aAction[645] = 0; // CLOSE
   aType[645] = OP_BUY; // BUY
   aTicket[645] = -1; // Ticket given by broker
   aSymbol[645] = "USDJPY";
   aLots[645] = 1.0;
   aDate[645] = D'2011.10.31 04:15:34'+time_offset*3600;
   aPrice[645] = 79.189;

   // ========== 646 ===== 518 ==========
   aPseudoTicket[646] = 322;
   aAction[646] = 0; // CLOSE
   aType[646] = OP_BUY; // BUY
   aTicket[646] = -1; // Ticket given by broker
   aSymbol[646] = "USDJPY";
   aLots[646] = 1.0;
   aDate[646] = D'2011.10.31 04:26:31'+time_offset*3600;
   aPrice[646] = 79.187;

   // ========== 647 ===== 517 ==========
   aPseudoTicket[647] = 323;
   aAction[647] = 0; // CLOSE
   aType[647] = OP_BUY; // BUY
   aTicket[647] = -1; // Ticket given by broker
   aSymbol[647] = "USDJPY";
   aLots[647] = 1.0;
   aDate[647] = D'2011.10.31 05:58:48'+time_offset*3600;
   aPrice[647] = 79.324;

   // ========== 648 ===== 516 ==========
   aPseudoTicket[648] = 325;
   aAction[648] = 1; // OPEN
   aReturn[325] = 648;
   aType[648] = OP_BUY; // BUY
   aTicket[648] = -1; // Ticket given by broker
   aSymbol[648] = "USDJPY";
   aLots[648] = 1.0;
   aDate[648] = D'2011.10.31 08:53:54'+time_offset*3600;
   aPrice[648] = 78.02;

   // ========== 649 ===== 515 ==========
   aPseudoTicket[649] = 326;
   aAction[649] = 1; // OPEN
   aReturn[326] = 649;
   aType[649] = OP_SELL; // SELL
   aTicket[649] = -1; // Ticket given by broker
   aSymbol[649] = "GBPUSD";
   aLots[649] = 1.0;
   aDate[649] = D'2011.10.31 13:40:58'+time_offset*3600;
   aPrice[649] = 1.60406;

   // ========== 650 ===== 514 ==========
   aPseudoTicket[650] = 327;
   aAction[650] = 1; // OPEN
   aReturn[327] = 650;
   aType[650] = OP_SELL; // SELL
   aTicket[650] = -1; // Ticket given by broker
   aSymbol[650] = "AUDUSD";
   aLots[650] = 1.0;
   aDate[650] = D'2011.10.31 14:41:25'+time_offset*3600;
   aPrice[650] = 1.06049;

   // ========== 651 ===== 516 ==========
   aPseudoTicket[651] = 325;
   aAction[651] = 0; // CLOSE
   aType[651] = OP_BUY; // BUY
   aTicket[651] = -1; // Ticket given by broker
   aSymbol[651] = "USDJPY";
   aLots[651] = 1.0;
   aDate[651] = D'2011.10.31 15:19:44'+time_offset*3600;
   aPrice[651] = 77.967;

   // ========== 652 ===== 515 ==========
   aPseudoTicket[652] = 326;
   aAction[652] = 0; // CLOSE
   aType[652] = OP_SELL; // SELL
   aTicket[652] = -1; // Ticket given by broker
   aSymbol[652] = "GBPUSD";
   aLots[652] = 1.0;
   aDate[652] = D'2011.10.31 19:20:03'+time_offset*3600;
   aPrice[652] = 1.61;

   // ========== 653 ===== 514 ==========
   aPseudoTicket[653] = 327;
   aAction[653] = 0; // CLOSE
   aType[653] = OP_SELL; // SELL
   aTicket[653] = -1; // Ticket given by broker
   aSymbol[653] = "AUDUSD";
   aLots[653] = 1.0;
   aDate[653] = D'2011.10.31 21:40:05'+time_offset*3600;
   aPrice[653] = 1.05381;

   // ========== 654 ===== 512 ==========
   aPseudoTicket[654] = 328;
   aAction[654] = 1; // OPEN
   aReturn[328] = 654;
   aType[654] = OP_SELL; // SELL
   aTicket[654] = -1; // Ticket given by broker
   aSymbol[654] = "USDCHF";
   aLots[654] = 1.0;
   aDate[654] = D'2011.11.01 02:31:15'+time_offset*3600;
   aPrice[654] = 0.87719;

   // ========== 655 ===== 513 ==========
   aPseudoTicket[655] = 329;
   aAction[655] = 1; // OPEN
   aReturn[329] = 655;
   aType[655] = OP_SELL; // SELL
   aTicket[655] = -1; // Ticket given by broker
   aSymbol[655] = "USDCHF";
   aLots[655] = 1.0;
   aDate[655] = D'2011.11.01 03:52:16'+time_offset*3600;
   aPrice[655] = 0.87848;

   // ========== 656 ===== 513 ==========
   aPseudoTicket[656] = 329;
   aAction[656] = 0; // CLOSE
   aType[656] = OP_SELL; // SELL
   aTicket[656] = -1; // Ticket given by broker
   aSymbol[656] = "USDCHF";
   aLots[656] = 1.0;
   aDate[656] = D'2011.11.01 05:15:50'+time_offset*3600;
   aPrice[656] = 0.88055;

   // ========== 657 ===== 512 ==========
   aPseudoTicket[657] = 328;
   aAction[657] = 0; // CLOSE
   aType[657] = OP_SELL; // SELL
   aTicket[657] = -1; // Ticket given by broker
   aSymbol[657] = "USDCHF";
   aLots[657] = 1.0;
   aDate[657] = D'2011.11.01 05:15:55'+time_offset*3600;
   aPrice[657] = 0.88054;

   // ========== 658 ===== 511 ==========
   aPseudoTicket[658] = 330;
   aAction[658] = 1; // OPEN
   aReturn[330] = 658;
   aType[658] = OP_SELL; // SELL
   aTicket[658] = -1; // Ticket given by broker
   aSymbol[658] = "GBPUSD";
   aLots[658] = 1.0;
   aDate[658] = D'2011.11.01 05:23:17'+time_offset*3600;
   aPrice[658] = 1.60285;

   // ========== 659 ===== 511 ==========
   aPseudoTicket[659] = 330;
   aAction[659] = 0; // CLOSE
   aType[659] = OP_SELL; // SELL
   aTicket[659] = -1; // Ticket given by broker
   aSymbol[659] = "GBPUSD";
   aLots[659] = 1.0;
   aDate[659] = D'2011.11.01 06:06:11'+time_offset*3600;
   aPrice[659] = 1.60535;

   // ========== 660 ===== 510 ==========
   aPseudoTicket[660] = 331;
   aAction[660] = 1; // OPEN
   aReturn[331] = 660;
   aType[660] = OP_BUY; // BUY
   aTicket[660] = -1; // Ticket given by broker
   aSymbol[660] = "AUDUSD";
   aLots[660] = 1.0;
   aDate[660] = D'2011.11.01 11:58:19'+time_offset*3600;
   aPrice[660] = 1.02994;

   // ========== 661 ===== 507 ==========
   aPseudoTicket[661] = 332;
   aAction[661] = 1; // OPEN
   aReturn[332] = 661;
   aType[661] = OP_BUY; // BUY
   aTicket[661] = -1; // Ticket given by broker
   aSymbol[661] = "EURUSD";
   aLots[661] = 1.0;
   aDate[661] = D'2011.11.01 12:40:36'+time_offset*3600;
   aPrice[661] = 1.36569;

   // ========== 662 ===== 508 ==========
   aPseudoTicket[662] = 333;
   aAction[662] = 1; // OPEN
   aReturn[333] = 662;
   aType[662] = OP_BUY; // BUY
   aTicket[662] = -1; // Ticket given by broker
   aSymbol[662] = "EURUSD";
   aLots[662] = 1.0;
   aDate[662] = D'2011.11.01 12:42:23'+time_offset*3600;
   aPrice[662] = 1.36491;

   // ========== 663 ===== 509 ==========
   aPseudoTicket[663] = 334;
   aAction[663] = 1; // OPEN
   aReturn[334] = 663;
   aType[663] = OP_BUY; // BUY
   aTicket[663] = -1; // Ticket given by broker
   aSymbol[663] = "EURUSD";
   aLots[663] = 1.0;
   aDate[663] = D'2011.11.01 13:14:55'+time_offset*3600;
   aPrice[663] = 1.36277;

   // ========== 664 ===== 510 ==========
   aPseudoTicket[664] = 331;
   aAction[664] = 0; // CLOSE
   aType[664] = OP_BUY; // BUY
   aTicket[664] = -1; // Ticket given by broker
   aSymbol[664] = "AUDUSD";
   aLots[664] = 1.0;
   aDate[664] = D'2011.11.01 14:15:46'+time_offset*3600;
   aPrice[664] = 1.03267;

   // ========== 665 ===== 509 ==========
   aPseudoTicket[665] = 334;
   aAction[665] = 0; // CLOSE
   aType[665] = OP_BUY; // BUY
   aTicket[665] = -1; // Ticket given by broker
   aSymbol[665] = "EURUSD";
   aLots[665] = 1.0;
   aDate[665] = D'2011.11.01 14:27:11'+time_offset*3600;
   aPrice[665] = 1.36749;

   // ========== 666 ===== 508 ==========
   aPseudoTicket[666] = 333;
   aAction[666] = 0; // CLOSE
   aType[666] = OP_BUY; // BUY
   aTicket[666] = -1; // Ticket given by broker
   aSymbol[666] = "EURUSD";
   aLots[666] = 1.0;
   aDate[666] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPrice[666] = 1.3681;

   // ========== 667 ===== 507 ==========
   aPseudoTicket[667] = 332;
   aAction[667] = 0; // CLOSE
   aType[667] = OP_BUY; // BUY
   aTicket[667] = -1; // Ticket given by broker
   aSymbol[667] = "EURUSD";
   aLots[667] = 1.0;
   aDate[667] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPrice[667] = 1.3681;

   // ========== 668 ===== 505 ==========
   aPseudoTicket[668] = 335;
   aAction[668] = 1; // OPEN
   aReturn[335] = 668;
   aType[668] = OP_SELL; // SELL
   aTicket[668] = -1; // Ticket given by broker
   aSymbol[668] = "USDCAD";
   aLots[668] = 1.0;
   aDate[668] = D'2011.11.01 23:21:16'+time_offset*3600;
   aPrice[668] = 1.02147;

   // ========== 669 ===== 506 ==========
   aPseudoTicket[669] = 336;
   aAction[669] = 1; // OPEN
   aReturn[336] = 669;
   aType[669] = OP_SELL; // SELL
   aTicket[669] = -1; // Ticket given by broker
   aSymbol[669] = "USDCAD";
   aLots[669] = 1.0;
   aDate[669] = D'2011.11.01 23:22:04'+time_offset*3600;
   aPrice[669] = 1.02162;

   // ========== 670 ===== 506 ==========
   aPseudoTicket[670] = 336;
   aAction[670] = 0; // CLOSE
   aType[670] = OP_SELL; // SELL
   aTicket[670] = -1; // Ticket given by broker
   aSymbol[670] = "USDCAD";
   aLots[670] = 1.0;
   aDate[670] = D'2011.11.02 03:24:36'+time_offset*3600;
   aPrice[670] = 1.01885;

   // ========== 671 ===== 505 ==========
   aPseudoTicket[671] = 335;
   aAction[671] = 0; // CLOSE
   aType[671] = OP_SELL; // SELL
   aTicket[671] = -1; // Ticket given by broker
   aSymbol[671] = "USDCAD";
   aLots[671] = 1.0;
   aDate[671] = D'2011.11.02 03:41:26'+time_offset*3600;
   aPrice[671] = 1.01875;

   // ========== 672 ===== 503 ==========
   aPseudoTicket[672] = 337;
   aAction[672] = 1; // OPEN
   aReturn[337] = 672;
   aType[672] = OP_SELL; // SELL
   aTicket[672] = -1; // Ticket given by broker
   aSymbol[672] = "AUDUSD";
   aLots[672] = 1.0;
   aDate[672] = D'2011.11.02 04:54:49'+time_offset*3600;
   aPrice[672] = 1.03594;

   // ========== 673 ===== 504 ==========
   aPseudoTicket[673] = 338;
   aAction[673] = 1; // OPEN
   aReturn[338] = 673;
   aType[673] = OP_SELL; // SELL
   aTicket[673] = -1; // Ticket given by broker
   aSymbol[673] = "AUDUSD";
   aLots[673] = 1.0;
   aDate[673] = D'2011.11.02 06:11:39'+time_offset*3600;
   aPrice[673] = 1.038;

   // ========== 674 ===== 501 ==========
   aPseudoTicket[674] = 339;
   aAction[674] = 1; // OPEN
   aReturn[339] = 674;
   aType[674] = OP_SELL; // SELL
   aTicket[674] = -1; // Ticket given by broker
   aSymbol[674] = "GBPUSD";
   aLots[674] = 1.0;
   aDate[674] = D'2011.11.02 07:53:01'+time_offset*3600;
   aPrice[674] = 1.5984;

   // ========== 675 ===== 504 ==========
   aPseudoTicket[675] = 338;
   aAction[675] = 0; // CLOSE
   aType[675] = OP_SELL; // SELL
   aTicket[675] = -1; // Ticket given by broker
   aSymbol[675] = "AUDUSD";
   aLots[675] = 1.0;
   aDate[675] = D'2011.11.02 08:08:55'+time_offset*3600;
   aPrice[675] = 1.0417;

   // ========== 676 ===== 503 ==========
   aPseudoTicket[676] = 337;
   aAction[676] = 0; // CLOSE
   aType[676] = OP_SELL; // SELL
   aTicket[676] = -1; // Ticket given by broker
   aSymbol[676] = "AUDUSD";
   aLots[676] = 1.0;
   aDate[676] = D'2011.11.02 11:07:29'+time_offset*3600;
   aPrice[676] = 1.03501;

   // ========== 677 ===== 502 ==========
   aPseudoTicket[677] = 340;
   aAction[677] = 1; // OPEN
   aReturn[340] = 677;
   aType[677] = OP_BUY; // BUY
   aTicket[677] = -1; // Ticket given by broker
   aSymbol[677] = "EURUSD";
   aLots[677] = 1.0;
   aDate[677] = D'2011.11.02 13:35:53'+time_offset*3600;
   aPrice[677] = 1.38277;

   // ========== 678 ===== 502 ==========
   aPseudoTicket[678] = 340;
   aAction[678] = 0; // CLOSE
   aType[678] = OP_BUY; // BUY
   aTicket[678] = -1; // Ticket given by broker
   aSymbol[678] = "EURUSD";
   aLots[678] = 1.0;
   aDate[678] = D'2011.11.02 16:16:24'+time_offset*3600;
   aPrice[678] = 1.377;

   // ========== 679 ===== 501 ==========
   aPseudoTicket[679] = 339;
   aAction[679] = 0; // CLOSE
   aType[679] = OP_SELL; // SELL
   aTicket[679] = -1; // Ticket given by broker
   aSymbol[679] = "GBPUSD";
   aLots[679] = 1.0;
   aDate[679] = D'2011.11.03 07:31:55'+time_offset*3600;
   aPrice[679] = 1.58871;

   // ========== 680 ===== 500 ==========
   aPseudoTicket[680] = 341;
   aAction[680] = 1; // OPEN
   aReturn[341] = 680;
   aType[680] = OP_BUY; // BUY
   aTicket[680] = -1; // Ticket given by broker
   aSymbol[680] = "USDCHF";
   aLots[680] = 1.0;
   aDate[680] = D'2011.11.04 08:25:16'+time_offset*3600;
   aPrice[680] = 0.88452;

   // ========== 681 ===== 500 ==========
   aPseudoTicket[681] = 341;
   aAction[681] = 0; // CLOSE
   aType[681] = OP_BUY; // BUY
   aTicket[681] = -1; // Ticket given by broker
   aSymbol[681] = "USDCHF";
   aLots[681] = 1.0;
   aDate[681] = D'2011.11.04 09:16:28'+time_offset*3600;
   aPrice[681] = 0.88512;

   // ========== 682 ===== 497 ==========
   aPseudoTicket[682] = 342;
   aAction[682] = 1; // OPEN
   aReturn[342] = 682;
   aType[682] = OP_BUY; // BUY
   aTicket[682] = -1; // Ticket given by broker
   aSymbol[682] = "USDJPY";
   aLots[682] = 1.0;
   aDate[682] = D'2011.11.04 12:32:24'+time_offset*3600;
   aPrice[682] = 78.115;

   // ========== 683 ===== 498 ==========
   aPseudoTicket[683] = 343;
   aAction[683] = 1; // OPEN
   aReturn[343] = 683;
   aType[683] = OP_BUY; // BUY
   aTicket[683] = -1; // Ticket given by broker
   aSymbol[683] = "USDJPY";
   aLots[683] = 1.0;
   aDate[683] = D'2011.11.04 12:34:16'+time_offset*3600;
   aPrice[683] = 78.076;

   // ========== 684 ===== 499 ==========
   aPseudoTicket[684] = 344;
   aAction[684] = 1; // OPEN
   aReturn[344] = 684;
   aType[684] = OP_BUY; // BUY
   aTicket[684] = -1; // Ticket given by broker
   aSymbol[684] = "GBPUSD";
   aLots[684] = 1.0;
   aDate[684] = D'2011.11.04 12:36:08'+time_offset*3600;
   aPrice[684] = 1.60413;

   // ========== 685 ===== 499 ==========
   aPseudoTicket[685] = 344;
   aAction[685] = 0; // CLOSE
   aType[685] = OP_BUY; // BUY
   aTicket[685] = -1; // Ticket given by broker
   aSymbol[685] = "GBPUSD";
   aLots[685] = 1.0;
   aDate[685] = D'2011.11.04 12:46:14'+time_offset*3600;
   aPrice[685] = 1.60165;

   // ========== 686 ===== 496 ==========
   aPseudoTicket[686] = 345;
   aAction[686] = 1; // OPEN
   aReturn[345] = 686;
   aType[686] = OP_SELL; // SELL
   aTicket[686] = -1; // Ticket given by broker
   aSymbol[686] = "EURUSD";
   aLots[686] = 1.0;
   aDate[686] = D'2011.11.04 12:46:23'+time_offset*3600;
   aPrice[686] = 1.38212;

   // ========== 687 ===== 498 ==========
   aPseudoTicket[687] = 343;
   aAction[687] = 0; // CLOSE
   aType[687] = OP_BUY; // BUY
   aTicket[687] = -1; // Ticket given by broker
   aSymbol[687] = "USDJPY";
   aLots[687] = 1.0;
   aDate[687] = D'2011.11.04 13:05:27'+time_offset*3600;
   aPrice[687] = 78.04;

   // ========== 688 ===== 497 ==========
   aPseudoTicket[688] = 342;
   aAction[688] = 0; // CLOSE
   aType[688] = OP_BUY; // BUY
   aTicket[688] = -1; // Ticket given by broker
   aSymbol[688] = "USDJPY";
   aLots[688] = 1.0;
   aDate[688] = D'2011.11.04 13:18:26'+time_offset*3600;
   aPrice[688] = 78.079;

   // ========== 689 ===== 495 ==========
   aPseudoTicket[689] = 346;
   aAction[689] = 1; // OPEN
   aReturn[346] = 689;
   aType[689] = OP_SELL; // SELL
   aTicket[689] = -1; // Ticket given by broker
   aSymbol[689] = "EURUSD";
   aLots[689] = 1.0;
   aDate[689] = D'2011.11.04 14:10:35'+time_offset*3600;
   aPrice[689] = 1.37354;

   // ========== 690 ===== 496 ==========
   aPseudoTicket[690] = 345;
   aAction[690] = 0; // CLOSE
   aType[690] = OP_SELL; // SELL
   aTicket[690] = -1; // Ticket given by broker
   aSymbol[690] = "EURUSD";
   aLots[690] = 1.0;
   aDate[690] = D'2011.11.04 15:28:01'+time_offset*3600;
   aPrice[690] = 1.37404;

   // ========== 691 ===== 495 ==========
   aPseudoTicket[691] = 346;
   aAction[691] = 0; // CLOSE
   aType[691] = OP_SELL; // SELL
   aTicket[691] = -1; // Ticket given by broker
   aSymbol[691] = "EURUSD";
   aLots[691] = 1.0;
   aDate[691] = D'2011.11.04 15:46:51'+time_offset*3600;
   aPrice[691] = 1.37617;

   // ========== 692 ===== 494 ==========
   aPseudoTicket[692] = 347;
   aAction[692] = 1; // OPEN
   aReturn[347] = 692;
   aType[692] = OP_BUY; // BUY
   aTicket[692] = -1; // Ticket given by broker
   aSymbol[692] = "GBPUSD";
   aLots[692] = 1.0;
   aDate[692] = D'2011.11.04 15:48:04'+time_offset*3600;
   aPrice[692] = 1.60322;

   // ========== 693 ===== 494 ==========
   aPseudoTicket[693] = 347;
   aAction[693] = 0; // CLOSE
   aType[693] = OP_BUY; // BUY
   aTicket[693] = -1; // Ticket given by broker
   aSymbol[693] = "GBPUSD";
   aLots[693] = 1.0;
   aDate[693] = D'2011.11.04 18:53:46'+time_offset*3600;
   aPrice[693] = 1.6035;

   // ========== 694 ===== 493 ==========
   aPseudoTicket[694] = 348;
   aAction[694] = 1; // OPEN
   aReturn[348] = 694;
   aType[694] = OP_SELL; // SELL
   aTicket[694] = -1; // Ticket given by broker
   aSymbol[694] = "GBPUSD";
   aLots[694] = 1.0;
   aDate[694] = D'2011.11.06 22:08:20'+time_offset*3600;
   aPrice[694] = 1.6054;

   // ========== 695 ===== 493 ==========
   aPseudoTicket[695] = 348;
   aAction[695] = 0; // CLOSE
   aType[695] = OP_SELL; // SELL
   aTicket[695] = -1; // Ticket given by broker
   aSymbol[695] = "GBPUSD";
   aLots[695] = 1.0;
   aDate[695] = D'2011.11.07 02:08:22'+time_offset*3600;
   aPrice[695] = 1.60098;

   // ========== 696 ===== 492 ==========
   aPseudoTicket[696] = 349;
   aAction[696] = 1; // OPEN
   aReturn[349] = 696;
   aType[696] = OP_SELL; // SELL
   aTicket[696] = -1; // Ticket given by broker
   aSymbol[696] = "GBPUSD";
   aLots[696] = 1.0;
   aDate[696] = D'2011.11.07 05:04:16'+time_offset*3600;
   aPrice[696] = 1.60232;

   // ========== 697 ===== 492 ==========
   aPseudoTicket[697] = 349;
   aAction[697] = 0; // CLOSE
   aType[697] = OP_SELL; // SELL
   aTicket[697] = -1; // Ticket given by broker
   aSymbol[697] = "GBPUSD";
   aLots[697] = 1.0;
   aDate[697] = D'2011.11.07 10:27:06'+time_offset*3600;
   aPrice[697] = 1.59941;

   // ========== 698 ===== 491 ==========
   aPseudoTicket[698] = 350;
   aAction[698] = 1; // OPEN
   aReturn[350] = 698;
   aType[698] = OP_SELL; // SELL
   aTicket[698] = -1; // Ticket given by broker
   aSymbol[698] = "GBPUSD";
   aLots[698] = 1.0;
   aDate[698] = D'2011.11.07 22:11:44'+time_offset*3600;
   aPrice[698] = 1.60546;

   // ========== 699 ===== 491 ==========
   aPseudoTicket[699] = 350;
   aAction[699] = 0; // CLOSE
   aType[699] = OP_SELL; // SELL
   aTicket[699] = -1; // Ticket given by broker
   aSymbol[699] = "GBPUSD";
   aLots[699] = 1.0;
   aDate[699] = D'2011.11.08 04:57:00'+time_offset*3600;
   aPrice[699] = 1.60431;

   // ========== 700 ===== 490 ==========
   aPseudoTicket[700] = 351;
   aAction[700] = 1; // OPEN
   aReturn[351] = 700;
   aType[700] = OP_SELL; // SELL
   aTicket[700] = -1; // Ticket given by broker
   aSymbol[700] = "EURUSD";
   aLots[700] = 1.0;
   aDate[700] = D'2011.11.08 08:00:55'+time_offset*3600;
   aPrice[700] = 1.37262;

   // ========== 701 ===== 490 ==========
   aPseudoTicket[701] = 351;
   aAction[701] = 0; // CLOSE
   aType[701] = OP_SELL; // SELL
   aTicket[701] = -1; // Ticket given by broker
   aSymbol[701] = "EURUSD";
   aLots[701] = 1.0;
   aDate[701] = D'2011.11.08 08:09:08'+time_offset*3600;
   aPrice[701] = 1.37469;

   // ========== 702 ===== 489 ==========
   aPseudoTicket[702] = 352;
   aAction[702] = 1; // OPEN
   aReturn[352] = 702;
   aType[702] = OP_SELL; // SELL
   aTicket[702] = -1; // Ticket given by broker
   aSymbol[702] = "USDCHF";
   aLots[702] = 1.0;
   aDate[702] = D'2011.11.08 08:15:10'+time_offset*3600;
   aPrice[702] = 0.90355;

   // ========== 703 ===== 489 ==========
   aPseudoTicket[703] = 352;
   aAction[703] = 0; // CLOSE
   aType[703] = OP_SELL; // SELL
   aTicket[703] = -1; // Ticket given by broker
   aSymbol[703] = "USDCHF";
   aLots[703] = 1.0;
   aDate[703] = D'2011.11.08 08:21:29'+time_offset*3600;
   aPrice[703] = 0.90339;

   // ========== 704 ===== 487 ==========
   aPseudoTicket[704] = 353;
   aAction[704] = 1; // OPEN
   aReturn[353] = 704;
   aType[704] = OP_SELL; // SELL
   aTicket[704] = -1; // Ticket given by broker
   aSymbol[704] = "GBPUSD";
   aLots[704] = 1.0;
   aDate[704] = D'2011.11.08 08:38:42'+time_offset*3600;
   aPrice[704] = 1.60616;

   // ========== 705 ===== 488 ==========
   aPseudoTicket[705] = 354;
   aAction[705] = 1; // OPEN
   aReturn[354] = 705;
   aType[705] = OP_SELL; // SELL
   aTicket[705] = -1; // Ticket given by broker
   aSymbol[705] = "GBPUSD";
   aLots[705] = 1.0;
   aDate[705] = D'2011.11.08 10:25:15'+time_offset*3600;
   aPrice[705] = 1.60868;

   // ========== 706 ===== 488 ==========
   aPseudoTicket[706] = 354;
   aAction[706] = 0; // CLOSE
   aType[706] = OP_SELL; // SELL
   aTicket[706] = -1; // Ticket given by broker
   aSymbol[706] = "GBPUSD";
   aLots[706] = 1.0;
   aDate[706] = D'2011.11.09 05:07:12'+time_offset*3600;
   aPrice[706] = 1.60873;

   // ========== 707 ===== 487 ==========
   aPseudoTicket[707] = 353;
   aAction[707] = 0; // CLOSE
   aType[707] = OP_SELL; // SELL
   aTicket[707] = -1; // Ticket given by broker
   aSymbol[707] = "GBPUSD";
   aLots[707] = 1.0;
   aDate[707] = D'2011.11.09 05:22:09'+time_offset*3600;
   aPrice[707] = 1.60872;

   // ========== 708 ===== 485 ==========
   aPseudoTicket[708] = 355;
   aAction[708] = 1; // OPEN
   aReturn[355] = 708;
   aType[708] = OP_SELL; // SELL
   aTicket[708] = -1; // Ticket given by broker
   aSymbol[708] = "EURUSD";
   aLots[708] = 1.0;
   aDate[708] = D'2011.11.09 09:06:59'+time_offset*3600;
   aPrice[708] = 1.37676;

   // ========== 709 ===== 484 ==========
   aPseudoTicket[709] = 356;
   aAction[709] = 1; // OPEN
   aReturn[356] = 709;
   aType[709] = OP_SELL; // SELL
   aTicket[709] = -1; // Ticket given by broker
   aSymbol[709] = "EURUSD";
   aLots[709] = 1.0;
   aDate[709] = D'2011.11.09 09:10:56'+time_offset*3600;
   aPrice[709] = 1.37596;

   // ========== 710 ===== 483 ==========
   aPseudoTicket[710] = 357;
   aAction[710] = 1; // OPEN
   aReturn[357] = 710;
   aType[710] = OP_SELL; // SELL
   aTicket[710] = -1; // Ticket given by broker
   aSymbol[710] = "EURUSD";
   aLots[710] = 1.0;
   aDate[710] = D'2011.11.09 09:12:50'+time_offset*3600;
   aPrice[710] = 1.37571;

   // ========== 711 ===== 486 ==========
   aPseudoTicket[711] = 358;
   aAction[711] = 1; // OPEN
   aReturn[358] = 711;
   aType[711] = OP_SELL; // SELL
   aTicket[711] = -1; // Ticket given by broker
   aSymbol[711] = "GBPUSD";
   aLots[711] = 1.0;
   aDate[711] = D'2011.11.09 09:16:37'+time_offset*3600;
   aPrice[711] = 1.60557;

   // ========== 712 ===== 486 ==========
   aPseudoTicket[712] = 358;
   aAction[712] = 0; // CLOSE
   aType[712] = OP_SELL; // SELL
   aTicket[712] = -1; // Ticket given by broker
   aSymbol[712] = "GBPUSD";
   aLots[712] = 1.0;
   aDate[712] = D'2011.11.09 09:30:09'+time_offset*3600;
   aPrice[712] = 1.6028;

   // ========== 713 ===== 485 ==========
   aPseudoTicket[713] = 355;
   aAction[713] = 0; // CLOSE
   aType[713] = OP_SELL; // SELL
   aTicket[713] = -1; // Ticket given by broker
   aSymbol[713] = "EURUSD";
   aLots[713] = 1.0;
   aDate[713] = D'2011.11.09 09:45:18'+time_offset*3600;
   aPrice[713] = 1.37204;

   // ========== 714 ===== 484 ==========
   aPseudoTicket[714] = 356;
   aAction[714] = 0; // CLOSE
   aType[714] = OP_SELL; // SELL
   aTicket[714] = -1; // Ticket given by broker
   aSymbol[714] = "EURUSD";
   aLots[714] = 1.0;
   aDate[714] = D'2011.11.09 10:40:19'+time_offset*3600;
   aPrice[714] = 1.3667;

   // ========== 715 ===== 483 ==========
   aPseudoTicket[715] = 357;
   aAction[715] = 0; // CLOSE
   aType[715] = OP_SELL; // SELL
   aTicket[715] = -1; // Ticket given by broker
   aSymbol[715] = "EURUSD";
   aLots[715] = 1.0;
   aDate[715] = D'2011.11.09 12:02:00'+time_offset*3600;
   aPrice[715] = 1.36261;

   // ========== 716 ===== 482 ==========
   aPseudoTicket[716] = 359;
   aAction[716] = 1; // OPEN
   aReturn[359] = 716;
   aType[716] = OP_BUY; // BUY
   aTicket[716] = -1; // Ticket given by broker
   aSymbol[716] = "EURUSD";
   aLots[716] = 1.0;
   aDate[716] = D'2011.11.09 14:46:44'+time_offset*3600;
   aPrice[716] = 1.356;

   // ========== 717 ===== 482 ==========
   aPseudoTicket[717] = 359;
   aAction[717] = 0; // CLOSE
   aType[717] = OP_BUY; // BUY
   aTicket[717] = -1; // Ticket given by broker
   aSymbol[717] = "EURUSD";
   aLots[717] = 1.0;
   aDate[717] = D'2011.11.09 15:52:31'+time_offset*3600;
   aPrice[717] = 1.3593;

   // ========== 718 ===== 478 ==========
   aPseudoTicket[718] = 360;
   aAction[718] = 1; // OPEN
   aReturn[360] = 718;
   aType[718] = OP_BUY; // BUY
   aTicket[718] = -1; // Ticket given by broker
   aSymbol[718] = "EURUSD";
   aLots[718] = 1.0;
   aDate[718] = D'2011.11.09 22:03:43'+time_offset*3600;
   aPrice[718] = 1.35422;

   // ========== 719 ===== 481 ==========
   aPseudoTicket[719] = 361;
   aAction[719] = 1; // OPEN
   aReturn[361] = 719;
   aType[719] = OP_BUY; // BUY
   aTicket[719] = -1; // Ticket given by broker
   aSymbol[719] = "AUDUSD";
   aLots[719] = 1.0;
   aDate[719] = D'2011.11.09 22:39:48'+time_offset*3600;
   aPrice[719] = 1.01329;

   // ========== 720 ===== 480 ==========
   aPseudoTicket[720] = 362;
   aAction[720] = 1; // OPEN
   aReturn[362] = 720;
   aType[720] = OP_SELL; // SELL
   aTicket[720] = -1; // Ticket given by broker
   aSymbol[720] = "USDCHF";
   aLots[720] = 1.0;
   aDate[720] = D'2011.11.10 00:02:38'+time_offset*3600;
   aPrice[720] = 0.9106;

   // ========== 721 ===== 481 ==========
   aPseudoTicket[721] = 361;
   aAction[721] = 0; // CLOSE
   aType[721] = OP_BUY; // BUY
   aTicket[721] = -1; // Ticket given by broker
   aSymbol[721] = "AUDUSD";
   aLots[721] = 1.0;
   aDate[721] = D'2011.11.10 00:03:56'+time_offset*3600;
   aPrice[721] = 1.01391;

   // ========== 722 ===== 479 ==========
   aPseudoTicket[722] = 363;
   aAction[722] = 1; // OPEN
   aReturn[363] = 722;
   aType[722] = OP_BUY; // BUY
   aTicket[722] = -1; // Ticket given by broker
   aSymbol[722] = "EURUSD";
   aLots[722] = 1.0;
   aDate[722] = D'2011.11.10 00:29:30'+time_offset*3600;
   aPrice[722] = 1.35208;

   // ========== 723 ===== 480 ==========
   aPseudoTicket[723] = 362;
   aAction[723] = 0; // CLOSE
   aType[723] = OP_SELL; // SELL
   aTicket[723] = -1; // Ticket given by broker
   aSymbol[723] = "USDCHF";
   aLots[723] = 1.0;
   aDate[723] = D'2011.11.10 01:02:40'+time_offset*3600;
   aPrice[723] = 0.9107;

   // ========== 724 ===== 479 ==========
   aPseudoTicket[724] = 363;
   aAction[724] = 0; // CLOSE
   aType[724] = OP_BUY; // BUY
   aTicket[724] = -1; // Ticket given by broker
   aSymbol[724] = "EURUSD";
   aLots[724] = 1.0;
   aDate[724] = D'2011.11.10 01:48:48'+time_offset*3600;
   aPrice[724] = 1.35395;

   // ========== 725 ===== 478 ==========
   aPseudoTicket[725] = 360;
   aAction[725] = 0; // CLOSE
   aType[725] = OP_BUY; // BUY
   aTicket[725] = -1; // Ticket given by broker
   aSymbol[725] = "EURUSD";
   aLots[725] = 1.0;
   aDate[725] = D'2011.11.10 01:51:04'+time_offset*3600;
   aPrice[725] = 1.35434;

   // ========== 726 ===== 475 ==========
   aPseudoTicket[726] = 364;
   aAction[726] = 1; // OPEN
   aReturn[364] = 726;
   aType[726] = OP_SELL; // SELL
   aTicket[726] = -1; // Ticket given by broker
   aSymbol[726] = "EURUSD";
   aLots[726] = 1.0;
   aDate[726] = D'2011.11.10 09:49:43'+time_offset*3600;
   aPrice[726] = 1.361;

   // ========== 727 ===== 476 ==========
   aPseudoTicket[727] = 365;
   aAction[727] = 1; // OPEN
   aReturn[365] = 727;
   aType[727] = OP_BUY; // BUY
   aTicket[727] = -1; // Ticket given by broker
   aSymbol[727] = "USDCHF";
   aLots[727] = 1.0;
   aDate[727] = D'2011.11.10 10:02:33'+time_offset*3600;
   aPrice[727] = 0.9053;

   // ========== 728 ===== 477 ==========
   aPseudoTicket[728] = 366;
   aAction[728] = 1; // OPEN
   aReturn[366] = 728;
   aType[728] = OP_BUY; // BUY
   aTicket[728] = -1; // Ticket given by broker
   aSymbol[728] = "USDCHF";
   aLots[728] = 1.0;
   aDate[728] = D'2011.11.10 10:03:23'+time_offset*3600;
   aPrice[728] = 0.90524;

   // ========== 729 ===== 477 ==========
   aPseudoTicket[729] = 366;
   aAction[729] = 0; // CLOSE
   aType[729] = OP_BUY; // BUY
   aTicket[729] = -1; // Ticket given by broker
   aSymbol[729] = "USDCHF";
   aLots[729] = 1.0;
   aDate[729] = D'2011.11.10 10:21:30'+time_offset*3600;
   aPrice[729] = 0.90646;

   // ========== 730 ===== 476 ==========
   aPseudoTicket[730] = 365;
   aAction[730] = 0; // CLOSE
   aType[730] = OP_BUY; // BUY
   aTicket[730] = -1; // Ticket given by broker
   aSymbol[730] = "USDCHF";
   aLots[730] = 1.0;
   aDate[730] = D'2011.11.10 10:40:46'+time_offset*3600;
   aPrice[730] = 0.90651;

   // ========== 731 ===== 475 ==========
   aPseudoTicket[731] = 364;
   aAction[731] = 0; // CLOSE
   aType[731] = OP_SELL; // SELL
   aTicket[731] = -1; // Ticket given by broker
   aSymbol[731] = "EURUSD";
   aLots[731] = 1.0;
   aDate[731] = D'2011.11.10 10:41:24'+time_offset*3600;
   aPrice[731] = 1.357;

   // ========== 732 ===== 474 ==========
   aPseudoTicket[732] = 367;
   aAction[732] = 1; // OPEN
   aReturn[367] = 732;
   aType[732] = OP_BUY; // BUY
   aTicket[732] = -1; // Ticket given by broker
   aSymbol[732] = "AUDUSD";
   aLots[732] = 1.0;
   aDate[732] = D'2011.11.10 16:13:32'+time_offset*3600;
   aPrice[732] = 1.01067;

   // ========== 733 ===== 474 ==========
   aPseudoTicket[733] = 367;
   aAction[733] = 0; // CLOSE
   aType[733] = OP_BUY; // BUY
   aTicket[733] = -1; // Ticket given by broker
   aSymbol[733] = "AUDUSD";
   aLots[733] = 1.0;
   aDate[733] = D'2011.11.10 16:42:53'+time_offset*3600;
   aPrice[733] = 1.01293;

   // ========== 734 ===== 473 ==========
   aPseudoTicket[734] = 368;
   aAction[734] = 1; // OPEN
   aReturn[368] = 734;
   aType[734] = OP_BUY; // BUY
   aTicket[734] = -1; // Ticket given by broker
   aSymbol[734] = "USDCAD";
   aLots[734] = 1.0;
   aDate[734] = D'2011.11.10 23:41:59'+time_offset*3600;
   aPrice[734] = 1.01678;

   // ========== 735 ===== 473 ==========
   aPseudoTicket[735] = 368;
   aAction[735] = 0; // CLOSE
   aType[735] = OP_BUY; // BUY
   aTicket[735] = -1; // Ticket given by broker
   aSymbol[735] = "USDCAD";
   aLots[735] = 1.0;
   aDate[735] = D'2011.11.11 02:08:31'+time_offset*3600;
   aPrice[735] = 1.01929;

   // ========== 736 ===== 472 ==========
   aPseudoTicket[736] = 369;
   aAction[736] = 1; // OPEN
   aReturn[369] = 736;
   aType[736] = OP_BUY; // BUY
   aTicket[736] = -1; // Ticket given by broker
   aSymbol[736] = "USDCHF";
   aLots[736] = 1.0;
   aDate[736] = D'2011.11.11 07:17:19'+time_offset*3600;
   aPrice[736] = 0.90537;

   // ========== 737 ===== 472 ==========
   aPseudoTicket[737] = 369;
   aAction[737] = 0; // CLOSE
   aType[737] = OP_BUY; // BUY
   aTicket[737] = -1; // Ticket given by broker
   aSymbol[737] = "USDCHF";
   aLots[737] = 1.0;
   aDate[737] = D'2011.11.11 08:23:35'+time_offset*3600;
   aPrice[737] = 0.90626;

   // ========== 738 ===== 471 ==========
   aPseudoTicket[738] = 370;
   aAction[738] = 1; // OPEN
   aReturn[370] = 738;
   aType[738] = OP_SELL; // SELL
   aTicket[738] = -1; // Ticket given by broker
   aSymbol[738] = "GBPUSD";
   aLots[738] = 1.0;
   aDate[738] = D'2011.11.11 09:08:03'+time_offset*3600;
   aPrice[738] = 1.59038;

   // ========== 739 ===== 471 ==========
   aPseudoTicket[739] = 370;
   aAction[739] = 0; // CLOSE
   aType[739] = OP_SELL; // SELL
   aTicket[739] = -1; // Ticket given by broker
   aSymbol[739] = "GBPUSD";
   aLots[739] = 1.0;
   aDate[739] = D'2011.11.11 09:40:42'+time_offset*3600;
   aPrice[739] = 1.591;

   // ========== 740 ===== 469 ==========
   aPseudoTicket[740] = 371;
   aAction[740] = 1; // OPEN
   aReturn[371] = 740;
   aType[740] = OP_SELL; // SELL
   aTicket[740] = -1; // Ticket given by broker
   aSymbol[740] = "EURUSD";
   aLots[740] = 1.0;
   aDate[740] = D'2011.11.11 11:38:12'+time_offset*3600;
   aPrice[740] = 1.36421;

   // ========== 741 ===== 470 ==========
   aPseudoTicket[741] = 372;
   aAction[741] = 1; // OPEN
   aReturn[372] = 741;
   aType[741] = OP_SELL; // SELL
   aTicket[741] = -1; // Ticket given by broker
   aSymbol[741] = "EURUSD";
   aLots[741] = 1.0;
   aDate[741] = D'2011.11.11 14:12:13'+time_offset*3600;
   aPrice[741] = 1.36784;

   // ========== 742 ===== 470 ==========
   aPseudoTicket[742] = 372;
   aAction[742] = 0; // CLOSE
   aType[742] = OP_SELL; // SELL
   aTicket[742] = -1; // Ticket given by broker
   aSymbol[742] = "EURUSD";
   aLots[742] = 1.0;
   aDate[742] = D'2011.11.11 15:35:37'+time_offset*3600;
   aPrice[742] = 1.37195;

   // ========== 743 ===== 469 ==========
   aPseudoTicket[743] = 371;
   aAction[743] = 0; // CLOSE
   aType[743] = OP_SELL; // SELL
   aTicket[743] = -1; // Ticket given by broker
   aSymbol[743] = "EURUSD";
   aLots[743] = 1.0;
   aDate[743] = D'2011.11.11 15:35:41'+time_offset*3600;
   aPrice[743] = 1.37173;

   // ========== 744 ===== 468 ==========
   aPseudoTicket[744] = 373;
   aAction[744] = 1; // OPEN
   aReturn[373] = 744;
   aType[744] = OP_BUY; // BUY
   aTicket[744] = -1; // Ticket given by broker
   aSymbol[744] = "GBPUSD";
   aLots[744] = 1.0;
   aDate[744] = D'2011.11.14 02:08:55'+time_offset*3600;
   aPrice[744] = 1.60631;

   // ========== 745 ===== 467 ==========
   aPseudoTicket[745] = 374;
   aAction[745] = 1; // OPEN
   aReturn[374] = 745;
   aType[745] = OP_BUY; // BUY
   aTicket[745] = -1; // Ticket given by broker
   aSymbol[745] = "USDCHF";
   aLots[745] = 1.0;
   aDate[745] = D'2011.11.14 07:57:02'+time_offset*3600;
   aPrice[745] = 0.90079;

   // ========== 746 ===== 468 ==========
   aPseudoTicket[746] = 373;
   aAction[746] = 0; // CLOSE
   aType[746] = OP_BUY; // BUY
   aTicket[746] = -1; // Ticket given by broker
   aSymbol[746] = "GBPUSD";
   aLots[746] = 1.0;
   aDate[746] = D'2011.11.14 08:26:32'+time_offset*3600;
   aPrice[746] = 1.60102;

   // ========== 747 ===== 467 ==========
   aPseudoTicket[747] = 374;
   aAction[747] = 0; // CLOSE
   aType[747] = OP_BUY; // BUY
   aTicket[747] = -1; // Ticket given by broker
   aSymbol[747] = "USDCHF";
   aLots[747] = 1.0;
   aDate[747] = D'2011.11.14 08:34:36'+time_offset*3600;
   aPrice[747] = 0.90207;

   // ========== 748 ===== 466 ==========
   aPseudoTicket[748] = 375;
   aAction[748] = 1; // OPEN
   aReturn[375] = 748;
   aType[748] = OP_SELL; // SELL
   aTicket[748] = -1; // Ticket given by broker
   aSymbol[748] = "GBPUSD";
   aLots[748] = 1.0;
   aDate[748] = D'2011.11.14 08:48:38'+time_offset*3600;
   aPrice[748] = 1.59993;

   // ========== 749 ===== 466 ==========
   aPseudoTicket[749] = 375;
   aAction[749] = 0; // CLOSE
   aType[749] = OP_SELL; // SELL
   aTicket[749] = -1; // Ticket given by broker
   aSymbol[749] = "GBPUSD";
   aLots[749] = 1.0;
   aDate[749] = D'2011.11.14 09:03:09'+time_offset*3600;
   aPrice[749] = 1.59891;

   // ========== 750 ===== 465 ==========
   aPseudoTicket[750] = 376;
   aAction[750] = 1; // OPEN
   aReturn[376] = 750;
   aType[750] = OP_SELL; // SELL
   aTicket[750] = -1; // Ticket given by broker
   aSymbol[750] = "EURUSD";
   aLots[750] = 1.0;
   aDate[750] = D'2011.11.14 09:23:58'+time_offset*3600;
   aPrice[750] = 1.36908;

   // ========== 751 ===== 463 ==========
   aPseudoTicket[751] = 377;
   aAction[751] = 1; // OPEN
   aReturn[377] = 751;
   aType[751] = OP_BUY; // BUY
   aTicket[751] = -1; // Ticket given by broker
   aSymbol[751] = "AUDUSD";
   aLots[751] = 1.0;
   aDate[751] = D'2011.11.14 09:32:03'+time_offset*3600;
   aPrice[751] = 1.02514;

   // ========== 752 ===== 465 ==========
   aPseudoTicket[752] = 376;
   aAction[752] = 0; // CLOSE
   aType[752] = OP_SELL; // SELL
   aTicket[752] = -1; // Ticket given by broker
   aSymbol[752] = "EURUSD";
   aLots[752] = 1.0;
   aDate[752] = D'2011.11.14 09:55:59'+time_offset*3600;
   aPrice[752] = 1.36962;

   // ========== 753 ===== 464 ==========
   aPseudoTicket[753] = 378;
   aAction[753] = 1; // OPEN
   aReturn[378] = 753;
   aType[753] = OP_BUY; // BUY
   aTicket[753] = -1; // Ticket given by broker
   aSymbol[753] = "EURUSD";
   aLots[753] = 1.0;
   aDate[753] = D'2011.11.14 10:06:42'+time_offset*3600;
   aPrice[753] = 1.36847;

   // ========== 754 ===== 464 ==========
   aPseudoTicket[754] = 378;
   aAction[754] = 0; // CLOSE
   aType[754] = OP_BUY; // BUY
   aTicket[754] = -1; // Ticket given by broker
   aSymbol[754] = "EURUSD";
   aLots[754] = 1.0;
   aDate[754] = D'2011.11.14 10:59:52'+time_offset*3600;
   aPrice[754] = 1.36967;

   // ========== 755 ===== 463 ==========
   aPseudoTicket[755] = 377;
   aAction[755] = 0; // CLOSE
   aType[755] = OP_BUY; // BUY
   aTicket[755] = -1; // Ticket given by broker
   aSymbol[755] = "AUDUSD";
   aLots[755] = 1.0;
   aDate[755] = D'2011.11.14 11:00:00'+time_offset*3600;
   aPrice[755] = 1.02591;

   // ========== 756 ===== 462 ==========
   aPseudoTicket[756] = 379;
   aAction[756] = 1; // OPEN
   aReturn[379] = 756;
   aType[756] = OP_SELL; // SELL
   aTicket[756] = -1; // Ticket given by broker
   aSymbol[756] = "USDCAD";
   aLots[756] = 1.0;
   aDate[756] = D'2011.11.14 11:06:45'+time_offset*3600;
   aPrice[756] = 1.01805;

   // ========== 757 ===== 462 ==========
   aPseudoTicket[757] = 379;
   aAction[757] = 0; // CLOSE
   aType[757] = OP_SELL; // SELL
   aTicket[757] = -1; // Ticket given by broker
   aSymbol[757] = "USDCAD";
   aLots[757] = 1.0;
   aDate[757] = D'2011.11.14 11:24:15'+time_offset*3600;
   aPrice[757] = 1.01873;

   // ========== 758 ===== 460 ==========
   aPseudoTicket[758] = 380;
   aAction[758] = 1; // OPEN
   aReturn[380] = 758;
   aType[758] = OP_BUY; // BUY
   aTicket[758] = -1; // Ticket given by broker
   aSymbol[758] = "EURUSD";
   aLots[758] = 1.0;
   aDate[758] = D'2011.11.14 14:17:03'+time_offset*3600;
   aPrice[758] = 1.36374;

   // ========== 759 ===== 461 ==========
   aPseudoTicket[759] = 381;
   aAction[759] = 1; // OPEN
   aReturn[381] = 759;
   aType[759] = OP_BUY; // BUY
   aTicket[759] = -1; // Ticket given by broker
   aSymbol[759] = "EURUSD";
   aLots[759] = 1.0;
   aDate[759] = D'2011.11.14 15:25:38'+time_offset*3600;
   aPrice[759] = 1.3623;

   // ========== 760 ===== 461 ==========
   aPseudoTicket[760] = 381;
   aAction[760] = 0; // CLOSE
   aType[760] = OP_BUY; // BUY
   aTicket[760] = -1; // Ticket given by broker
   aSymbol[760] = "EURUSD";
   aLots[760] = 1.0;
   aDate[760] = D'2011.11.14 15:51:51'+time_offset*3600;
   aPrice[760] = 1.36345;

   // ========== 761 ===== 460 ==========
   aPseudoTicket[761] = 380;
   aAction[761] = 0; // CLOSE
   aType[761] = OP_BUY; // BUY
   aTicket[761] = -1; // Ticket given by broker
   aSymbol[761] = "EURUSD";
   aLots[761] = 1.0;
   aDate[761] = D'2011.11.14 16:09:51'+time_offset*3600;
   aPrice[761] = 1.36408;

   // ========== 762 ===== 459 ==========
   aPseudoTicket[762] = 382;
   aAction[762] = 1; // OPEN
   aReturn[382] = 762;
   aType[762] = OP_SELL; // SELL
   aTicket[762] = -1; // Ticket given by broker
   aSymbol[762] = "EURUSD";
   aLots[762] = 1.0;
   aDate[762] = D'2011.11.15 08:49:03'+time_offset*3600;
   aPrice[762] = 1.35709;

   // ========== 763 ===== 459 ==========
   aPseudoTicket[763] = 382;
   aAction[763] = 0; // CLOSE
   aType[763] = OP_SELL; // SELL
   aTicket[763] = -1; // Ticket given by broker
   aSymbol[763] = "EURUSD";
   aLots[763] = 1.0;
   aDate[763] = D'2011.11.15 08:52:40'+time_offset*3600;
   aPrice[763] = 1.35877;

   // ========== 764 ===== 458 ==========
   aPseudoTicket[764] = 383;
   aAction[764] = 1; // OPEN
   aReturn[383] = 764;
   aType[764] = OP_SELL; // SELL
   aTicket[764] = -1; // Ticket given by broker
   aSymbol[764] = "USDCHF";
   aLots[764] = 1.0;
   aDate[764] = D'2011.11.15 08:57:29'+time_offset*3600;
   aPrice[764] = 0.91361;

   // ========== 765 ===== 458 ==========
   aPseudoTicket[765] = 383;
   aAction[765] = 0; // CLOSE
   aType[765] = OP_SELL; // SELL
   aTicket[765] = -1; // Ticket given by broker
   aSymbol[765] = "USDCHF";
   aLots[765] = 1.0;
   aDate[765] = D'2011.11.15 09:07:58'+time_offset*3600;
   aPrice[765] = 0.91654;

   // ========== 766 ===== 455 ==========
   aPseudoTicket[766] = 384;
   aAction[766] = 1; // OPEN
   aReturn[384] = 766;
   aType[766] = OP_SELL; // SELL
   aTicket[766] = -1; // Ticket given by broker
   aSymbol[766] = "GBPUSD";
   aLots[766] = 1.0;
   aDate[766] = D'2011.11.15 09:25:11'+time_offset*3600;
   aPrice[766] = 1.58517;

   // ========== 767 ===== 454 ==========
   aPseudoTicket[767] = 385;
   aAction[767] = 1; // OPEN
   aReturn[385] = 767;
   aType[767] = OP_SELL; // SELL
   aTicket[767] = -1; // Ticket given by broker
   aSymbol[767] = "GBPUSD";
   aLots[767] = 1.0;
   aDate[767] = D'2011.11.15 09:25:31'+time_offset*3600;
   aPrice[767] = 1.58498;

   // ========== 768 ===== 457 ==========
   aPseudoTicket[768] = 386;
   aAction[768] = 1; // OPEN
   aReturn[386] = 768;
   aType[768] = OP_SELL; // SELL
   aTicket[768] = -1; // Ticket given by broker
   aSymbol[768] = "GBPUSD";
   aLots[768] = 1.0;
   aDate[768] = D'2011.11.15 09:26:00'+time_offset*3600;
   aPrice[768] = 1.58519;

   // ========== 769 ===== 456 ==========
   aPseudoTicket[769] = 387;
   aAction[769] = 1; // OPEN
   aReturn[387] = 769;
   aType[769] = OP_SELL; // SELL
   aTicket[769] = -1; // Ticket given by broker
   aSymbol[769] = "GBPUSD";
   aLots[769] = 1.0;
   aDate[769] = D'2011.11.15 09:26:18'+time_offset*3600;
   aPrice[769] = 1.58514;

   // ========== 770 ===== 457 ==========
   aPseudoTicket[770] = 386;
   aAction[770] = 0; // CLOSE
   aType[770] = OP_SELL; // SELL
   aTicket[770] = -1; // Ticket given by broker
   aSymbol[770] = "GBPUSD";
   aLots[770] = 1.0;
   aDate[770] = D'2011.11.15 16:40:48'+time_offset*3600;
   aPrice[770] = 1.58114;

   // ========== 771 ===== 456 ==========
   aPseudoTicket[771] = 387;
   aAction[771] = 0; // CLOSE
   aType[771] = OP_SELL; // SELL
   aTicket[771] = -1; // Ticket given by broker
   aSymbol[771] = "GBPUSD";
   aLots[771] = 1.0;
   aDate[771] = D'2011.11.15 23:01:58'+time_offset*3600;
   aPrice[771] = 1.58197;

   // ========== 772 ===== 453 ==========
   aPseudoTicket[772] = 388;
   aAction[772] = 1; // OPEN
   aReturn[388] = 772;
   aType[772] = OP_BUY; // BUY
   aTicket[772] = -1; // Ticket given by broker
   aSymbol[772] = "EURUSD";
   aLots[772] = 1.0;
   aDate[772] = D'2011.11.16 02:04:30'+time_offset*3600;
   aPrice[772] = 1.3475;

   // ========== 773 ===== 455 ==========
   aPseudoTicket[773] = 384;
   aAction[773] = 0; // CLOSE
   aType[773] = OP_SELL; // SELL
   aTicket[773] = -1; // Ticket given by broker
   aSymbol[773] = "GBPUSD";
   aLots[773] = 1.0;
   aDate[773] = D'2011.11.16 02:45:10'+time_offset*3600;
   aPrice[773] = 1.57671;

   // ========== 774 ===== 454 ==========
   aPseudoTicket[774] = 385;
   aAction[774] = 0; // CLOSE
   aType[774] = OP_SELL; // SELL
   aTicket[774] = -1; // Ticket given by broker
   aSymbol[774] = "GBPUSD";
   aLots[774] = 1.0;
   aDate[774] = D'2011.11.16 06:04:40'+time_offset*3600;
   aPrice[774] = 1.57618;

   // ========== 775 ===== 453 ==========
   aPseudoTicket[775] = 388;
   aAction[775] = 0; // CLOSE
   aType[775] = OP_BUY; // BUY
   aTicket[775] = -1; // Ticket given by broker
   aSymbol[775] = "EURUSD";
   aLots[775] = 1.0;
   aDate[775] = D'2011.11.16 08:21:45'+time_offset*3600;
   aPrice[775] = 1.349;

   // ========== 776 ===== 452 ==========
   aPseudoTicket[776] = 389;
   aAction[776] = 1; // OPEN
   aReturn[389] = 776;
   aType[776] = OP_SELL; // SELL
   aTicket[776] = -1; // Ticket given by broker
   aSymbol[776] = "EURUSD";
   aLots[776] = 1.0;
   aDate[776] = D'2011.11.16 08:46:10'+time_offset*3600;
   aPrice[776] = 1.35318;

   // ========== 777 ===== 452 ==========
   aPseudoTicket[777] = 389;
   aAction[777] = 0; // CLOSE
   aType[777] = OP_SELL; // SELL
   aTicket[777] = -1; // Ticket given by broker
   aSymbol[777] = "EURUSD";
   aLots[777] = 1.0;
   aDate[777] = D'2011.11.16 08:51:01'+time_offset*3600;
   aPrice[777] = 1.35303;

   // ========== 778 ===== 451 ==========
   aPseudoTicket[778] = 390;
   aAction[778] = 1; // OPEN
   aReturn[390] = 778;
   aType[778] = OP_SELL; // SELL
   aTicket[778] = -1; // Ticket given by broker
   aSymbol[778] = "EURUSD";
   aLots[778] = 1.0;
   aDate[778] = D'2011.11.16 09:12:18'+time_offset*3600;
   aPrice[778] = 1.3541;

   // ========== 779 ===== 451 ==========
   aPseudoTicket[779] = 390;
   aAction[779] = 0; // CLOSE
   aType[779] = OP_SELL; // SELL
   aTicket[779] = -1; // Ticket given by broker
   aSymbol[779] = "EURUSD";
   aLots[779] = 1.0;
   aDate[779] = D'2011.11.16 09:14:03'+time_offset*3600;
   aPrice[779] = 1.35364;

   // ========== 780 ===== 450 ==========
   aPseudoTicket[780] = 391;
   aAction[780] = 1; // OPEN
   aReturn[391] = 780;
   aType[780] = OP_SELL; // SELL
   aTicket[780] = -1; // Ticket given by broker
   aSymbol[780] = "AUDUSD";
   aLots[780] = 1.0;
   aDate[780] = D'2011.11.16 10:05:57'+time_offset*3600;
   aPrice[780] = 1.01796;

   // ========== 781 ===== 450 ==========
   aPseudoTicket[781] = 391;
   aAction[781] = 0; // CLOSE
   aType[781] = OP_SELL; // SELL
   aTicket[781] = -1; // Ticket given by broker
   aSymbol[781] = "AUDUSD";
   aLots[781] = 1.0;
   aDate[781] = D'2011.11.16 10:16:23'+time_offset*3600;
   aPrice[781] = 1.01678;

   // ========== 782 ===== 449 ==========
   aPseudoTicket[782] = 392;
   aAction[782] = 1; // OPEN
   aReturn[392] = 782;
   aType[782] = OP_SELL; // SELL
   aTicket[782] = -1; // Ticket given by broker
   aSymbol[782] = "USDCHF";
   aLots[782] = 1.0;
   aDate[782] = D'2011.11.16 11:27:39'+time_offset*3600;
   aPrice[782] = 0.91798;

   // ========== 783 ===== 449 ==========
   aPseudoTicket[783] = 392;
   aAction[783] = 0; // CLOSE
   aType[783] = OP_SELL; // SELL
   aTicket[783] = -1; // Ticket given by broker
   aSymbol[783] = "USDCHF";
   aLots[783] = 1.0;
   aDate[783] = D'2011.11.16 12:14:46'+time_offset*3600;
   aPrice[783] = 0.91786;

   // ========== 784 ===== 448 ==========
   aPseudoTicket[784] = 393;
   aAction[784] = 1; // OPEN
   aReturn[393] = 784;
   aType[784] = OP_SELL; // SELL
   aTicket[784] = -1; // Ticket given by broker
   aSymbol[784] = "GBPUSD";
   aLots[784] = 1.0;
   aDate[784] = D'2011.11.16 13:36:06'+time_offset*3600;
   aPrice[784] = 1.57696;

   // ========== 785 ===== 448 ==========
   aPseudoTicket[785] = 393;
   aAction[785] = 0; // CLOSE
   aType[785] = OP_SELL; // SELL
   aTicket[785] = -1; // Ticket given by broker
   aSymbol[785] = "GBPUSD";
   aLots[785] = 1.0;
   aDate[785] = D'2011.11.16 13:49:02'+time_offset*3600;
   aPrice[785] = 1.57682;

   // ========== 786 ===== 447 ==========
   aPseudoTicket[786] = 394;
   aAction[786] = 1; // OPEN
   aReturn[394] = 786;
   aType[786] = OP_SELL; // SELL
   aTicket[786] = -1; // Ticket given by broker
   aSymbol[786] = "USDCAD";
   aLots[786] = 1.0;
   aDate[786] = D'2011.11.17 01:16:00'+time_offset*3600;
   aPrice[786] = 1.02602;

   // ========== 787 ===== 447 ==========
   aPseudoTicket[787] = 394;
   aAction[787] = 0; // CLOSE
   aType[787] = OP_SELL; // SELL
   aTicket[787] = -1; // Ticket given by broker
   aSymbol[787] = "USDCAD";
   aLots[787] = 1.0;
   aDate[787] = D'2011.11.17 01:35:12'+time_offset*3600;
   aPrice[787] = 1.02553;

   // ========== 788 ===== 446 ==========
   aPseudoTicket[788] = 395;
   aAction[788] = 1; // OPEN
   aReturn[395] = 788;
   aType[788] = OP_SELL; // SELL
   aTicket[788] = -1; // Ticket given by broker
   aSymbol[788] = "GBPUSD";
   aLots[788] = 1.0;
   aDate[788] = D'2011.11.17 09:30:50'+time_offset*3600;
   aPrice[788] = 1.57812;

   // ========== 789 ===== 446 ==========
   aPseudoTicket[789] = 395;
   aAction[789] = 0; // CLOSE
   aType[789] = OP_SELL; // SELL
   aTicket[789] = -1; // Ticket given by broker
   aSymbol[789] = "GBPUSD";
   aLots[789] = 1.0;
   aDate[789] = D'2011.11.17 09:46:24'+time_offset*3600;
   aPrice[789] = 1.57503;

   // ========== 790 ===== 444 ==========
   aPseudoTicket[790] = 396;
   aAction[790] = 1; // OPEN
   aReturn[396] = 790;
   aType[790] = OP_SELL; // SELL
   aTicket[790] = -1; // Ticket given by broker
   aSymbol[790] = "GBPUSD";
   aLots[790] = 1.0;
   aDate[790] = D'2011.11.17 16:46:00'+time_offset*3600;
   aPrice[790] = 1.58002;

   // ========== 791 ===== 445 ==========
   aPseudoTicket[791] = 397;
   aAction[791] = 1; // OPEN
   aReturn[397] = 791;
   aType[791] = OP_SELL; // SELL
   aTicket[791] = -1; // Ticket given by broker
   aSymbol[791] = "GBPUSD";
   aLots[791] = 1.0;
   aDate[791] = D'2011.11.17 16:54:57'+time_offset*3600;
   aPrice[791] = 1.57937;

   // ========== 792 ===== 445 ==========
   aPseudoTicket[792] = 397;
   aAction[792] = 0; // CLOSE
   aType[792] = OP_SELL; // SELL
   aTicket[792] = -1; // Ticket given by broker
   aSymbol[792] = "GBPUSD";
   aLots[792] = 1.0;
   aDate[792] = D'2011.11.17 17:36:06'+time_offset*3600;
   aPrice[792] = 1.57678;

   // ========== 793 ===== 444 ==========
   aPseudoTicket[793] = 396;
   aAction[793] = 0; // CLOSE
   aType[793] = OP_SELL; // SELL
   aTicket[793] = -1; // Ticket given by broker
   aSymbol[793] = "GBPUSD";
   aLots[793] = 1.0;
   aDate[793] = D'2011.11.17 17:36:15'+time_offset*3600;
   aPrice[793] = 1.57678;

   // ========== 794 ===== 443 ==========
   aPseudoTicket[794] = 398;
   aAction[794] = 1; // OPEN
   aReturn[398] = 794;
   aType[794] = OP_BUY; // BUY
   aTicket[794] = -1; // Ticket given by broker
   aSymbol[794] = "EURUSD";
   aLots[794] = 1.0;
   aDate[794] = D'2011.11.18 02:23:13'+time_offset*3600;
   aPrice[794] = 1.34828;

   // ========== 795 ===== 443 ==========
   aPseudoTicket[795] = 398;
   aAction[795] = 0; // CLOSE
   aType[795] = OP_BUY; // BUY
   aTicket[795] = -1; // Ticket given by broker
   aSymbol[795] = "EURUSD";
   aLots[795] = 1.0;
   aDate[795] = D'2011.11.18 02:27:41'+time_offset*3600;
   aPrice[795] = 1.34827;

   // ========== 796 ===== 442 ==========
   aPseudoTicket[796] = 399;
   aAction[796] = 1; // OPEN
   aReturn[399] = 796;
   aType[796] = OP_SELL; // SELL
   aTicket[796] = -1; // Ticket given by broker
   aSymbol[796] = "EURUSD";
   aLots[796] = 1.0;
   aDate[796] = D'2011.11.18 05:16:35'+time_offset*3600;
   aPrice[796] = 1.34695;

   // ========== 797 ===== 442 ==========
   aPseudoTicket[797] = 399;
   aAction[797] = 0; // CLOSE
   aType[797] = OP_SELL; // SELL
   aTicket[797] = -1; // Ticket given by broker
   aSymbol[797] = "EURUSD";
   aLots[797] = 1.0;
   aDate[797] = D'2011.11.18 07:27:18'+time_offset*3600;
   aPrice[797] = 1.35143;

   // ========== 798 ===== 440 ==========
   aPseudoTicket[798] = 400;
   aAction[798] = 1; // OPEN
   aReturn[400] = 798;
   aType[798] = OP_SELL; // SELL
   aTicket[798] = -1; // Ticket given by broker
   aSymbol[798] = "GBPUSD";
   aLots[798] = 1.0;
   aDate[798] = D'2011.11.18 08:46:55'+time_offset*3600;
   aPrice[798] = 1.57741;

   // ========== 799 ===== 441 ==========
   aPseudoTicket[799] = 401;
   aAction[799] = 1; // OPEN
   aReturn[401] = 799;
   aType[799] = OP_SELL; // SELL
   aTicket[799] = -1; // Ticket given by broker
   aSymbol[799] = "GBPUSD";
   aLots[799] = 1.0;
   aDate[799] = D'2011.11.18 08:58:43'+time_offset*3600;
   aPrice[799] = 1.57901;

   // ========== 800 ===== 441 ==========
   aPseudoTicket[800] = 401;
   aAction[800] = 0; // CLOSE
   aType[800] = OP_SELL; // SELL
   aTicket[800] = -1; // Ticket given by broker
   aSymbol[800] = "GBPUSD";
   aLots[800] = 1.0;
   aDate[800] = D'2011.11.18 09:25:23'+time_offset*3600;
   aPrice[800] = 1.58209;

   // ========== 801 ===== 440 ==========
   aPseudoTicket[801] = 400;
   aAction[801] = 0; // CLOSE
   aType[801] = OP_SELL; // SELL
   aTicket[801] = -1; // Ticket given by broker
   aSymbol[801] = "GBPUSD";
   aLots[801] = 1.0;
   aDate[801] = D'2011.11.18 09:25:44'+time_offset*3600;
   aPrice[801] = 1.5824;

   // ========== 802 ===== 438 ==========
   aPseudoTicket[802] = 402;
   aAction[802] = 1; // OPEN
   aReturn[402] = 802;
   aType[802] = OP_SELL; // SELL
   aTicket[802] = -1; // Ticket given by broker
   aSymbol[802] = "EURUSD";
   aLots[802] = 1.0;
   aDate[802] = D'2011.11.21 07:50:04'+time_offset*3600;
   aPrice[802] = 1.34893;

   // ========== 803 ===== 439 ==========
   aPseudoTicket[803] = 403;
   aAction[803] = 1; // OPEN
   aReturn[403] = 803;
   aType[803] = OP_SELL; // SELL
   aTicket[803] = -1; // Ticket given by broker
   aSymbol[803] = "EURUSD";
   aLots[803] = 1.0;
   aDate[803] = D'2011.11.21 07:51:27'+time_offset*3600;
   aPrice[803] = 1.34925;

   // ========== 804 ===== 439 ==========
   aPseudoTicket[804] = 403;
   aAction[804] = 0; // CLOSE
   aType[804] = OP_SELL; // SELL
   aTicket[804] = -1; // Ticket given by broker
   aSymbol[804] = "EURUSD";
   aLots[804] = 1.0;
   aDate[804] = D'2011.11.21 08:02:14'+time_offset*3600;
   aPrice[804] = 1.34769;

   // ========== 805 ===== 438 ==========
   aPseudoTicket[805] = 402;
   aAction[805] = 0; // CLOSE
   aType[805] = OP_SELL; // SELL
   aTicket[805] = -1; // Ticket given by broker
   aSymbol[805] = "EURUSD";
   aLots[805] = 1.0;
   aDate[805] = D'2011.11.21 08:02:18'+time_offset*3600;
   aPrice[805] = 1.34774;

   // ========== 806 ===== 437 ==========
   aPseudoTicket[806] = 404;
   aAction[806] = 1; // OPEN
   aReturn[404] = 806;
   aType[806] = OP_BUY; // BUY
   aTicket[806] = -1; // Ticket given by broker
   aSymbol[806] = "AUDUSD";
   aLots[806] = 1.0;
   aDate[806] = D'2011.11.21 16:11:39'+time_offset*3600;
   aPrice[806] = 0.9825;

   // ========== 807 ===== 437 ==========
   aPseudoTicket[807] = 404;
   aAction[807] = 0; // CLOSE
   aType[807] = OP_BUY; // BUY
   aTicket[807] = -1; // Ticket given by broker
   aSymbol[807] = "AUDUSD";
   aLots[807] = 1.0;
   aDate[807] = D'2011.11.21 17:24:58'+time_offset*3600;
   aPrice[807] = 0.98454;

   // ========== 808 ===== 436 ==========
   aPseudoTicket[808] = 405;
   aAction[808] = 1; // OPEN
   aReturn[405] = 808;
   aType[808] = OP_SELL; // SELL
   aTicket[808] = -1; // Ticket given by broker
   aSymbol[808] = "EURUSD";
   aLots[808] = 1.0;
   aDate[808] = D'2011.11.22 10:39:01'+time_offset*3600;
   aPrice[808] = 1.35382;

   // ========== 809 ===== 436 ==========
   aPseudoTicket[809] = 405;
   aAction[809] = 0; // CLOSE
   aType[809] = OP_SELL; // SELL
   aTicket[809] = -1; // Ticket given by broker
   aSymbol[809] = "EURUSD";
   aLots[809] = 1.0;
   aDate[809] = D'2011.11.22 10:55:57'+time_offset*3600;
   aPrice[809] = 1.35359;

   // ========== 810 ===== 435 ==========
   aPseudoTicket[810] = 406;
   aAction[810] = 1; // OPEN
   aReturn[406] = 810;
   aType[810] = OP_SELL; // SELL
   aTicket[810] = -1; // Ticket given by broker
   aSymbol[810] = "EURUSD";
   aLots[810] = 1.0;
   aDate[810] = D'2011.11.22 11:02:19'+time_offset*3600;
   aPrice[810] = 1.35398;

   // ========== 811 ===== 435 ==========
   aPseudoTicket[811] = 406;
   aAction[811] = 0; // CLOSE
   aType[811] = OP_SELL; // SELL
   aTicket[811] = -1; // Ticket given by broker
   aSymbol[811] = "EURUSD";
   aLots[811] = 1.0;
   aDate[811] = D'2011.11.22 13:28:30'+time_offset*3600;
   aPrice[811] = 1.35325;

   // ========== 812 ===== 434 ==========
   aPseudoTicket[812] = 407;
   aAction[812] = 1; // OPEN
   aReturn[407] = 812;
   aType[812] = OP_SELL; // SELL
   aTicket[812] = -1; // Ticket given by broker
   aSymbol[812] = "GBPUSD";
   aLots[812] = 1.0;
   aDate[812] = D'2011.11.23 01:14:56'+time_offset*3600;
   aPrice[812] = 1.56311;

   // ========== 813 ===== 434 ==========
   aPseudoTicket[813] = 407;
   aAction[813] = 0; // CLOSE
   aType[813] = OP_SELL; // SELL
   aTicket[813] = -1; // Ticket given by broker
   aSymbol[813] = "GBPUSD";
   aLots[813] = 1.0;
   aDate[813] = D'2011.11.23 01:29:39'+time_offset*3600;
   aPrice[813] = 1.56277;

   // ========== 814 ===== 433 ==========
   aPseudoTicket[814] = 408;
   aAction[814] = 1; // OPEN
   aReturn[408] = 814;
   aType[814] = OP_SELL; // SELL
   aTicket[814] = -1; // Ticket given by broker
   aSymbol[814] = "AUDUSD";
   aLots[814] = 1.0;
   aDate[814] = D'2011.11.23 01:58:25'+time_offset*3600;
   aPrice[814] = 0.97877;

   // ========== 815 ===== 432 ==========
   aPseudoTicket[815] = 409;
   aAction[815] = 1; // OPEN
   aReturn[409] = 815;
   aType[815] = OP_SELL; // SELL
   aTicket[815] = -1; // Ticket given by broker
   aSymbol[815] = "AUDUSD";
   aLots[815] = 1.0;
   aDate[815] = D'2011.11.23 01:59:27'+time_offset*3600;
   aPrice[815] = 0.97925;

   // ========== 816 ===== 433 ==========
   aPseudoTicket[816] = 408;
   aAction[816] = 0; // CLOSE
   aType[816] = OP_SELL; // SELL
   aTicket[816] = -1; // Ticket given by broker
   aSymbol[816] = "AUDUSD";
   aLots[816] = 1.0;
   aDate[816] = D'2011.11.23 04:26:43'+time_offset*3600;
   aPrice[816] = 0.97739;

   // ========== 817 ===== 432 ==========
   aPseudoTicket[817] = 409;
   aAction[817] = 0; // CLOSE
   aType[817] = OP_SELL; // SELL
   aTicket[817] = -1; // Ticket given by broker
   aSymbol[817] = "AUDUSD";
   aLots[817] = 1.0;
   aDate[817] = D'2011.11.23 05:39:45'+time_offset*3600;
   aPrice[817] = 0.97648;

   // ========== 818 ===== 431 ==========
   aPseudoTicket[818] = 410;
   aAction[818] = 1; // OPEN
   aReturn[410] = 818;
   aType[818] = OP_SELL; // SELL
   aTicket[818] = -1; // Ticket given by broker
   aSymbol[818] = "GBPUSD";
   aLots[818] = 1.0;
   aDate[818] = D'2011.11.23 08:09:44'+time_offset*3600;
   aPrice[818] = 1.55892;

   // ========== 819 ===== 431 ==========
   aPseudoTicket[819] = 410;
   aAction[819] = 0; // CLOSE
   aType[819] = OP_SELL; // SELL
   aTicket[819] = -1; // Ticket given by broker
   aSymbol[819] = "GBPUSD";
   aLots[819] = 1.0;
   aDate[819] = D'2011.11.23 08:21:11'+time_offset*3600;
   aPrice[819] = 1.55858;

   // ========== 820 ===== 430 ==========
   aPseudoTicket[820] = 411;
   aAction[820] = 1; // OPEN
   aReturn[411] = 820;
   aType[820] = OP_SELL; // SELL
   aTicket[820] = -1; // Ticket given by broker
   aSymbol[820] = "GBPUSD";
   aLots[820] = 1.0;
   aDate[820] = D'2011.11.23 08:33:18'+time_offset*3600;
   aPrice[820] = 1.55712;

   // ========== 821 ===== 430 ==========
   aPseudoTicket[821] = 411;
   aAction[821] = 0; // CLOSE
   aType[821] = OP_SELL; // SELL
   aTicket[821] = -1; // Ticket given by broker
   aSymbol[821] = "GBPUSD";
   aLots[821] = 1.0;
   aDate[821] = D'2011.11.23 08:58:07'+time_offset*3600;
   aPrice[821] = 1.5568;

   // ========== 822 ===== 429 ==========
   aPseudoTicket[822] = 412;
   aAction[822] = 1; // OPEN
   aReturn[412] = 822;
   aType[822] = OP_SELL; // SELL
   aTicket[822] = -1; // Ticket given by broker
   aSymbol[822] = "EURUSD";
   aLots[822] = 1.0;
   aDate[822] = D'2011.11.23 10:12:15'+time_offset*3600;
   aPrice[822] = 1.3421;

   // ========== 823 ===== 429 ==========
   aPseudoTicket[823] = 412;
   aAction[823] = 0; // CLOSE
   aType[823] = OP_SELL; // SELL
   aTicket[823] = -1; // Ticket given by broker
   aSymbol[823] = "EURUSD";
   aLots[823] = 1.0;
   aDate[823] = D'2011.11.23 10:16:04'+time_offset*3600;
   aPrice[823] = 1.33978;

   // ========== 824 ===== 426 ==========
   aPseudoTicket[824] = 413;
   aAction[824] = 1; // OPEN
   aReturn[413] = 824;
   aType[824] = OP_SELL; // SELL
   aTicket[824] = -1; // Ticket given by broker
   aSymbol[824] = "EURUSD";
   aLots[824] = 1.0;
   aDate[824] = D'2011.11.23 10:19:28'+time_offset*3600;
   aPrice[824] = 1.33951;

   // ========== 825 ===== 427 ==========
   aPseudoTicket[825] = 414;
   aAction[825] = 1; // OPEN
   aReturn[414] = 825;
   aType[825] = OP_SELL; // SELL
   aTicket[825] = -1; // Ticket given by broker
   aSymbol[825] = "EURUSD";
   aLots[825] = 1.0;
   aDate[825] = D'2011.11.23 10:20:55'+time_offset*3600;
   aPrice[825] = 1.33982;

   // ========== 826 ===== 428 ==========
   aPseudoTicket[826] = 415;
   aAction[826] = 1; // OPEN
   aReturn[415] = 826;
   aType[826] = OP_SELL; // SELL
   aTicket[826] = -1; // Ticket given by broker
   aSymbol[826] = "EURUSD";
   aLots[826] = 1.0;
   aDate[826] = D'2011.11.23 12:16:42'+time_offset*3600;
   aPrice[826] = 1.33942;

   // ========== 827 ===== 428 ==========
   aPseudoTicket[827] = 415;
   aAction[827] = 0; // CLOSE
   aType[827] = OP_SELL; // SELL
   aTicket[827] = -1; // Ticket given by broker
   aSymbol[827] = "EURUSD";
   aLots[827] = 1.0;
   aDate[827] = D'2011.11.23 15:02:43'+time_offset*3600;
   aPrice[827] = 1.33689;

   // ========== 828 ===== 427 ==========
   aPseudoTicket[828] = 414;
   aAction[828] = 0; // CLOSE
   aType[828] = OP_SELL; // SELL
   aTicket[828] = -1; // Ticket given by broker
   aSymbol[828] = "EURUSD";
   aLots[828] = 1.0;
   aDate[828] = D'2011.11.23 15:03:35'+time_offset*3600;
   aPrice[828] = 1.33664;

   // ========== 829 ===== 426 ==========
   aPseudoTicket[829] = 413;
   aAction[829] = 0; // CLOSE
   aType[829] = OP_SELL; // SELL
   aTicket[829] = -1; // Ticket given by broker
   aSymbol[829] = "EURUSD";
   aLots[829] = 1.0;
   aDate[829] = D'2011.11.23 15:45:17'+time_offset*3600;
   aPrice[829] = 1.33589;

   // ========== 830 ===== 425 ==========
   aPseudoTicket[830] = 416;
   aAction[830] = 1; // OPEN
   aReturn[416] = 830;
   aType[830] = OP_BUY; // BUY
   aTicket[830] = -1; // Ticket given by broker
   aSymbol[830] = "EURUSD";
   aLots[830] = 1.0;
   aDate[830] = D'2011.11.24 11:39:03'+time_offset*3600;
   aPrice[830] = 1.33824;

   // ========== 831 ===== 425 ==========
   aPseudoTicket[831] = 416;
   aAction[831] = 0; // CLOSE
   aType[831] = OP_BUY; // BUY
   aTicket[831] = -1; // Ticket given by broker
   aSymbol[831] = "EURUSD";
   aLots[831] = 1.0;
   aDate[831] = D'2011.11.24 11:47:31'+time_offset*3600;
   aPrice[831] = 1.33842;

   // ========== 832 ===== 424 ==========
   aPseudoTicket[832] = 417;
   aAction[832] = 1; // OPEN
   aReturn[417] = 832;
   aType[832] = OP_SELL; // SELL
   aTicket[832] = -1; // Ticket given by broker
   aSymbol[832] = "AUDUSD";
   aLots[832] = 1.0;
   aDate[832] = D'2011.11.24 13:36:56'+time_offset*3600;
   aPrice[832] = 0.97545;

   // ========== 833 ===== 423 ==========
   aPseudoTicket[833] = 418;
   aAction[833] = 1; // OPEN
   aReturn[418] = 833;
   aType[833] = OP_SELL; // SELL
   aTicket[833] = -1; // Ticket given by broker
   aSymbol[833] = "AUDUSD";
   aLots[833] = 1.0;
   aDate[833] = D'2011.11.24 13:40:28'+time_offset*3600;
   aPrice[833] = 0.9751;

   // ========== 834 ===== 424 ==========
   aPseudoTicket[834] = 417;
   aAction[834] = 0; // CLOSE
   aType[834] = OP_SELL; // SELL
   aTicket[834] = -1; // Ticket given by broker
   aSymbol[834] = "AUDUSD";
   aLots[834] = 1.0;
   aDate[834] = D'2011.11.24 14:44:37'+time_offset*3600;
   aPrice[834] = 0.9715;

   // ========== 835 ===== 423 ==========
   aPseudoTicket[835] = 418;
   aAction[835] = 0; // CLOSE
   aType[835] = OP_SELL; // SELL
   aTicket[835] = -1; // Ticket given by broker
   aSymbol[835] = "AUDUSD";
   aLots[835] = 1.0;
   aDate[835] = D'2011.11.24 14:58:06'+time_offset*3600;
   aPrice[835] = 0.97191;

   // ========== 836 ===== 422 ==========
   aPseudoTicket[836] = 419;
   aAction[836] = 1; // OPEN
   aReturn[419] = 836;
   aType[836] = OP_BUY; // BUY
   aTicket[836] = -1; // Ticket given by broker
   aSymbol[836] = "GBPUSD";
   aLots[836] = 1.0;
   aDate[836] = D'2011.11.25 00:07:17'+time_offset*3600;
   aPrice[836] = 1.54713;

   // ========== 837 ===== 422 ==========
   aPseudoTicket[837] = 419;
   aAction[837] = 0; // CLOSE
   aType[837] = OP_BUY; // BUY
   aTicket[837] = -1; // Ticket given by broker
   aSymbol[837] = "GBPUSD";
   aLots[837] = 1.0;
   aDate[837] = D'2011.11.25 01:10:05'+time_offset*3600;
   aPrice[837] = 1.54666;

   // ========== 838 ===== 421 ==========
   aPseudoTicket[838] = 420;
   aAction[838] = 1; // OPEN
   aReturn[420] = 838;
   aType[838] = OP_BUY; // BUY
   aTicket[838] = -1; // Ticket given by broker
   aSymbol[838] = "GBPUSD";
   aLots[838] = 1.0;
   aDate[838] = D'2011.11.25 05:39:36'+time_offset*3600;
   aPrice[838] = 1.54571;

   // ========== 839 ===== 420 ==========
   aPseudoTicket[839] = 421;
   aAction[839] = 1; // OPEN
   aReturn[421] = 839;
   aType[839] = OP_BUY; // BUY
   aTicket[839] = -1; // Ticket given by broker
   aSymbol[839] = "GBPUSD";
   aLots[839] = 1.0;
   aDate[839] = D'2011.11.25 05:42:03'+time_offset*3600;
   aPrice[839] = 1.54573;

   // ========== 840 ===== 421 ==========
   aPseudoTicket[840] = 420;
   aAction[840] = 0; // CLOSE
   aType[840] = OP_BUY; // BUY
   aTicket[840] = -1; // Ticket given by broker
   aSymbol[840] = "GBPUSD";
   aLots[840] = 1.0;
   aDate[840] = D'2011.11.25 06:36:55'+time_offset*3600;
   aPrice[840] = 1.54598;

   // ========== 841 ===== 420 ==========
   aPseudoTicket[841] = 421;
   aAction[841] = 0; // CLOSE
   aType[841] = OP_BUY; // BUY
   aTicket[841] = -1; // Ticket given by broker
   aSymbol[841] = "GBPUSD";
   aLots[841] = 1.0;
   aDate[841] = D'2011.11.25 06:40:39'+time_offset*3600;
   aPrice[841] = 1.54606;

   // ========== 842 ===== 419 ==========
   aPseudoTicket[842] = 422;
   aAction[842] = 1; // OPEN
   aReturn[422] = 842;
   aType[842] = OP_SELL; // SELL
   aTicket[842] = -1; // Ticket given by broker
   aSymbol[842] = "EURUSD";
   aLots[842] = 1.0;
   aDate[842] = D'2011.11.25 09:04:41'+time_offset*3600;
   aPrice[842] = 1.32688;

   // ========== 843 ===== 419 ==========
   aPseudoTicket[843] = 422;
   aAction[843] = 0; // CLOSE
   aType[843] = OP_SELL; // SELL
   aTicket[843] = -1; // Ticket given by broker
   aSymbol[843] = "EURUSD";
   aLots[843] = 1.0;
   aDate[843] = D'2011.11.25 09:10:17'+time_offset*3600;
   aPrice[843] = 1.32611;

   // ========== 844 ===== 417 ==========
   aPseudoTicket[844] = 423;
   aAction[844] = 1; // OPEN
   aReturn[423] = 844;
   aType[844] = OP_BUY; // BUY
   aTicket[844] = -1; // Ticket given by broker
   aSymbol[844] = "GBPUSD";
   aLots[844] = 1.0;
   aDate[844] = D'2011.11.25 12:16:23'+time_offset*3600;
   aPrice[844] = 1.54953;

   // ========== 845 ===== 418 ==========
   aPseudoTicket[845] = 424;
   aAction[845] = 1; // OPEN
   aReturn[424] = 845;
   aType[845] = OP_BUY; // BUY
   aTicket[845] = -1; // Ticket given by broker
   aSymbol[845] = "GBPUSD";
   aLots[845] = 1.0;
   aDate[845] = D'2011.11.25 13:00:38'+time_offset*3600;
   aPrice[845] = 1.54618;

   // ========== 846 ===== 418 ==========
   aPseudoTicket[846] = 424;
   aAction[846] = 0; // CLOSE
   aType[846] = OP_BUY; // BUY
   aTicket[846] = -1; // Ticket given by broker
   aSymbol[846] = "GBPUSD";
   aLots[846] = 1.0;
   aDate[846] = D'2011.11.25 13:34:55'+time_offset*3600;
   aPrice[846] = 1.54522;

   // ========== 847 ===== 417 ==========
   aPseudoTicket[847] = 423;
   aAction[847] = 0; // CLOSE
   aType[847] = OP_BUY; // BUY
   aTicket[847] = -1; // Ticket given by broker
   aSymbol[847] = "GBPUSD";
   aLots[847] = 1.0;
   aDate[847] = D'2011.11.25 13:35:13'+time_offset*3600;
   aPrice[847] = 1.54509;

   // ========== 848 ===== 415 ==========
   aPseudoTicket[848] = 425;
   aAction[848] = 1; // OPEN
   aReturn[425] = 848;
   aType[848] = OP_SELL; // SELL
   aTicket[848] = -1; // Ticket given by broker
   aSymbol[848] = "EURUSD";
   aLots[848] = 1.0;
   aDate[848] = D'2011.11.27 23:28:55'+time_offset*3600;
   aPrice[848] = 1.33176;

   // ========== 849 ===== 416 ==========
   aPseudoTicket[849] = 426;
   aAction[849] = 1; // OPEN
   aReturn[426] = 849;
   aType[849] = OP_SELL; // SELL
   aTicket[849] = -1; // Ticket given by broker
   aSymbol[849] = "EURUSD";
   aLots[849] = 1.0;
   aDate[849] = D'2011.11.27 23:32:53'+time_offset*3600;
   aPrice[849] = 1.33222;

   // ========== 850 ===== 416 ==========
   aPseudoTicket[850] = 426;
   aAction[850] = 0; // CLOSE
   aType[850] = OP_SELL; // SELL
   aTicket[850] = -1; // Ticket given by broker
   aSymbol[850] = "EURUSD";
   aLots[850] = 1.0;
   aDate[850] = D'2011.11.28 01:06:55'+time_offset*3600;
   aPrice[850] = 1.33096;

   // ========== 851 ===== 415 ==========
   aPseudoTicket[851] = 425;
   aAction[851] = 0; // CLOSE
   aType[851] = OP_SELL; // SELL
   aTicket[851] = -1; // Ticket given by broker
   aSymbol[851] = "EURUSD";
   aLots[851] = 1.0;
   aDate[851] = D'2011.11.28 01:20:07'+time_offset*3600;
   aPrice[851] = 1.33168;

   // ========== 852 ===== 414 ==========
   aPseudoTicket[852] = 427;
   aAction[852] = 1; // OPEN
   aReturn[427] = 852;
   aType[852] = OP_SELL; // SELL
   aTicket[852] = -1; // Ticket given by broker
   aSymbol[852] = "EURUSD";
   aLots[852] = 1.0;
   aDate[852] = D'2011.11.28 02:01:19'+time_offset*3600;
   aPrice[852] = 1.33159;

   // ========== 853 ===== 413 ==========
   aPseudoTicket[853] = 428;
   aAction[853] = 1; // OPEN
   aReturn[428] = 853;
   aType[853] = OP_SELL; // SELL
   aTicket[853] = -1; // Ticket given by broker
   aSymbol[853] = "AUDUSD";
   aLots[853] = 1.0;
   aDate[853] = D'2011.11.28 03:09:56'+time_offset*3600;
   aPrice[853] = 0.98787;

   // ========== 854 ===== 414 ==========
   aPseudoTicket[854] = 427;
   aAction[854] = 0; // CLOSE
   aType[854] = OP_SELL; // SELL
   aTicket[854] = -1; // Ticket given by broker
   aSymbol[854] = "EURUSD";
   aLots[854] = 1.0;
   aDate[854] = D'2011.11.28 03:20:34'+time_offset*3600;
   aPrice[854] = 1.33097;

   // ========== 855 ===== 413 ==========
   aPseudoTicket[855] = 428;
   aAction[855] = 0; // CLOSE
   aType[855] = OP_SELL; // SELL
   aTicket[855] = -1; // Ticket given by broker
   aSymbol[855] = "AUDUSD";
   aLots[855] = 1.0;
   aDate[855] = D'2011.11.28 03:21:38'+time_offset*3600;
   aPrice[855] = 0.98407;

   // ========== 856 ===== 412 ==========
   aPseudoTicket[856] = 429;
   aAction[856] = 1; // OPEN
   aReturn[429] = 856;
   aType[856] = OP_SELL; // SELL
   aTicket[856] = -1; // Ticket given by broker
   aSymbol[856] = "EURUSD";
   aLots[856] = 1.0;
   aDate[856] = D'2011.11.28 04:15:44'+time_offset*3600;
   aPrice[856] = 1.3278;

   // ========== 857 ===== 412 ==========
   aPseudoTicket[857] = 429;
   aAction[857] = 0; // CLOSE
   aType[857] = OP_SELL; // SELL
   aTicket[857] = -1; // Ticket given by broker
   aSymbol[857] = "EURUSD";
   aLots[857] = 1.0;
   aDate[857] = D'2011.11.28 05:53:47'+time_offset*3600;
   aPrice[857] = 1.33028;

   // ========== 858 ===== 405 ==========
   aPseudoTicket[858] = 430;
   aAction[858] = 1; // OPEN
   aReturn[430] = 858;
   aType[858] = OP_BUY; // BUY
   aTicket[858] = -1; // Ticket given by broker
   aSymbol[858] = "USDCAD";
   aLots[858] = 1.0;
   aDate[858] = D'2011.11.28 09:54:56'+time_offset*3600;
   aPrice[858] = 1.035;

   // ========== 859 ===== 410 ==========
   aPseudoTicket[859] = 431;
   aAction[859] = 1; // OPEN
   aReturn[431] = 859;
   aType[859] = OP_BUY; // BUY
   aTicket[859] = -1; // Ticket given by broker
   aSymbol[859] = "USDCAD";
   aLots[859] = 1.0;
   aDate[859] = D'2011.11.28 10:20:17'+time_offset*3600;
   aPrice[859] = 1.033;

   // ========== 860 ===== 411 ==========
   aPseudoTicket[860] = 432;
   aAction[860] = 1; // OPEN
   aReturn[432] = 860;
   aType[860] = OP_BUY; // BUY
   aTicket[860] = -1; // Ticket given by broker
   aSymbol[860] = "USDCAD";
   aLots[860] = 1.0;
   aDate[860] = D'2011.11.28 11:04:56'+time_offset*3600;
   aPrice[860] = 1.03265;

   // ========== 861 ===== 411 ==========
   aPseudoTicket[861] = 432;
   aAction[861] = 0; // CLOSE
   aType[861] = OP_BUY; // BUY
   aTicket[861] = -1; // Ticket given by broker
   aSymbol[861] = "USDCAD";
   aLots[861] = 1.0;
   aDate[861] = D'2011.11.28 11:50:50'+time_offset*3600;
   aPrice[861] = 1.03305;

   // ========== 862 ===== 410 ==========
   aPseudoTicket[862] = 431;
   aAction[862] = 0; // CLOSE
   aType[862] = OP_BUY; // BUY
   aTicket[862] = -1; // Ticket given by broker
   aSymbol[862] = "USDCAD";
   aLots[862] = 1.0;
   aDate[862] = D'2011.11.28 12:30:17'+time_offset*3600;
   aPrice[862] = 1.03403;

   // ========== 863 ===== 409 ==========
   aPseudoTicket[863] = 433;
   aAction[863] = 1; // OPEN
   aReturn[433] = 863;
   aType[863] = OP_SELL; // SELL
   aTicket[863] = -1; // Ticket given by broker
   aSymbol[863] = "AUDUSD";
   aLots[863] = 1.0;
   aDate[863] = D'2011.11.28 13:33:45'+time_offset*3600;
   aPrice[863] = 0.99668;

   // ========== 864 ===== 408 ==========
   aPseudoTicket[864] = 434;
   aAction[864] = 1; // OPEN
   aReturn[434] = 864;
   aType[864] = OP_SELL; // SELL
   aTicket[864] = -1; // Ticket given by broker
   aSymbol[864] = "AUDUSD";
   aLots[864] = 1.0;
   aDate[864] = D'2011.11.28 13:43:24'+time_offset*3600;
   aPrice[864] = 0.99625;

   // ========== 865 ===== 407 ==========
   aPseudoTicket[865] = 435;
   aAction[865] = 1; // OPEN
   aReturn[435] = 865;
   aType[865] = OP_SELL; // SELL
   aTicket[865] = -1; // Ticket given by broker
   aSymbol[865] = "AUDUSD";
   aLots[865] = 1.0;
   aDate[865] = D'2011.11.28 13:44:31'+time_offset*3600;
   aPrice[865] = 0.9963;

   // ========== 866 ===== 409 ==========
   aPseudoTicket[866] = 433;
   aAction[866] = 0; // CLOSE
   aType[866] = OP_SELL; // SELL
   aTicket[866] = -1; // Ticket given by broker
   aSymbol[866] = "AUDUSD";
   aLots[866] = 1.0;
   aDate[866] = D'2011.11.28 15:41:25'+time_offset*3600;
   aPrice[866] = 0.9952;

   // ========== 867 ===== 408 ==========
   aPseudoTicket[867] = 434;
   aAction[867] = 0; // CLOSE
   aType[867] = OP_SELL; // SELL
   aTicket[867] = -1; // Ticket given by broker
   aSymbol[867] = "AUDUSD";
   aLots[867] = 1.0;
   aDate[867] = D'2011.11.28 16:08:05'+time_offset*3600;
   aPrice[867] = 0.99226;

   // ========== 868 ===== 407 ==========
   aPseudoTicket[868] = 435;
   aAction[868] = 0; // CLOSE
   aType[868] = OP_SELL; // SELL
   aTicket[868] = -1; // Ticket given by broker
   aSymbol[868] = "AUDUSD";
   aLots[868] = 1.0;
   aDate[868] = D'2011.11.28 16:16:05'+time_offset*3600;
   aPrice[868] = 0.9913;

   // ========== 869 ===== 406 ==========
   aPseudoTicket[869] = 436;
   aAction[869] = 1; // OPEN
   aReturn[436] = 869;
   aType[869] = OP_SELL; // SELL
   aTicket[869] = -1; // Ticket given by broker
   aSymbol[869] = "AUDUSD";
   aLots[869] = 1.0;
   aDate[869] = D'2011.11.28 16:30:47'+time_offset*3600;
   aPrice[869] = 0.99219;

   // ========== 870 ===== 406 ==========
   aPseudoTicket[870] = 436;
   aAction[870] = 0; // CLOSE
   aType[870] = OP_SELL; // SELL
   aTicket[870] = -1; // Ticket given by broker
   aSymbol[870] = "AUDUSD";
   aLots[870] = 1.0;
   aDate[870] = D'2011.11.28 16:39:10'+time_offset*3600;
   aPrice[870] = 0.99155;

   // ========== 871 ===== 405 ==========
   aPseudoTicket[871] = 430;
   aAction[871] = 0; // CLOSE
   aType[871] = OP_BUY; // BUY
   aTicket[871] = -1; // Ticket given by broker
   aSymbol[871] = "USDCAD";
   aLots[871] = 1.0;
   aDate[871] = D'2011.11.28 16:40:12'+time_offset*3600;
   aPrice[871] = 1.03308;

   // ========== 872 ===== 404 ==========
   aPseudoTicket[872] = 437;
   aAction[872] = 1; // OPEN
   aReturn[437] = 872;
   aType[872] = OP_BUY; // BUY
   aTicket[872] = -1; // Ticket given by broker
   aSymbol[872] = "USDCAD";
   aLots[872] = 1.0;
   aDate[872] = D'2011.11.28 16:45:31'+time_offset*3600;
   aPrice[872] = 1.03288;

   // ========== 873 ===== 403 ==========
   aPseudoTicket[873] = 438;
   aAction[873] = 1; // OPEN
   aReturn[438] = 873;
   aType[873] = OP_SELL; // SELL
   aTicket[873] = -1; // Ticket given by broker
   aSymbol[873] = "AUDUSD";
   aLots[873] = 1.0;
   aDate[873] = D'2011.11.28 16:49:47'+time_offset*3600;
   aPrice[873] = 0.99199;

   // ========== 874 ===== 404 ==========
   aPseudoTicket[874] = 437;
   aAction[874] = 0; // CLOSE
   aType[874] = OP_BUY; // BUY
   aTicket[874] = -1; // Ticket given by broker
   aSymbol[874] = "USDCAD";
   aLots[874] = 1.0;
   aDate[874] = D'2011.11.28 16:51:43'+time_offset*3600;
   aPrice[874] = 1.033;

   // ========== 875 ===== 403 ==========
   aPseudoTicket[875] = 438;
   aAction[875] = 0; // CLOSE
   aType[875] = OP_SELL; // SELL
   aTicket[875] = -1; // Ticket given by broker
   aSymbol[875] = "AUDUSD";
   aLots[875] = 1.0;
   aDate[875] = D'2011.11.28 17:30:22'+time_offset*3600;
   aPrice[875] = 0.99113;

   // ========== 876 ===== 402 ==========
   aPseudoTicket[876] = 439;
   aAction[876] = 1; // OPEN
   aReturn[439] = 876;
   aType[876] = OP_BUY; // BUY
   aTicket[876] = -1; // Ticket given by broker
   aSymbol[876] = "GBPUSD";
   aLots[876] = 1.0;
   aDate[876] = D'2011.11.29 00:12:35'+time_offset*3600;
   aPrice[876] = 1.54846;

   // ========== 877 ===== 401 ==========
   aPseudoTicket[877] = 440;
   aAction[877] = 1; // OPEN
   aReturn[440] = 877;
   aType[877] = OP_BUY; // BUY
   aTicket[877] = -1; // Ticket given by broker
   aSymbol[877] = "GBPUSD";
   aLots[877] = 1.0;
   aDate[877] = D'2011.11.29 00:32:35'+time_offset*3600;
   aPrice[877] = 1.54716;

   // ========== 878 ===== 402 ==========
   aPseudoTicket[878] = 439;
   aAction[878] = 0; // CLOSE
   aType[878] = OP_BUY; // BUY
   aTicket[878] = -1; // Ticket given by broker
   aSymbol[878] = "GBPUSD";
   aLots[878] = 1.0;
   aDate[878] = D'2011.11.29 00:45:53'+time_offset*3600;
   aPrice[878] = 1.54883;

   // ========== 879 ===== 401 ==========
   aPseudoTicket[879] = 440;
   aAction[879] = 0; // CLOSE
   aType[879] = OP_BUY; // BUY
   aTicket[879] = -1; // Ticket given by broker
   aSymbol[879] = "GBPUSD";
   aLots[879] = 1.0;
   aDate[879] = D'2011.11.29 01:20:56'+time_offset*3600;
   aPrice[879] = 1.54873;

   // ========== 880 ===== 400 ==========
   aPseudoTicket[880] = 441;
   aAction[880] = 1; // OPEN
   aReturn[441] = 880;
   aType[880] = OP_SELL; // SELL
   aTicket[880] = -1; // Ticket given by broker
   aSymbol[880] = "EURUSD";
   aLots[880] = 1.0;
   aDate[880] = D'2011.11.29 08:02:11'+time_offset*3600;
   aPrice[880] = 1.33325;

   // ========== 881 ===== 400 ==========
   aPseudoTicket[881] = 441;
   aAction[881] = 0; // CLOSE
   aType[881] = OP_SELL; // SELL
   aTicket[881] = -1; // Ticket given by broker
   aSymbol[881] = "EURUSD";
   aLots[881] = 1.0;
   aDate[881] = D'2011.11.29 08:17:05'+time_offset*3600;
   aPrice[881] = 1.33303;

   // ========== 882 ===== 399 ==========
   aPseudoTicket[882] = 442;
   aAction[882] = 1; // OPEN
   aReturn[442] = 882;
   aType[882] = OP_SELL; // SELL
   aTicket[882] = -1; // Ticket given by broker
   aSymbol[882] = "EURUSD";
   aLots[882] = 1.0;
   aDate[882] = D'2011.11.29 08:40:51'+time_offset*3600;
   aPrice[882] = 1.33246;

   // ========== 883 ===== 399 ==========
   aPseudoTicket[883] = 442;
   aAction[883] = 0; // CLOSE
   aType[883] = OP_SELL; // SELL
   aTicket[883] = -1; // Ticket given by broker
   aSymbol[883] = "EURUSD";
   aLots[883] = 1.0;
   aDate[883] = D'2011.11.29 08:51:19'+time_offset*3600;
   aPrice[883] = 1.33227;

   // ========== 884 ===== 398 ==========
   aPseudoTicket[884] = 443;
   aAction[884] = 1; // OPEN
   aReturn[443] = 884;
   aType[884] = OP_BUY; // BUY
   aTicket[884] = -1; // Ticket given by broker
   aSymbol[884] = "EURUSD";
   aLots[884] = 1.0;
   aDate[884] = D'2011.11.29 10:14:21'+time_offset*3600;
   aPrice[884] = 1.33866;

   // ========== 885 ===== 398 ==========
   aPseudoTicket[885] = 443;
   aAction[885] = 0; // CLOSE
   aType[885] = OP_BUY; // BUY
   aTicket[885] = -1; // Ticket given by broker
   aSymbol[885] = "EURUSD";
   aLots[885] = 1.0;
   aDate[885] = D'2011.11.29 10:15:43'+time_offset*3600;
   aPrice[885] = 1.33976;

   // ========== 886 ===== 397 ==========
   aPseudoTicket[886] = 444;
   aAction[886] = 1; // OPEN
   aReturn[444] = 886;
   aType[886] = OP_BUY; // BUY
   aTicket[886] = -1; // Ticket given by broker
   aSymbol[886] = "EURUSD";
   aLots[886] = 1.0;
   aDate[886] = D'2011.11.29 11:23:59'+time_offset*3600;
   aPrice[886] = 1.34017;

   // ========== 887 ===== 397 ==========
   aPseudoTicket[887] = 444;
   aAction[887] = 0; // CLOSE
   aType[887] = OP_BUY; // BUY
   aTicket[887] = -1; // Ticket given by broker
   aSymbol[887] = "EURUSD";
   aLots[887] = 1.0;
   aDate[887] = D'2011.11.29 11:43:32'+time_offset*3600;
   aPrice[887] = 1.33882;

   // ========== 888 ===== 396 ==========
   aPseudoTicket[888] = 445;
   aAction[888] = 1; // OPEN
   aReturn[445] = 888;
   aType[888] = OP_SELL; // SELL
   aTicket[888] = -1; // Ticket given by broker
   aSymbol[888] = "EURUSD";
   aLots[888] = 1.0;
   aDate[888] = D'2011.11.30 06:57:02'+time_offset*3600;
   aPrice[888] = 1.33015;

   // ========== 889 ===== 396 ==========
   aPseudoTicket[889] = 445;
   aAction[889] = 0; // CLOSE
   aType[889] = OP_SELL; // SELL
   aTicket[889] = -1; // Ticket given by broker
   aSymbol[889] = "EURUSD";
   aLots[889] = 1.0;
   aDate[889] = D'2011.11.30 07:04:56'+time_offset*3600;
   aPrice[889] = 1.32952;

   // ========== 890 ===== 395 ==========
   aPseudoTicket[890] = 446;
   aAction[890] = 1; // OPEN
   aReturn[446] = 890;
   aType[890] = OP_SELL; // SELL
   aTicket[890] = -1; // Ticket given by broker
   aSymbol[890] = "EURUSD";
   aLots[890] = 1.0;
   aDate[890] = D'2011.11.30 07:16:09'+time_offset*3600;
   aPrice[890] = 1.32662;

   // ========== 891 ===== 394 ==========
   aPseudoTicket[891] = 447;
   aAction[891] = 1; // OPEN
   aReturn[447] = 891;
   aType[891] = OP_SELL; // SELL
   aTicket[891] = -1; // Ticket given by broker
   aSymbol[891] = "EURUSD";
   aLots[891] = 1.0;
   aDate[891] = D'2011.11.30 07:17:31'+time_offset*3600;
   aPrice[891] = 1.32669;

   // ========== 892 ===== 393 ==========
   aPseudoTicket[892] = 448;
   aAction[892] = 1; // OPEN
   aReturn[448] = 892;
   aType[892] = OP_SELL; // SELL
   aTicket[892] = -1; // Ticket given by broker
   aSymbol[892] = "EURUSD";
   aLots[892] = 1.0;
   aDate[892] = D'2011.11.30 07:18:22'+time_offset*3600;
   aPrice[892] = 1.32632;

   // ========== 893 ===== 392 ==========
   aPseudoTicket[893] = 449;
   aAction[893] = 1; // OPEN
   aReturn[449] = 893;
   aType[893] = OP_SELL; // SELL
   aTicket[893] = -1; // Ticket given by broker
   aSymbol[893] = "EURUSD";
   aLots[893] = 1.0;
   aDate[893] = D'2011.11.30 07:20:09'+time_offset*3600;
   aPrice[893] = 1.32623;

   // ========== 894 ===== 395 ==========
   aPseudoTicket[894] = 446;
   aAction[894] = 0; // CLOSE
   aType[894] = OP_SELL; // SELL
   aTicket[894] = -1; // Ticket given by broker
   aSymbol[894] = "EURUSD";
   aLots[894] = 1.0;
   aDate[894] = D'2011.11.30 09:08:19'+time_offset*3600;
   aPrice[894] = 1.32906;

   // ========== 895 ===== 394 ==========
   aPseudoTicket[895] = 447;
   aAction[895] = 0; // CLOSE
   aType[895] = OP_SELL; // SELL
   aTicket[895] = -1; // Ticket given by broker
   aSymbol[895] = "EURUSD";
   aLots[895] = 1.0;
   aDate[895] = D'2011.11.30 09:08:23'+time_offset*3600;
   aPrice[895] = 1.32908;

   // ========== 896 ===== 393 ==========
   aPseudoTicket[896] = 448;
   aAction[896] = 0; // CLOSE
   aType[896] = OP_SELL; // SELL
   aTicket[896] = -1; // Ticket given by broker
   aSymbol[896] = "EURUSD";
   aLots[896] = 1.0;
   aDate[896] = D'2011.11.30 09:08:27'+time_offset*3600;
   aPrice[896] = 1.32906;

   // ========== 897 ===== 392 ==========
   aPseudoTicket[897] = 449;
   aAction[897] = 0; // CLOSE
   aType[897] = OP_SELL; // SELL
   aTicket[897] = -1; // Ticket given by broker
   aSymbol[897] = "EURUSD";
   aLots[897] = 1.0;
   aDate[897] = D'2011.11.30 09:08:30'+time_offset*3600;
   aPrice[897] = 1.32915;

   // ========== 898 ===== 389 ==========
   aPseudoTicket[898] = 450;
   aAction[898] = 1; // OPEN
   aReturn[450] = 898;
   aType[898] = OP_BUY; // BUY
   aTicket[898] = -1; // Ticket given by broker
   aSymbol[898] = "EURUSD";
   aLots[898] = 1.0;
   aDate[898] = D'2011.11.30 13:12:16'+time_offset*3600;
   aPrice[898] = 1.34301;

   // ========== 899 ===== 388 ==========
   aPseudoTicket[899] = 451;
   aAction[899] = 1; // OPEN
   aReturn[451] = 899;
   aType[899] = OP_BUY; // BUY
   aTicket[899] = -1; // Ticket given by broker
   aSymbol[899] = "EURUSD";
   aLots[899] = 1.0;
   aDate[899] = D'2011.11.30 13:23:20'+time_offset*3600;
   aPrice[899] = 1.34261;

   // ========== 900 ===== 391 ==========
   aPseudoTicket[900] = 452;
   aAction[900] = 1; // OPEN
   aReturn[452] = 900;
   aType[900] = OP_BUY; // BUY
   aTicket[900] = -1; // Ticket given by broker
   aSymbol[900] = "EURUSD";
   aLots[900] = 1.0;
   aDate[900] = D'2011.11.30 14:03:12'+time_offset*3600;
   aPrice[900] = 1.35103;

   // ========== 901 ===== 391 ==========
   aPseudoTicket[901] = 452;
   aAction[901] = 0; // CLOSE
   aType[901] = OP_BUY; // BUY
   aTicket[901] = -1; // Ticket given by broker
   aSymbol[901] = "EURUSD";
   aLots[901] = 1.0;
   aDate[901] = D'2011.11.30 14:06:48'+time_offset*3600;
   aPrice[901] = 1.35127;

   // ========== 902 ===== 390 ==========
   aPseudoTicket[902] = 453;
   aAction[902] = 1; // OPEN
   aReturn[453] = 902;
   aType[902] = OP_BUY; // BUY
   aTicket[902] = -1; // Ticket given by broker
   aSymbol[902] = "EURUSD";
   aLots[902] = 1.0;
   aDate[902] = D'2011.11.30 14:10:09'+time_offset*3600;
   aPrice[902] = 1.34987;

   // ========== 903 ===== 390 ==========
   aPseudoTicket[903] = 453;
   aAction[903] = 0; // CLOSE
   aType[903] = OP_BUY; // BUY
   aTicket[903] = -1; // Ticket given by broker
   aSymbol[903] = "EURUSD";
   aLots[903] = 1.0;
   aDate[903] = D'2011.11.30 14:16:43'+time_offset*3600;
   aPrice[903] = 1.35062;

   // ========== 904 ===== 383 ==========
   aPseudoTicket[904] = 454;
   aAction[904] = 1; // OPEN
   aReturn[454] = 904;
   aType[904] = OP_BUY; // BUY
   aTicket[904] = -1; // Ticket given by broker
   aSymbol[904] = "EURUSD";
   aLots[904] = 1.0;
   aDate[904] = D'2011.11.30 14:23:38'+time_offset*3600;
   aPrice[904] = 1.34938;

   // ========== 905 ===== 384 ==========
   aPseudoTicket[905] = 455;
   aAction[905] = 1; // OPEN
   aReturn[455] = 905;
   aType[905] = OP_BUY; // BUY
   aTicket[905] = -1; // Ticket given by broker
   aSymbol[905] = "EURUSD";
   aLots[905] = 1.0;
   aDate[905] = D'2011.11.30 14:32:49'+time_offset*3600;
   aPrice[905] = 1.3481;

   // ========== 906 ===== 389 ==========
   aPseudoTicket[906] = 450;
   aAction[906] = 0; // CLOSE
   aType[906] = OP_BUY; // BUY
   aTicket[906] = -1; // Ticket given by broker
   aSymbol[906] = "EURUSD";
   aLots[906] = 1.0;
   aDate[906] = D'2011.12.01 02:39:25'+time_offset*3600;
   aPrice[906] = 1.34357;

   // ========== 907 ===== 388 ==========
   aPseudoTicket[907] = 451;
   aAction[907] = 0; // CLOSE
   aType[907] = OP_BUY; // BUY
   aTicket[907] = -1; // Ticket given by broker
   aSymbol[907] = "EURUSD";
   aLots[907] = 1.0;
   aDate[907] = D'2011.12.01 02:39:33'+time_offset*3600;
   aPrice[907] = 1.34365;

   // ========== 908 ===== 387 ==========
   aPseudoTicket[908] = 456;
   aAction[908] = 1; // OPEN
   aReturn[456] = 908;
   aType[908] = OP_BUY; // BUY
   aTicket[908] = -1; // Ticket given by broker
   aSymbol[908] = "AUDUSD";
   aLots[908] = 1.0;
   aDate[908] = D'2011.12.01 02:43:13'+time_offset*3600;
   aPrice[908] = 1.01913;

   // ========== 909 ===== 386 ==========
   aPseudoTicket[909] = 457;
   aAction[909] = 1; // OPEN
   aReturn[457] = 909;
   aType[909] = OP_BUY; // BUY
   aTicket[909] = -1; // Ticket given by broker
   aSymbol[909] = "AUDUSD";
   aLots[909] = 1.0;
   aDate[909] = D'2011.12.01 02:44:03'+time_offset*3600;
   aPrice[909] = 1.01927;

   // ========== 910 ===== 387 ==========
   aPseudoTicket[910] = 456;
   aAction[910] = 0; // CLOSE
   aType[910] = OP_BUY; // BUY
   aTicket[910] = -1; // Ticket given by broker
   aSymbol[910] = "AUDUSD";
   aLots[910] = 1.0;
   aDate[910] = D'2011.12.01 04:36:38'+time_offset*3600;
   aPrice[910] = 1.0241;

   // ========== 911 ===== 386 ==========
   aPseudoTicket[911] = 457;
   aAction[911] = 0; // CLOSE
   aType[911] = OP_BUY; // BUY
   aTicket[911] = -1; // Ticket given by broker
   aSymbol[911] = "AUDUSD";
   aLots[911] = 1.0;
   aDate[911] = D'2011.12.01 04:52:42'+time_offset*3600;
   aPrice[911] = 1.0256;

   // ========== 912 ===== 385 ==========
   aPseudoTicket[912] = 458;
   aAction[912] = 1; // OPEN
   aReturn[458] = 912;
   aType[912] = OP_BUY; // BUY
   aTicket[912] = -1; // Ticket given by broker
   aSymbol[912] = "EURUSD";
   aLots[912] = 1.0;
   aDate[912] = D'2011.12.01 09:31:02'+time_offset*3600;
   aPrice[912] = 1.3471;

   // ========== 913 ===== 385 ==========
   aPseudoTicket[913] = 458;
   aAction[913] = 0; // CLOSE
   aType[913] = OP_BUY; // BUY
   aTicket[913] = -1; // Ticket given by broker
   aSymbol[913] = "EURUSD";
   aLots[913] = 1.0;
   aDate[913] = D'2011.12.01 09:38:17'+time_offset*3600;
   aPrice[913] = 1.3471;

   // ========== 914 ===== 384 ==========
   aPseudoTicket[914] = 455;
   aAction[914] = 0; // CLOSE
   aType[914] = OP_BUY; // BUY
   aTicket[914] = -1; // Ticket given by broker
   aSymbol[914] = "EURUSD";
   aLots[914] = 1.0;
   aDate[914] = D'2011.12.01 09:41:38'+time_offset*3600;
   aPrice[914] = 1.34705;

   // ========== 915 ===== 383 ==========
   aPseudoTicket[915] = 454;
   aAction[915] = 0; // CLOSE
   aType[915] = OP_BUY; // BUY
   aTicket[915] = -1; // Ticket given by broker
   aSymbol[915] = "EURUSD";
   aLots[915] = 1.0;
   aDate[915] = D'2011.12.01 09:49:46'+time_offset*3600;
   aPrice[915] = 1.34855;

   // ========== 916 ===== 382 ==========
   aPseudoTicket[916] = 459;
   aAction[916] = 1; // OPEN
   aReturn[459] = 916;
   aType[916] = OP_BUY; // BUY
   aTicket[916] = -1; // Ticket given by broker
   aSymbol[916] = "EURUSD";
   aLots[916] = 1.0;
   aDate[916] = D'2011.12.01 13:18:40'+time_offset*3600;
   aPrice[916] = 1.35094;

   // ========== 917 ===== 382 ==========
   aPseudoTicket[917] = 459;
   aAction[917] = 0; // CLOSE
   aType[917] = OP_BUY; // BUY
   aTicket[917] = -1; // Ticket given by broker
   aSymbol[917] = "EURUSD";
   aLots[917] = 1.0;
   aDate[917] = D'2011.12.01 13:22:30'+time_offset*3600;
   aPrice[917] = 1.35146;

   // ========== 918 ===== 381 ==========
   aPseudoTicket[918] = 460;
   aAction[918] = 1; // OPEN
   aReturn[460] = 918;
   aType[918] = OP_SELL; // SELL
   aTicket[918] = -1; // Ticket given by broker
   aSymbol[918] = "EURUSD";
   aLots[918] = 1.0;
   aDate[918] = D'2011.12.01 15:33:46'+time_offset*3600;
   aPrice[918] = 1.34851;

   // ========== 919 ===== 381 ==========
   aPseudoTicket[919] = 460;
   aAction[919] = 0; // CLOSE
   aType[919] = OP_SELL; // SELL
   aTicket[919] = -1; // Ticket given by broker
   aSymbol[919] = "EURUSD";
   aLots[919] = 1.0;
   aDate[919] = D'2011.12.01 15:35:56'+time_offset*3600;
   aPrice[919] = 1.34745;

   // ========== 920 ===== 380 ==========
   aPseudoTicket[920] = 461;
   aAction[920] = 1; // OPEN
   aReturn[461] = 920;
   aType[920] = OP_SELL; // SELL
   aTicket[920] = -1; // Ticket given by broker
   aSymbol[920] = "EURUSD";
   aLots[920] = 1.0;
   aDate[920] = D'2011.12.01 16:08:07'+time_offset*3600;
   aPrice[920] = 1.34753;

   // ========== 921 ===== 380 ==========
   aPseudoTicket[921] = 461;
   aAction[921] = 0; // CLOSE
   aType[921] = OP_SELL; // SELL
   aTicket[921] = -1; // Ticket given by broker
   aSymbol[921] = "EURUSD";
   aLots[921] = 1.0;
   aDate[921] = D'2011.12.01 16:18:11'+time_offset*3600;
   aPrice[921] = 1.34672;

   // ========== 922 ===== 379 ==========
   aPseudoTicket[922] = 462;
   aAction[922] = 1; // OPEN
   aReturn[462] = 922;
   aType[922] = OP_BUY; // BUY
   aTicket[922] = -1; // Ticket given by broker
   aSymbol[922] = "EURUSD";
   aLots[922] = 1.0;
   aDate[922] = D'2011.12.02 08:00:36'+time_offset*3600;
   aPrice[922] = 1.34842;

   // ========== 923 ===== 379 ==========
   aPseudoTicket[923] = 462;
   aAction[923] = 0; // CLOSE
   aType[923] = OP_BUY; // BUY
   aTicket[923] = -1; // Ticket given by broker
   aSymbol[923] = "EURUSD";
   aLots[923] = 1.0;
   aDate[923] = D'2011.12.02 08:06:07'+time_offset*3600;
   aPrice[923] = 1.34857;

   // ========== 924 ===== 378 ==========
   aPseudoTicket[924] = 463;
   aAction[924] = 1; // OPEN
   aReturn[463] = 924;
   aType[924] = OP_BUY; // BUY
   aTicket[924] = -1; // Ticket given by broker
   aSymbol[924] = "GBPUSD";
   aLots[924] = 1.0;
   aDate[924] = D'2011.12.02 08:34:31'+time_offset*3600;
   aPrice[924] = 1.57042;

   // ========== 925 ===== 378 ==========
   aPseudoTicket[925] = 463;
   aAction[925] = 0; // CLOSE
   aType[925] = OP_BUY; // BUY
   aTicket[925] = -1; // Ticket given by broker
   aSymbol[925] = "GBPUSD";
   aLots[925] = 1.0;
   aDate[925] = D'2011.12.02 08:46:34'+time_offset*3600;
   aPrice[925] = 1.57024;

   // ========== 926 ===== 377 ==========
   aPseudoTicket[926] = 464;
   aAction[926] = 1; // OPEN
   aReturn[464] = 926;
   aType[926] = OP_SELL; // SELL
   aTicket[926] = -1; // Ticket given by broker
   aSymbol[926] = "GBPUSD";
   aLots[926] = 1.0;
   aDate[926] = D'2011.12.02 08:54:12'+time_offset*3600;
   aPrice[926] = 1.56887;

   // ========== 927 ===== 377 ==========
   aPseudoTicket[927] = 464;
   aAction[927] = 0; // CLOSE
   aType[927] = OP_SELL; // SELL
   aTicket[927] = -1; // Ticket given by broker
   aSymbol[927] = "GBPUSD";
   aLots[927] = 1.0;
   aDate[927] = D'2011.12.02 09:14:19'+time_offset*3600;
   aPrice[927] = 1.56951;

   // ========== 928 ===== 376 ==========
   aPseudoTicket[928] = 465;
   aAction[928] = 1; // OPEN
   aReturn[465] = 928;
   aType[928] = OP_BUY; // BUY
   aTicket[928] = -1; // Ticket given by broker
   aSymbol[928] = "EURUSD";
   aLots[928] = 1.0;
   aDate[928] = D'2011.12.02 09:18:30'+time_offset*3600;
   aPrice[928] = 1.34918;

   // ========== 929 ===== 376 ==========
   aPseudoTicket[929] = 465;
   aAction[929] = 0; // CLOSE
   aType[929] = OP_BUY; // BUY
   aTicket[929] = -1; // Ticket given by broker
   aSymbol[929] = "EURUSD";
   aLots[929] = 1.0;
   aDate[929] = D'2011.12.02 09:35:11'+time_offset*3600;
   aPrice[929] = 1.34793;

   // ========== 930 ===== 372 ==========
   aPseudoTicket[930] = 466;
   aAction[930] = 1; // OPEN
   aReturn[466] = 930;
   aType[930] = OP_BUY; // BUY
   aTicket[930] = -1; // Ticket given by broker
   aSymbol[930] = "GBPUSD";
   aLots[930] = 1.0;
   aDate[930] = D'2011.12.02 10:09:30'+time_offset*3600;
   aPrice[930] = 1.57042;

   // ========== 931 ===== 373 ==========
   aPseudoTicket[931] = 467;
   aAction[931] = 1; // OPEN
   aReturn[467] = 931;
   aType[931] = OP_BUY; // BUY
   aTicket[931] = -1; // Ticket given by broker
   aSymbol[931] = "GBPUSD";
   aLots[931] = 1.0;
   aDate[931] = D'2011.12.02 10:10:13'+time_offset*3600;
   aPrice[931] = 1.57037;

   // ========== 932 ===== 374 ==========
   aPseudoTicket[932] = 468;
   aAction[932] = 1; // OPEN
   aReturn[468] = 932;
   aType[932] = OP_BUY; // BUY
   aTicket[932] = -1; // Ticket given by broker
   aSymbol[932] = "GBPUSD";
   aLots[932] = 1.0;
   aDate[932] = D'2011.12.02 10:11:31'+time_offset*3600;
   aPrice[932] = 1.57021;

   // ========== 933 ===== 375 ==========
   aPseudoTicket[933] = 469;
   aAction[933] = 1; // OPEN
   aReturn[469] = 933;
   aType[933] = OP_BUY; // BUY
   aTicket[933] = -1; // Ticket given by broker
   aSymbol[933] = "GBPUSD";
   aLots[933] = 1.0;
   aDate[933] = D'2011.12.02 10:13:50'+time_offset*3600;
   aPrice[933] = 1.56999;

   // ========== 934 ===== 375 ==========
   aPseudoTicket[934] = 469;
   aAction[934] = 0; // CLOSE
   aType[934] = OP_BUY; // BUY
   aTicket[934] = -1; // Ticket given by broker
   aSymbol[934] = "GBPUSD";
   aLots[934] = 1.0;
   aDate[934] = D'2011.12.02 12:04:10'+time_offset*3600;
   aPrice[934] = 1.56863;

   // ========== 935 ===== 374 ==========
   aPseudoTicket[935] = 468;
   aAction[935] = 0; // CLOSE
   aType[935] = OP_BUY; // BUY
   aTicket[935] = -1; // Ticket given by broker
   aSymbol[935] = "GBPUSD";
   aLots[935] = 1.0;
   aDate[935] = D'2011.12.02 12:04:15'+time_offset*3600;
   aPrice[935] = 1.56869;

   // ========== 936 ===== 368 ==========
   aPseudoTicket[936] = 470;
   aAction[936] = 1; // OPEN
   aReturn[470] = 936;
   aType[936] = OP_BUY; // BUY
   aTicket[936] = -1; // Ticket given by broker
   aSymbol[936] = "EURUSD";
   aLots[936] = 1.0;
   aDate[936] = D'2011.12.02 12:38:55'+time_offset*3600;
   aPrice[936] = 1.35351;

   // ========== 937 ===== 369 ==========
   aPseudoTicket[937] = 471;
   aAction[937] = 1; // OPEN
   aReturn[471] = 937;
   aType[937] = OP_BUY; // BUY
   aTicket[937] = -1; // Ticket given by broker
   aSymbol[937] = "EURUSD";
   aLots[937] = 1.0;
   aDate[937] = D'2011.12.02 12:39:37'+time_offset*3600;
   aPrice[937] = 1.35317;

   // ========== 938 ===== 373 ==========
   aPseudoTicket[938] = 467;
   aAction[938] = 0; // CLOSE
   aType[938] = OP_BUY; // BUY
   aTicket[938] = -1; // Ticket given by broker
   aSymbol[938] = "GBPUSD";
   aLots[938] = 1.0;
   aDate[938] = D'2011.12.02 13:05:11'+time_offset*3600;
   aPrice[938] = 1.57077;

   // ========== 939 ===== 372 ==========
   aPseudoTicket[939] = 466;
   aAction[939] = 0; // CLOSE
   aType[939] = OP_BUY; // BUY
   aTicket[939] = -1; // Ticket given by broker
   aSymbol[939] = "GBPUSD";
   aLots[939] = 1.0;
   aDate[939] = D'2011.12.02 13:05:18'+time_offset*3600;
   aPrice[939] = 1.57104;

   // ========== 940 ===== 370 ==========
   aPseudoTicket[940] = 472;
   aAction[940] = 1; // OPEN
   aReturn[472] = 940;
   aType[940] = OP_BUY; // BUY
   aTicket[940] = -1; // Ticket given by broker
   aSymbol[940] = "EURUSD";
   aLots[940] = 1.0;
   aDate[940] = D'2011.12.02 13:19:59'+time_offset*3600;
   aPrice[940] = 1.35219;

   // ========== 941 ===== 371 ==========
   aPseudoTicket[941] = 473;
   aAction[941] = 1; // OPEN
   aReturn[473] = 941;
   aType[941] = OP_BUY; // BUY
   aTicket[941] = -1; // Ticket given by broker
   aSymbol[941] = "EURUSD";
   aLots[941] = 1.0;
   aDate[941] = D'2011.12.02 13:20:23'+time_offset*3600;
   aPrice[941] = 1.35242;

   // ========== 942 ===== 371 ==========
   aPseudoTicket[942] = 473;
   aAction[942] = 0; // CLOSE
   aType[942] = OP_BUY; // BUY
   aTicket[942] = -1; // Ticket given by broker
   aSymbol[942] = "EURUSD";
   aLots[942] = 1.0;
   aDate[942] = D'2011.12.02 13:36:26'+time_offset*3600;
   aPrice[942] = 1.34994;

   // ========== 943 ===== 370 ==========
   aPseudoTicket[943] = 472;
   aAction[943] = 0; // CLOSE
   aType[943] = OP_BUY; // BUY
   aTicket[943] = -1; // Ticket given by broker
   aSymbol[943] = "EURUSD";
   aLots[943] = 1.0;
   aDate[943] = D'2011.12.02 13:36:31'+time_offset*3600;
   aPrice[943] = 1.34991;

   // ========== 944 ===== 369 ==========
   aPseudoTicket[944] = 471;
   aAction[944] = 0; // CLOSE
   aType[944] = OP_BUY; // BUY
   aTicket[944] = -1; // Ticket given by broker
   aSymbol[944] = "EURUSD";
   aLots[944] = 1.0;
   aDate[944] = D'2011.12.02 13:36:43'+time_offset*3600;
   aPrice[944] = 1.34998;

   // ========== 945 ===== 368 ==========
   aPseudoTicket[945] = 470;
   aAction[945] = 0; // CLOSE
   aType[945] = OP_BUY; // BUY
   aTicket[945] = -1; // Ticket given by broker
   aSymbol[945] = "EURUSD";
   aLots[945] = 1.0;
   aDate[945] = D'2011.12.02 13:36:47'+time_offset*3600;
   aPrice[945] = 1.34997;

   // ========== 946 ===== 367 ==========
   aPseudoTicket[946] = 474;
   aAction[946] = 1; // OPEN
   aReturn[474] = 946;
   aType[946] = OP_SELL; // SELL
   aTicket[946] = -1; // Ticket given by broker
   aSymbol[946] = "USDCAD";
   aLots[946] = 1.0;
   aDate[946] = D'2011.12.04 22:10:00'+time_offset*3600;
   aPrice[946] = 1.01723;

   // ========== 947 ===== 365 ==========
   aPseudoTicket[947] = 475;
   aAction[947] = 1; // OPEN
   aReturn[475] = 947;
   aType[947] = OP_SELL; // SELL
   aTicket[947] = -1; // Ticket given by broker
   aSymbol[947] = "USDCAD";
   aLots[947] = 1.0;
   aDate[947] = D'2011.12.04 22:56:36'+time_offset*3600;
   aPrice[947] = 1.0182;

   // ========== 948 ===== 367 ==========
   aPseudoTicket[948] = 474;
   aAction[948] = 0; // CLOSE
   aType[948] = OP_SELL; // SELL
   aTicket[948] = -1; // Ticket given by broker
   aSymbol[948] = "USDCAD";
   aLots[948] = 1.0;
   aDate[948] = D'2011.12.05 00:32:04'+time_offset*3600;
   aPrice[948] = 1.0162;

   // ========== 949 ===== 366 ==========
   aPseudoTicket[949] = 476;
   aAction[949] = 1; // OPEN
   aReturn[476] = 949;
   aType[949] = OP_SELL; // SELL
   aTicket[949] = -1; // Ticket given by broker
   aSymbol[949] = "USDCAD";
   aLots[949] = 1.0;
   aDate[949] = D'2011.12.05 06:02:33'+time_offset*3600;
   aPrice[949] = 1.01819;

   // ========== 950 ===== 366 ==========
   aPseudoTicket[950] = 476;
   aAction[950] = 0; // CLOSE
   aType[950] = OP_SELL; // SELL
   aTicket[950] = -1; // Ticket given by broker
   aSymbol[950] = "USDCAD";
   aLots[950] = 1.0;
   aDate[950] = D'2011.12.05 07:10:20'+time_offset*3600;
   aPrice[950] = 1.01715;

   // ========== 951 ===== 357 ==========
   aPseudoTicket[951] = 477;
   aAction[951] = 1; // OPEN
   aReturn[477] = 951;
   aType[951] = OP_SELL; // SELL
   aTicket[951] = -1; // Ticket given by broker
   aSymbol[951] = "USDCHF";
   aLots[951] = 1.0;
   aDate[951] = D'2011.12.05 07:40:57'+time_offset*3600;
   aPrice[951] = 0.92031;

   // ========== 952 ===== 356 ==========
   aPseudoTicket[952] = 478;
   aAction[952] = 1; // OPEN
   aReturn[478] = 952;
   aType[952] = OP_SELL; // SELL
   aTicket[952] = -1; // Ticket given by broker
   aSymbol[952] = "USDCHF";
   aLots[952] = 1.0;
   aDate[952] = D'2011.12.05 07:41:35'+time_offset*3600;
   aPrice[952] = 0.92039;

   // ========== 953 ===== 365 ==========
   aPseudoTicket[953] = 475;
   aAction[953] = 0; // CLOSE
   aType[953] = OP_SELL; // SELL
   aTicket[953] = -1; // Ticket given by broker
   aSymbol[953] = "USDCAD";
   aLots[953] = 1.0;
   aDate[953] = D'2011.12.05 07:51:44'+time_offset*3600;
   aPrice[953] = 1.0165;

   // ========== 954 ===== 364 ==========
   aPseudoTicket[954] = 479;
   aAction[954] = 1; // OPEN
   aReturn[479] = 954;
   aType[954] = OP_SELL; // SELL
   aTicket[954] = -1; // Ticket given by broker
   aSymbol[954] = "USDCHF";
   aLots[954] = 1.0;
   aDate[954] = D'2011.12.06 06:34:12'+time_offset*3600;
   aPrice[954] = 0.9225;

   // ========== 955 ===== 364 ==========
   aPseudoTicket[955] = 479;
   aAction[955] = 0; // CLOSE
   aType[955] = OP_SELL; // SELL
   aTicket[955] = -1; // Ticket given by broker
   aSymbol[955] = "USDCHF";
   aLots[955] = 1.0;
   aDate[955] = D'2011.12.06 07:00:46'+time_offset*3600;
   aPrice[955] = 0.92336;

   // ========== 956 ===== 362 ==========
   aPseudoTicket[956] = 480;
   aAction[956] = 1; // OPEN
   aReturn[480] = 956;
   aType[956] = OP_SELL; // SELL
   aTicket[956] = -1; // Ticket given by broker
   aSymbol[956] = "EURUSD";
   aLots[956] = 1.0;
   aDate[956] = D'2011.12.06 07:14:26'+time_offset*3600;
   aPrice[956] = 1.3354;

   // ========== 957 ===== 363 ==========
   aPseudoTicket[957] = 481;
   aAction[957] = 1; // OPEN
   aReturn[481] = 957;
   aType[957] = OP_SELL; // SELL
   aTicket[957] = -1; // Ticket given by broker
   aSymbol[957] = "EURUSD";
   aLots[957] = 1.0;
   aDate[957] = D'2011.12.06 07:15:03'+time_offset*3600;
   aPrice[957] = 1.33581;

   // ========== 958 ===== 363 ==========
   aPseudoTicket[958] = 481;
   aAction[958] = 0; // CLOSE
   aType[958] = OP_SELL; // SELL
   aTicket[958] = -1; // Ticket given by broker
   aSymbol[958] = "EURUSD";
   aLots[958] = 1.0;
   aDate[958] = D'2011.12.06 07:24:29'+time_offset*3600;
   aPrice[958] = 1.33534;

   // ========== 959 ===== 362 ==========
   aPseudoTicket[959] = 480;
   aAction[959] = 0; // CLOSE
   aType[959] = OP_SELL; // SELL
   aTicket[959] = -1; // Ticket given by broker
   aSymbol[959] = "EURUSD";
   aLots[959] = 1.0;
   aDate[959] = D'2011.12.06 07:24:34'+time_offset*3600;
   aPrice[959] = 1.33527;

   // ========== 960 ===== 360 ==========
   aPseudoTicket[960] = 482;
   aAction[960] = 1; // OPEN
   aReturn[482] = 960;
   aType[960] = OP_SELL; // SELL
   aTicket[960] = -1; // Ticket given by broker
   aSymbol[960] = "EURUSD";
   aLots[960] = 1.0;
   aDate[960] = D'2011.12.06 07:34:11'+time_offset*3600;
   aPrice[960] = 1.3342;

   // ========== 961 ===== 361 ==========
   aPseudoTicket[961] = 483;
   aAction[961] = 1; // OPEN
   aReturn[483] = 961;
   aType[961] = OP_SELL; // SELL
   aTicket[961] = -1; // Ticket given by broker
   aSymbol[961] = "EURUSD";
   aLots[961] = 1.0;
   aDate[961] = D'2011.12.06 07:40:41'+time_offset*3600;
   aPrice[961] = 1.33471;

   // ========== 962 ===== 361 ==========
   aPseudoTicket[962] = 483;
   aAction[962] = 0; // CLOSE
   aType[962] = OP_SELL; // SELL
   aTicket[962] = -1; // Ticket given by broker
   aSymbol[962] = "EURUSD";
   aLots[962] = 1.0;
   aDate[962] = D'2011.12.06 08:09:53'+time_offset*3600;
   aPrice[962] = 1.33426;

   // ========== 963 ===== 359 ==========
   aPseudoTicket[963] = 484;
   aAction[963] = 1; // OPEN
   aReturn[484] = 963;
   aType[963] = OP_SELL; // SELL
   aTicket[963] = -1; // Ticket given by broker
   aSymbol[963] = "USDCHF";
   aLots[963] = 1.0;
   aDate[963] = D'2011.12.06 08:17:12'+time_offset*3600;
   aPrice[963] = 0.92878;

   // ========== 964 ===== 360 ==========
   aPseudoTicket[964] = 482;
   aAction[964] = 0; // CLOSE
   aType[964] = OP_SELL; // SELL
   aTicket[964] = -1; // Ticket given by broker
   aSymbol[964] = "EURUSD";
   aLots[964] = 1.0;
   aDate[964] = D'2011.12.06 08:19:40'+time_offset*3600;
   aPrice[964] = 1.33549;

   // ========== 965 ===== 358 ==========
   aPseudoTicket[965] = 485;
   aAction[965] = 1; // OPEN
   aReturn[485] = 965;
   aType[965] = OP_SELL; // SELL
   aTicket[965] = -1; // Ticket given by broker
   aSymbol[965] = "USDCHF";
   aLots[965] = 1.0;
   aDate[965] = D'2011.12.06 09:19:24'+time_offset*3600;
   aPrice[965] = 0.92695;

   // ========== 966 ===== 359 ==========
   aPseudoTicket[966] = 484;
   aAction[966] = 0; // CLOSE
   aType[966] = OP_SELL; // SELL
   aTicket[966] = -1; // Ticket given by broker
   aSymbol[966] = "USDCHF";
   aLots[966] = 1.0;
   aDate[966] = D'2011.12.06 13:54:48'+time_offset*3600;
   aPrice[966] = 0.92686;

   // ========== 967 ===== 358 ==========
   aPseudoTicket[967] = 485;
   aAction[967] = 0; // CLOSE
   aType[967] = OP_SELL; // SELL
   aTicket[967] = -1; // Ticket given by broker
   aSymbol[967] = "USDCHF";
   aLots[967] = 1.0;
   aDate[967] = D'2011.12.06 14:04:27'+time_offset*3600;
   aPrice[967] = 0.9281;

   // ========== 968 ===== 357 ==========
   aPseudoTicket[968] = 477;
   aAction[968] = 0; // CLOSE
   aType[968] = OP_SELL; // SELL
   aTicket[968] = -1; // Ticket given by broker
   aSymbol[968] = "USDCHF";
   aLots[968] = 1.0;
   aDate[968] = D'2011.12.06 14:04:31'+time_offset*3600;
   aPrice[968] = 0.9282;

   // ========== 969 ===== 356 ==========
   aPseudoTicket[969] = 478;
   aAction[969] = 0; // CLOSE
   aType[969] = OP_SELL; // SELL
   aTicket[969] = -1; // Ticket given by broker
   aSymbol[969] = "USDCHF";
   aLots[969] = 1.0;
   aDate[969] = D'2011.12.06 14:04:35'+time_offset*3600;
   aPrice[969] = 0.92821;

   // ========== 970 ===== 355 ==========
   aPseudoTicket[970] = 486;
   aAction[970] = 1; // OPEN
   aReturn[486] = 970;
   aType[970] = OP_SELL; // SELL
   aTicket[970] = -1; // Ticket given by broker
   aSymbol[970] = "USDCAD";
   aLots[970] = 1.0;
   aDate[970] = D'2011.12.06 14:33:43'+time_offset*3600;
   aPrice[970] = 1.01266;

   // ========== 971 ===== 355 ==========
   aPseudoTicket[971] = 486;
   aAction[971] = 0; // CLOSE
   aType[971] = OP_SELL; // SELL
   aTicket[971] = -1; // Ticket given by broker
   aSymbol[971] = "USDCAD";
   aLots[971] = 1.0;
   aDate[971] = D'2011.12.06 16:15:20'+time_offset*3600;
   aPrice[971] = 1.01241;

   // ========== 972 ===== 354 ==========
   aPseudoTicket[972] = 487;
   aAction[972] = 1; // OPEN
   aReturn[487] = 972;
   aType[972] = OP_BUY; // BUY
   aTicket[972] = -1; // Ticket given by broker
   aSymbol[972] = "GBPUSD";
   aLots[972] = 1.0;
   aDate[972] = D'2011.12.08 09:48:27'+time_offset*3600;
   aPrice[972] = 1.57386;

   // ========== 973 ===== 354 ==========
   aPseudoTicket[973] = 487;
   aAction[973] = 0; // CLOSE
   aType[973] = OP_BUY; // BUY
   aTicket[973] = -1; // Ticket given by broker
   aSymbol[973] = "GBPUSD";
   aLots[973] = 1.0;
   aDate[973] = D'2011.12.08 10:19:41'+time_offset*3600;
   aPrice[973] = 1.57182;

   // ========== 974 ===== 350 ==========
   aPseudoTicket[974] = 488;
   aAction[974] = 1; // OPEN
   aReturn[488] = 974;
   aType[974] = OP_BUY; // BUY
   aTicket[974] = -1; // Ticket given by broker
   aSymbol[974] = "EURUSD";
   aLots[974] = 1.0;
   aDate[974] = D'2011.12.08 12:59:21'+time_offset*3600;
   aPrice[974] = 1.34195;

   // ========== 975 ===== 353 ==========
   aPseudoTicket[975] = 489;
   aAction[975] = 1; // OPEN
   aReturn[489] = 975;
   aType[975] = OP_SELL; // SELL
   aTicket[975] = -1; // Ticket given by broker
   aSymbol[975] = "USDCHF";
   aLots[975] = 1.0;
   aDate[975] = D'2011.12.08 13:36:45'+time_offset*3600;
   aPrice[975] = 0.91775;

   // ========== 976 ===== 352 ==========
   aPseudoTicket[976] = 490;
   aAction[976] = 1; // OPEN
   aReturn[490] = 976;
   aType[976] = OP_SELL; // SELL
   aTicket[976] = -1; // Ticket given by broker
   aSymbol[976] = "USDCHF";
   aLots[976] = 1.0;
   aDate[976] = D'2011.12.08 13:38:42'+time_offset*3600;
   aPrice[976] = 0.9184;

   // ========== 977 ===== 351 ==========
   aPseudoTicket[977] = 491;
   aAction[977] = 1; // OPEN
   aReturn[491] = 977;
   aType[977] = OP_SELL; // SELL
   aTicket[977] = -1; // Ticket given by broker
   aSymbol[977] = "USDCHF";
   aLots[977] = 1.0;
   aDate[977] = D'2011.12.08 13:43:02'+time_offset*3600;
   aPrice[977] = 0.919;

   // ========== 978 ===== 353 ==========
   aPseudoTicket[978] = 489;
   aAction[978] = 0; // CLOSE
   aType[978] = OP_SELL; // SELL
   aTicket[978] = -1; // Ticket given by broker
   aSymbol[978] = "USDCHF";
   aLots[978] = 1.0;
   aDate[978] = D'2011.12.08 13:58:00'+time_offset*3600;
   aPrice[978] = 0.922;

   // ========== 979 ===== 351 ==========
   aPseudoTicket[979] = 491;
   aAction[979] = 0; // CLOSE
   aType[979] = OP_SELL; // SELL
   aTicket[979] = -1; // Ticket given by broker
   aSymbol[979] = "USDCHF";
   aLots[979] = 1.0;
   aDate[979] = D'2011.12.08 13:58:00'+time_offset*3600;
   aPrice[979] = 0.922;

   // ========== 980 ===== 352 ==========
   aPseudoTicket[980] = 490;
   aAction[980] = 0; // CLOSE
   aType[980] = OP_SELL; // SELL
   aTicket[980] = -1; // Ticket given by broker
   aSymbol[980] = "USDCHF";
   aLots[980] = 1.0;
   aDate[980] = D'2011.12.08 13:58:00'+time_offset*3600;
   aPrice[980] = 0.922;

   // ========== 981 ===== 350 ==========
   aPseudoTicket[981] = 488;
   aAction[981] = 0; // CLOSE
   aType[981] = OP_BUY; // BUY
   aTicket[981] = -1; // Ticket given by broker
   aSymbol[981] = "EURUSD";
   aLots[981] = 1.0;
   aDate[981] = D'2011.12.08 13:58:08'+time_offset*3600;
   aPrice[981] = 1.338;

   // ========== 982 ===== 347 ==========
   aPseudoTicket[982] = 492;
   aAction[982] = 1; // OPEN
   aReturn[492] = 982;
   aType[982] = OP_SELL; // SELL
   aTicket[982] = -1; // Ticket given by broker
   aSymbol[982] = "AUDUSD";
   aLots[982] = 1.0;
   aDate[982] = D'2011.12.09 11:01:37'+time_offset*3600;
   aPrice[982] = 1.01416;

   // ========== 983 ===== 348 ==========
   aPseudoTicket[983] = 493;
   aAction[983] = 1; // OPEN
   aReturn[493] = 983;
   aType[983] = OP_SELL; // SELL
   aTicket[983] = -1; // Ticket given by broker
   aSymbol[983] = "AUDUSD";
   aLots[983] = 1.0;
   aDate[983] = D'2011.12.09 11:02:27'+time_offset*3600;
   aPrice[983] = 1.0145;

   // ========== 984 ===== 346 ==========
   aPseudoTicket[984] = 494;
   aAction[984] = 1; // OPEN
   aReturn[494] = 984;
   aType[984] = OP_SELL; // SELL
   aTicket[984] = -1; // Ticket given by broker
   aSymbol[984] = "AUDUSD";
   aLots[984] = 1.0;
   aDate[984] = D'2011.12.09 11:04:41'+time_offset*3600;
   aPrice[984] = 1.01483;

   // ========== 985 ===== 349 ==========
   aPseudoTicket[985] = 495;
   aAction[985] = 1; // OPEN
   aReturn[495] = 985;
   aType[985] = OP_SELL; // SELL
   aTicket[985] = -1; // Ticket given by broker
   aSymbol[985] = "AUDUSD";
   aLots[985] = 1.0;
   aDate[985] = D'2011.12.09 11:05:08'+time_offset*3600;
   aPrice[985] = 1.01492;

   // ========== 986 ===== 349 ==========
   aPseudoTicket[986] = 495;
   aAction[986] = 0; // CLOSE
   aType[986] = OP_SELL; // SELL
   aTicket[986] = -1; // Ticket given by broker
   aSymbol[986] = "AUDUSD";
   aLots[986] = 1.0;
   aDate[986] = D'2011.12.09 13:46:41'+time_offset*3600;
   aPrice[986] = 1.01398;

   // ========== 987 ===== 348 ==========
   aPseudoTicket[987] = 493;
   aAction[987] = 0; // CLOSE
   aType[987] = OP_SELL; // SELL
   aTicket[987] = -1; // Ticket given by broker
   aSymbol[987] = "AUDUSD";
   aLots[987] = 1.0;
   aDate[987] = D'2011.12.09 13:46:46'+time_offset*3600;
   aPrice[987] = 1.014;

   // ========== 988 ===== 347 ==========
   aPseudoTicket[988] = 492;
   aAction[988] = 0; // CLOSE
   aType[988] = OP_SELL; // SELL
   aTicket[988] = -1; // Ticket given by broker
   aSymbol[988] = "AUDUSD";
   aLots[988] = 1.0;
   aDate[988] = D'2011.12.09 13:50:14'+time_offset*3600;
   aPrice[988] = 1.01393;

   // ========== 989 ===== 346 ==========
   aPseudoTicket[989] = 494;
   aAction[989] = 0; // CLOSE
   aType[989] = OP_SELL; // SELL
   aTicket[989] = -1; // Ticket given by broker
   aSymbol[989] = "AUDUSD";
   aLots[989] = 1.0;
   aDate[989] = D'2011.12.09 13:50:21'+time_offset*3600;
   aPrice[989] = 1.0137;

   // ========== 990 ===== 345 ==========
   aPseudoTicket[990] = 496;
   aAction[990] = 1; // OPEN
   aReturn[496] = 990;
   aType[990] = OP_SELL; // SELL
   aTicket[990] = -1; // Ticket given by broker
   aSymbol[990] = "AUDUSD";
   aLots[990] = 1.0;
   aDate[990] = D'2011.12.09 17:22:07'+time_offset*3600;
   aPrice[990] = 1.01921;

   // ========== 991 ===== 344 ==========
   aPseudoTicket[991] = 497;
   aAction[991] = 1; // OPEN
   aReturn[497] = 991;
   aType[991] = OP_SELL; // SELL
   aTicket[991] = -1; // Ticket given by broker
   aSymbol[991] = "AUDUSD";
   aLots[991] = 1.0;
   aDate[991] = D'2011.12.09 17:23:55'+time_offset*3600;
   aPrice[991] = 1.01928;

   // ========== 992 ===== 343 ==========
   aPseudoTicket[992] = 498;
   aAction[992] = 1; // OPEN
   aReturn[498] = 992;
   aType[992] = OP_SELL; // SELL
   aTicket[992] = -1; // Ticket given by broker
   aSymbol[992] = "AUDUSD";
   aLots[992] = 1.0;
   aDate[992] = D'2011.12.09 17:25:24'+time_offset*3600;
   aPrice[992] = 1.01914;

   // ========== 993 ===== 342 ==========
   aPseudoTicket[993] = 499;
   aAction[993] = 1; // OPEN
   aReturn[499] = 993;
   aType[993] = OP_SELL; // SELL
   aTicket[993] = -1; // Ticket given by broker
   aSymbol[993] = "AUDUSD";
   aLots[993] = 1.0;
   aDate[993] = D'2011.12.09 17:45:23'+time_offset*3600;
   aPrice[993] = 1.01974;

   // ========== 994 ===== 345 ==========
   aPseudoTicket[994] = 496;
   aAction[994] = 0; // CLOSE
   aType[994] = OP_SELL; // SELL
   aTicket[994] = -1; // Ticket given by broker
   aSymbol[994] = "AUDUSD";
   aLots[994] = 1.0;
   aDate[994] = D'2011.12.12 03:34:24'+time_offset*3600;
   aPrice[994] = 1.01705;

   // ========== 995 ===== 344 ==========
   aPseudoTicket[995] = 497;
   aAction[995] = 0; // CLOSE
   aType[995] = OP_SELL; // SELL
   aTicket[995] = -1; // Ticket given by broker
   aSymbol[995] = "AUDUSD";
   aLots[995] = 1.0;
   aDate[995] = D'2011.12.12 05:09:48'+time_offset*3600;
   aPrice[995] = 1.01717;

   // ========== 996 ===== 343 ==========
   aPseudoTicket[996] = 498;
   aAction[996] = 0; // CLOSE
   aType[996] = OP_SELL; // SELL
   aTicket[996] = -1; // Ticket given by broker
   aSymbol[996] = "AUDUSD";
   aLots[996] = 1.0;
   aDate[996] = D'2011.12.12 05:09:56'+time_offset*3600;
   aPrice[996] = 1.01709;

   // ========== 997 ===== 342 ==========
   aPseudoTicket[997] = 499;
   aAction[997] = 0; // CLOSE
   aType[997] = OP_SELL; // SELL
   aTicket[997] = -1; // Ticket given by broker
   aSymbol[997] = "AUDUSD";
   aLots[997] = 1.0;
   aDate[997] = D'2011.12.12 05:10:14'+time_offset*3600;
   aPrice[997] = 1.01708;

   // ========== 998 ===== 340 ==========
   aPseudoTicket[998] = 500;
   aAction[998] = 1; // OPEN
   aReturn[500] = 998;
   aType[998] = OP_SELL; // SELL
   aTicket[998] = -1; // Ticket given by broker
   aSymbol[998] = "AUDUSD";
   aLots[998] = 1.0;
   aDate[998] = D'2011.12.13 08:53:42'+time_offset*3600;
   aPrice[998] = 1.00907;

   // ========== 999 ===== 337 ==========
   aPseudoTicket[999] = 501;
   aAction[999] = 1; // OPEN
   aReturn[501] = 999;
   aType[999] = OP_SELL; // SELL
   aTicket[999] = -1; // Ticket given by broker
   aSymbol[999] = "AUDUSD";
   aLots[999] = 1.0;
   aDate[999] = D'2011.12.13 08:56:23'+time_offset*3600;
   aPrice[999] = 1.0083;

   // ========== 1000 ===== 341 ==========
   aPseudoTicket[1000] = 502;
   aAction[1000] = 1; // OPEN
   aReturn[502] = 1000;
   aType[1000] = OP_SELL; // SELL
   aTicket[1000] = -1; // Ticket given by broker
   aSymbol[1000] = "AUDUSD";
   aLots[1000] = 1.0;
   aDate[1000] = D'2011.12.13 09:00:17'+time_offset*3600;
   aPrice[1000] = 1.0091;

   // ========== 1001 ===== 341 ==========
   aPseudoTicket[1001] = 502;
   aAction[1001] = 0; // CLOSE
   aType[1001] = OP_SELL; // SELL
   aTicket[1001] = -1; // Ticket given by broker
   aSymbol[1001] = "AUDUSD";
   aLots[1001] = 1.0;
   aDate[1001] = D'2011.12.13 09:51:24'+time_offset*3600;
   aPrice[1001] = 1.0112;

   // ========== 1002 ===== 340 ==========
   aPseudoTicket[1002] = 500;
   aAction[1002] = 0; // CLOSE
   aType[1002] = OP_SELL; // SELL
   aTicket[1002] = -1; // Ticket given by broker
   aSymbol[1002] = "AUDUSD";
   aLots[1002] = 1.0;
   aDate[1002] = D'2011.12.13 09:51:28'+time_offset*3600;
   aPrice[1002] = 1.0112;

   // ========== 1003 ===== 338 ==========
   aPseudoTicket[1003] = 503;
   aAction[1003] = 1; // OPEN
   aReturn[503] = 1003;
   aType[1003] = OP_SELL; // SELL
   aTicket[1003] = -1; // Ticket given by broker
   aSymbol[1003] = "AUDUSD";
   aLots[1003] = 1.0;
   aDate[1003] = D'2011.12.13 11:09:57'+time_offset*3600;
   aPrice[1003] = 1.01276;

   // ========== 1004 ===== 339 ==========
   aPseudoTicket[1004] = 504;
   aAction[1004] = 1; // OPEN
   aReturn[504] = 1004;
   aType[1004] = OP_SELL; // SELL
   aTicket[1004] = -1; // Ticket given by broker
   aSymbol[1004] = "AUDUSD";
   aLots[1004] = 1.0;
   aDate[1004] = D'2011.12.13 11:17:28'+time_offset*3600;
   aPrice[1004] = 1.01305;

   // ========== 1005 ===== 339 ==========
   aPseudoTicket[1005] = 504;
   aAction[1005] = 0; // CLOSE
   aType[1005] = OP_SELL; // SELL
   aTicket[1005] = -1; // Ticket given by broker
   aSymbol[1005] = "AUDUSD";
   aLots[1005] = 1.0;
   aDate[1005] = D'2011.12.13 14:06:31'+time_offset*3600;
   aPrice[1005] = 1.01249;

   // ========== 1006 ===== 338 ==========
   aPseudoTicket[1006] = 503;
   aAction[1006] = 0; // CLOSE
   aType[1006] = OP_SELL; // SELL
   aTicket[1006] = -1; // Ticket given by broker
   aSymbol[1006] = "AUDUSD";
   aLots[1006] = 1.0;
   aDate[1006] = D'2011.12.13 14:34:48'+time_offset*3600;
   aPrice[1006] = 1.01254;

   // ========== 1007 ===== 337 ==========
   aPseudoTicket[1007] = 501;
   aAction[1007] = 0; // CLOSE
   aType[1007] = OP_SELL; // SELL
   aTicket[1007] = -1; // Ticket given by broker
   aSymbol[1007] = "AUDUSD";
   aLots[1007] = 1.0;
   aDate[1007] = D'2011.12.13 14:45:41'+time_offset*3600;
   aPrice[1007] = 1.01513;

   // ========== 1008 ===== 336 ==========
   aPseudoTicket[1008] = 505;
   aAction[1008] = 1; // OPEN
   aReturn[505] = 1008;
   aType[1008] = OP_BUY; // BUY
   aTicket[1008] = -1; // Ticket given by broker
   aSymbol[1008] = "EURUSD";
   aLots[1008] = 1.0;
   aDate[1008] = D'2011.12.14 12:15:11'+time_offset*3600;
   aPrice[1008] = 1.30042;

   // ========== 1009 ===== 334 ==========
   aPseudoTicket[1009] = 506;
   aAction[1009] = 1; // OPEN
   aReturn[506] = 1009;
   aType[1009] = OP_SELL; // SELL
   aTicket[1009] = -1; // Ticket given by broker
   aSymbol[1009] = "USDCHF";
   aLots[1009] = 1.0;
   aDate[1009] = D'2011.12.14 12:52:18'+time_offset*3600;
   aPrice[1009] = 0.94854;

   // ========== 1010 ===== 335 ==========
   aPseudoTicket[1010] = 507;
   aAction[1010] = 1; // OPEN
   aReturn[507] = 1010;
   aType[1010] = OP_SELL; // SELL
   aTicket[1010] = -1; // Ticket given by broker
   aSymbol[1010] = "USDCHF";
   aLots[1010] = 1.0;
   aDate[1010] = D'2011.12.14 14:01:10'+time_offset*3600;
   aPrice[1010] = 0.94797;

   // ========== 1011 ===== 336 ==========
   aPseudoTicket[1011] = 505;
   aAction[1011] = 0; // CLOSE
   aType[1011] = OP_BUY; // BUY
   aTicket[1011] = -1; // Ticket given by broker
   aSymbol[1011] = "EURUSD";
   aLots[1011] = 1.0;
   aDate[1011] = D'2011.12.15 06:48:12'+time_offset*3600;
   aPrice[1011] = 1.29885;

   // ========== 1012 ===== 335 ==========
   aPseudoTicket[1012] = 507;
   aAction[1012] = 0; // CLOSE
   aType[1012] = OP_SELL; // SELL
   aTicket[1012] = -1; // Ticket given by broker
   aSymbol[1012] = "USDCHF";
   aLots[1012] = 1.0;
   aDate[1012] = D'2011.12.15 07:49:51'+time_offset*3600;
   aPrice[1012] = 0.948;

   // ========== 1013 ===== 334 ==========
   aPseudoTicket[1013] = 506;
   aAction[1013] = 0; // CLOSE
   aType[1013] = OP_SELL; // SELL
   aTicket[1013] = -1; // Ticket given by broker
   aSymbol[1013] = "USDCHF";
   aLots[1013] = 1.0;
   aDate[1013] = D'2011.12.15 07:49:51'+time_offset*3600;
   aPrice[1013] = 0.948;

   // ========== 1014 ===== 329 ==========
   aPseudoTicket[1014] = 508;
   aAction[1014] = 1; // OPEN
   aReturn[508] = 1014;
   aType[1014] = OP_BUY; // BUY
   aTicket[1014] = -1; // Ticket given by broker
   aSymbol[1014] = "USDCHF";
   aLots[1014] = 1.0;
   aDate[1014] = D'2011.12.15 08:30:22'+time_offset*3600;
   aPrice[1014] = 0.94199;

   // ========== 1015 ===== 330 ==========
   aPseudoTicket[1015] = 509;
   aAction[1015] = 1; // OPEN
   aReturn[509] = 1015;
   aType[1015] = OP_BUY; // BUY
   aTicket[1015] = -1; // Ticket given by broker
   aSymbol[1015] = "USDCHF";
   aLots[1015] = 1.0;
   aDate[1015] = D'2011.12.15 08:41:07'+time_offset*3600;
   aPrice[1015] = 0.94173;

   // ========== 1016 ===== 331 ==========
   aPseudoTicket[1016] = 510;
   aAction[1016] = 1; // OPEN
   aReturn[510] = 1016;
   aType[1016] = OP_BUY; // BUY
   aTicket[1016] = -1; // Ticket given by broker
   aSymbol[1016] = "USDCHF";
   aLots[1016] = 1.0;
   aDate[1016] = D'2011.12.15 08:42:16'+time_offset*3600;
   aPrice[1016] = 0.9421;

   // ========== 1017 ===== 333 ==========
   aPseudoTicket[1017] = 511;
   aAction[1017] = 1; // OPEN
   aReturn[511] = 1017;
   aType[1017] = OP_SELL; // SELL
   aTicket[1017] = -1; // Ticket given by broker
   aSymbol[1017] = "GBPUSD";
   aLots[1017] = 1.0;
   aDate[1017] = D'2011.12.15 12:03:57'+time_offset*3600;
   aPrice[1017] = 1.55098;

   // ========== 1018 ===== 333 ==========
   aPseudoTicket[1018] = 511;
   aAction[1018] = 0; // CLOSE
   aType[1018] = OP_SELL; // SELL
   aTicket[1018] = -1; // Ticket given by broker
   aSymbol[1018] = "GBPUSD";
   aLots[1018] = 1.0;
   aDate[1018] = D'2011.12.15 16:01:37'+time_offset*3600;
   aPrice[1018] = 1.54879;

   // ========== 1019 ===== 332 ==========
   aPseudoTicket[1019] = 512;
   aAction[1019] = 1; // OPEN
   aReturn[512] = 1019;
   aType[1019] = OP_BUY; // BUY
   aTicket[1019] = -1; // Ticket given by broker
   aSymbol[1019] = "USDCHF";
   aLots[1019] = 1.0;
   aDate[1019] = D'2011.12.16 13:26:41'+time_offset*3600;
   aPrice[1019] = 0.93622;

   // ========== 1020 ===== 332 ==========
   aPseudoTicket[1020] = 512;
   aAction[1020] = 0; // CLOSE
   aType[1020] = OP_BUY; // BUY
   aTicket[1020] = -1; // Ticket given by broker
   aSymbol[1020] = "USDCHF";
   aLots[1020] = 1.0;
   aDate[1020] = D'2011.12.20 09:52:39'+time_offset*3600;
   aPrice[1020] = 0.93258;

   // ========== 1021 ===== 331 ==========
   aPseudoTicket[1021] = 510;
   aAction[1021] = 0; // CLOSE
   aType[1021] = OP_BUY; // BUY
   aTicket[1021] = -1; // Ticket given by broker
   aSymbol[1021] = "USDCHF";
   aLots[1021] = 1.0;
   aDate[1021] = D'2011.12.20 09:52:44'+time_offset*3600;
   aPrice[1021] = 0.93218;

   // ========== 1022 ===== 330 ==========
   aPseudoTicket[1022] = 509;
   aAction[1022] = 0; // CLOSE
   aType[1022] = OP_BUY; // BUY
   aTicket[1022] = -1; // Ticket given by broker
   aSymbol[1022] = "USDCHF";
   aLots[1022] = 1.0;
   aDate[1022] = D'2011.12.20 09:52:48'+time_offset*3600;
   aPrice[1022] = 0.93223;

   // ========== 1023 ===== 329 ==========
   aPseudoTicket[1023] = 508;
   aAction[1023] = 0; // CLOSE
   aType[1023] = OP_BUY; // BUY
   aTicket[1023] = -1; // Ticket given by broker
   aSymbol[1023] = "USDCHF";
   aLots[1023] = 1.0;
   aDate[1023] = D'2011.12.20 09:52:51'+time_offset*3600;
   aPrice[1023] = 0.93218;

   // ========== 1024 ===== 328 ==========
   aPseudoTicket[1024] = 513;
   aAction[1024] = 1; // OPEN
   aReturn[513] = 1024;
   aType[1024] = OP_SELL; // SELL
   aTicket[1024] = -1; // Ticket given by broker
   aSymbol[1024] = "AUDUSD";
   aLots[1024] = 1.0;
   aDate[1024] = D'2011.12.21 07:12:50'+time_offset*3600;
   aPrice[1024] = 1.0176;

   // ========== 1025 ===== 325 ==========
   aPseudoTicket[1025] = 514;
   aAction[1025] = 1; // OPEN
   aReturn[514] = 1025;
   aType[1025] = OP_SELL; // SELL
   aTicket[1025] = -1; // Ticket given by broker
   aSymbol[1025] = "AUDUSD";
   aLots[1025] = 1.0;
   aDate[1025] = D'2011.12.21 07:16:09'+time_offset*3600;
   aPrice[1025] = 1.01765;

   // ========== 1026 ===== 327 ==========
   aPseudoTicket[1026] = 515;
   aAction[1026] = 1; // OPEN
   aReturn[515] = 1026;
   aType[1026] = OP_SELL; // SELL
   aTicket[1026] = -1; // Ticket given by broker
   aSymbol[1026] = "AUDUSD";
   aLots[1026] = 1.0;
   aDate[1026] = D'2011.12.21 07:18:17'+time_offset*3600;
   aPrice[1026] = 1.01807;

   // ========== 1027 ===== 326 ==========
   aPseudoTicket[1027] = 516;
   aAction[1027] = 1; // OPEN
   aReturn[516] = 1027;
   aType[1027] = OP_SELL; // SELL
   aTicket[1027] = -1; // Ticket given by broker
   aSymbol[1027] = "AUDUSD";
   aLots[1027] = 1.0;
   aDate[1027] = D'2011.12.21 07:36:08'+time_offset*3600;
   aPrice[1027] = 1.01806;

   // ========== 1028 ===== 326 ==========
   aPseudoTicket[1028] = 516;
   aAction[1028] = 0; // CLOSE
   aType[1028] = OP_SELL; // SELL
   aTicket[1028] = -1; // Ticket given by broker
   aSymbol[1028] = "AUDUSD";
   aLots[1028] = 1.0;
   aDate[1028] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPrice[1028] = 1.0135;

   // ========== 1029 ===== 328 ==========
   aPseudoTicket[1029] = 513;
   aAction[1029] = 0; // CLOSE
   aType[1029] = OP_SELL; // SELL
   aTicket[1029] = -1; // Ticket given by broker
   aSymbol[1029] = "AUDUSD";
   aLots[1029] = 1.0;
   aDate[1029] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPrice[1029] = 1.0135;

   // ========== 1030 ===== 325 ==========
   aPseudoTicket[1030] = 514;
   aAction[1030] = 0; // CLOSE
   aType[1030] = OP_SELL; // SELL
   aTicket[1030] = -1; // Ticket given by broker
   aSymbol[1030] = "AUDUSD";
   aLots[1030] = 1.0;
   aDate[1030] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPrice[1030] = 1.0135;

   // ========== 1031 ===== 327 ==========
   aPseudoTicket[1031] = 515;
   aAction[1031] = 0; // CLOSE
   aType[1031] = OP_SELL; // SELL
   aTicket[1031] = -1; // Ticket given by broker
   aSymbol[1031] = "AUDUSD";
   aLots[1031] = 1.0;
   aDate[1031] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPrice[1031] = 1.0135;

   // ========== 1032 ===== 324 ==========
   aPseudoTicket[1032] = 517;
   aAction[1032] = 1; // OPEN
   aReturn[517] = 1032;
   aType[1032] = OP_BUY; // BUY
   aTicket[1032] = -1; // Ticket given by broker
   aSymbol[1032] = "AUDUSD";
   aLots[1032] = 1.0;
   aDate[1032] = D'2011.12.21 12:25:48'+time_offset*3600;
   aPrice[1032] = 1.01203;

   // ========== 1033 ===== 321 ==========
   aPseudoTicket[1033] = 518;
   aAction[1033] = 1; // OPEN
   aReturn[518] = 1033;
   aType[1033] = OP_BUY; // BUY
   aTicket[1033] = -1; // Ticket given by broker
   aSymbol[1033] = "AUDUSD";
   aLots[1033] = 1.0;
   aDate[1033] = D'2011.12.21 12:45:25'+time_offset*3600;
   aPrice[1033] = 1.01025;

   // ========== 1034 ===== 323 ==========
   aPseudoTicket[1034] = 519;
   aAction[1034] = 1; // OPEN
   aReturn[519] = 1034;
   aType[1034] = OP_BUY; // BUY
   aTicket[1034] = -1; // Ticket given by broker
   aSymbol[1034] = "AUDUSD";
   aLots[1034] = 1.0;
   aDate[1034] = D'2011.12.21 12:45:52'+time_offset*3600;
   aPrice[1034] = 1.0097;

   // ========== 1035 ===== 322 ==========
   aPseudoTicket[1035] = 520;
   aAction[1035] = 1; // OPEN
   aReturn[520] = 1035;
   aType[1035] = OP_BUY; // BUY
   aTicket[1035] = -1; // Ticket given by broker
   aSymbol[1035] = "AUDUSD";
   aLots[1035] = 1.0;
   aDate[1035] = D'2011.12.21 12:46:51'+time_offset*3600;
   aPrice[1035] = 1.00961;

   // ========== 1036 ===== 324 ==========
   aPseudoTicket[1036] = 517;
   aAction[1036] = 0; // CLOSE
   aType[1036] = OP_BUY; // BUY
   aTicket[1036] = -1; // Ticket given by broker
   aSymbol[1036] = "AUDUSD";
   aLots[1036] = 1.0;
   aDate[1036] = D'2011.12.22 08:10:27'+time_offset*3600;
   aPrice[1036] = 1.0125;

   // ========== 1037 ===== 323 ==========
   aPseudoTicket[1037] = 519;
   aAction[1037] = 0; // CLOSE
   aType[1037] = OP_BUY; // BUY
   aTicket[1037] = -1; // Ticket given by broker
   aSymbol[1037] = "AUDUSD";
   aLots[1037] = 1.0;
   aDate[1037] = D'2011.12.22 08:10:27'+time_offset*3600;
   aPrice[1037] = 1.0125;

   // ========== 1038 ===== 322 ==========
   aPseudoTicket[1038] = 520;
   aAction[1038] = 0; // CLOSE
   aType[1038] = OP_BUY; // BUY
   aTicket[1038] = -1; // Ticket given by broker
   aSymbol[1038] = "AUDUSD";
   aLots[1038] = 1.0;
   aDate[1038] = D'2011.12.22 08:21:32'+time_offset*3600;
   aPrice[1038] = 1.01313;

   // ========== 1039 ===== 321 ==========
   aPseudoTicket[1039] = 518;
   aAction[1039] = 0; // CLOSE
   aType[1039] = OP_BUY; // BUY
   aTicket[1039] = -1; // Ticket given by broker
   aSymbol[1039] = "AUDUSD";
   aLots[1039] = 1.0;
   aDate[1039] = D'2011.12.22 08:23:18'+time_offset*3600;
   aPrice[1039] = 1.01354;

   // ========== 1040 ===== 320 ==========
   aPseudoTicket[1040] = 521;
   aAction[1040] = 1; // OPEN
   aReturn[521] = 1040;
   aType[1040] = OP_SELL; // SELL
   aTicket[1040] = -1; // Ticket given by broker
   aSymbol[1040] = "EURUSD";
   aLots[1040] = 1.0;
   aDate[1040] = D'2011.12.23 13:15:33'+time_offset*3600;
   aPrice[1040] = 1.30568;

   // ========== 1041 ===== 320 ==========
   aPseudoTicket[1041] = 521;
   aAction[1041] = 0; // CLOSE
   aType[1041] = OP_SELL; // SELL
   aTicket[1041] = -1; // Ticket given by broker
   aSymbol[1041] = "EURUSD";
   aLots[1041] = 1.0;
   aDate[1041] = D'2011.12.23 14:11:34'+time_offset*3600;
   aPrice[1041] = 1.30483;

   // ========== 1042 ===== 316 ==========
   aPseudoTicket[1042] = 522;
   aAction[1042] = 1; // OPEN
   aReturn[522] = 1042;
   aType[1042] = OP_SELL; // SELL
   aTicket[1042] = -1; // Ticket given by broker
   aSymbol[1042] = "EURUSD";
   aLots[1042] = 1.0;
   aDate[1042] = D'2011.12.29 17:03:13'+time_offset*3600;
   aPrice[1042] = 1.2955;

   // ========== 1043 ===== 317 ==========
   aPseudoTicket[1043] = 523;
   aAction[1043] = 1; // OPEN
   aReturn[523] = 1043;
   aType[1043] = OP_SELL; // SELL
   aTicket[1043] = -1; // Ticket given by broker
   aSymbol[1043] = "EURUSD";
   aLots[1043] = 1.0;
   aDate[1043] = D'2011.12.29 17:03:43'+time_offset*3600;
   aPrice[1043] = 1.29541;

   // ========== 1044 ===== 318 ==========
   aPseudoTicket[1044] = 524;
   aAction[1044] = 1; // OPEN
   aReturn[524] = 1044;
   aType[1044] = OP_SELL; // SELL
   aTicket[1044] = -1; // Ticket given by broker
   aSymbol[1044] = "EURUSD";
   aLots[1044] = 1.0;
   aDate[1044] = D'2011.12.29 21:16:01'+time_offset*3600;
   aPrice[1044] = 1.29602;

   // ========== 1045 ===== 319 ==========
   aPseudoTicket[1045] = 525;
   aAction[1045] = 1; // OPEN
   aReturn[525] = 1045;
   aType[1045] = OP_SELL; // SELL
   aTicket[1045] = -1; // Ticket given by broker
   aSymbol[1045] = "EURUSD";
   aLots[1045] = 1.0;
   aDate[1045] = D'2011.12.29 22:10:50'+time_offset*3600;
   aPrice[1045] = 1.2959;

   // ========== 1046 ===== 319 ==========
   aPseudoTicket[1046] = 525;
   aAction[1046] = 0; // CLOSE
   aType[1046] = OP_SELL; // SELL
   aTicket[1046] = -1; // Ticket given by broker
   aSymbol[1046] = "EURUSD";
   aLots[1046] = 1.0;
   aDate[1046] = D'2011.12.29 23:15:17'+time_offset*3600;
   aPrice[1046] = 1.29543;

   // ========== 1047 ===== 318 ==========
   aPseudoTicket[1047] = 524;
   aAction[1047] = 0; // CLOSE
   aType[1047] = OP_SELL; // SELL
   aTicket[1047] = -1; // Ticket given by broker
   aSymbol[1047] = "EURUSD";
   aLots[1047] = 1.0;
   aDate[1047] = D'2011.12.29 23:15:20'+time_offset*3600;
   aPrice[1047] = 1.29543;

   // ========== 1048 ===== 314 ==========
   aPseudoTicket[1048] = 526;
   aAction[1048] = 1; // OPEN
   aReturn[526] = 1048;
   aType[1048] = OP_SELL; // SELL
   aTicket[1048] = -1; // Ticket given by broker
   aSymbol[1048] = "EURUSD";
   aLots[1048] = 1.0;
   aDate[1048] = D'2011.12.30 00:05:32'+time_offset*3600;
   aPrice[1048] = 1.29517;

   // ========== 1049 ===== 315 ==========
   aPseudoTicket[1049] = 527;
   aAction[1049] = 1; // OPEN
   aReturn[527] = 1049;
   aType[1049] = OP_SELL; // SELL
   aTicket[1049] = -1; // Ticket given by broker
   aSymbol[1049] = "EURUSD";
   aLots[1049] = 1.0;
   aDate[1049] = D'2011.12.30 00:50:58'+time_offset*3600;
   aPrice[1049] = 1.29537;

   // ========== 1050 ===== 317 ==========
   aPseudoTicket[1050] = 523;
   aAction[1050] = 0; // CLOSE
   aType[1050] = OP_SELL; // SELL
   aTicket[1050] = -1; // Ticket given by broker
   aSymbol[1050] = "EURUSD";
   aLots[1050] = 1.0;
   aDate[1050] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPrice[1050] = 1.2905;

   // ========== 1051 ===== 316 ==========
   aPseudoTicket[1051] = 522;
   aAction[1051] = 0; // CLOSE
   aType[1051] = OP_SELL; // SELL
   aTicket[1051] = -1; // Ticket given by broker
   aSymbol[1051] = "EURUSD";
   aLots[1051] = 1.0;
   aDate[1051] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPrice[1051] = 1.2905;

   // ========== 1052 ===== 315 ==========
   aPseudoTicket[1052] = 527;
   aAction[1052] = 0; // CLOSE
   aType[1052] = OP_SELL; // SELL
   aTicket[1052] = -1; // Ticket given by broker
   aSymbol[1052] = "EURUSD";
   aLots[1052] = 1.0;
   aDate[1052] = D'2011.12.30 11:44:43'+time_offset*3600;
   aPrice[1052] = 1.2927;

   // ========== 1053 ===== 314 ==========
   aPseudoTicket[1053] = 526;
   aAction[1053] = 0; // CLOSE
   aType[1053] = OP_SELL; // SELL
   aTicket[1053] = -1; // Ticket given by broker
   aSymbol[1053] = "EURUSD";
   aLots[1053] = 1.0;
   aDate[1053] = D'2011.12.30 11:50:41'+time_offset*3600;
   aPrice[1053] = 1.2933;

   // ========== 1054 ===== 313 ==========
   aPseudoTicket[1054] = 528;
   aAction[1054] = 1; // OPEN
   aReturn[528] = 1054;
   aType[1054] = OP_SELL; // SELL
   aTicket[1054] = -1; // Ticket given by broker
   aSymbol[1054] = "GBPUSD";
   aLots[1054] = 1.0;
   aDate[1054] = D'2011.12.30 12:00:03'+time_offset*3600;
   aPrice[1054] = 1.546;

   // ========== 1055 ===== 312 ==========
   aPseudoTicket[1055] = 529;
   aAction[1055] = 1; // OPEN
   aReturn[529] = 1055;
   aType[1055] = OP_SELL; // SELL
   aTicket[1055] = -1; // Ticket given by broker
   aSymbol[1055] = "GBPUSD";
   aLots[1055] = 1.0;
   aDate[1055] = D'2011.12.30 12:02:57'+time_offset*3600;
   aPrice[1055] = 1.54577;

   // ========== 1056 ===== 311 ==========
   aPseudoTicket[1056] = 530;
   aAction[1056] = 1; // OPEN
   aReturn[530] = 1056;
   aType[1056] = OP_SELL; // SELL
   aTicket[1056] = -1; // Ticket given by broker
   aSymbol[1056] = "GBPUSD";
   aLots[1056] = 1.0;
   aDate[1056] = D'2011.12.30 12:11:32'+time_offset*3600;
   aPrice[1056] = 1.54582;

   // ========== 1057 ===== 310 ==========
   aPseudoTicket[1057] = 531;
   aAction[1057] = 1; // OPEN
   aReturn[531] = 1057;
   aType[1057] = OP_SELL; // SELL
   aTicket[1057] = -1; // Ticket given by broker
   aSymbol[1057] = "GBPUSD";
   aLots[1057] = 1.0;
   aDate[1057] = D'2011.12.30 12:15:12'+time_offset*3600;
   aPrice[1057] = 1.5459;

   // ========== 1058 ===== 313 ==========
   aPseudoTicket[1058] = 528;
   aAction[1058] = 0; // CLOSE
   aType[1058] = OP_SELL; // SELL
   aTicket[1058] = -1; // Ticket given by broker
   aSymbol[1058] = "GBPUSD";
   aLots[1058] = 1.0;
   aDate[1058] = D'2012.01.02 07:15:24'+time_offset*3600;
   aPrice[1058] = 1.54996;

   // ========== 1059 ===== 312 ==========
   aPseudoTicket[1059] = 529;
   aAction[1059] = 0; // CLOSE
   aType[1059] = OP_SELL; // SELL
   aTicket[1059] = -1; // Ticket given by broker
   aSymbol[1059] = "GBPUSD";
   aLots[1059] = 1.0;
   aDate[1059] = D'2012.01.02 07:15:40'+time_offset*3600;
   aPrice[1059] = 1.54995;

   // ========== 1060 ===== 311 ==========
   aPseudoTicket[1060] = 530;
   aAction[1060] = 0; // CLOSE
   aType[1060] = OP_SELL; // SELL
   aTicket[1060] = -1; // Ticket given by broker
   aSymbol[1060] = "GBPUSD";
   aLots[1060] = 1.0;
   aDate[1060] = D'2012.01.02 07:15:46'+time_offset*3600;
   aPrice[1060] = 1.54909;

   // ========== 1061 ===== 310 ==========
   aPseudoTicket[1061] = 531;
   aAction[1061] = 0; // CLOSE
   aType[1061] = OP_SELL; // SELL
   aTicket[1061] = -1; // Ticket given by broker
   aSymbol[1061] = "GBPUSD";
   aLots[1061] = 1.0;
   aDate[1061] = D'2012.01.02 07:15:52'+time_offset*3600;
   aPrice[1061] = 1.55039;

   // ========== 1062 ===== 309 ==========
   aPseudoTicket[1062] = 532;
   aAction[1062] = 1; // OPEN
   aReturn[532] = 1062;
   aType[1062] = OP_SELL; // SELL
   aTicket[1062] = -1; // Ticket given by broker
   aSymbol[1062] = "USDCHF";
   aLots[1062] = 1.0;
   aDate[1062] = D'2012.01.03 10:04:36'+time_offset*3600;
   aPrice[1062] = 0.93283;

   // ========== 1063 ===== 309 ==========
   aPseudoTicket[1063] = 532;
   aAction[1063] = 0; // CLOSE
   aType[1063] = OP_SELL; // SELL
   aTicket[1063] = -1; // Ticket given by broker
   aSymbol[1063] = "USDCHF";
   aLots[1063] = 1.0;
   aDate[1063] = D'2012.01.03 11:32:21'+time_offset*3600;
   aPrice[1063] = 0.93216;

   // ========== 1064 ===== 305 ==========
   aPseudoTicket[1064] = 533;
   aAction[1064] = 1; // OPEN
   aReturn[533] = 1064;
   aType[1064] = OP_SELL; // SELL
   aTicket[1064] = -1; // Ticket given by broker
   aSymbol[1064] = "AUDUSD";
   aLots[1064] = 1.0;
   aDate[1064] = D'2012.01.03 11:39:49'+time_offset*3600;
   aPrice[1064] = 1.0359;

   // ========== 1065 ===== 306 ==========
   aPseudoTicket[1065] = 534;
   aAction[1065] = 1; // OPEN
   aReturn[534] = 1065;
   aType[1065] = OP_SELL; // SELL
   aTicket[1065] = -1; // Ticket given by broker
   aSymbol[1065] = "AUDUSD";
   aLots[1065] = 1.0;
   aDate[1065] = D'2012.01.03 11:40:29'+time_offset*3600;
   aPrice[1065] = 1.03587;

   // ========== 1066 ===== 307 ==========
   aPseudoTicket[1066] = 535;
   aAction[1066] = 1; // OPEN
   aReturn[535] = 1066;
   aType[1066] = OP_SELL; // SELL
   aTicket[1066] = -1; // Ticket given by broker
   aSymbol[1066] = "AUDUSD";
   aLots[1066] = 1.0;
   aDate[1066] = D'2012.01.03 11:41:34'+time_offset*3600;
   aPrice[1066] = 1.03594;

   // ========== 1067 ===== 308 ==========
   aPseudoTicket[1067] = 536;
   aAction[1067] = 1; // OPEN
   aReturn[536] = 1067;
   aType[1067] = OP_SELL; // SELL
   aTicket[1067] = -1; // Ticket given by broker
   aSymbol[1067] = "AUDUSD";
   aLots[1067] = 1.0;
   aDate[1067] = D'2012.01.03 11:42:27'+time_offset*3600;
   aPrice[1067] = 1.03604;

   // ========== 1068 ===== 308 ==========
   aPseudoTicket[1068] = 536;
   aAction[1068] = 0; // CLOSE
   aType[1068] = OP_SELL; // SELL
   aTicket[1068] = -1; // Ticket given by broker
   aSymbol[1068] = "AUDUSD";
   aLots[1068] = 1.0;
   aDate[1068] = D'2012.01.04 02:19:26'+time_offset*3600;
   aPrice[1068] = 1.0345;

   // ========== 1069 ===== 307 ==========
   aPseudoTicket[1069] = 535;
   aAction[1069] = 0; // CLOSE
   aType[1069] = OP_SELL; // SELL
   aTicket[1069] = -1; // Ticket given by broker
   aSymbol[1069] = "AUDUSD";
   aLots[1069] = 1.0;
   aDate[1069] = D'2012.01.04 02:19:29'+time_offset*3600;
   aPrice[1069] = 1.0345;

   // ========== 1070 ===== 306 ==========
   aPseudoTicket[1070] = 534;
   aAction[1070] = 0; // CLOSE
   aType[1070] = OP_SELL; // SELL
   aTicket[1070] = -1; // Ticket given by broker
   aSymbol[1070] = "AUDUSD";
   aLots[1070] = 1.0;
   aDate[1070] = D'2012.01.04 02:19:33'+time_offset*3600;
   aPrice[1070] = 1.03452;

   // ========== 1071 ===== 305 ==========
   aPseudoTicket[1071] = 533;
   aAction[1071] = 0; // CLOSE
   aType[1071] = OP_SELL; // SELL
   aTicket[1071] = -1; // Ticket given by broker
   aSymbol[1071] = "AUDUSD";
   aLots[1071] = 1.0;
   aDate[1071] = D'2012.01.04 02:19:39'+time_offset*3600;
   aPrice[1071] = 1.03452;

   // ========== 1072 ===== 304 ==========
   aPseudoTicket[1072] = 537;
   aAction[1072] = 1; // OPEN
   aReturn[537] = 1072;
   aType[1072] = OP_SELL; // SELL
   aTicket[1072] = -1; // Ticket given by broker
   aSymbol[1072] = "GBPUSD";
   aLots[1072] = 1.0;
   aDate[1072] = D'2012.01.04 07:24:39'+time_offset*3600;
   aPrice[1072] = 1.56479;

   // ========== 1073 ===== 303 ==========
   aPseudoTicket[1073] = 538;
   aAction[1073] = 1; // OPEN
   aReturn[538] = 1073;
   aType[1073] = OP_SELL; // SELL
   aTicket[1073] = -1; // Ticket given by broker
   aSymbol[1073] = "GBPUSD";
   aLots[1073] = 1.0;
   aDate[1073] = D'2012.01.04 07:25:58'+time_offset*3600;
   aPrice[1073] = 1.56465;

   // ========== 1074 ===== 302 ==========
   aPseudoTicket[1074] = 539;
   aAction[1074] = 1; // OPEN
   aReturn[539] = 1074;
   aType[1074] = OP_SELL; // SELL
   aTicket[1074] = -1; // Ticket given by broker
   aSymbol[1074] = "GBPUSD";
   aLots[1074] = 1.0;
   aDate[1074] = D'2012.01.04 07:27:18'+time_offset*3600;
   aPrice[1074] = 1.56471;

   // ========== 1075 ===== 301 ==========
   aPseudoTicket[1075] = 540;
   aAction[1075] = 1; // OPEN
   aReturn[540] = 1075;
   aType[1075] = OP_SELL; // SELL
   aTicket[1075] = -1; // Ticket given by broker
   aSymbol[1075] = "GBPUSD";
   aLots[1075] = 1.0;
   aDate[1075] = D'2012.01.04 07:28:10'+time_offset*3600;
   aPrice[1075] = 1.56474;

   // ========== 1076 ===== 304 ==========
   aPseudoTicket[1076] = 537;
   aAction[1076] = 0; // CLOSE
   aType[1076] = OP_SELL; // SELL
   aTicket[1076] = -1; // Ticket given by broker
   aSymbol[1076] = "GBPUSD";
   aLots[1076] = 1.0;
   aDate[1076] = D'2012.01.04 08:08:21'+time_offset*3600;
   aPrice[1076] = 1.56635;

   // ========== 1077 ===== 303 ==========
   aPseudoTicket[1077] = 538;
   aAction[1077] = 0; // CLOSE
   aType[1077] = OP_SELL; // SELL
   aTicket[1077] = -1; // Ticket given by broker
   aSymbol[1077] = "GBPUSD";
   aLots[1077] = 1.0;
   aDate[1077] = D'2012.01.04 08:08:25'+time_offset*3600;
   aPrice[1077] = 1.56639;

   // ========== 1078 ===== 297 ==========
   aPseudoTicket[1078] = 541;
   aAction[1078] = 1; // OPEN
   aReturn[541] = 1078;
   aType[1078] = OP_BUY; // BUY
   aTicket[1078] = -1; // Ticket given by broker
   aSymbol[1078] = "EURUSD";
   aLots[1078] = 1.0;
   aDate[1078] = D'2012.01.04 08:09:40'+time_offset*3600;
   aPrice[1078] = 1.30631;

   // ========== 1079 ===== 298 ==========
   aPseudoTicket[1079] = 542;
   aAction[1079] = 1; // OPEN
   aReturn[542] = 1079;
   aType[1079] = OP_BUY; // BUY
   aTicket[1079] = -1; // Ticket given by broker
   aSymbol[1079] = "EURUSD";
   aLots[1079] = 1.0;
   aDate[1079] = D'2012.01.04 08:12:40'+time_offset*3600;
   aPrice[1079] = 1.3064;

   // ========== 1080 ===== 302 ==========
   aPseudoTicket[1080] = 539;
   aAction[1080] = 0; // CLOSE
   aType[1080] = OP_SELL; // SELL
   aTicket[1080] = -1; // Ticket given by broker
   aSymbol[1080] = "GBPUSD";
   aLots[1080] = 1.0;
   aDate[1080] = D'2012.01.04 08:24:25'+time_offset*3600;
   aPrice[1080] = 1.56584;

   // ========== 1081 ===== 301 ==========
   aPseudoTicket[1081] = 540;
   aAction[1081] = 0; // CLOSE
   aType[1081] = OP_SELL; // SELL
   aTicket[1081] = -1; // Ticket given by broker
   aSymbol[1081] = "GBPUSD";
   aLots[1081] = 1.0;
   aDate[1081] = D'2012.01.04 08:24:30'+time_offset*3600;
   aPrice[1081] = 1.56585;

   // ========== 1082 ===== 299 ==========
   aPseudoTicket[1082] = 543;
   aAction[1082] = 1; // OPEN
   aReturn[543] = 1082;
   aType[1082] = OP_BUY; // BUY
   aTicket[1082] = -1; // Ticket given by broker
   aSymbol[1082] = "EURUSD";
   aLots[1082] = 1.0;
   aDate[1082] = D'2012.01.04 08:25:34'+time_offset*3600;
   aPrice[1082] = 1.30623;

   // ========== 1083 ===== 300 ==========
   aPseudoTicket[1083] = 544;
   aAction[1083] = 1; // OPEN
   aReturn[544] = 1083;
   aType[1083] = OP_BUY; // BUY
   aTicket[1083] = -1; // Ticket given by broker
   aSymbol[1083] = "EURUSD";
   aLots[1083] = 1.0;
   aDate[1083] = D'2012.01.04 08:26:52'+time_offset*3600;
   aPrice[1083] = 1.30614;

   // ========== 1084 ===== 300 ==========
   aPseudoTicket[1084] = 544;
   aAction[1084] = 0; // CLOSE
   aType[1084] = OP_BUY; // BUY
   aTicket[1084] = -1; // Ticket given by broker
   aSymbol[1084] = "EURUSD";
   aLots[1084] = 1.0;
   aDate[1084] = D'2012.01.04 08:55:49'+time_offset*3600;
   aPrice[1084] = 1.30353;

   // ========== 1085 ===== 299 ==========
   aPseudoTicket[1085] = 543;
   aAction[1085] = 0; // CLOSE
   aType[1085] = OP_BUY; // BUY
   aTicket[1085] = -1; // Ticket given by broker
   aSymbol[1085] = "EURUSD";
   aLots[1085] = 1.0;
   aDate[1085] = D'2012.01.04 08:55:52'+time_offset*3600;
   aPrice[1085] = 1.30351;

   // ========== 1086 ===== 298 ==========
   aPseudoTicket[1086] = 542;
   aAction[1086] = 0; // CLOSE
   aType[1086] = OP_BUY; // BUY
   aTicket[1086] = -1; // Ticket given by broker
   aSymbol[1086] = "EURUSD";
   aLots[1086] = 1.0;
   aDate[1086] = D'2012.01.04 08:55:56'+time_offset*3600;
   aPrice[1086] = 1.30352;

   // ========== 1087 ===== 297 ==========
   aPseudoTicket[1087] = 541;
   aAction[1087] = 0; // CLOSE
   aType[1087] = OP_BUY; // BUY
   aTicket[1087] = -1; // Ticket given by broker
   aSymbol[1087] = "EURUSD";
   aLots[1087] = 1.0;
   aDate[1087] = D'2012.01.04 08:55:59'+time_offset*3600;
   aPrice[1087] = 1.30357;

   // ========== 1088 ===== 296 ==========
   aPseudoTicket[1088] = 545;
   aAction[1088] = 1; // OPEN
   aReturn[545] = 1088;
   aType[1088] = OP_BUY; // BUY
   aTicket[1088] = -1; // Ticket given by broker
   aSymbol[1088] = "AUDUSD";
   aLots[1088] = 1.0;
   aDate[1088] = D'2012.01.05 11:42:45'+time_offset*3600;
   aPrice[1088] = 1.0248;

   // ========== 1089 ===== 296 ==========
   aPseudoTicket[1089] = 545;
   aAction[1089] = 0; // CLOSE
   aType[1089] = OP_BUY; // BUY
   aTicket[1089] = -1; // Ticket given by broker
   aSymbol[1089] = "AUDUSD";
   aLots[1089] = 1.0;
   aDate[1089] = D'2012.01.05 12:12:02'+time_offset*3600;
   aPrice[1089] = 1.02604;

   // ========== 1090 ===== 293 ==========
   aPseudoTicket[1090] = 546;
   aAction[1090] = 1; // OPEN
   aReturn[546] = 1090;
   aType[1090] = OP_BUY; // BUY
   aTicket[1090] = -1; // Ticket given by broker
   aSymbol[1090] = "AUDUSD";
   aLots[1090] = 1.0;
   aDate[1090] = D'2012.01.08 23:36:22'+time_offset*3600;
   aPrice[1090] = 1.019;

   // ========== 1091 ===== 294 ==========
   aPseudoTicket[1091] = 547;
   aAction[1091] = 1; // OPEN
   aReturn[547] = 1091;
   aType[1091] = OP_BUY; // BUY
   aTicket[1091] = -1; // Ticket given by broker
   aSymbol[1091] = "AUDUSD";
   aLots[1091] = 1.0;
   aDate[1091] = D'2012.01.08 23:38:16'+time_offset*3600;
   aPrice[1091] = 1.01839;

   // ========== 1092 ===== 292 ==========
   aPseudoTicket[1092] = 548;
   aAction[1092] = 1; // OPEN
   aReturn[548] = 1092;
   aType[1092] = OP_BUY; // BUY
   aTicket[1092] = -1; // Ticket given by broker
   aSymbol[1092] = "AUDUSD";
   aLots[1092] = 1.0;
   aDate[1092] = D'2012.01.09 00:17:35'+time_offset*3600;
   aPrice[1092] = 1.0186;

   // ========== 1093 ===== 295 ==========
   aPseudoTicket[1093] = 549;
   aAction[1093] = 1; // OPEN
   aReturn[549] = 1093;
   aType[1093] = OP_BUY; // BUY
   aTicket[1093] = -1; // Ticket given by broker
   aSymbol[1093] = "AUDUSD";
   aLots[1093] = 1.0;
   aDate[1093] = D'2012.01.09 00:22:28'+time_offset*3600;
   aPrice[1093] = 1.01774;

   // ========== 1094 ===== 295 ==========
   aPseudoTicket[1094] = 549;
   aAction[1094] = 0; // CLOSE
   aType[1094] = OP_BUY; // BUY
   aTicket[1094] = -1; // Ticket given by broker
   aSymbol[1094] = "AUDUSD";
   aLots[1094] = 1.0;
   aDate[1094] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPrice[1094] = 1.019;

   // ========== 1095 ===== 293 ==========
   aPseudoTicket[1095] = 546;
   aAction[1095] = 0; // CLOSE
   aType[1095] = OP_BUY; // BUY
   aTicket[1095] = -1; // Ticket given by broker
   aSymbol[1095] = "AUDUSD";
   aLots[1095] = 1.0;
   aDate[1095] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPrice[1095] = 1.019;

   // ========== 1096 ===== 294 ==========
   aPseudoTicket[1096] = 547;
   aAction[1096] = 0; // CLOSE
   aType[1096] = OP_BUY; // BUY
   aTicket[1096] = -1; // Ticket given by broker
   aSymbol[1096] = "AUDUSD";
   aLots[1096] = 1.0;
   aDate[1096] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPrice[1096] = 1.019;

   // ========== 1097 ===== 292 ==========
   aPseudoTicket[1097] = 548;
   aAction[1097] = 0; // CLOSE
   aType[1097] = OP_BUY; // BUY
   aTicket[1097] = -1; // Ticket given by broker
   aSymbol[1097] = "AUDUSD";
   aLots[1097] = 1.0;
   aDate[1097] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPrice[1097] = 1.019;

   // ========== 1098 ===== 288 ==========
   aPseudoTicket[1098] = 550;
   aAction[1098] = 1; // OPEN
   aReturn[550] = 1098;
   aType[1098] = OP_SELL; // SELL
   aTicket[1098] = -1; // Ticket given by broker
   aSymbol[1098] = "EURUSD";
   aLots[1098] = 1.0;
   aDate[1098] = D'2012.01.09 08:35:37'+time_offset*3600;
   aPrice[1098] = 1.2764;

   // ========== 1099 ===== 289 ==========
   aPseudoTicket[1099] = 551;
   aAction[1099] = 1; // OPEN
   aReturn[551] = 1099;
   aType[1099] = OP_SELL; // SELL
   aTicket[1099] = -1; // Ticket given by broker
   aSymbol[1099] = "EURUSD";
   aLots[1099] = 1.0;
   aDate[1099] = D'2012.01.09 08:36:19'+time_offset*3600;
   aPrice[1099] = 1.2767;

   // ========== 1100 ===== 290 ==========
   aPseudoTicket[1100] = 552;
   aAction[1100] = 1; // OPEN
   aReturn[552] = 1100;
   aType[1100] = OP_SELL; // SELL
   aTicket[1100] = -1; // Ticket given by broker
   aSymbol[1100] = "EURUSD";
   aLots[1100] = 1.0;
   aDate[1100] = D'2012.01.09 08:37:06'+time_offset*3600;
   aPrice[1100] = 1.2769;

   // ========== 1101 ===== 291 ==========
   aPseudoTicket[1101] = 553;
   aAction[1101] = 1; // OPEN
   aReturn[553] = 1101;
   aType[1101] = OP_SELL; // SELL
   aTicket[1101] = -1; // Ticket given by broker
   aSymbol[1101] = "EURUSD";
   aLots[1101] = 1.0;
   aDate[1101] = D'2012.01.09 08:37:56'+time_offset*3600;
   aPrice[1101] = 1.27655;

   // ========== 1102 ===== 291 ==========
   aPseudoTicket[1102] = 553;
   aAction[1102] = 0; // CLOSE
   aType[1102] = OP_SELL; // SELL
   aTicket[1102] = -1; // Ticket given by broker
   aSymbol[1102] = "EURUSD";
   aLots[1102] = 1.0;
   aDate[1102] = D'2012.01.11 04:57:44'+time_offset*3600;
   aPrice[1102] = 1.27445;

   // ========== 1103 ===== 290 ==========
   aPseudoTicket[1103] = 552;
   aAction[1103] = 0; // CLOSE
   aType[1103] = OP_SELL; // SELL
   aTicket[1103] = -1; // Ticket given by broker
   aSymbol[1103] = "EURUSD";
   aLots[1103] = 1.0;
   aDate[1103] = D'2012.01.11 04:57:48'+time_offset*3600;
   aPrice[1103] = 1.27442;

   // ========== 1104 ===== 289 ==========
   aPseudoTicket[1104] = 551;
   aAction[1104] = 0; // CLOSE
   aType[1104] = OP_SELL; // SELL
   aTicket[1104] = -1; // Ticket given by broker
   aSymbol[1104] = "EURUSD";
   aLots[1104] = 1.0;
   aDate[1104] = D'2012.01.11 10:31:57'+time_offset*3600;
   aPrice[1104] = 1.27544;

   // ========== 1105 ===== 288 ==========
   aPseudoTicket[1105] = 550;
   aAction[1105] = 0; // CLOSE
   aType[1105] = OP_SELL; // SELL
   aTicket[1105] = -1; // Ticket given by broker
   aSymbol[1105] = "EURUSD";
   aLots[1105] = 1.0;
   aDate[1105] = D'2012.01.11 10:32:41'+time_offset*3600;
   aPrice[1105] = 1.27542;

   // ========== 1106 ===== 286 ==========
   aPseudoTicket[1106] = 554;
   aAction[1106] = 1; // OPEN
   aReturn[554] = 1106;
   aType[1106] = OP_SELL; // SELL
   aTicket[1106] = -1; // Ticket given by broker
   aSymbol[1106] = "GBPUSD";
   aLots[1106] = 1.0;
   aDate[1106] = D'2012.01.13 06:14:12'+time_offset*3600;
   aPrice[1106] = 1.53768;

   // ========== 1107 ===== 285 ==========
   aPseudoTicket[1107] = 555;
   aAction[1107] = 1; // OPEN
   aReturn[555] = 1107;
   aType[1107] = OP_SELL; // SELL
   aTicket[1107] = -1; // Ticket given by broker
   aSymbol[1107] = "GBPUSD";
   aLots[1107] = 1.0;
   aDate[1107] = D'2012.01.13 06:40:25'+time_offset*3600;
   aPrice[1107] = 1.53795;

   // ========== 1108 ===== 284 ==========
   aPseudoTicket[1108] = 556;
   aAction[1108] = 1; // OPEN
   aReturn[556] = 1108;
   aType[1108] = OP_SELL; // SELL
   aTicket[1108] = -1; // Ticket given by broker
   aSymbol[1108] = "GBPUSD";
   aLots[1108] = 1.0;
   aDate[1108] = D'2012.01.13 06:58:02'+time_offset*3600;
   aPrice[1108] = 1.53772;

   // ========== 1109 ===== 287 ==========
   aPseudoTicket[1109] = 557;
   aAction[1109] = 1; // OPEN
   aReturn[557] = 1109;
   aType[1109] = OP_SELL; // SELL
   aTicket[1109] = -1; // Ticket given by broker
   aSymbol[1109] = "GBPUSD";
   aLots[1109] = 1.0;
   aDate[1109] = D'2012.01.13 07:05:45'+time_offset*3600;
   aPrice[1109] = 1.53799;

   // ========== 1110 ===== 287 ==========
   aPseudoTicket[1110] = 557;
   aAction[1110] = 0; // CLOSE
   aType[1110] = OP_SELL; // SELL
   aTicket[1110] = -1; // Ticket given by broker
   aSymbol[1110] = "GBPUSD";
   aLots[1110] = 1.0;
   aDate[1110] = D'2012.01.13 08:15:13'+time_offset*3600;
   aPrice[1110] = 1.53668;

   // ========== 1111 ===== 283 ==========
   aPseudoTicket[1111] = 558;
   aAction[1111] = 1; // OPEN
   aReturn[558] = 1111;
   aType[1111] = OP_SELL; // SELL
   aTicket[1111] = -1; // Ticket given by broker
   aSymbol[1111] = "EURUSD";
   aLots[1111] = 1.0;
   aDate[1111] = D'2012.01.13 08:21:43'+time_offset*3600;
   aPrice[1111] = 1.28644;

   // ========== 1112 ===== 286 ==========
   aPseudoTicket[1112] = 554;
   aAction[1112] = 0; // CLOSE
   aType[1112] = OP_SELL; // SELL
   aTicket[1112] = -1; // Ticket given by broker
   aSymbol[1112] = "GBPUSD";
   aLots[1112] = 1.0;
   aDate[1112] = D'2012.01.13 08:48:32'+time_offset*3600;
   aPrice[1112] = 1.5355;

   // ========== 1113 ===== 285 ==========
   aPseudoTicket[1113] = 555;
   aAction[1113] = 0; // CLOSE
   aType[1113] = OP_SELL; // SELL
   aTicket[1113] = -1; // Ticket given by broker
   aSymbol[1113] = "GBPUSD";
   aLots[1113] = 1.0;
   aDate[1113] = D'2012.01.13 09:02:16'+time_offset*3600;
   aPrice[1113] = 1.53472;

   // ========== 1114 ===== 284 ==========
   aPseudoTicket[1114] = 556;
   aAction[1114] = 0; // CLOSE
   aType[1114] = OP_SELL; // SELL
   aTicket[1114] = -1; // Ticket given by broker
   aSymbol[1114] = "GBPUSD";
   aLots[1114] = 1.0;
   aDate[1114] = D'2012.01.13 09:02:19'+time_offset*3600;
   aPrice[1114] = 1.53467;

   // ========== 1115 ===== 283 ==========
   aPseudoTicket[1115] = 558;
   aAction[1115] = 0; // CLOSE
   aType[1115] = OP_SELL; // SELL
   aTicket[1115] = -1; // Ticket given by broker
   aSymbol[1115] = "EURUSD";
   aLots[1115] = 1.0;
   aDate[1115] = D'2012.01.13 09:24:49'+time_offset*3600;
   aPrice[1115] = 1.28388;

   // ========== 1116 ===== 279 ==========
   aPseudoTicket[1116] = 559;
   aAction[1116] = 1; // OPEN
   aReturn[559] = 1116;
   aType[1116] = OP_BUY; // BUY
   aTicket[1116] = -1; // Ticket given by broker
   aSymbol[1116] = "EURUSD";
   aLots[1116] = 1.0;
   aDate[1116] = D'2012.01.13 14:09:03'+time_offset*3600;
   aPrice[1116] = 1.27199;

   // ========== 1117 ===== 281 ==========
   aPseudoTicket[1117] = 560;
   aAction[1117] = 1; // OPEN
   aReturn[560] = 1117;
   aType[1117] = OP_BUY; // BUY
   aTicket[1117] = -1; // Ticket given by broker
   aSymbol[1117] = "EURUSD";
   aLots[1117] = 1.0;
   aDate[1117] = D'2012.01.13 14:10:42'+time_offset*3600;
   aPrice[1117] = 1.27127;

   // ========== 1118 ===== 282 ==========
   aPseudoTicket[1118] = 561;
   aAction[1118] = 1; // OPEN
   aReturn[561] = 1118;
   aType[1118] = OP_BUY; // BUY
   aTicket[1118] = -1; // Ticket given by broker
   aSymbol[1118] = "EURUSD";
   aLots[1118] = 1.0;
   aDate[1118] = D'2012.01.13 14:11:50'+time_offset*3600;
   aPrice[1118] = 1.27047;

   // ========== 1119 ===== 280 ==========
   aPseudoTicket[1119] = 562;
   aAction[1119] = 1; // OPEN
   aReturn[562] = 1119;
   aType[1119] = OP_BUY; // BUY
   aTicket[1119] = -1; // Ticket given by broker
   aSymbol[1119] = "EURUSD";
   aLots[1119] = 1.0;
   aDate[1119] = D'2012.01.13 14:51:43'+time_offset*3600;
   aPrice[1119] = 1.2683;

   // ========== 1120 ===== 282 ==========
   aPseudoTicket[1120] = 561;
   aAction[1120] = 0; // CLOSE
   aType[1120] = OP_BUY; // BUY
   aTicket[1120] = -1; // Ticket given by broker
   aSymbol[1120] = "EURUSD";
   aLots[1120] = 1.0;
   aDate[1120] = D'2012.01.13 20:35:04'+time_offset*3600;
   aPrice[1120] = 1.26769;

   // ========== 1121 ===== 281 ==========
   aPseudoTicket[1121] = 560;
   aAction[1121] = 0; // CLOSE
   aType[1121] = OP_BUY; // BUY
   aTicket[1121] = -1; // Ticket given by broker
   aSymbol[1121] = "EURUSD";
   aLots[1121] = 1.0;
   aDate[1121] = D'2012.01.13 20:35:10'+time_offset*3600;
   aPrice[1121] = 1.26769;

   // ========== 1122 ===== 280 ==========
   aPseudoTicket[1122] = 562;
   aAction[1122] = 0; // CLOSE
   aType[1122] = OP_BUY; // BUY
   aTicket[1122] = -1; // Ticket given by broker
   aSymbol[1122] = "EURUSD";
   aLots[1122] = 1.0;
   aDate[1122] = D'2012.01.13 20:36:12'+time_offset*3600;
   aPrice[1122] = 1.26769;

   // ========== 1123 ===== 279 ==========
   aPseudoTicket[1123] = 559;
   aAction[1123] = 0; // CLOSE
   aType[1123] = OP_BUY; // BUY
   aTicket[1123] = -1; // Ticket given by broker
   aSymbol[1123] = "EURUSD";
   aLots[1123] = 1.0;
   aDate[1123] = D'2012.01.13 20:36:21'+time_offset*3600;
   aPrice[1123] = 1.26764;

   // ========== 1124 ===== 278 ==========
   aPseudoTicket[1124] = 563;
   aAction[1124] = 1; // OPEN
   aReturn[563] = 1124;
   aType[1124] = OP_SELL; // SELL
   aTicket[1124] = -1; // Ticket given by broker
   aSymbol[1124] = "EURUSD";
   aLots[1124] = 1.0;
   aDate[1124] = D'2012.01.17 02:49:50'+time_offset*3600;
   aPrice[1124] = 1.2725;

   // ========== 1125 ===== 277 ==========
   aPseudoTicket[1125] = 564;
   aAction[1125] = 1; // OPEN
   aReturn[564] = 1125;
   aType[1125] = OP_SELL; // SELL
   aTicket[1125] = -1; // Ticket given by broker
   aSymbol[1125] = "EURUSD";
   aLots[1125] = 1.0;
   aDate[1125] = D'2012.01.17 02:52:42'+time_offset*3600;
   aPrice[1125] = 1.27297;

   // ========== 1126 ===== 275 ==========
   aPseudoTicket[1126] = 565;
   aAction[1126] = 1; // OPEN
   aReturn[565] = 1126;
   aType[1126] = OP_SELL; // SELL
   aTicket[1126] = -1; // Ticket given by broker
   aSymbol[1126] = "EURUSD";
   aLots[1126] = 1.0;
   aDate[1126] = D'2012.01.17 03:05:47'+time_offset*3600;
   aPrice[1126] = 1.27285;

   // ========== 1127 ===== 276 ==========
   aPseudoTicket[1127] = 566;
   aAction[1127] = 1; // OPEN
   aReturn[566] = 1127;
   aType[1127] = OP_SELL; // SELL
   aTicket[1127] = -1; // Ticket given by broker
   aSymbol[1127] = "EURUSD";
   aLots[1127] = 1.0;
   aDate[1127] = D'2012.01.17 03:10:56'+time_offset*3600;
   aPrice[1127] = 1.27314;

   // ========== 1128 ===== 277 ==========
   aPseudoTicket[1128] = 564;
   aAction[1128] = 0; // CLOSE
   aType[1128] = OP_SELL; // SELL
   aTicket[1128] = -1; // Ticket given by broker
   aSymbol[1128] = "EURUSD";
   aLots[1128] = 1.0;
   aDate[1128] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPrice[1128] = 1.272;

   // ========== 1129 ===== 278 ==========
   aPseudoTicket[1129] = 563;
   aAction[1129] = 0; // CLOSE
   aType[1129] = OP_SELL; // SELL
   aTicket[1129] = -1; // Ticket given by broker
   aSymbol[1129] = "EURUSD";
   aLots[1129] = 1.0;
   aDate[1129] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPrice[1129] = 1.272;

   // ========== 1130 ===== 276 ==========
   aPseudoTicket[1130] = 566;
   aAction[1130] = 0; // CLOSE
   aType[1130] = OP_SELL; // SELL
   aTicket[1130] = -1; // Ticket given by broker
   aSymbol[1130] = "EURUSD";
   aLots[1130] = 1.0;
   aDate[1130] = D'2012.01.17 14:41:49'+time_offset*3600;
   aPrice[1130] = 1.27189;

   // ========== 1131 ===== 275 ==========
   aPseudoTicket[1131] = 565;
   aAction[1131] = 0; // CLOSE
   aType[1131] = OP_SELL; // SELL
   aTicket[1131] = -1; // Ticket given by broker
   aSymbol[1131] = "EURUSD";
   aLots[1131] = 1.0;
   aDate[1131] = D'2012.01.17 14:41:53'+time_offset*3600;
   aPrice[1131] = 1.27187;

   // ========== 1132 ===== 271 ==========
   aPseudoTicket[1132] = 567;
   aAction[1132] = 1; // OPEN
   aReturn[567] = 1132;
   aType[1132] = OP_SELL; // SELL
   aTicket[1132] = -1; // Ticket given by broker
   aSymbol[1132] = "EURUSD";
   aLots[1132] = 1.0;
   aDate[1132] = D'2012.01.18 22:53:44'+time_offset*3600;
   aPrice[1132] = 1.2852;

   // ========== 1133 ===== 272 ==========
   aPseudoTicket[1133] = 568;
   aAction[1133] = 1; // OPEN
   aReturn[568] = 1133;
   aType[1133] = OP_SELL; // SELL
   aTicket[1133] = -1; // Ticket given by broker
   aSymbol[1133] = "EURUSD";
   aLots[1133] = 1.0;
   aDate[1133] = D'2012.01.19 03:29:19'+time_offset*3600;
   aPrice[1133] = 1.28729;

   // ========== 1134 ===== 273 ==========
   aPseudoTicket[1134] = 569;
   aAction[1134] = 1; // OPEN
   aReturn[569] = 1134;
   aType[1134] = OP_SELL; // SELL
   aTicket[1134] = -1; // Ticket given by broker
   aSymbol[1134] = "EURUSD";
   aLots[1134] = 1.0;
   aDate[1134] = D'2012.01.19 12:38:47'+time_offset*3600;
   aPrice[1134] = 1.29076;

   // ========== 1135 ===== 274 ==========
   aPseudoTicket[1135] = 570;
   aAction[1135] = 1; // OPEN
   aReturn[570] = 1135;
   aType[1135] = OP_SELL; // SELL
   aTicket[1135] = -1; // Ticket given by broker
   aSymbol[1135] = "EURUSD";
   aLots[1135] = 1.0;
   aDate[1135] = D'2012.01.19 12:53:16'+time_offset*3600;
   aPrice[1135] = 1.2925;

   // ========== 1136 ===== 274 ==========
   aPseudoTicket[1136] = 570;
   aAction[1136] = 0; // CLOSE
   aType[1136] = OP_SELL; // SELL
   aTicket[1136] = -1; // Ticket given by broker
   aSymbol[1136] = "EURUSD";
   aLots[1136] = 1.0;
   aDate[1136] = D'2012.01.20 14:12:35'+time_offset*3600;
   aPrice[1136] = 1.29178;

   // ========== 1137 ===== 273 ==========
   aPseudoTicket[1137] = 569;
   aAction[1137] = 0; // CLOSE
   aType[1137] = OP_SELL; // SELL
   aTicket[1137] = -1; // Ticket given by broker
   aSymbol[1137] = "EURUSD";
   aLots[1137] = 1.0;
   aDate[1137] = D'2012.01.20 14:12:39'+time_offset*3600;
   aPrice[1137] = 1.29181;

   // ========== 1138 ===== 272 ==========
   aPseudoTicket[1138] = 568;
   aAction[1138] = 0; // CLOSE
   aType[1138] = OP_SELL; // SELL
   aTicket[1138] = -1; // Ticket given by broker
   aSymbol[1138] = "EURUSD";
   aLots[1138] = 1.0;
   aDate[1138] = D'2012.01.20 14:15:58'+time_offset*3600;
   aPrice[1138] = 1.29239;

   // ========== 1139 ===== 271 ==========
   aPseudoTicket[1139] = 567;
   aAction[1139] = 0; // CLOSE
   aType[1139] = OP_SELL; // SELL
   aTicket[1139] = -1; // Ticket given by broker
   aSymbol[1139] = "EURUSD";
   aLots[1139] = 1.0;
   aDate[1139] = D'2012.01.20 14:16:02'+time_offset*3600;
   aPrice[1139] = 1.2924;

   // ========== 1140 ===== 267 ==========
   aPseudoTicket[1140] = 571;
   aAction[1140] = 1; // OPEN
   aReturn[571] = 1140;
   aType[1140] = OP_SELL; // SELL
   aTicket[1140] = -1; // Ticket given by broker
   aSymbol[1140] = "EURUSD";
   aLots[1140] = 1.0;
   aDate[1140] = D'2012.01.23 10:56:31'+time_offset*3600;
   aPrice[1140] = 1.29703;

   // ========== 1141 ===== 268 ==========
   aPseudoTicket[1141] = 572;
   aAction[1141] = 1; // OPEN
   aReturn[572] = 1141;
   aType[1141] = OP_SELL; // SELL
   aTicket[1141] = -1; // Ticket given by broker
   aSymbol[1141] = "EURUSD";
   aLots[1141] = 1.0;
   aDate[1141] = D'2012.01.23 10:58:12'+time_offset*3600;
   aPrice[1141] = 1.29716;

   // ========== 1142 ===== 269 ==========
   aPseudoTicket[1142] = 573;
   aAction[1142] = 1; // OPEN
   aReturn[573] = 1142;
   aType[1142] = OP_SELL; // SELL
   aTicket[1142] = -1; // Ticket given by broker
   aSymbol[1142] = "EURUSD";
   aLots[1142] = 1.0;
   aDate[1142] = D'2012.01.23 10:59:32'+time_offset*3600;
   aPrice[1142] = 1.29754;

   // ========== 1143 ===== 270 ==========
   aPseudoTicket[1143] = 574;
   aAction[1143] = 1; // OPEN
   aReturn[574] = 1143;
   aType[1143] = OP_SELL; // SELL
   aTicket[1143] = -1; // Ticket given by broker
   aSymbol[1143] = "EURUSD";
   aLots[1143] = 1.0;
   aDate[1143] = D'2012.01.23 11:00:35'+time_offset*3600;
   aPrice[1143] = 1.2977;

   // ========== 1144 ===== 270 ==========
   aPseudoTicket[1144] = 574;
   aAction[1144] = 0; // CLOSE
   aType[1144] = OP_SELL; // SELL
   aTicket[1144] = -1; // Ticket given by broker
   aSymbol[1144] = "EURUSD";
   aLots[1144] = 1.0;
   aDate[1144] = D'2012.01.24 09:09:20'+time_offset*3600;
   aPrice[1144] = 1.30472;

   // ========== 1145 ===== 269 ==========
   aPseudoTicket[1145] = 573;
   aAction[1145] = 0; // CLOSE
   aType[1145] = OP_SELL; // SELL
   aTicket[1145] = -1; // Ticket given by broker
   aSymbol[1145] = "EURUSD";
   aLots[1145] = 1.0;
   aDate[1145] = D'2012.01.24 09:09:24'+time_offset*3600;
   aPrice[1145] = 1.30468;

   // ========== 1146 ===== 268 ==========
   aPseudoTicket[1146] = 572;
   aAction[1146] = 0; // CLOSE
   aType[1146] = OP_SELL; // SELL
   aTicket[1146] = -1; // Ticket given by broker
   aSymbol[1146] = "EURUSD";
   aLots[1146] = 1.0;
   aDate[1146] = D'2012.01.24 09:09:35'+time_offset*3600;
   aPrice[1146] = 1.30428;

   // ========== 1147 ===== 267 ==========
   aPseudoTicket[1147] = 571;
   aAction[1147] = 0; // CLOSE
   aType[1147] = OP_SELL; // SELL
   aTicket[1147] = -1; // Ticket given by broker
   aSymbol[1147] = "EURUSD";
   aLots[1147] = 1.0;
   aDate[1147] = D'2012.01.24 09:09:38'+time_offset*3600;
   aPrice[1147] = 1.30424;

   // ========== 1148 ===== 265 ==========
   aPseudoTicket[1148] = 575;
   aAction[1148] = 1; // OPEN
   aReturn[575] = 1148;
   aType[1148] = OP_BUY; // BUY
   aTicket[1148] = -1; // Ticket given by broker
   aSymbol[1148] = "AUDUSD";
   aLots[1148] = 1.0;
   aDate[1148] = D'2012.01.24 09:57:44'+time_offset*3600;
   aPrice[1148] = 1.04669;

   // ========== 1149 ===== 266 ==========
   aPseudoTicket[1149] = 576;
   aAction[1149] = 1; // OPEN
   aReturn[576] = 1149;
   aType[1149] = OP_BUY; // BUY
   aTicket[1149] = -1; // Ticket given by broker
   aSymbol[1149] = "AUDUSD";
   aLots[1149] = 1.0;
   aDate[1149] = D'2012.01.24 14:04:28'+time_offset*3600;
   aPrice[1149] = 1.0435;

   // ========== 1150 ===== 265 ==========
   aPseudoTicket[1150] = 575;
   aAction[1150] = 0; // CLOSE
   aType[1150] = OP_BUY; // BUY
   aTicket[1150] = -1; // Ticket given by broker
   aSymbol[1150] = "AUDUSD";
   aLots[1150] = 1.0;
   aDate[1150] = D'2012.01.24 17:57:28'+time_offset*3600;
   aPrice[1150] = 1.0478;

   // ========== 1151 ===== 266 ==========
   aPseudoTicket[1151] = 576;
   aAction[1151] = 0; // CLOSE
   aType[1151] = OP_BUY; // BUY
   aTicket[1151] = -1; // Ticket given by broker
   aSymbol[1151] = "AUDUSD";
   aLots[1151] = 1.0;
   aDate[1151] = D'2012.01.24 17:57:28'+time_offset*3600;
   aPrice[1151] = 1.0478;

   // ========== 1152 ===== 262 ==========
   aPseudoTicket[1152] = 577;
   aAction[1152] = 1; // OPEN
   aReturn[577] = 1152;
   aType[1152] = OP_SELL; // SELL
   aTicket[1152] = -1; // Ticket given by broker
   aSymbol[1152] = "GBPUSD";
   aLots[1152] = 1.0;
   aDate[1152] = D'2012.01.25 00:54:09'+time_offset*3600;
   aPrice[1152] = 1.56157;

   // ========== 1153 ===== 261 ==========
   aPseudoTicket[1153] = 578;
   aAction[1153] = 1; // OPEN
   aReturn[578] = 1153;
   aType[1153] = OP_SELL; // SELL
   aTicket[1153] = -1; // Ticket given by broker
   aSymbol[1153] = "GBPUSD";
   aLots[1153] = 1.0;
   aDate[1153] = D'2012.01.25 00:55:32'+time_offset*3600;
   aPrice[1153] = 1.56153;

   // ========== 1154 ===== 260 ==========
   aPseudoTicket[1154] = 579;
   aAction[1154] = 1; // OPEN
   aReturn[579] = 1154;
   aType[1154] = OP_SELL; // SELL
   aTicket[1154] = -1; // Ticket given by broker
   aSymbol[1154] = "GBPUSD";
   aLots[1154] = 1.0;
   aDate[1154] = D'2012.01.25 00:56:20'+time_offset*3600;
   aPrice[1154] = 1.5615;

   // ========== 1155 ===== 264 ==========
   aPseudoTicket[1155] = 580;
   aAction[1155] = 1; // OPEN
   aReturn[580] = 1155;
   aType[1155] = OP_SELL; // SELL
   aTicket[1155] = -1; // Ticket given by broker
   aSymbol[1155] = "GBPUSD";
   aLots[1155] = 1.0;
   aDate[1155] = D'2012.01.25 00:59:14'+time_offset*3600;
   aPrice[1155] = 1.56164;

   // ========== 1156 ===== 264 ==========
   aPseudoTicket[1156] = 580;
   aAction[1156] = 0; // CLOSE
   aType[1156] = OP_SELL; // SELL
   aTicket[1156] = -1; // Ticket given by broker
   aSymbol[1156] = "GBPUSD";
   aLots[1156] = 1.0;
   aDate[1156] = D'2012.01.25 09:38:24'+time_offset*3600;
   aPrice[1156] = 1.55569;

   // ========== 1157 ===== 263 ==========
   aPseudoTicket[1157] = 581;
   aAction[1157] = 1; // OPEN
   aReturn[581] = 1157;
   aType[1157] = OP_SELL; // SELL
   aTicket[1157] = -1; // Ticket given by broker
   aSymbol[1157] = "GBPUSD";
   aLots[1157] = 1.0;
   aDate[1157] = D'2012.01.25 09:53:53'+time_offset*3600;
   aPrice[1157] = 1.55779;

   // ========== 1158 ===== 263 ==========
   aPseudoTicket[1158] = 581;
   aAction[1158] = 0; // CLOSE
   aType[1158] = OP_SELL; // SELL
   aTicket[1158] = -1; // Ticket given by broker
   aSymbol[1158] = "GBPUSD";
   aLots[1158] = 1.0;
   aDate[1158] = D'2012.01.25 12:24:17'+time_offset*3600;
   aPrice[1158] = 1.5562;

   // ========== 1159 ===== 259 ==========
   aPseudoTicket[1159] = 582;
   aAction[1159] = 1; // OPEN
   aReturn[582] = 1159;
   aType[1159] = OP_SELL; // SELL
   aTicket[1159] = -1; // Ticket given by broker
   aSymbol[1159] = "USDCHF";
   aLots[1159] = 1.0;
   aDate[1159] = D'2012.01.25 12:26:08'+time_offset*3600;
   aPrice[1159] = 0.93299;

   // ========== 1160 ===== 262 ==========
   aPseudoTicket[1160] = 577;
   aAction[1160] = 0; // CLOSE
   aType[1160] = OP_SELL; // SELL
   aTicket[1160] = -1; // Ticket given by broker
   aSymbol[1160] = "GBPUSD";
   aLots[1160] = 1.0;
   aDate[1160] = D'2012.01.25 12:27:25'+time_offset*3600;
   aPrice[1160] = 1.55623;

   // ========== 1161 ===== 261 ==========
   aPseudoTicket[1161] = 578;
   aAction[1161] = 0; // CLOSE
   aType[1161] = OP_SELL; // SELL
   aTicket[1161] = -1; // Ticket given by broker
   aSymbol[1161] = "GBPUSD";
   aLots[1161] = 1.0;
   aDate[1161] = D'2012.01.25 12:36:42'+time_offset*3600;
   aPrice[1161] = 1.55602;

   // ========== 1162 ===== 260 ==========
   aPseudoTicket[1162] = 579;
   aAction[1162] = 0; // CLOSE
   aType[1162] = OP_SELL; // SELL
   aTicket[1162] = -1; // Ticket given by broker
   aSymbol[1162] = "GBPUSD";
   aLots[1162] = 1.0;
   aDate[1162] = D'2012.01.25 12:36:53'+time_offset*3600;
   aPrice[1162] = 1.55599;

   // ========== 1163 ===== 259 ==========
   aPseudoTicket[1163] = 582;
   aAction[1163] = 0; // CLOSE
   aType[1163] = OP_SELL; // SELL
   aTicket[1163] = -1; // Ticket given by broker
   aSymbol[1163] = "USDCHF";
   aLots[1163] = 1.0;
   aDate[1163] = D'2012.01.25 21:53:51'+time_offset*3600;
   aPrice[1163] = 0.92193;

   // ========== 1164 ===== 255 ==========
   aPseudoTicket[1164] = 583;
   aAction[1164] = 1; // OPEN
   aReturn[583] = 1164;
   aType[1164] = OP_BUY; // BUY
   aTicket[1164] = -1; // Ticket given by broker
   aSymbol[1164] = "EURUSD";
   aLots[1164] = 1.0;
   aDate[1164] = D'2012.01.27 00:16:31'+time_offset*3600;
   aPrice[1164] = 1.30887;

   // ========== 1165 ===== 257 ==========
   aPseudoTicket[1165] = 584;
   aAction[1165] = 1; // OPEN
   aReturn[584] = 1165;
   aType[1165] = OP_BUY; // BUY
   aTicket[1165] = -1; // Ticket given by broker
   aSymbol[1165] = "EURUSD";
   aLots[1165] = 1.0;
   aDate[1165] = D'2012.01.27 00:25:37'+time_offset*3600;
   aPrice[1165] = 1.30859;

   // ========== 1166 ===== 256 ==========
   aPseudoTicket[1166] = 585;
   aAction[1166] = 1; // OPEN
   aReturn[585] = 1166;
   aType[1166] = OP_BUY; // BUY
   aTicket[1166] = -1; // Ticket given by broker
   aSymbol[1166] = "EURUSD";
   aLots[1166] = 1.0;
   aDate[1166] = D'2012.01.27 00:26:14'+time_offset*3600;
   aPrice[1166] = 1.3083;

   // ========== 1167 ===== 258 ==========
   aPseudoTicket[1167] = 586;
   aAction[1167] = 1; // OPEN
   aReturn[586] = 1167;
   aType[1167] = OP_BUY; // BUY
   aTicket[1167] = -1; // Ticket given by broker
   aSymbol[1167] = "EURUSD";
   aLots[1167] = 1.0;
   aDate[1167] = D'2012.01.27 00:27:36'+time_offset*3600;
   aPrice[1167] = 1.30836;

   // ========== 1168 ===== 258 ==========
   aPseudoTicket[1168] = 586;
   aAction[1168] = 0; // CLOSE
   aType[1168] = OP_BUY; // BUY
   aTicket[1168] = -1; // Ticket given by broker
   aSymbol[1168] = "EURUSD";
   aLots[1168] = 1.0;
   aDate[1168] = D'2012.01.27 07:01:01'+time_offset*3600;
   aPrice[1168] = 1.3109;

   // ========== 1169 ===== 257 ==========
   aPseudoTicket[1169] = 584;
   aAction[1169] = 0; // CLOSE
   aType[1169] = OP_BUY; // BUY
   aTicket[1169] = -1; // Ticket given by broker
   aSymbol[1169] = "EURUSD";
   aLots[1169] = 1.0;
   aDate[1169] = D'2012.01.27 07:01:49'+time_offset*3600;
   aPrice[1169] = 1.31081;

   // ========== 1170 ===== 256 ==========
   aPseudoTicket[1170] = 585;
   aAction[1170] = 0; // CLOSE
   aType[1170] = OP_BUY; // BUY
   aTicket[1170] = -1; // Ticket given by broker
   aSymbol[1170] = "EURUSD";
   aLots[1170] = 1.0;
   aDate[1170] = D'2012.01.27 09:57:03'+time_offset*3600;
   aPrice[1170] = 1.31266;

   // ========== 1171 ===== 255 ==========
   aPseudoTicket[1171] = 583;
   aAction[1171] = 0; // CLOSE
   aType[1171] = OP_BUY; // BUY
   aTicket[1171] = -1; // Ticket given by broker
   aSymbol[1171] = "EURUSD";
   aLots[1171] = 1.0;
   aDate[1171] = D'2012.01.27 10:05:37'+time_offset*3600;
   aPrice[1171] = 1.314;

   // ========== 1172 ===== 253 ==========
   aPseudoTicket[1172] = 587;
   aAction[1172] = 1; // OPEN
   aReturn[587] = 1172;
   aType[1172] = OP_BUY; // BUY
   aTicket[1172] = -1; // Ticket given by broker
   aSymbol[1172] = "AUDUSD";
   aLots[1172] = 1.0;
   aDate[1172] = D'2012.01.30 08:40:43'+time_offset*3600;
   aPrice[1172] = 1.05664;

   // ========== 1173 ===== 252 ==========
   aPseudoTicket[1173] = 588;
   aAction[1173] = 1; // OPEN
   aReturn[588] = 1173;
   aType[1173] = OP_BUY; // BUY
   aTicket[1173] = -1; // Ticket given by broker
   aSymbol[1173] = "AUDUSD";
   aLots[1173] = 1.0;
   aDate[1173] = D'2012.01.30 10:15:26'+time_offset*3600;
   aPrice[1173] = 1.053;

   // ========== 1174 ===== 254 ==========
   aPseudoTicket[1174] = 589;
   aAction[1174] = 1; // OPEN
   aReturn[589] = 1174;
   aType[1174] = OP_BUY; // BUY
   aTicket[1174] = -1; // Ticket given by broker
   aSymbol[1174] = "AUDUSD";
   aLots[1174] = 1.0;
   aDate[1174] = D'2012.01.30 11:12:18'+time_offset*3600;
   aPrice[1174] = 1.05434;

   // ========== 1175 ===== 254 ==========
   aPseudoTicket[1175] = 589;
   aAction[1175] = 0; // CLOSE
   aType[1175] = OP_BUY; // BUY
   aTicket[1175] = -1; // Ticket given by broker
   aSymbol[1175] = "AUDUSD";
   aLots[1175] = 1.0;
   aDate[1175] = D'2012.01.30 15:51:23'+time_offset*3600;
   aPrice[1175] = 1.05636;

   // ========== 1176 ===== 253 ==========
   aPseudoTicket[1176] = 587;
   aAction[1176] = 0; // CLOSE
   aType[1176] = OP_BUY; // BUY
   aTicket[1176] = -1; // Ticket given by broker
   aSymbol[1176] = "AUDUSD";
   aLots[1176] = 1.0;
   aDate[1176] = D'2012.01.30 16:04:21'+time_offset*3600;
   aPrice[1176] = 1.0579;

   // ========== 1177 ===== 252 ==========
   aPseudoTicket[1177] = 588;
   aAction[1177] = 0; // CLOSE
   aType[1177] = OP_BUY; // BUY
   aTicket[1177] = -1; // Ticket given by broker
   aSymbol[1177] = "AUDUSD";
   aLots[1177] = 1.0;
   aDate[1177] = D'2012.01.30 16:04:21'+time_offset*3600;
   aPrice[1177] = 1.0579;

   // ========== 1178 ===== 251 ==========
   aPseudoTicket[1178] = 590;
   aAction[1178] = 1; // OPEN
   aReturn[590] = 1178;
   aType[1178] = OP_SELL; // SELL
   aTicket[1178] = -1; // Ticket given by broker
   aSymbol[1178] = "EURUSD";
   aLots[1178] = 1.0;
   aDate[1178] = D'2012.01.31 10:25:28'+time_offset*3600;
   aPrice[1178] = 1.31826;

   // ========== 1179 ===== 251 ==========
   aPseudoTicket[1179] = 590;
   aAction[1179] = 0; // CLOSE
   aType[1179] = OP_SELL; // SELL
   aTicket[1179] = -1; // Ticket given by broker
   aSymbol[1179] = "EURUSD";
   aLots[1179] = 1.0;
   aDate[1179] = D'2012.01.31 13:09:27'+time_offset*3600;
   aPrice[1179] = 1.31756;

   // ========== 1180 ===== 250 ==========
   aPseudoTicket[1180] = 591;
   aAction[1180] = 1; // OPEN
   aReturn[591] = 1180;
   aType[1180] = OP_BUY; // BUY
   aTicket[1180] = -1; // Ticket given by broker
   aSymbol[1180] = "GBPUSD";
   aLots[1180] = 1.0;
   aDate[1180] = D'2012.02.01 11:51:24'+time_offset*3600;
   aPrice[1180] = 1.57872;

   // ========== 1181 ===== 250 ==========
   aPseudoTicket[1181] = 591;
   aAction[1181] = 0; // CLOSE
   aType[1181] = OP_BUY; // BUY
   aTicket[1181] = -1; // Ticket given by broker
   aSymbol[1181] = "GBPUSD";
   aLots[1181] = 1.0;
   aDate[1181] = D'2012.02.01 12:42:59'+time_offset*3600;
   aPrice[1181] = 1.584;

   // ========== 1182 ===== 249 ==========
   aPseudoTicket[1182] = 592;
   aAction[1182] = 1; // OPEN
   aReturn[592] = 1182;
   aType[1182] = OP_SELL; // SELL
   aTicket[1182] = -1; // Ticket given by broker
   aSymbol[1182] = "GBPUSD";
   aLots[1182] = 1.0;
   aDate[1182] = D'2012.02.03 13:50:13'+time_offset*3600;
   aPrice[1182] = 1.5764;

   // ========== 1183 ===== 248 ==========
   aPseudoTicket[1183] = 593;
   aAction[1183] = 1; // OPEN
   aReturn[593] = 1183;
   aType[1183] = OP_SELL; // SELL
   aTicket[1183] = -1; // Ticket given by broker
   aSymbol[1183] = "GBPUSD";
   aLots[1183] = 1.0;
   aDate[1183] = D'2012.02.03 13:52:52'+time_offset*3600;
   aPrice[1183] = 1.57718;

   // ========== 1184 ===== 249 ==========
   aPseudoTicket[1184] = 592;
   aAction[1184] = 0; // CLOSE
   aType[1184] = OP_SELL; // SELL
   aTicket[1184] = -1; // Ticket given by broker
   aSymbol[1184] = "GBPUSD";
   aLots[1184] = 1.0;
   aDate[1184] = D'2012.02.03 14:16:19'+time_offset*3600;
   aPrice[1184] = 1.57594;

   // ========== 1185 ===== 248 ==========
   aPseudoTicket[1185] = 593;
   aAction[1185] = 0; // CLOSE
   aType[1185] = OP_SELL; // SELL
   aTicket[1185] = -1; // Ticket given by broker
   aSymbol[1185] = "GBPUSD";
   aLots[1185] = 1.0;
   aDate[1185] = D'2012.02.03 14:17:26'+time_offset*3600;
   aPrice[1185] = 1.57657;

   // ========== 1186 ===== 247 ==========
   aPseudoTicket[1186] = 594;
   aAction[1186] = 1; // OPEN
   aReturn[594] = 1186;
   aType[1186] = OP_BUY; // BUY
   aTicket[1186] = -1; // Ticket given by broker
   aSymbol[1186] = "AUDUSD";
   aLots[1186] = 1.0;
   aDate[1186] = D'2012.02.07 03:41:46'+time_offset*3600;
   aPrice[1186] = 1.07824;

   // ========== 1187 ===== 247 ==========
   aPseudoTicket[1187] = 594;
   aAction[1187] = 0; // CLOSE
   aType[1187] = OP_BUY; // BUY
   aTicket[1187] = -1; // Ticket given by broker
   aSymbol[1187] = "AUDUSD";
   aLots[1187] = 1.0;
   aDate[1187] = D'2012.02.07 04:50:26'+time_offset*3600;
   aPrice[1187] = 1.07914;

   // ========== 1188 ===== 246 ==========
   aPseudoTicket[1188] = 595;
   aAction[1188] = 1; // OPEN
   aReturn[595] = 1188;
   aType[1188] = OP_SELL; // SELL
   aTicket[1188] = -1; // Ticket given by broker
   aSymbol[1188] = "AUDUSD";
   aLots[1188] = 1.0;
   aDate[1188] = D'2012.02.08 13:31:43'+time_offset*3600;
   aPrice[1188] = 1.08381;

   // ========== 1189 ===== 246 ==========
   aPseudoTicket[1189] = 595;
   aAction[1189] = 0; // CLOSE
   aType[1189] = OP_SELL; // SELL
   aTicket[1189] = -1; // Ticket given by broker
   aSymbol[1189] = "AUDUSD";
   aLots[1189] = 1.0;
   aDate[1189] = D'2012.02.08 14:36:59'+time_offset*3600;
   aPrice[1189] = 1.08201;

   // ========== 1190 ===== 245 ==========
   aPseudoTicket[1190] = 596;
   aAction[1190] = 1; // OPEN
   aReturn[596] = 1190;
   aType[1190] = OP_BUY; // BUY
   aTicket[1190] = -1; // Ticket given by broker
   aSymbol[1190] = "EURUSD";
   aLots[1190] = 1.0;
   aDate[1190] = D'2012.02.09 13:16:59'+time_offset*3600;
   aPrice[1190] = 1.32964;

   // ========== 1191 ===== 243 ==========
   aPseudoTicket[1191] = 597;
   aAction[1191] = 1; // OPEN
   aReturn[597] = 1191;
   aType[1191] = OP_SELL; // SELL
   aTicket[1191] = -1; // Ticket given by broker
   aSymbol[1191] = "GBPUSD";
   aLots[1191] = 1.0;
   aDate[1191] = D'2012.02.09 13:36:53'+time_offset*3600;
   aPrice[1191] = 1.58478;

   // ========== 1192 ===== 245 ==========
   aPseudoTicket[1192] = 596;
   aAction[1192] = 0; // CLOSE
   aType[1192] = OP_BUY; // BUY
   aTicket[1192] = -1; // Ticket given by broker
   aSymbol[1192] = "EURUSD";
   aLots[1192] = 1.0;
   aDate[1192] = D'2012.02.09 13:40:09'+time_offset*3600;
   aPrice[1192] = 1.32588;

   // ========== 1193 ===== 244 ==========
   aPseudoTicket[1193] = 598;
   aAction[1193] = 1; // OPEN
   aReturn[598] = 1193;
   aType[1193] = OP_SELL; // SELL
   aTicket[1193] = -1; // Ticket given by broker
   aSymbol[1193] = "GBPUSD";
   aLots[1193] = 1.0;
   aDate[1193] = D'2012.02.09 13:45:43'+time_offset*3600;
   aPrice[1193] = 1.58632;

   // ========== 1194 ===== 244 ==========
   aPseudoTicket[1194] = 598;
   aAction[1194] = 0; // CLOSE
   aType[1194] = OP_SELL; // SELL
   aTicket[1194] = -1; // Ticket given by broker
   aSymbol[1194] = "GBPUSD";
   aLots[1194] = 1.0;
   aDate[1194] = D'2012.02.09 23:56:46'+time_offset*3600;
   aPrice[1194] = 1.58102;

   // ========== 1195 ===== 243 ==========
   aPseudoTicket[1195] = 597;
   aAction[1195] = 0; // CLOSE
   aType[1195] = OP_SELL; // SELL
   aTicket[1195] = -1; // Ticket given by broker
   aSymbol[1195] = "GBPUSD";
   aLots[1195] = 1.0;
   aDate[1195] = D'2012.02.10 00:33:18'+time_offset*3600;
   aPrice[1195] = 1.58101;

   // ========== 1196 ===== 242 ==========
   aPseudoTicket[1196] = 599;
   aAction[1196] = 1; // OPEN
   aReturn[599] = 1196;
   aType[1196] = OP_BUY; // BUY
   aTicket[1196] = -1; // Ticket given by broker
   aSymbol[1196] = "AUDUSD";
   aLots[1196] = 1.0;
   aDate[1196] = D'2012.02.10 05:04:45'+time_offset*3600;
   aPrice[1196] = 1.0704;

   // ========== 1197 ===== 242 ==========
   aPseudoTicket[1197] = 599;
   aAction[1197] = 0; // CLOSE
   aType[1197] = OP_BUY; // BUY
   aTicket[1197] = -1; // Ticket given by broker
   aSymbol[1197] = "AUDUSD";
   aLots[1197] = 1.0;
   aDate[1197] = D'2012.02.12 22:24:36'+time_offset*3600;
   aPrice[1197] = 1.069;

   // ========== 1198 ===== 241 ==========
   aPseudoTicket[1198] = 600;
   aAction[1198] = 1; // OPEN
   aReturn[600] = 1198;
   aType[1198] = OP_SELL; // SELL
   aTicket[1198] = -1; // Ticket given by broker
   aSymbol[1198] = "AUDUSD";
   aLots[1198] = 1.0;
   aDate[1198] = D'2012.02.13 08:10:40'+time_offset*3600;
   aPrice[1198] = 1.07532;

   // ========== 1199 ===== 240 ==========
   aPseudoTicket[1199] = 601;
   aAction[1199] = 1; // OPEN
   aReturn[601] = 1199;
   aType[1199] = OP_SELL; // SELL
   aTicket[1199] = -1; // Ticket given by broker
   aSymbol[1199] = "AUDUSD";
   aLots[1199] = 1.0;
   aDate[1199] = D'2012.02.13 08:35:13'+time_offset*3600;
   aPrice[1199] = 1.07675;

   // ========== 1200 ===== 239 ==========
   aPseudoTicket[1200] = 602;
   aAction[1200] = 1; // OPEN
   aReturn[602] = 1200;
   aType[1200] = OP_SELL; // SELL
   aTicket[1200] = -1; // Ticket given by broker
   aSymbol[1200] = "AUDUSD";
   aLots[1200] = 1.0;
   aDate[1200] = D'2012.02.13 08:54:30'+time_offset*3600;
   aPrice[1200] = 1.07741;

   // ========== 1201 ===== 241 ==========
   aPseudoTicket[1201] = 600;
   aAction[1201] = 0; // CLOSE
   aType[1201] = OP_SELL; // SELL
   aTicket[1201] = -1; // Ticket given by broker
   aSymbol[1201] = "AUDUSD";
   aLots[1201] = 1.0;
   aDate[1201] = D'2012.02.13 15:49:06'+time_offset*3600;
   aPrice[1201] = 1.07309;

   // ========== 1202 ===== 240 ==========
   aPseudoTicket[1202] = 601;
   aAction[1202] = 0; // CLOSE
   aType[1202] = OP_SELL; // SELL
   aTicket[1202] = -1; // Ticket given by broker
   aSymbol[1202] = "AUDUSD";
   aLots[1202] = 1.0;
   aDate[1202] = D'2012.02.14 02:04:38'+time_offset*3600;
   aPrice[1202] = 1.06882;

   // ========== 1203 ===== 239 ==========
   aPseudoTicket[1203] = 602;
   aAction[1203] = 0; // CLOSE
   aType[1203] = OP_SELL; // SELL
   aTicket[1203] = -1; // Ticket given by broker
   aSymbol[1203] = "AUDUSD";
   aLots[1203] = 1.0;
   aDate[1203] = D'2012.02.14 03:30:04'+time_offset*3600;
   aPrice[1203] = 1.06735;

   // ========== 1204 ===== 237 ==========
   aPseudoTicket[1204] = 603;
   aAction[1204] = 1; // OPEN
   aReturn[603] = 1204;
   aType[1204] = OP_SELL; // SELL
   aTicket[1204] = -1; // Ticket given by broker
   aSymbol[1204] = "USDJPY";
   aLots[1204] = 1.0;
   aDate[1204] = D'2012.02.14 09:43:48'+time_offset*3600;
   aPrice[1204] = 78.158;

   // ========== 1205 ===== 238 ==========
   aPseudoTicket[1205] = 604;
   aAction[1205] = 1; // OPEN
   aReturn[604] = 1205;
   aType[1205] = OP_SELL; // SELL
   aTicket[1205] = -1; // Ticket given by broker
   aSymbol[1205] = "USDJPY";
   aLots[1205] = 1.0;
   aDate[1205] = D'2012.02.15 12:03:15'+time_offset*3600;
   aPrice[1205] = 78.572;

   // ========== 1206 ===== 238 ==========
   aPseudoTicket[1206] = 604;
   aAction[1206] = 0; // CLOSE
   aType[1206] = OP_SELL; // SELL
   aTicket[1206] = -1; // Ticket given by broker
   aSymbol[1206] = "USDJPY";
   aLots[1206] = 1.0;
   aDate[1206] = D'2012.02.15 14:50:30'+time_offset*3600;
   aPrice[1206] = 78.265;

   // ========== 1207 ===== 237 ==========
   aPseudoTicket[1207] = 603;
   aAction[1207] = 0; // CLOSE
   aType[1207] = OP_SELL; // SELL
   aTicket[1207] = -1; // Ticket given by broker
   aSymbol[1207] = "USDJPY";
   aLots[1207] = 1.0;
   aDate[1207] = D'2012.02.15 14:55:30'+time_offset*3600;
   aPrice[1207] = 78.259;

   // ========== 1208 ===== 236 ==========
   aPseudoTicket[1208] = 605;
   aAction[1208] = 1; // OPEN
   aReturn[605] = 1208;
   aType[1208] = OP_BUY; // BUY
   aTicket[1208] = -1; // Ticket given by broker
   aSymbol[1208] = "EURUSD";
   aLots[1208] = 1.0;
   aDate[1208] = D'2012.02.16 07:01:48'+time_offset*3600;
   aPrice[1208] = 1.29987;

   // ========== 1209 ===== 236 ==========
   aPseudoTicket[1209] = 605;
   aAction[1209] = 0; // CLOSE
   aType[1209] = OP_BUY; // BUY
   aTicket[1209] = -1; // Ticket given by broker
   aSymbol[1209] = "EURUSD";
   aLots[1209] = 1.0;
   aDate[1209] = D'2012.02.16 15:05:31'+time_offset*3600;
   aPrice[1209] = 1.30392;

   // ========== 1210 ===== 231 ==========
   aPseudoTicket[1210] = 606;
   aAction[1210] = 1; // OPEN
   aReturn[606] = 1210;
   aType[1210] = OP_SELL; // SELL
   aTicket[1210] = -1; // Ticket given by broker
   aSymbol[1210] = "USDJPY";
   aLots[1210] = 1.0;
   aDate[1210] = D'2012.02.17 13:03:52'+time_offset*3600;
   aPrice[1210] = 79.219;

   // ========== 1211 ===== 235 ==========
   aPseudoTicket[1211] = 607;
   aAction[1211] = 1; // OPEN
   aReturn[607] = 1211;
   aType[1211] = OP_SELL; // SELL
   aTicket[1211] = -1; // Ticket given by broker
   aSymbol[1211] = "EURUSD";
   aLots[1211] = 1.0;
   aDate[1211] = D'2012.02.17 13:39:16'+time_offset*3600;
   aPrice[1211] = 1.31728;

   // ========== 1212 ===== 235 ==========
   aPseudoTicket[1212] = 607;
   aAction[1212] = 0; // CLOSE
   aType[1212] = OP_SELL; // SELL
   aTicket[1212] = -1; // Ticket given by broker
   aSymbol[1212] = "EURUSD";
   aLots[1212] = 1.0;
   aDate[1212] = D'2012.02.17 17:54:00'+time_offset*3600;
   aPrice[1212] = 1.31541;

   // ========== 1213 ===== 232 ==========
   aPseudoTicket[1213] = 608;
   aAction[1213] = 1; // OPEN
   aReturn[608] = 1213;
   aType[1213] = OP_SELL; // SELL
   aTicket[1213] = -1; // Ticket given by broker
   aSymbol[1213] = "EURUSD";
   aLots[1213] = 1.0;
   aDate[1213] = D'2012.02.19 22:00:08'+time_offset*3600;
   aPrice[1213] = 1.31771;

   // ========== 1214 ===== 233 ==========
   aPseudoTicket[1214] = 609;
   aAction[1214] = 1; // OPEN
   aReturn[609] = 1214;
   aType[1214] = OP_SELL; // SELL
   aTicket[1214] = -1; // Ticket given by broker
   aSymbol[1214] = "EURUSD";
   aLots[1214] = 1.0;
   aDate[1214] = D'2012.02.20 11:53:56'+time_offset*3600;
   aPrice[1214] = 1.32682;

   // ========== 1215 ===== 234 ==========
   aPseudoTicket[1215] = 610;
   aAction[1215] = 1; // OPEN
   aReturn[610] = 1215;
   aType[1215] = OP_SELL; // SELL
   aTicket[1215] = -1; // Ticket given by broker
   aSymbol[1215] = "EURUSD";
   aLots[1215] = 1.0;
   aDate[1215] = D'2012.02.20 11:54:53'+time_offset*3600;
   aPrice[1215] = 1.3268;

   // ========== 1216 ===== 234 ==========
   aPseudoTicket[1216] = 610;
   aAction[1216] = 0; // CLOSE
   aType[1216] = OP_SELL; // SELL
   aTicket[1216] = -1; // Ticket given by broker
   aSymbol[1216] = "EURUSD";
   aLots[1216] = 1.0;
   aDate[1216] = D'2012.02.20 23:59:27'+time_offset*3600;
   aPrice[1216] = 1.32067;

   // ========== 1217 ===== 233 ==========
   aPseudoTicket[1217] = 609;
   aAction[1217] = 0; // CLOSE
   aType[1217] = OP_SELL; // SELL
   aTicket[1217] = -1; // Ticket given by broker
   aSymbol[1217] = "EURUSD";
   aLots[1217] = 1.0;
   aDate[1217] = D'2012.02.21 02:51:08'+time_offset*3600;
   aPrice[1217] = 1.32473;

   // ========== 1218 ===== 232 ==========
   aPseudoTicket[1218] = 608;
   aAction[1218] = 0; // CLOSE
   aType[1218] = OP_SELL; // SELL
   aTicket[1218] = -1; // Ticket given by broker
   aSymbol[1218] = "EURUSD";
   aLots[1218] = 1.0;
   aDate[1218] = D'2012.02.21 02:51:59'+time_offset*3600;
   aPrice[1218] = 1.32536;

   // ========== 1219 ===== 230 ==========
   aPseudoTicket[1219] = 611;
   aAction[1219] = 1; // OPEN
   aReturn[611] = 1219;
   aType[1219] = OP_BUY; // BUY
   aTicket[1219] = -1; // Ticket given by broker
   aSymbol[1219] = "EURUSD";
   aLots[1219] = 1.0;
   aDate[1219] = D'2012.02.21 03:12:35'+time_offset*3600;
   aPrice[1219] = 1.32911;

   // ========== 1220 ===== 231 ==========
   aPseudoTicket[1220] = 606;
   aAction[1220] = 0; // CLOSE
   aType[1220] = OP_SELL; // SELL
   aTicket[1220] = -1; // Ticket given by broker
   aSymbol[1220] = "USDJPY";
   aLots[1220] = 1.0;
   aDate[1220] = D'2012.02.21 07:16:40'+time_offset*3600;
   aPrice[1220] = 79.8;

   // ========== 1221 ===== 230 ==========
   aPseudoTicket[1221] = 611;
   aAction[1221] = 0; // CLOSE
   aType[1221] = OP_BUY; // BUY
   aTicket[1221] = -1; // Ticket given by broker
   aSymbol[1221] = "EURUSD";
   aLots[1221] = 1.0;
   aDate[1221] = D'2012.02.21 07:23:00'+time_offset*3600;
   aPrice[1221] = 1.32525;

   // ========== 1222 ===== 228 ==========
   aPseudoTicket[1222] = 612;
   aAction[1222] = 1; // OPEN
   aReturn[612] = 1222;
   aType[1222] = OP_SELL; // SELL
   aTicket[1222] = -1; // Ticket given by broker
   aSymbol[1222] = "USDJPY";
   aLots[1222] = 1.0;
   aDate[1222] = D'2012.02.22 05:31:16'+time_offset*3600;
   aPrice[1222] = 80.063;

   // ========== 1223 ===== 229 ==========
   aPseudoTicket[1223] = 613;
   aAction[1223] = 1; // OPEN
   aReturn[613] = 1223;
   aType[1223] = OP_SELL; // SELL
   aTicket[1223] = -1; // Ticket given by broker
   aSymbol[1223] = "USDJPY";
   aLots[1223] = 1.0;
   aDate[1223] = D'2012.02.22 09:11:42'+time_offset*3600;
   aPrice[1223] = 80.216;

   // ========== 1224 ===== 229 ==========
   aPseudoTicket[1224] = 613;
   aAction[1224] = 0; // CLOSE
   aType[1224] = OP_SELL; // SELL
   aTicket[1224] = -1; // Ticket given by broker
   aSymbol[1224] = "USDJPY";
   aLots[1224] = 1.0;
   aDate[1224] = D'2012.02.23 22:38:18'+time_offset*3600;
   aPrice[1224] = 79.962;

   // ========== 1225 ===== 225 ==========
   aPseudoTicket[1225] = 614;
   aAction[1225] = 1; // OPEN
   aReturn[614] = 1225;
   aType[1225] = OP_SELL; // SELL
   aTicket[1225] = -1; // Ticket given by broker
   aSymbol[1225] = "EURUSD";
   aLots[1225] = 1.0;
   aDate[1225] = D'2012.02.24 12:00:46'+time_offset*3600;
   aPrice[1225] = 1.34119;

   // ========== 1226 ===== 226 ==========
   aPseudoTicket[1226] = 615;
   aAction[1226] = 1; // OPEN
   aReturn[615] = 1226;
   aType[1226] = OP_SELL; // SELL
   aTicket[1226] = -1; // Ticket given by broker
   aSymbol[1226] = "EURUSD";
   aLots[1226] = 1.0;
   aDate[1226] = D'2012.02.24 18:49:15'+time_offset*3600;
   aPrice[1226] = 1.34649;

   // ========== 1227 ===== 228 ==========
   aPseudoTicket[1227] = 612;
   aAction[1227] = 0; // CLOSE
   aType[1227] = OP_SELL; // SELL
   aTicket[1227] = -1; // Ticket given by broker
   aSymbol[1227] = "USDJPY";
   aLots[1227] = 1.0;
   aDate[1227] = D'2012.02.24 19:34:36'+time_offset*3600;
   aPrice[1227] = 80.936;

   // ========== 1228 ===== 227 ==========
   aPseudoTicket[1228] = 616;
   aAction[1228] = 1; // OPEN
   aReturn[616] = 1228;
   aType[1228] = OP_BUY; // BUY
   aTicket[1228] = -1; // Ticket given by broker
   aSymbol[1228] = "USDJPY";
   aLots[1228] = 1.0;
   aDate[1228] = D'2012.02.27 09:33:51'+time_offset*3600;
   aPrice[1228] = 80.647;

   // ========== 1229 ===== 227 ==========
   aPseudoTicket[1229] = 616;
   aAction[1229] = 0; // CLOSE
   aType[1229] = OP_BUY; // BUY
   aTicket[1229] = -1; // Ticket given by broker
   aSymbol[1229] = "USDJPY";
   aLots[1229] = 1.0;
   aDate[1229] = D'2012.02.27 10:03:25'+time_offset*3600;
   aPrice[1229] = 80.636;

   // ========== 1230 ===== 226 ==========
   aPseudoTicket[1230] = 615;
   aAction[1230] = 0; // CLOSE
   aType[1230] = OP_SELL; // SELL
   aTicket[1230] = -1; // Ticket given by broker
   aSymbol[1230] = "EURUSD";
   aLots[1230] = 1.0;
   aDate[1230] = D'2012.02.27 10:21:19'+time_offset*3600;
   aPrice[1230] = 1.34194;

   // ========== 1231 ===== 225 ==========
   aPseudoTicket[1231] = 614;
   aAction[1231] = 0; // CLOSE
   aType[1231] = OP_SELL; // SELL
   aTicket[1231] = -1; // Ticket given by broker
   aSymbol[1231] = "EURUSD";
   aLots[1231] = 1.0;
   aDate[1231] = D'2012.02.27 10:25:26'+time_offset*3600;
   aPrice[1231] = 1.34146;

   // ========== 1232 ===== 224 ==========
   aPseudoTicket[1232] = 617;
   aAction[1232] = 1; // OPEN
   aReturn[617] = 1232;
   aType[1232] = OP_BUY; // BUY
   aTicket[1232] = -1; // Ticket given by broker
   aSymbol[1232] = "EURUSD";
   aLots[1232] = 1.0;
   aDate[1232] = D'2012.02.27 12:30:14'+time_offset*3600;
   aPrice[1232] = 1.33922;

   // ========== 1233 ===== 224 ==========
   aPseudoTicket[1233] = 617;
   aAction[1233] = 0; // CLOSE
   aType[1233] = OP_BUY; // BUY
   aTicket[1233] = -1; // Ticket given by broker
   aSymbol[1233] = "EURUSD";
   aLots[1233] = 1.0;
   aDate[1233] = D'2012.02.27 15:45:05'+time_offset*3600;
   aPrice[1233] = 1.3413;

   // ========== 1234 ===== 223 ==========
   aPseudoTicket[1234] = 618;
   aAction[1234] = 1; // OPEN
   aReturn[618] = 1234;
   aType[1234] = OP_BUY; // BUY
   aTicket[1234] = -1; // Ticket given by broker
   aSymbol[1234] = "USDJPY";
   aLots[1234] = 1.0;
   aDate[1234] = D'2012.02.28 03:48:08'+time_offset*3600;
   aPrice[1234] = 80.18;

   // ========== 1235 ===== 223 ==========
   aPseudoTicket[1235] = 618;
   aAction[1235] = 0; // CLOSE
   aType[1235] = OP_BUY; // BUY
   aTicket[1235] = -1; // Ticket given by broker
   aSymbol[1235] = "USDJPY";
   aLots[1235] = 1.0;
   aDate[1235] = D'2012.02.28 06:30:02'+time_offset*3600;
   aPrice[1235] = 80.623;

   // ========== 1236 ===== 222 ==========
   aPseudoTicket[1236] = 619;
   aAction[1236] = 1; // OPEN
   aReturn[619] = 1236;
   aType[1236] = OP_BUY; // BUY
   aTicket[1236] = -1; // Ticket given by broker
   aSymbol[1236] = "USDCHF";
   aLots[1236] = 1.0;
   aDate[1236] = D'2012.02.28 08:14:19'+time_offset*3600;
   aPrice[1236] = 0.89614;

   // ========== 1237 ===== 222 ==========
   aPseudoTicket[1237] = 619;
   aAction[1237] = 0; // CLOSE
   aType[1237] = OP_BUY; // BUY
   aTicket[1237] = -1; // Ticket given by broker
   aSymbol[1237] = "USDCHF";
   aLots[1237] = 1.0;
   aDate[1237] = D'2012.02.28 09:07:32'+time_offset*3600;
   aPrice[1237] = 0.89667;

   // ========== 1238 ===== 221 ==========
   aPseudoTicket[1238] = 620;
   aAction[1238] = 1; // OPEN
   aReturn[620] = 1238;
   aType[1238] = OP_SELL; // SELL
   aTicket[1238] = -1; // Ticket given by broker
   aSymbol[1238] = "USDCHF";
   aLots[1238] = 1.0;
   aDate[1238] = D'2012.02.28 09:31:00'+time_offset*3600;
   aPrice[1238] = 0.89746;

   // ========== 1239 ===== 221 ==========
   aPseudoTicket[1239] = 620;
   aAction[1239] = 0; // CLOSE
   aType[1239] = OP_SELL; // SELL
   aTicket[1239] = -1; // Ticket given by broker
   aSymbol[1239] = "USDCHF";
   aLots[1239] = 1.0;
   aDate[1239] = D'2012.02.28 10:00:39'+time_offset*3600;
   aPrice[1239] = 0.89704;

   // ========== 1240 ===== 220 ==========
   aPseudoTicket[1240] = 621;
   aAction[1240] = 1; // OPEN
   aReturn[621] = 1240;
   aType[1240] = OP_BUY; // BUY
   aTicket[1240] = -1; // Ticket given by broker
   aSymbol[1240] = "EURUSD";
   aLots[1240] = 1.0;
   aDate[1240] = D'2012.03.01 14:00:11'+time_offset*3600;
   aPrice[1240] = 1.32927;

   // ========== 1241 ===== 220 ==========
   aPseudoTicket[1241] = 621;
   aAction[1241] = 0; // CLOSE
   aType[1241] = OP_BUY; // BUY
   aTicket[1241] = -1; // Ticket given by broker
   aSymbol[1241] = "EURUSD";
   aLots[1241] = 1.0;
   aDate[1241] = D'2012.03.01 20:17:22'+time_offset*3600;
   aPrice[1241] = 1.33134;

   // ========== 1242 ===== 218 ==========
   aPseudoTicket[1242] = 622;
   aAction[1242] = 1; // OPEN
   aReturn[622] = 1242;
   aType[1242] = OP_SELL; // SELL
   aTicket[1242] = -1; // Ticket given by broker
   aSymbol[1242] = "USDJPY";
   aLots[1242] = 1.0;
   aDate[1242] = D'2012.03.02 04:05:30'+time_offset*3600;
   aPrice[1242] = 81.479;

   // ========== 1243 ===== 219 ==========
   aPseudoTicket[1243] = 623;
   aAction[1243] = 1; // OPEN
   aReturn[623] = 1243;
   aType[1243] = OP_SELL; // SELL
   aTicket[1243] = -1; // Ticket given by broker
   aSymbol[1243] = "USDJPY";
   aLots[1243] = 1.0;
   aDate[1243] = D'2012.03.02 07:56:31'+time_offset*3600;
   aPrice[1243] = 81.611;

   // ========== 1244 ===== 219 ==========
   aPseudoTicket[1244] = 623;
   aAction[1244] = 0; // CLOSE
   aType[1244] = OP_SELL; // SELL
   aTicket[1244] = -1; // Ticket given by broker
   aSymbol[1244] = "USDJPY";
   aLots[1244] = 1.0;
   aDate[1244] = D'2012.03.02 11:05:38'+time_offset*3600;
   aPrice[1244] = 81.502;

   // ========== 1245 ===== 218 ==========
   aPseudoTicket[1245] = 622;
   aAction[1245] = 0; // CLOSE
   aType[1245] = OP_SELL; // SELL
   aTicket[1245] = -1; // Ticket given by broker
   aSymbol[1245] = "USDJPY";
   aLots[1245] = 1.0;
   aDate[1245] = D'2012.03.02 11:30:09'+time_offset*3600;
   aPrice[1245] = 81.479;

   // ========== 1246 ===== 217 ==========
   aPseudoTicket[1246] = 624;
   aAction[1246] = 1; // OPEN
   aReturn[624] = 1246;
   aType[1246] = OP_SELL; // SELL
   aTicket[1246] = -1; // Ticket given by broker
   aSymbol[1246] = "USDCHF";
   aLots[1246] = 1.0;
   aDate[1246] = D'2012.03.02 12:06:18'+time_offset*3600;
   aPrice[1246] = 0.9125;

   // ========== 1247 ===== 216 ==========
   aPseudoTicket[1247] = 625;
   aAction[1247] = 1; // OPEN
   aReturn[625] = 1247;
   aType[1247] = OP_BUY; // BUY
   aTicket[1247] = -1; // Ticket given by broker
   aSymbol[1247] = "EURUSD";
   aLots[1247] = 1.0;
   aDate[1247] = D'2012.03.02 15:04:10'+time_offset*3600;
   aPrice[1247] = 1.319;

   // ========== 1248 ===== 217 ==========
   aPseudoTicket[1248] = 624;
   aAction[1248] = 0; // CLOSE
   aType[1248] = OP_SELL; // SELL
   aTicket[1248] = -1; // Ticket given by broker
   aSymbol[1248] = "USDCHF";
   aLots[1248] = 1.0;
   aDate[1248] = D'2012.03.05 07:08:38'+time_offset*3600;
   aPrice[1248] = 0.91304;

   // ========== 1249 ===== 216 ==========
   aPseudoTicket[1249] = 625;
   aAction[1249] = 0; // CLOSE
   aType[1249] = OP_BUY; // BUY
   aTicket[1249] = -1; // Ticket given by broker
   aSymbol[1249] = "EURUSD";
   aLots[1249] = 1.0;
   aDate[1249] = D'2012.03.05 07:08:44'+time_offset*3600;
   aPrice[1249] = 1.32026;

   // ========== 1250 ===== 215 ==========
   aPseudoTicket[1250] = 626;
   aAction[1250] = 1; // OPEN
   aReturn[626] = 1250;
   aType[1250] = OP_BUY; // BUY
   aTicket[1250] = -1; // Ticket given by broker
   aSymbol[1250] = "GBPUSD";
   aLots[1250] = 1.0;
   aDate[1250] = D'2012.03.05 08:02:19'+time_offset*3600;
   aPrice[1250] = 1.58048;

   // ========== 1251 ===== 214 ==========
   aPseudoTicket[1251] = 627;
   aAction[1251] = 1; // OPEN
   aReturn[627] = 1251;
   aType[1251] = OP_BUY; // BUY
   aTicket[1251] = -1; // Ticket given by broker
   aSymbol[1251] = "GBPUSD";
   aLots[1251] = 1.0;
   aDate[1251] = D'2012.03.05 08:24:15'+time_offset*3600;
   aPrice[1251] = 1.57926;

   // ========== 1252 ===== 215 ==========
   aPseudoTicket[1252] = 626;
   aAction[1252] = 0; // CLOSE
   aType[1252] = OP_BUY; // BUY
   aTicket[1252] = -1; // Ticket given by broker
   aSymbol[1252] = "GBPUSD";
   aLots[1252] = 1.0;
   aDate[1252] = D'2012.03.05 08:52:20'+time_offset*3600;
   aPrice[1252] = 1.58112;

   // ========== 1253 ===== 213 ==========
   aPseudoTicket[1253] = 628;
   aAction[1253] = 1; // OPEN
   aReturn[628] = 1253;
   aType[1253] = OP_BUY; // BUY
   aTicket[1253] = -1; // Ticket given by broker
   aSymbol[1253] = "EURUSD";
   aLots[1253] = 1.0;
   aDate[1253] = D'2012.03.05 09:09:03'+time_offset*3600;
   aPrice[1253] = 1.31746;

   // ========== 1254 ===== 214 ==========
   aPseudoTicket[1254] = 627;
   aAction[1254] = 0; // CLOSE
   aType[1254] = OP_BUY; // BUY
   aTicket[1254] = -1; // Ticket given by broker
   aSymbol[1254] = "GBPUSD";
   aLots[1254] = 1.0;
   aDate[1254] = D'2012.03.05 12:08:35'+time_offset*3600;
   aPrice[1254] = 1.58167;

   // ========== 1255 ===== 213 ==========
   aPseudoTicket[1255] = 628;
   aAction[1255] = 0; // CLOSE
   aType[1255] = OP_BUY; // BUY
   aTicket[1255] = -1; // Ticket given by broker
   aSymbol[1255] = "EURUSD";
   aLots[1255] = 1.0;
   aDate[1255] = D'2012.03.05 12:31:54'+time_offset*3600;
   aPrice[1255] = 1.32024;

   // ========== 1256 ===== 212 ==========
   aPseudoTicket[1256] = 629;
   aAction[1256] = 1; // OPEN
   aReturn[629] = 1256;
   aType[1256] = OP_SELL; // SELL
   aTicket[1256] = -1; // Ticket given by broker
   aSymbol[1256] = "GBPUSD";
   aLots[1256] = 1.0;
   aDate[1256] = D'2012.03.06 10:30:49'+time_offset*3600;
   aPrice[1256] = 1.57736;

   // ========== 1257 ===== 212 ==========
   aPseudoTicket[1257] = 629;
   aAction[1257] = 0; // CLOSE
   aType[1257] = OP_SELL; // SELL
   aTicket[1257] = -1; // Ticket given by broker
   aSymbol[1257] = "GBPUSD";
   aLots[1257] = 1.0;
   aDate[1257] = D'2012.03.06 14:33:21'+time_offset*3600;
   aPrice[1257] = 1.57658;

   // ========== 1258 ===== 211 ==========
   aPseudoTicket[1258] = 630;
   aAction[1258] = 1; // OPEN
   aReturn[630] = 1258;
   aType[1258] = OP_SELL; // SELL
   aTicket[1258] = -1; // Ticket given by broker
   aSymbol[1258] = "GBPUSD";
   aLots[1258] = 1.0;
   aDate[1258] = D'2012.03.08 09:13:38'+time_offset*3600;
   aPrice[1258] = 1.5794;

   // ========== 1259 ===== 208 ==========
   aPseudoTicket[1259] = 631;
   aAction[1259] = 1; // OPEN
   aReturn[631] = 1259;
   aType[1259] = OP_SELL; // SELL
   aTicket[1259] = -1; // Ticket given by broker
   aSymbol[1259] = "EURUSD";
   aLots[1259] = 1.0;
   aDate[1259] = D'2012.03.08 09:33:01'+time_offset*3600;
   aPrice[1259] = 1.32003;

   // ========== 1260 ===== 211 ==========
   aPseudoTicket[1260] = 630;
   aAction[1260] = 0; // CLOSE
   aType[1260] = OP_SELL; // SELL
   aTicket[1260] = -1; // Ticket given by broker
   aSymbol[1260] = "GBPUSD";
   aLots[1260] = 1.0;
   aDate[1260] = D'2012.03.08 11:17:50'+time_offset*3600;
   aPrice[1260] = 1.57919;

   // ========== 1261 ===== 209 ==========
   aPseudoTicket[1261] = 632;
   aAction[1261] = 1; // OPEN
   aReturn[632] = 1261;
   aType[1261] = OP_SELL; // SELL
   aTicket[1261] = -1; // Ticket given by broker
   aSymbol[1261] = "EURUSD";
   aLots[1261] = 1.0;
   aDate[1261] = D'2012.03.08 11:50:14'+time_offset*3600;
   aPrice[1261] = 1.32362;

   // ========== 1262 ===== 210 ==========
   aPseudoTicket[1262] = 633;
   aAction[1262] = 1; // OPEN
   aReturn[633] = 1262;
   aType[1262] = OP_SELL; // SELL
   aTicket[1262] = -1; // Ticket given by broker
   aSymbol[1262] = "EURUSD";
   aLots[1262] = 1.0;
   aDate[1262] = D'2012.03.08 12:16:30'+time_offset*3600;
   aPrice[1262] = 1.32441;

   // ========== 1263 ===== 210 ==========
   aPseudoTicket[1263] = 633;
   aAction[1263] = 0; // CLOSE
   aType[1263] = OP_SELL; // SELL
   aTicket[1263] = -1; // Ticket given by broker
   aSymbol[1263] = "EURUSD";
   aLots[1263] = 1.0;
   aDate[1263] = D'2012.03.09 06:29:10'+time_offset*3600;
   aPrice[1263] = 1.32354;

   // ========== 1264 ===== 209 ==========
   aPseudoTicket[1264] = 632;
   aAction[1264] = 0; // CLOSE
   aType[1264] = OP_SELL; // SELL
   aTicket[1264] = -1; // Ticket given by broker
   aSymbol[1264] = "EURUSD";
   aLots[1264] = 1.0;
   aDate[1264] = D'2012.03.09 07:53:29'+time_offset*3600;
   aPrice[1264] = 1.32237;

   // ========== 1265 ===== 208 ==========
   aPseudoTicket[1265] = 631;
   aAction[1265] = 0; // CLOSE
   aType[1265] = OP_SELL; // SELL
   aTicket[1265] = -1; // Ticket given by broker
   aSymbol[1265] = "EURUSD";
   aLots[1265] = 1.0;
   aDate[1265] = D'2012.03.09 08:01:28'+time_offset*3600;
   aPrice[1265] = 1.32198;

   // ========== 1266 ===== 207 ==========
   aPseudoTicket[1266] = 634;
   aAction[1266] = 1; // OPEN
   aReturn[634] = 1266;
   aType[1266] = OP_BUY; // BUY
   aTicket[1266] = -1; // Ticket given by broker
   aSymbol[1266] = "USDJPY";
   aLots[1266] = 1.0;
   aDate[1266] = D'2012.03.09 13:40:22'+time_offset*3600;
   aPrice[1266] = 82.136;

   // ========== 1267 ===== 207 ==========
   aPseudoTicket[1267] = 634;
   aAction[1267] = 0; // CLOSE
   aType[1267] = OP_BUY; // BUY
   aTicket[1267] = -1; // Ticket given by broker
   aSymbol[1267] = "USDJPY";
   aLots[1267] = 1.0;
   aDate[1267] = D'2012.03.09 13:42:06'+time_offset*3600;
   aPrice[1267] = 82.276;

   // ========== 1268 ===== 206 ==========
   aPseudoTicket[1268] = 635;
   aAction[1268] = 1; // OPEN
   aReturn[635] = 1268;
   aType[1268] = OP_BUY; // BUY
   aTicket[1268] = -1; // Ticket given by broker
   aSymbol[1268] = "EURUSD";
   aLots[1268] = 1.0;
   aDate[1268] = D'2012.03.09 13:51:54'+time_offset*3600;
   aPrice[1268] = 1.31397;

   // ========== 1269 ===== 206 ==========
   aPseudoTicket[1269] = 635;
   aAction[1269] = 0; // CLOSE
   aType[1269] = OP_BUY; // BUY
   aTicket[1269] = -1; // Ticket given by broker
   aSymbol[1269] = "EURUSD";
   aLots[1269] = 1.0;
   aDate[1269] = D'2012.03.12 01:27:28'+time_offset*3600;
   aPrice[1269] = 1.30869;

   // ========== 1270 ===== 205 ==========
   aPseudoTicket[1270] = 636;
   aAction[1270] = 1; // OPEN
   aReturn[636] = 1270;
   aType[1270] = OP_BUY; // BUY
   aTicket[1270] = -1; // Ticket given by broker
   aSymbol[1270] = "USDCHF";
   aLots[1270] = 1.0;
   aDate[1270] = D'2012.03.12 13:44:40'+time_offset*3600;
   aPrice[1270] = 0.91865;

   // ========== 1271 ===== 205 ==========
   aPseudoTicket[1271] = 636;
   aAction[1271] = 0; // CLOSE
   aType[1271] = OP_BUY; // BUY
   aTicket[1271] = -1; // Ticket given by broker
   aSymbol[1271] = "USDCHF";
   aLots[1271] = 1.0;
   aDate[1271] = D'2012.03.13 11:04:42'+time_offset*3600;
   aPrice[1271] = 0.91946;

   // ========== 1272 ===== 204 ==========
   aPseudoTicket[1272] = 637;
   aAction[1272] = 1; // OPEN
   aReturn[637] = 1272;
   aType[1272] = OP_SELL; // SELL
   aTicket[1272] = -1; // Ticket given by broker
   aSymbol[1272] = "EURUSD";
   aLots[1272] = 1.0;
   aDate[1272] = D'2012.03.14 05:49:42'+time_offset*3600;
   aPrice[1272] = 1.30523;

   // ========== 1273 ===== 204 ==========
   aPseudoTicket[1273] = 637;
   aAction[1273] = 0; // CLOSE
   aType[1273] = OP_SELL; // SELL
   aTicket[1273] = -1; // Ticket given by broker
   aSymbol[1273] = "EURUSD";
   aLots[1273] = 1.0;
   aDate[1273] = D'2012.03.14 11:01:29'+time_offset*3600;
   aPrice[1273] = 1.308;

   // ========== 1274 ===== 203 ==========
   aPseudoTicket[1274] = 638;
   aAction[1274] = 1; // OPEN
   aReturn[638] = 1274;
   aType[1274] = OP_SELL; // SELL
   aTicket[1274] = -1; // Ticket given by broker
   aSymbol[1274] = "USDJPY";
   aLots[1274] = 1.0;
   aDate[1274] = D'2012.03.14 17:58:49'+time_offset*3600;
   aPrice[1274] = 83.637;

   // ========== 1275 ===== 201 ==========
   aPseudoTicket[1275] = 639;
   aAction[1275] = 1; // OPEN
   aReturn[639] = 1275;
   aType[1275] = OP_SELL; // SELL
   aTicket[1275] = -1; // Ticket given by broker
   aSymbol[1275] = "USDJPY";
   aLots[1275] = 1.0;
   aDate[1275] = D'2012.03.14 23:58:35'+time_offset*3600;
   aPrice[1275] = 83.837;

   // ========== 1276 ===== 200 ==========
   aPseudoTicket[1276] = 640;
   aAction[1276] = 1; // OPEN
   aReturn[640] = 1276;
   aType[1276] = OP_SELL; // SELL
   aTicket[1276] = -1; // Ticket given by broker
   aSymbol[1276] = "USDJPY";
   aLots[1276] = 1.0;
   aDate[1276] = D'2012.03.15 00:24:24'+time_offset*3600;
   aPrice[1276] = 83.951;

   // ========== 1277 ===== 202 ==========
   aPseudoTicket[1277] = 641;
   aAction[1277] = 1; // OPEN
   aReturn[641] = 1277;
   aType[1277] = OP_SELL; // SELL
   aTicket[1277] = -1; // Ticket given by broker
   aSymbol[1277] = "USDJPY";
   aLots[1277] = 1.0;
   aDate[1277] = D'2012.03.15 03:16:32'+time_offset*3600;
   aPrice[1277] = 84.077;

   // ========== 1278 ===== 203 ==========
   aPseudoTicket[1278] = 638;
   aAction[1278] = 0; // CLOSE
   aType[1278] = OP_SELL; // SELL
   aTicket[1278] = -1; // Ticket given by broker
   aSymbol[1278] = "USDJPY";
   aLots[1278] = 1.0;
   aDate[1278] = D'2012.03.15 10:40:16'+time_offset*3600;
   aPrice[1278] = 83.538;

   // ========== 1279 ===== 202 ==========
   aPseudoTicket[1279] = 641;
   aAction[1279] = 0; // CLOSE
   aType[1279] = OP_SELL; // SELL
   aTicket[1279] = -1; // Ticket given by broker
   aSymbol[1279] = "USDJPY";
   aLots[1279] = 1.0;
   aDate[1279] = D'2012.03.15 10:45:48'+time_offset*3600;
   aPrice[1279] = 83.463;

   // ========== 1280 ===== 201 ==========
   aPseudoTicket[1280] = 639;
   aAction[1280] = 0; // CLOSE
   aType[1280] = OP_SELL; // SELL
   aTicket[1280] = -1; // Ticket given by broker
   aSymbol[1280] = "USDJPY";
   aLots[1280] = 1.0;
   aDate[1280] = D'2012.03.15 11:29:55'+time_offset*3600;
   aPrice[1280] = 83.3;

   // ========== 1281 ===== 200 ==========
   aPseudoTicket[1281] = 640;
   aAction[1281] = 0; // CLOSE
   aType[1281] = OP_SELL; // SELL
   aTicket[1281] = -1; // Ticket given by broker
   aSymbol[1281] = "USDJPY";
   aLots[1281] = 1.0;
   aDate[1281] = D'2012.03.15 11:44:04'+time_offset*3600;
   aPrice[1281] = 83.327;

   // ========== 1282 ===== 199 ==========
   aPseudoTicket[1282] = 642;
   aAction[1282] = 1; // OPEN
   aReturn[642] = 1282;
   aType[1282] = OP_BUY; // BUY
   aTicket[1282] = -1; // Ticket given by broker
   aSymbol[1282] = "EURUSD";
   aLots[1282] = 1.0;
   aDate[1282] = D'2012.03.16 10:53:03'+time_offset*3600;
   aPrice[1282] = 1.30557;

   // ========== 1283 ===== 199 ==========
   aPseudoTicket[1283] = 642;
   aAction[1283] = 0; // CLOSE
   aType[1283] = OP_BUY; // BUY
   aTicket[1283] = -1; // Ticket given by broker
   aSymbol[1283] = "EURUSD";
   aLots[1283] = 1.0;
   aDate[1283] = D'2012.03.16 11:07:08'+time_offset*3600;
   aPrice[1283] = 1.30668;

   // ========== 1284 ===== 198 ==========
   aPseudoTicket[1284] = 643;
   aAction[1284] = 1; // OPEN
   aReturn[643] = 1284;
   aType[1284] = OP_SELL; // SELL
   aTicket[1284] = -1; // Ticket given by broker
   aSymbol[1284] = "GBPUSD";
   aLots[1284] = 1.0;
   aDate[1284] = D'2012.03.19 15:56:56'+time_offset*3600;
   aPrice[1284] = 1.59006;

   // ========== 1285 ===== 198 ==========
   aPseudoTicket[1285] = 643;
   aAction[1285] = 0; // CLOSE
   aType[1285] = OP_SELL; // SELL
   aTicket[1285] = -1; // Ticket given by broker
   aSymbol[1285] = "GBPUSD";
   aLots[1285] = 1.0;
   aDate[1285] = D'2012.03.19 22:28:31'+time_offset*3600;
   aPrice[1285] = 1.58944;

   // ========== 1286 ===== 197 ==========
   aPseudoTicket[1286] = 644;
   aAction[1286] = 1; // OPEN
   aReturn[644] = 1286;
   aType[1286] = OP_SELL; // SELL
   aTicket[1286] = -1; // Ticket given by broker
   aSymbol[1286] = "EURUSD";
   aLots[1286] = 1.0;
   aDate[1286] = D'2012.03.21 15:05:20'+time_offset*3600;
   aPrice[1286] = 1.31889;

   // ========== 1287 ===== 197 ==========
   aPseudoTicket[1287] = 644;
   aAction[1287] = 0; // CLOSE
   aType[1287] = OP_SELL; // SELL
   aTicket[1287] = -1; // Ticket given by broker
   aSymbol[1287] = "EURUSD";
   aLots[1287] = 1.0;
   aDate[1287] = D'2012.03.21 16:09:44'+time_offset*3600;
   aPrice[1287] = 1.32019;

   // ========== 1288 ===== 196 ==========
   aPseudoTicket[1288] = 645;
   aAction[1288] = 1; // OPEN
   aReturn[645] = 1288;
   aType[1288] = OP_SELL; // SELL
   aTicket[1288] = -1; // Ticket given by broker
   aSymbol[1288] = "EURUSD";
   aLots[1288] = 1.0;
   aDate[1288] = D'2012.03.22 08:31:49'+time_offset*3600;
   aPrice[1288] = 1.31624;

   // ========== 1289 ===== 196 ==========
   aPseudoTicket[1289] = 645;
   aAction[1289] = 0; // CLOSE
   aType[1289] = OP_SELL; // SELL
   aTicket[1289] = -1; // Ticket given by broker
   aSymbol[1289] = "EURUSD";
   aLots[1289] = 1.0;
   aDate[1289] = D'2012.03.22 16:01:45'+time_offset*3600;
   aPrice[1289] = 1.32;

   // ========== 1290 ===== 195 ==========
   aPseudoTicket[1290] = 646;
   aAction[1290] = 1; // OPEN
   aReturn[646] = 1290;
   aType[1290] = OP_BUY; // BUY
   aTicket[1290] = -1; // Ticket given by broker
   aSymbol[1290] = "EURUSD";
   aLots[1290] = 1.0;
   aDate[1290] = D'2012.03.23 09:23:51'+time_offset*3600;
   aPrice[1290] = 1.32677;

   // ========== 1291 ===== 194 ==========
   aPseudoTicket[1291] = 647;
   aAction[1291] = 1; // OPEN
   aReturn[647] = 1291;
   aType[1291] = OP_SELL; // SELL
   aTicket[1291] = -1; // Ticket given by broker
   aSymbol[1291] = "AUDUSD";
   aLots[1291] = 1.0;
   aDate[1291] = D'2012.03.25 22:15:16'+time_offset*3600;
   aPrice[1291] = 1.04814;

   // ========== 1292 ===== 195 ==========
   aPseudoTicket[1292] = 646;
   aAction[1292] = 0; // CLOSE
   aType[1292] = OP_BUY; // BUY
   aTicket[1292] = -1; // Ticket given by broker
   aSymbol[1292] = "EURUSD";
   aLots[1292] = 1.0;
   aDate[1292] = D'2012.03.26 06:29:41'+time_offset*3600;
   aPrice[1292] = 1.32538;

   // ========== 1293 ===== 194 ==========
   aPseudoTicket[1293] = 647;
   aAction[1293] = 0; // CLOSE
   aType[1293] = OP_SELL; // SELL
   aTicket[1293] = -1; // Ticket given by broker
   aSymbol[1293] = "AUDUSD";
   aLots[1293] = 1.0;
   aDate[1293] = D'2012.03.26 06:39:36'+time_offset*3600;
   aPrice[1293] = 1.0431;

   // ========== 1294 ===== 193 ==========
   aPseudoTicket[1294] = 648;
   aAction[1294] = 1; // OPEN
   aReturn[648] = 1294;
   aType[1294] = OP_SELL; // SELL
   aTicket[1294] = -1; // Ticket given by broker
   aSymbol[1294] = "EURUSD";
   aLots[1294] = 1.0;
   aDate[1294] = D'2012.03.26 08:42:33'+time_offset*3600;
   aPrice[1294] = 1.32075;

   // ========== 1295 ===== 193 ==========
   aPseudoTicket[1295] = 648;
   aAction[1295] = 0; // CLOSE
   aType[1295] = OP_SELL; // SELL
   aTicket[1295] = -1; // Ticket given by broker
   aSymbol[1295] = "EURUSD";
   aLots[1295] = 1.0;
   aDate[1295] = D'2012.03.26 11:08:16'+time_offset*3600;
   aPrice[1295] = 1.3247;

   // ========== 1296 ===== 192 ==========
   aPseudoTicket[1296] = 649;
   aAction[1296] = 1; // OPEN
   aReturn[649] = 1296;
   aType[1296] = OP_BUY; // BUY
   aTicket[1296] = -1; // Ticket given by broker
   aSymbol[1296] = "GBPUSD";
   aLots[1296] = 1.0;
   aDate[1296] = D'2012.03.26 11:15:51'+time_offset*3600;
   aPrice[1296] = 1.58869;

   // ========== 1297 ===== 192 ==========
   aPseudoTicket[1297] = 649;
   aAction[1297] = 0; // CLOSE
   aType[1297] = OP_BUY; // BUY
   aTicket[1297] = -1; // Ticket given by broker
   aSymbol[1297] = "GBPUSD";
   aLots[1297] = 1.0;
   aDate[1297] = D'2012.03.27 01:24:31'+time_offset*3600;
   aPrice[1297] = 1.59672;

   // ========== 1298 ===== 191 ==========
   aPseudoTicket[1298] = 650;
   aAction[1298] = 1; // OPEN
   aReturn[650] = 1298;
   aType[1298] = OP_BUY; // BUY
   aTicket[1298] = -1; // Ticket given by broker
   aSymbol[1298] = "GBPUSD";
   aLots[1298] = 1.0;
   aDate[1298] = D'2012.03.28 13:47:48'+time_offset*3600;
   aPrice[1298] = 1.58835;

   // ========== 1299 ===== 191 ==========
   aPseudoTicket[1299] = 650;
   aAction[1299] = 0; // CLOSE
   aType[1299] = OP_BUY; // BUY
   aTicket[1299] = -1; // Ticket given by broker
   aSymbol[1299] = "GBPUSD";
   aLots[1299] = 1.0;
   aDate[1299] = D'2012.03.28 14:27:23'+time_offset*3600;
   aPrice[1299] = 1.58519;

   // ========== 1300 ===== 189 ==========
   aPseudoTicket[1300] = 651;
   aAction[1300] = 1; // OPEN
   aReturn[651] = 1300;
   aType[1300] = OP_BUY; // BUY
   aTicket[1300] = -1; // Ticket given by broker
   aSymbol[1300] = "EURUSD";
   aLots[1300] = 1.0;
   aDate[1300] = D'2012.03.30 00:45:25'+time_offset*3600;
   aPrice[1300] = 1.33334;

   // ========== 1301 ===== 190 ==========
   aPseudoTicket[1301] = 652;
   aAction[1301] = 1; // OPEN
   aReturn[652] = 1301;
   aType[1301] = OP_SELL; // SELL
   aTicket[1301] = -1; // Ticket given by broker
   aSymbol[1301] = "AUDUSD";
   aLots[1301] = 1.0;
   aDate[1301] = D'2012.03.30 02:06:10'+time_offset*3600;
   aPrice[1301] = 1.04029;

   // ========== 1302 ===== 190 ==========
   aPseudoTicket[1302] = 652;
   aAction[1302] = 0; // CLOSE
   aType[1302] = OP_SELL; // SELL
   aTicket[1302] = -1; // Ticket given by broker
   aSymbol[1302] = "AUDUSD";
   aLots[1302] = 1.0;
   aDate[1302] = D'2012.03.30 03:14:53'+time_offset*3600;
   aPrice[1302] = 1.03967;

   // ========== 1303 ===== 189 ==========
   aPseudoTicket[1303] = 651;
   aAction[1303] = 0; // CLOSE
   aType[1303] = OP_BUY; // BUY
   aTicket[1303] = -1; // Ticket given by broker
   aSymbol[1303] = "EURUSD";
   aLots[1303] = 1.0;
   aDate[1303] = D'2012.03.30 13:00:53'+time_offset*3600;
   aPrice[1303] = 1.33386;

   // ========== 1304 ===== 188 ==========
   aPseudoTicket[1304] = 653;
   aAction[1304] = 1; // OPEN
   aReturn[653] = 1304;
   aType[1304] = OP_BUY; // BUY
   aTicket[1304] = -1; // Ticket given by broker
   aSymbol[1304] = "EURUSD";
   aLots[1304] = 1.0;
   aDate[1304] = D'2012.04.02 07:40:06'+time_offset*3600;
   aPrice[1304] = 1.33683;

   // ========== 1305 ===== 188 ==========
   aPseudoTicket[1305] = 653;
   aAction[1305] = 0; // CLOSE
   aType[1305] = OP_BUY; // BUY
   aTicket[1305] = -1; // Ticket given by broker
   aSymbol[1305] = "EURUSD";
   aLots[1305] = 1.0;
   aDate[1305] = D'2012.04.02 12:07:35'+time_offset*3600;
   aPrice[1305] = 1.332;

   // ========== 1306 ===== 187 ==========
   aPseudoTicket[1306] = 654;
   aAction[1306] = 1; // OPEN
   aReturn[654] = 1306;
   aType[1306] = OP_BUY; // BUY
   aTicket[1306] = -1; // Ticket given by broker
   aSymbol[1306] = "USDCHF";
   aLots[1306] = 1.0;
   aDate[1306] = D'2012.04.02 13:20:23'+time_offset*3600;
   aPrice[1306] = 0.90703;

   // ========== 1307 ===== 187 ==========
   aPseudoTicket[1307] = 654;
   aAction[1307] = 0; // CLOSE
   aType[1307] = OP_BUY; // BUY
   aTicket[1307] = -1; // Ticket given by broker
   aSymbol[1307] = "USDCHF";
   aLots[1307] = 1.0;
   aDate[1307] = D'2012.04.03 09:36:35'+time_offset*3600;
   aPrice[1307] = 0.90031;

   // ========== 1308 ===== 186 ==========
   aPseudoTicket[1308] = 655;
   aAction[1308] = 1; // OPEN
   aReturn[655] = 1308;
   aType[1308] = OP_SELL; // SELL
   aTicket[1308] = -1; // Ticket given by broker
   aSymbol[1308] = "EURUSD";
   aLots[1308] = 1.0;
   aDate[1308] = D'2012.04.03 22:49:35'+time_offset*3600;
   aPrice[1308] = 1.32233;

   // ========== 1309 ===== 186 ==========
   aPseudoTicket[1309] = 655;
   aAction[1309] = 0; // CLOSE
   aType[1309] = OP_SELL; // SELL
   aTicket[1309] = -1; // Ticket given by broker
   aSymbol[1309] = "EURUSD";
   aLots[1309] = 1.0;
   aDate[1309] = D'2012.04.04 11:12:18'+time_offset*3600;
   aPrice[1309] = 1.31589;

   // ========== 1310 ===== 184 ==========
   aPseudoTicket[1310] = 656;
   aAction[1310] = 1; // OPEN
   aReturn[656] = 1310;
   aType[1310] = OP_BUY; // BUY
   aTicket[1310] = -1; // Ticket given by broker
   aSymbol[1310] = "EURUSD";
   aLots[1310] = 1.0;
   aDate[1310] = D'2012.04.05 09:32:41'+time_offset*3600;
   aPrice[1310] = 1.3091;

   // ========== 1311 ===== 185 ==========
   aPseudoTicket[1311] = 657;
   aAction[1311] = 1; // OPEN
   aReturn[657] = 1311;
   aType[1311] = OP_BUY; // BUY
   aTicket[1311] = -1; // Ticket given by broker
   aSymbol[1311] = "EURUSD";
   aLots[1311] = 1.0;
   aDate[1311] = D'2012.04.05 10:06:50'+time_offset*3600;
   aPrice[1311] = 1.30621;

   // ========== 1312 ===== 185 ==========
   aPseudoTicket[1312] = 657;
   aAction[1312] = 0; // CLOSE
   aType[1312] = OP_BUY; // BUY
   aTicket[1312] = -1; // Ticket given by broker
   aSymbol[1312] = "EURUSD";
   aLots[1312] = 1.0;
   aDate[1312] = D'2012.04.06 06:11:25'+time_offset*3600;
   aPrice[1312] = 1.30726;

   // ========== 1313 ===== 184 ==========
   aPseudoTicket[1313] = 656;
   aAction[1313] = 0; // CLOSE
   aType[1313] = OP_BUY; // BUY
   aTicket[1313] = -1; // Ticket given by broker
   aSymbol[1313] = "EURUSD";
   aLots[1313] = 1.0;
   aDate[1313] = D'2012.04.06 12:32:21'+time_offset*3600;
   aPrice[1313] = 1.31;

   // ========== 1314 ===== 183 ==========
   aPseudoTicket[1314] = 658;
   aAction[1314] = 1; // OPEN
   aReturn[658] = 1314;
   aType[1314] = OP_SELL; // SELL
   aTicket[1314] = -1; // Ticket given by broker
   aSymbol[1314] = "GBPUSD";
   aLots[1314] = 1.0;
   aDate[1314] = D'2012.04.09 22:40:16'+time_offset*3600;
   aPrice[1314] = 1.58994;

   // ========== 1315 ===== 183 ==========
   aPseudoTicket[1315] = 658;
   aAction[1315] = 0; // CLOSE
   aType[1315] = OP_SELL; // SELL
   aTicket[1315] = -1; // Ticket given by broker
   aSymbol[1315] = "GBPUSD";
   aLots[1315] = 1.0;
   aDate[1315] = D'2012.04.10 08:17:31'+time_offset*3600;
   aPrice[1315] = 1.58558;

   // ========== 1316 ===== 182 ==========
   aPseudoTicket[1316] = 659;
   aAction[1316] = 1; // OPEN
   aReturn[659] = 1316;
   aType[1316] = OP_SELL; // SELL
   aTicket[1316] = -1; // Ticket given by broker
   aSymbol[1316] = "GBPUSD";
   aLots[1316] = 1.0;
   aDate[1316] = D'2012.04.11 06:25:47'+time_offset*3600;
   aPrice[1316] = 1.58988;

   // ========== 1317 ===== 182 ==========
   aPseudoTicket[1317] = 659;
   aAction[1317] = 0; // CLOSE
   aType[1317] = OP_SELL; // SELL
   aTicket[1317] = -1; // Ticket given by broker
   aSymbol[1317] = "GBPUSD";
   aLots[1317] = 1.0;
   aDate[1317] = D'2012.04.11 08:00:55'+time_offset*3600;
   aPrice[1317] = 1.58867;

   // ========== 1318 ===== 181 ==========
   aPseudoTicket[1318] = 660;
   aAction[1318] = 1; // OPEN
   aReturn[660] = 1318;
   aType[1318] = OP_SELL; // SELL
   aTicket[1318] = -1; // Ticket given by broker
   aSymbol[1318] = "GBPUSD";
   aLots[1318] = 1.0;
   aDate[1318] = D'2012.04.11 08:30:58'+time_offset*3600;
   aPrice[1318] = 1.59086;

   // ========== 1319 ===== 181 ==========
   aPseudoTicket[1319] = 660;
   aAction[1319] = 0; // CLOSE
   aType[1319] = OP_SELL; // SELL
   aTicket[1319] = -1; // Ticket given by broker
   aSymbol[1319] = "GBPUSD";
   aLots[1319] = 1.0;
   aDate[1319] = D'2012.04.11 09:09:27'+time_offset*3600;
   aPrice[1319] = 1.58878;

   // ========== 1320 ===== 178 ==========
   aPseudoTicket[1320] = 661;
   aAction[1320] = 1; // OPEN
   aReturn[661] = 1320;
   aType[1320] = OP_SELL; // SELL
   aTicket[1320] = -1; // Ticket given by broker
   aSymbol[1320] = "GBPUSD";
   aLots[1320] = 1.0;
   aDate[1320] = D'2012.04.12 06:19:08'+time_offset*3600;
   aPrice[1320] = 1.59274;

   // ========== 1321 ===== 180 ==========
   aPseudoTicket[1321] = 662;
   aAction[1321] = 1; // OPEN
   aReturn[662] = 1321;
   aType[1321] = OP_SELL; // SELL
   aTicket[1321] = -1; // Ticket given by broker
   aSymbol[1321] = "GBPUSD";
   aLots[1321] = 1.0;
   aDate[1321] = D'2012.04.12 14:54:17'+time_offset*3600;
   aPrice[1321] = 1.59564;

   // ========== 1322 ===== 180 ==========
   aPseudoTicket[1322] = 662;
   aAction[1322] = 0; // CLOSE
   aType[1322] = OP_SELL; // SELL
   aTicket[1322] = -1; // Ticket given by broker
   aSymbol[1322] = "GBPUSD";
   aLots[1322] = 1.0;
   aDate[1322] = D'2012.04.12 16:28:57'+time_offset*3600;
   aPrice[1322] = 1.59516;

   // ========== 1323 ===== 179 ==========
   aPseudoTicket[1323] = 663;
   aAction[1323] = 1; // OPEN
   aReturn[663] = 1323;
   aType[1323] = OP_SELL; // SELL
   aTicket[1323] = -1; // Ticket given by broker
   aSymbol[1323] = "GBPUSD";
   aLots[1323] = 1.0;
   aDate[1323] = D'2012.04.13 00:58:53'+time_offset*3600;
   aPrice[1323] = 1.59674;

   // ========== 1324 ===== 179 ==========
   aPseudoTicket[1324] = 663;
   aAction[1324] = 0; // CLOSE
   aType[1324] = OP_SELL; // SELL
   aTicket[1324] = -1; // Ticket given by broker
   aSymbol[1324] = "GBPUSD";
   aLots[1324] = 1.0;
   aDate[1324] = D'2012.04.13 04:05:13'+time_offset*3600;
   aPrice[1324] = 1.59418;

   // ========== 1325 ===== 178 ==========
   aPseudoTicket[1325] = 661;
   aAction[1325] = 0; // CLOSE
   aType[1325] = OP_SELL; // SELL
   aTicket[1325] = -1; // Ticket given by broker
   aSymbol[1325] = "GBPUSD";
   aLots[1325] = 1.0;
   aDate[1325] = D'2012.04.13 07:57:11'+time_offset*3600;
   aPrice[1325] = 1.59348;

   // ========== 1326 ===== 176 ==========
   aPseudoTicket[1326] = 664;
   aAction[1326] = 1; // OPEN
   aReturn[664] = 1326;
   aType[1326] = OP_BUY; // BUY
   aTicket[1326] = -1; // Ticket given by broker
   aSymbol[1326] = "AUDUSD";
   aLots[1326] = 1.0;
   aDate[1326] = D'2012.04.15 23:35:48'+time_offset*3600;
   aPrice[1326] = 1.03582;

   // ========== 1327 ===== 177 ==========
   aPseudoTicket[1327] = 665;
   aAction[1327] = 1; // OPEN
   aReturn[665] = 1327;
   aType[1327] = OP_BUY; // BUY
   aTicket[1327] = -1; // Ticket given by broker
   aSymbol[1327] = "AUDUSD";
   aLots[1327] = 1.0;
   aDate[1327] = D'2012.04.16 00:00:39'+time_offset*3600;
   aPrice[1327] = 1.0345;

   // ========== 1328 ===== 177 ==========
   aPseudoTicket[1328] = 665;
   aAction[1328] = 0; // CLOSE
   aType[1328] = OP_BUY; // BUY
   aTicket[1328] = -1; // Ticket given by broker
   aSymbol[1328] = "AUDUSD";
   aLots[1328] = 1.0;
   aDate[1328] = D'2012.04.16 09:36:25'+time_offset*3600;
   aPrice[1328] = 1.03451;

   // ========== 1329 ===== 176 ==========
   aPseudoTicket[1329] = 664;
   aAction[1329] = 0; // CLOSE
   aType[1329] = OP_BUY; // BUY
   aTicket[1329] = -1; // Ticket given by broker
   aSymbol[1329] = "AUDUSD";
   aLots[1329] = 1.0;
   aDate[1329] = D'2012.04.16 09:50:32'+time_offset*3600;
   aPrice[1329] = 1.03514;

   // ========== 1330 ===== 175 ==========
   aPseudoTicket[1330] = 666;
   aAction[1330] = 1; // OPEN
   aReturn[666] = 1330;
   aType[1330] = OP_SELL; // SELL
   aTicket[1330] = -1; // Ticket given by broker
   aSymbol[1330] = "EURUSD";
   aLots[1330] = 1.0;
   aDate[1330] = D'2012.04.16 20:49:47'+time_offset*3600;
   aPrice[1330] = 1.31418;

   // ========== 1331 ===== 174 ==========
   aPseudoTicket[1331] = 667;
   aAction[1331] = 1; // OPEN
   aReturn[667] = 1331;
   aType[1331] = OP_BUY; // BUY
   aTicket[1331] = -1; // Ticket given by broker
   aSymbol[1331] = "GBPUSD";
   aLots[1331] = 1.0;
   aDate[1331] = D'2012.04.17 06:30:30'+time_offset*3600;
   aPrice[1331] = 1.5867;

   // ========== 1332 ===== 175 ==========
   aPseudoTicket[1332] = 666;
   aAction[1332] = 0; // CLOSE
   aType[1332] = OP_SELL; // SELL
   aTicket[1332] = -1; // Ticket given by broker
   aSymbol[1332] = "EURUSD";
   aLots[1332] = 1.0;
   aDate[1332] = D'2012.04.17 06:31:58'+time_offset*3600;
   aPrice[1332] = 1.30987;

   // ========== 1333 ===== 174 ==========
   aPseudoTicket[1333] = 667;
   aAction[1333] = 0; // CLOSE
   aType[1333] = OP_BUY; // BUY
   aTicket[1333] = -1; // Ticket given by broker
   aSymbol[1333] = "GBPUSD";
   aLots[1333] = 1.0;
   aDate[1333] = D'2012.04.17 07:07:09'+time_offset*3600;
   aPrice[1333] = 1.5885;

   // ========== 1334 ===== 172 ==========
   aPseudoTicket[1334] = 668;
   aAction[1334] = 1; // OPEN
   aReturn[668] = 1334;
   aType[1334] = OP_SELL; // SELL
   aTicket[1334] = -1; // Ticket given by broker
   aSymbol[1334] = "GBPUSD";
   aLots[1334] = 1.0;
   aDate[1334] = D'2012.04.18 22:12:46'+time_offset*3600;
   aPrice[1334] = 1.60162;

   // ========== 1335 ===== 173 ==========
   aPseudoTicket[1335] = 669;
   aAction[1335] = 1; // OPEN
   aReturn[669] = 1335;
   aType[1335] = OP_SELL; // SELL
   aTicket[1335] = -1; // Ticket given by broker
   aSymbol[1335] = "GBPUSD";
   aLots[1335] = 1.0;
   aDate[1335] = D'2012.04.19 07:08:18'+time_offset*3600;
   aPrice[1335] = 1.60595;

   // ========== 1336 ===== 173 ==========
   aPseudoTicket[1336] = 669;
   aAction[1336] = 0; // CLOSE
   aType[1336] = OP_SELL; // SELL
   aTicket[1336] = -1; // Ticket given by broker
   aSymbol[1336] = "GBPUSD";
   aLots[1336] = 1.0;
   aDate[1336] = D'2012.04.19 10:24:11'+time_offset*3600;
   aPrice[1336] = 1.60363;

   // ========== 1337 ===== 172 ==========
   aPseudoTicket[1337] = 668;
   aAction[1337] = 0; // CLOSE
   aType[1337] = OP_SELL; // SELL
   aTicket[1337] = -1; // Ticket given by broker
   aSymbol[1337] = "GBPUSD";
   aLots[1337] = 1.0;
   aDate[1337] = D'2012.04.19 11:35:52'+time_offset*3600;
   aPrice[1337] = 1.60151;

   // ========== 1338 ===== 171 ==========
   aPseudoTicket[1338] = 670;
   aAction[1338] = 1; // OPEN
   aReturn[670] = 1338;
   aType[1338] = OP_BUY; // BUY
   aTicket[1338] = -1; // Ticket given by broker
   aSymbol[1338] = "EURUSD";
   aLots[1338] = 1.0;
   aDate[1338] = D'2012.04.20 05:48:38'+time_offset*3600;
   aPrice[1338] = 1.31651;

   // ========== 1339 ===== 171 ==========
   aPseudoTicket[1339] = 670;
   aAction[1339] = 0; // CLOSE
   aType[1339] = OP_BUY; // BUY
   aTicket[1339] = -1; // Ticket given by broker
   aSymbol[1339] = "EURUSD";
   aLots[1339] = 1.0;
   aDate[1339] = D'2012.04.20 06:44:47'+time_offset*3600;
   aPrice[1339] = 1.31456;

   // ========== 1340 ===== 169 ==========
   aPseudoTicket[1340] = 671;
   aAction[1340] = 1; // OPEN
   aReturn[671] = 1340;
   aType[1340] = OP_BUY; // BUY
   aTicket[1340] = -1; // Ticket given by broker
   aSymbol[1340] = "EURUSD";
   aLots[1340] = 1.0;
   aDate[1340] = D'2012.04.20 08:01:17'+time_offset*3600;
   aPrice[1340] = 1.31763;

   // ========== 1341 ===== 170 ==========
   aPseudoTicket[1341] = 672;
   aAction[1341] = 1; // OPEN
   aReturn[672] = 1341;
   aType[1341] = OP_BUY; // BUY
   aTicket[1341] = -1; // Ticket given by broker
   aSymbol[1341] = "EURUSD";
   aLots[1341] = 1.0;
   aDate[1341] = D'2012.04.20 08:04:07'+time_offset*3600;
   aPrice[1341] = 1.31673;

   // ========== 1342 ===== 168 ==========
   aPseudoTicket[1342] = 673;
   aAction[1342] = 1; // OPEN
   aReturn[673] = 1342;
   aType[1342] = OP_SELL; // SELL
   aTicket[1342] = -1; // Ticket given by broker
   aSymbol[1342] = "GBPUSD";
   aLots[1342] = 1.0;
   aDate[1342] = D'2012.04.20 08:31:30'+time_offset*3600;
   aPrice[1342] = 1.6115;

   // ========== 1343 ===== 170 ==========
   aPseudoTicket[1343] = 672;
   aAction[1343] = 0; // CLOSE
   aType[1343] = OP_BUY; // BUY
   aTicket[1343] = -1; // Ticket given by broker
   aSymbol[1343] = "EURUSD";
   aLots[1343] = 1.0;
   aDate[1343] = D'2012.04.20 09:05:50'+time_offset*3600;
   aPrice[1343] = 1.31525;

   // ========== 1344 ===== 169 ==========
   aPseudoTicket[1344] = 671;
   aAction[1344] = 0; // CLOSE
   aType[1344] = OP_BUY; // BUY
   aTicket[1344] = -1; // Ticket given by broker
   aSymbol[1344] = "EURUSD";
   aLots[1344] = 1.0;
   aDate[1344] = D'2012.04.20 09:23:02'+time_offset*3600;
   aPrice[1344] = 1.31566;

   // ========== 1345 ===== 167 ==========
   aPseudoTicket[1345] = 674;
   aAction[1345] = 1; // OPEN
   aReturn[674] = 1345;
   aType[1345] = OP_SELL; // SELL
   aTicket[1345] = -1; // Ticket given by broker
   aSymbol[1345] = "GBPUSD";
   aLots[1345] = 1.0;
   aDate[1345] = D'2012.04.20 10:46:56'+time_offset*3600;
   aPrice[1345] = 1.61118;

   // ========== 1346 ===== 168 ==========
   aPseudoTicket[1346] = 673;
   aAction[1346] = 0; // CLOSE
   aType[1346] = OP_SELL; // SELL
   aTicket[1346] = -1; // Ticket given by broker
   aSymbol[1346] = "GBPUSD";
   aLots[1346] = 1.0;
   aDate[1346] = D'2012.04.23 07:14:10'+time_offset*3600;
   aPrice[1346] = 1.60914;

   // ========== 1347 ===== 167 ==========
   aPseudoTicket[1347] = 674;
   aAction[1347] = 0; // CLOSE
   aType[1347] = OP_SELL; // SELL
   aTicket[1347] = -1; // Ticket given by broker
   aSymbol[1347] = "GBPUSD";
   aLots[1347] = 1.0;
   aDate[1347] = D'2012.04.23 11:11:29'+time_offset*3600;
   aPrice[1347] = 1.60844;

   // ========== 1348 ===== 165 ==========
   aPseudoTicket[1348] = 675;
   aAction[1348] = 1; // OPEN
   aReturn[675] = 1348;
   aType[1348] = OP_SELL; // SELL
   aTicket[1348] = -1; // Ticket given by broker
   aSymbol[1348] = "GBPUSD";
   aLots[1348] = 1.0;
   aDate[1348] = D'2012.04.24 06:50:07'+time_offset*3600;
   aPrice[1348] = 1.61361;

   // ========== 1349 ===== 166 ==========
   aPseudoTicket[1349] = 676;
   aAction[1349] = 1; // OPEN
   aReturn[676] = 1349;
   aType[1349] = OP_SELL; // SELL
   aTicket[1349] = -1; // Ticket given by broker
   aSymbol[1349] = "GBPUSD";
   aLots[1349] = 1.0;
   aDate[1349] = D'2012.04.24 11:38:19'+time_offset*3600;
   aPrice[1349] = 1.61608;

   // ========== 1350 ===== 166 ==========
   aPseudoTicket[1350] = 676;
   aAction[1350] = 0; // CLOSE
   aType[1350] = OP_SELL; // SELL
   aTicket[1350] = -1; // Ticket given by broker
   aSymbol[1350] = "GBPUSD";
   aLots[1350] = 1.0;
   aDate[1350] = D'2012.04.24 13:48:30'+time_offset*3600;
   aPrice[1350] = 1.6141;

   // ========== 1351 ===== 165 ==========
   aPseudoTicket[1351] = 675;
   aAction[1351] = 0; // CLOSE
   aType[1351] = OP_SELL; // SELL
   aTicket[1351] = -1; // Ticket given by broker
   aSymbol[1351] = "GBPUSD";
   aLots[1351] = 1.0;
   aDate[1351] = D'2012.04.24 13:50:19'+time_offset*3600;
   aPrice[1351] = 1.61334;

   // ========== 1352 ===== 164 ==========
   aPseudoTicket[1352] = 677;
   aAction[1352] = 1; // OPEN
   aReturn[677] = 1352;
   aType[1352] = OP_SELL; // SELL
   aTicket[1352] = -1; // Ticket given by broker
   aSymbol[1352] = "EURUSD";
   aLots[1352] = 1.0;
   aDate[1352] = D'2012.04.25 11:33:31'+time_offset*3600;
   aPrice[1352] = 1.32038;

   // ========== 1353 ===== 164 ==========
   aPseudoTicket[1353] = 677;
   aAction[1353] = 0; // CLOSE
   aType[1353] = OP_SELL; // SELL
   aTicket[1353] = -1; // Ticket given by broker
   aSymbol[1353] = "EURUSD";
   aLots[1353] = 1.0;
   aDate[1353] = D'2012.04.25 16:33:07'+time_offset*3600;
   aPrice[1353] = 1.31997;

   // ========== 1354 ===== 163 ==========
   aPseudoTicket[1354] = 678;
   aAction[1354] = 1; // OPEN
   aReturn[678] = 1354;
   aType[1354] = OP_SELL; // SELL
   aTicket[1354] = -1; // Ticket given by broker
   aSymbol[1354] = "GBPUSD";
   aLots[1354] = 1.0;
   aDate[1354] = D'2012.04.26 06:39:44'+time_offset*3600;
   aPrice[1354] = 1.61856;

   // ========== 1355 ===== 162 ==========
   aPseudoTicket[1355] = 679;
   aAction[1355] = 1; // OPEN
   aReturn[679] = 1355;
   aType[1355] = OP_BUY; // BUY
   aTicket[1355] = -1; // Ticket given by broker
   aSymbol[1355] = "USDJPY";
   aLots[1355] = 1.0;
   aDate[1355] = D'2012.04.27 05:05:28'+time_offset*3600;
   aPrice[1355] = 80.883;

   // ========== 1356 ===== 163 ==========
   aPseudoTicket[1356] = 678;
   aAction[1356] = 0; // CLOSE
   aType[1356] = OP_SELL; // SELL
   aTicket[1356] = -1; // Ticket given by broker
   aSymbol[1356] = "GBPUSD";
   aLots[1356] = 1.0;
   aDate[1356] = D'2012.04.27 06:20:28'+time_offset*3600;
   aPrice[1356] = 1.61574;

   // ========== 1357 ===== 162 ==========
   aPseudoTicket[1357] = 679;
   aAction[1357] = 0; // CLOSE
   aType[1357] = OP_BUY; // BUY
   aTicket[1357] = -1; // Ticket given by broker
   aSymbol[1357] = "USDJPY";
   aLots[1357] = 1.0;
   aDate[1357] = D'2012.04.27 07:37:49'+time_offset*3600;
   aPrice[1357] = 80.619;

   // ========== 1358 ===== 159 ==========
   aPseudoTicket[1358] = 680;
   aAction[1358] = 1; // OPEN
   aReturn[680] = 1358;
   aType[1358] = OP_SELL; // SELL
   aTicket[1358] = -1; // Ticket given by broker
   aSymbol[1358] = "GBPUSD";
   aLots[1358] = 1.0;
   aDate[1358] = D'2012.04.27 07:43:54'+time_offset*3600;
   aPrice[1358] = 1.61749;

   // ========== 1359 ===== 160 ==========
   aPseudoTicket[1359] = 681;
   aAction[1359] = 1; // OPEN
   aReturn[681] = 1359;
   aType[1359] = OP_SELL; // SELL
   aTicket[1359] = -1; // Ticket given by broker
   aSymbol[1359] = "GBPUSD";
   aLots[1359] = 1.0;
   aDate[1359] = D'2012.04.27 09:40:53'+time_offset*3600;
   aPrice[1359] = 1.623;

   // ========== 1360 ===== 161 ==========
   aPseudoTicket[1360] = 682;
   aAction[1360] = 1; // OPEN
   aReturn[682] = 1360;
   aType[1360] = OP_SELL; // SELL
   aTicket[1360] = -1; // Ticket given by broker
   aSymbol[1360] = "GBPUSD";
   aLots[1360] = 1.0;
   aDate[1360] = D'2012.04.27 13:15:08'+time_offset*3600;
   aPrice[1360] = 1.62488;

   // ========== 1361 ===== 161 ==========
   aPseudoTicket[1361] = 682;
   aAction[1361] = 0; // CLOSE
   aType[1361] = OP_SELL; // SELL
   aTicket[1361] = -1; // Ticket given by broker
   aSymbol[1361] = "GBPUSD";
   aLots[1361] = 1.0;
   aDate[1361] = D'2012.04.30 15:28:23'+time_offset*3600;
   aPrice[1361] = 1.62332;

   // ========== 1362 ===== 160 ==========
   aPseudoTicket[1362] = 681;
   aAction[1362] = 0; // CLOSE
   aType[1362] = OP_SELL; // SELL
   aTicket[1362] = -1; // Ticket given by broker
   aSymbol[1362] = "GBPUSD";
   aLots[1362] = 1.0;
   aDate[1362] = D'2012.05.01 03:27:21'+time_offset*3600;
   aPrice[1362] = 1.62305;

   // ========== 1363 ===== 159 ==========
   aPseudoTicket[1363] = 680;
   aAction[1363] = 0; // CLOSE
   aType[1363] = OP_SELL; // SELL
   aTicket[1363] = -1; // Ticket given by broker
   aSymbol[1363] = "GBPUSD";
   aLots[1363] = 1.0;
   aDate[1363] = D'2012.05.01 04:35:57'+time_offset*3600;
   aPrice[1363] = 1.6226;

   // ========== 1364 ===== 158 ==========
   aPseudoTicket[1364] = 683;
   aAction[1364] = 1; // OPEN
   aReturn[683] = 1364;
   aType[1364] = OP_BUY; // BUY
   aTicket[1364] = -1; // Ticket given by broker
   aSymbol[1364] = "USDJPY";
   aLots[1364] = 1.0;
   aDate[1364] = D'2012.05.01 07:10:10'+time_offset*3600;
   aPrice[1364] = 79.671;

   // ========== 1365 ===== 158 ==========
   aPseudoTicket[1365] = 683;
   aAction[1365] = 0; // CLOSE
   aType[1365] = OP_BUY; // BUY
   aTicket[1365] = -1; // Ticket given by broker
   aSymbol[1365] = "USDJPY";
   aLots[1365] = 1.0;
   aDate[1365] = D'2012.05.01 23:07:07'+time_offset*3600;
   aPrice[1365] = 80.141;

   // ========== 1366 ===== 157 ==========
   aPseudoTicket[1366] = 684;
   aAction[1366] = 1; // OPEN
   aReturn[684] = 1366;
   aType[1366] = OP_SELL; // SELL
   aTicket[1366] = -1; // Ticket given by broker
   aSymbol[1366] = "USDJPY";
   aLots[1366] = 1.0;
   aDate[1366] = D'2012.05.02 07:10:07'+time_offset*3600;
   aPrice[1366] = 80.575;

   // ========== 1367 ===== 157 ==========
   aPseudoTicket[1367] = 684;
   aAction[1367] = 0; // CLOSE
   aType[1367] = OP_SELL; // SELL
   aTicket[1367] = -1; // Ticket given by broker
   aSymbol[1367] = "USDJPY";
   aLots[1367] = 1.0;
   aDate[1367] = D'2012.05.02 07:25:49'+time_offset*3600;
   aPrice[1367] = 80.483;

   // ========== 1368 ===== 156 ==========
   aPseudoTicket[1368] = 685;
   aAction[1368] = 1; // OPEN
   aReturn[685] = 1368;
   aType[1368] = OP_SELL; // SELL
   aTicket[1368] = -1; // Ticket given by broker
   aSymbol[1368] = "EURUSD";
   aLots[1368] = 1.0;
   aDate[1368] = D'2012.05.02 07:43:22'+time_offset*3600;
   aPrice[1368] = 1.32039;

   // ========== 1369 ===== 154 ==========
   aPseudoTicket[1369] = 686;
   aAction[1369] = 1; // OPEN
   aReturn[686] = 1369;
   aType[1369] = OP_SELL; // SELL
   aTicket[1369] = -1; // Ticket given by broker
   aSymbol[1369] = "EURUSD";
   aLots[1369] = 1.0;
   aDate[1369] = D'2012.05.02 07:45:13'+time_offset*3600;
   aPrice[1369] = 1.31933;

   // ========== 1370 ===== 156 ==========
   aPseudoTicket[1370] = 685;
   aAction[1370] = 0; // CLOSE
   aType[1370] = OP_SELL; // SELL
   aTicket[1370] = -1; // Ticket given by broker
   aSymbol[1370] = "EURUSD";
   aLots[1370] = 1.0;
   aDate[1370] = D'2012.05.02 09:26:39'+time_offset*3600;
   aPrice[1370] = 1.3143;

   // ========== 1371 ===== 155 ==========
   aPseudoTicket[1371] = 687;
   aAction[1371] = 1; // OPEN
   aReturn[687] = 1371;
   aType[1371] = OP_SELL; // SELL
   aTicket[1371] = -1; // Ticket given by broker
   aSymbol[1371] = "EURUSD";
   aLots[1371] = 1.0;
   aDate[1371] = D'2012.05.02 14:20:35'+time_offset*3600;
   aPrice[1371] = 1.31526;

   // ========== 1372 ===== 155 ==========
   aPseudoTicket[1372] = 687;
   aAction[1372] = 0; // CLOSE
   aType[1372] = OP_SELL; // SELL
   aTicket[1372] = -1; // Ticket given by broker
   aSymbol[1372] = "EURUSD";
   aLots[1372] = 1.0;
   aDate[1372] = D'2012.05.03 02:10:23'+time_offset*3600;
   aPrice[1372] = 1.31391;

   // ========== 1373 ===== 154 ==========
   aPseudoTicket[1373] = 686;
   aAction[1373] = 0; // CLOSE
   aType[1373] = OP_SELL; // SELL
   aTicket[1373] = -1; // Ticket given by broker
   aSymbol[1373] = "EURUSD";
   aLots[1373] = 1.0;
   aDate[1373] = D'2012.05.03 05:18:01'+time_offset*3600;
   aPrice[1373] = 1.31469;

   // ========== 1374 ===== 152 ==========
   aPseudoTicket[1374] = 688;
   aAction[1374] = 1; // OPEN
   aReturn[688] = 1374;
   aType[1374] = OP_BUY; // BUY
   aTicket[1374] = -1; // Ticket given by broker
   aSymbol[1374] = "AUDUSD";
   aLots[1374] = 1.0;
   aDate[1374] = D'2012.05.04 14:39:04'+time_offset*3600;
   aPrice[1374] = 1.01844;

   // ========== 1375 ===== 153 ==========
   aPseudoTicket[1375] = 689;
   aAction[1375] = 1; // OPEN
   aReturn[689] = 1375;
   aType[1375] = OP_SELL; // SELL
   aTicket[1375] = -1; // Ticket given by broker
   aSymbol[1375] = "EURUSD";
   aLots[1375] = 1.0;
   aDate[1375] = D'2012.05.04 15:23:57'+time_offset*3600;
   aPrice[1375] = 1.31025;

   // ========== 1376 ===== 153 ==========
   aPseudoTicket[1376] = 689;
   aAction[1376] = 0; // CLOSE
   aType[1376] = OP_SELL; // SELL
   aTicket[1376] = -1; // Ticket given by broker
   aSymbol[1376] = "EURUSD";
   aLots[1376] = 1.0;
   aDate[1376] = D'2012.05.04 15:45:56'+time_offset*3600;
   aPrice[1376] = 1.30894;

   // ========== 1377 ===== 152 ==========
   aPseudoTicket[1377] = 688;
   aAction[1377] = 0; // CLOSE
   aType[1377] = OP_BUY; // BUY
   aTicket[1377] = -1; // Ticket given by broker
   aSymbol[1377] = "AUDUSD";
   aLots[1377] = 1.0;
   aDate[1377] = D'2012.05.04 16:10:53'+time_offset*3600;
   aPrice[1377] = 1.01949;

   // ========== 1378 ===== 150 ==========
   aPseudoTicket[1378] = 690;
   aAction[1378] = 1; // OPEN
   aReturn[690] = 1378;
   aType[1378] = OP_BUY; // BUY
   aTicket[1378] = -1; // Ticket given by broker
   aSymbol[1378] = "AUDUSD";
   aLots[1378] = 1.0;
   aDate[1378] = D'2012.05.06 23:06:04'+time_offset*3600;
   aPrice[1378] = 1.01326;

   // ========== 1379 ===== 151 ==========
   aPseudoTicket[1379] = 691;
   aAction[1379] = 1; // OPEN
   aReturn[691] = 1379;
   aType[1379] = OP_BUY; // BUY
   aTicket[1379] = -1; // Ticket given by broker
   aSymbol[1379] = "AUDUSD";
   aLots[1379] = 1.0;
   aDate[1379] = D'2012.05.07 00:10:34'+time_offset*3600;
   aPrice[1379] = 1.01176;

   // ========== 1380 ===== 151 ==========
   aPseudoTicket[1380] = 691;
   aAction[1380] = 0; // CLOSE
   aType[1380] = OP_BUY; // BUY
   aTicket[1380] = -1; // Ticket given by broker
   aSymbol[1380] = "AUDUSD";
   aLots[1380] = 1.0;
   aDate[1380] = D'2012.05.07 03:16:00'+time_offset*3600;
   aPrice[1380] = 1.01375;

   // ========== 1381 ===== 150 ==========
   aPseudoTicket[1381] = 690;
   aAction[1381] = 0; // CLOSE
   aType[1381] = OP_BUY; // BUY
   aTicket[1381] = -1; // Ticket given by broker
   aSymbol[1381] = "AUDUSD";
   aLots[1381] = 1.0;
   aDate[1381] = D'2012.05.07 06:11:21'+time_offset*3600;
   aPrice[1381] = 1.01464;

   // ========== 1382 ===== 147 ==========
   aPseudoTicket[1382] = 692;
   aAction[1382] = 1; // OPEN
   aReturn[692] = 1382;
   aType[1382] = OP_SELL; // SELL
   aTicket[1382] = -1; // Ticket given by broker
   aSymbol[1382] = "EURUSD";
   aLots[1382] = 1.0;
   aDate[1382] = D'2012.05.07 13:20:18'+time_offset*3600;
   aPrice[1382] = 1.30453;

   // ========== 1383 ===== 149 ==========
   aPseudoTicket[1383] = 693;
   aAction[1383] = 1; // OPEN
   aReturn[693] = 1383;
   aType[1383] = OP_SELL; // SELL
   aTicket[1383] = -1; // Ticket given by broker
   aSymbol[1383] = "EURUSD";
   aLots[1383] = 1.0;
   aDate[1383] = D'2012.05.07 13:27:55'+time_offset*3600;
   aPrice[1383] = 1.3054;

   // ========== 1384 ===== 149 ==========
   aPseudoTicket[1384] = 693;
   aAction[1384] = 0; // CLOSE
   aType[1384] = OP_SELL; // SELL
   aTicket[1384] = -1; // Ticket given by broker
   aSymbol[1384] = "EURUSD";
   aLots[1384] = 1.0;
   aDate[1384] = D'2012.05.07 13:55:57'+time_offset*3600;
   aPrice[1384] = 1.30445;

   // ========== 1385 ===== 148 ==========
   aPseudoTicket[1385] = 694;
   aAction[1385] = 1; // OPEN
   aReturn[694] = 1385;
   aType[1385] = OP_SELL; // SELL
   aTicket[1385] = -1; // Ticket given by broker
   aSymbol[1385] = "AUDUSD";
   aLots[1385] = 1.0;
   aDate[1385] = D'2012.05.07 18:55:41'+time_offset*3600;
   aPrice[1385] = 1.02093;

   // ========== 1386 ===== 148 ==========
   aPseudoTicket[1386] = 694;
   aAction[1386] = 0; // CLOSE
   aType[1386] = OP_SELL; // SELL
   aTicket[1386] = -1; // Ticket given by broker
   aSymbol[1386] = "AUDUSD";
   aLots[1386] = 1.0;
   aDate[1386] = D'2012.05.08 01:34:37'+time_offset*3600;
   aPrice[1386] = 1.01768;

   // ========== 1387 ===== 147 ==========
   aPseudoTicket[1387] = 692;
   aAction[1387] = 0; // CLOSE
   aType[1387] = OP_SELL; // SELL
   aTicket[1387] = -1; // Ticket given by broker
   aSymbol[1387] = "EURUSD";
   aLots[1387] = 1.0;
   aDate[1387] = D'2012.05.08 03:20:06'+time_offset*3600;
   aPrice[1387] = 1.30314;

   // ========== 1388 ===== 146 ==========
   aPseudoTicket[1388] = 695;
   aAction[1388] = 1; // OPEN
   aReturn[695] = 1388;
   aType[1388] = OP_SELL; // SELL
   aTicket[1388] = -1; // Ticket given by broker
   aSymbol[1388] = "AUDUSD";
   aLots[1388] = 1.0;
   aDate[1388] = D'2012.05.08 05:39:16'+time_offset*3600;
   aPrice[1388] = 1.01929;

   // ========== 1389 ===== 146 ==========
   aPseudoTicket[1389] = 695;
   aAction[1389] = 0; // CLOSE
   aType[1389] = OP_SELL; // SELL
   aTicket[1389] = -1; // Ticket given by broker
   aSymbol[1389] = "AUDUSD";
   aLots[1389] = 1.0;
   aDate[1389] = D'2012.05.08 06:34:01'+time_offset*3600;
   aPrice[1389] = 1.0179;

   // ========== 1390 ===== 143 ==========
   aPseudoTicket[1390] = 696;
   aAction[1390] = 1; // OPEN
   aReturn[696] = 1390;
   aType[1390] = OP_BUY; // BUY
   aTicket[1390] = -1; // Ticket given by broker
   aSymbol[1390] = "GBPUSD";
   aLots[1390] = 1.0;
   aDate[1390] = D'2012.05.08 06:49:15'+time_offset*3600;
   aPrice[1390] = 1.61581;

   // ========== 1391 ===== 144 ==========
   aPseudoTicket[1391] = 697;
   aAction[1391] = 1; // OPEN
   aReturn[697] = 1391;
   aType[1391] = OP_BUY; // BUY
   aTicket[1391] = -1; // Ticket given by broker
   aSymbol[1391] = "GBPUSD";
   aLots[1391] = 1.0;
   aDate[1391] = D'2012.05.08 07:32:40'+time_offset*3600;
   aPrice[1391] = 1.6143;

   // ========== 1392 ===== 145 ==========
   aPseudoTicket[1392] = 698;
   aAction[1392] = 1; // OPEN
   aReturn[698] = 1392;
   aType[1392] = OP_BUY; // BUY
   aTicket[1392] = -1; // Ticket given by broker
   aSymbol[1392] = "GBPUSD";
   aLots[1392] = 1.0;
   aDate[1392] = D'2012.05.08 09:33:04'+time_offset*3600;
   aPrice[1392] = 1.61281;

   // ========== 1393 ===== 145 ==========
   aPseudoTicket[1393] = 698;
   aAction[1393] = 0; // CLOSE
   aType[1393] = OP_BUY; // BUY
   aTicket[1393] = -1; // Ticket given by broker
   aSymbol[1393] = "GBPUSD";
   aLots[1393] = 1.0;
   aDate[1393] = D'2012.05.08 11:07:54'+time_offset*3600;
   aPrice[1393] = 1.61478;

   // ========== 1394 ===== 144 ==========
   aPseudoTicket[1394] = 697;
   aAction[1394] = 0; // CLOSE
   aType[1394] = OP_BUY; // BUY
   aTicket[1394] = -1; // Ticket given by broker
   aSymbol[1394] = "GBPUSD";
   aLots[1394] = 1.0;
   aDate[1394] = D'2012.05.08 11:08:30'+time_offset*3600;
   aPrice[1394] = 1.61491;

   // ========== 1395 ===== 143 ==========
   aPseudoTicket[1395] = 696;
   aAction[1395] = 0; // CLOSE
   aType[1395] = OP_BUY; // BUY
   aTicket[1395] = -1; // Ticket given by broker
   aSymbol[1395] = "GBPUSD";
   aLots[1395] = 1.0;
   aDate[1395] = D'2012.05.08 11:17:25'+time_offset*3600;
   aPrice[1395] = 1.61529;

   // ========== 1396 ===== 142 ==========
   aPseudoTicket[1396] = 699;
   aAction[1396] = 1; // OPEN
   aReturn[699] = 1396;
   aType[1396] = OP_BUY; // BUY
   aTicket[1396] = -1; // Ticket given by broker
   aSymbol[1396] = "GBPUSD";
   aLots[1396] = 1.0;
   aDate[1396] = D'2012.05.08 12:25:31'+time_offset*3600;
   aPrice[1396] = 1.6137;

   // ========== 1397 ===== 142 ==========
   aPseudoTicket[1397] = 699;
   aAction[1397] = 0; // CLOSE
   aType[1397] = OP_BUY; // BUY
   aTicket[1397] = -1; // Ticket given by broker
   aSymbol[1397] = "GBPUSD";
   aLots[1397] = 1.0;
   aDate[1397] = D'2012.05.08 15:40:19'+time_offset*3600;
   aPrice[1397] = 1.61536;

   // ========== 1398 ===== 141 ==========
   aPseudoTicket[1398] = 700;
   aAction[1398] = 1; // OPEN
   aReturn[700] = 1398;
   aType[1398] = OP_BUY; // BUY
   aTicket[1398] = -1; // Ticket given by broker
   aSymbol[1398] = "USDJPY";
   aLots[1398] = 1.0;
   aDate[1398] = D'2012.05.09 11:34:40'+time_offset*3600;
   aPrice[1398] = 79.474;

   // ========== 1399 ===== 141 ==========
   aPseudoTicket[1399] = 700;
   aAction[1399] = 0; // CLOSE
   aType[1399] = OP_BUY; // BUY
   aTicket[1399] = -1; // Ticket given by broker
   aSymbol[1399] = "USDJPY";
   aLots[1399] = 1.0;
   aDate[1399] = D'2012.05.09 22:57:06'+time_offset*3600;
   aPrice[1399] = 79.632;

   // ========== 1400 ===== 140 ==========
   aPseudoTicket[1400] = 701;
   aAction[1400] = 1; // OPEN
   aReturn[701] = 1400;
   aType[1400] = OP_SELL; // SELL
   aTicket[1400] = -1; // Ticket given by broker
   aSymbol[1400] = "AUDUSD";
   aLots[1400] = 1.0;
   aDate[1400] = D'2012.05.10 07:01:52'+time_offset*3600;
   aPrice[1400] = 1.01189;

   // ========== 1401 ===== 140 ==========
   aPseudoTicket[1401] = 701;
   aAction[1401] = 0; // CLOSE
   aType[1401] = OP_SELL; // SELL
   aTicket[1401] = -1; // Ticket given by broker
   aSymbol[1401] = "AUDUSD";
   aLots[1401] = 1.0;
   aDate[1401] = D'2012.05.10 08:12:57'+time_offset*3600;
   aPrice[1401] = 1.00895;

   // ========== 1402 ===== 139 ==========
   aPseudoTicket[1402] = 702;
   aAction[1402] = 1; // OPEN
   aReturn[702] = 1402;
   aType[1402] = OP_BUY; // BUY
   aTicket[1402] = -1; // Ticket given by broker
   aSymbol[1402] = "GBPUSD";
   aLots[1402] = 1.0;
   aDate[1402] = D'2012.05.11 05:41:20'+time_offset*3600;
   aPrice[1402] = 1.6115;

   // ========== 1403 ===== 139 ==========
   aPseudoTicket[1403] = 702;
   aAction[1403] = 0; // CLOSE
   aType[1403] = OP_BUY; // BUY
   aTicket[1403] = -1; // Ticket given by broker
   aSymbol[1403] = "GBPUSD";
   aLots[1403] = 1.0;
   aDate[1403] = D'2012.05.11 06:49:23'+time_offset*3600;
   aPrice[1403] = 1.61225;

   // ========== 1404 ===== 138 ==========
   aPseudoTicket[1404] = 703;
   aAction[1404] = 1; // OPEN
   aReturn[703] = 1404;
   aType[1404] = OP_BUY; // BUY
   aTicket[1404] = -1; // Ticket given by broker
   aSymbol[1404] = "GBPUSD";
   aLots[1404] = 1.0;
   aDate[1404] = D'2012.05.11 07:21:26'+time_offset*3600;
   aPrice[1404] = 1.61055;

   // ========== 1405 ===== 138 ==========
   aPseudoTicket[1405] = 703;
   aAction[1405] = 0; // CLOSE
   aType[1405] = OP_BUY; // BUY
   aTicket[1405] = -1; // Ticket given by broker
   aSymbol[1405] = "GBPUSD";
   aLots[1405] = 1.0;
   aDate[1405] = D'2012.05.11 08:48:02'+time_offset*3600;
   aPrice[1405] = 1.61243;

   // ========== 1406 ===== 136 ==========
   aPseudoTicket[1406] = 704;
   aAction[1406] = 1; // OPEN
   aReturn[704] = 1406;
   aType[1406] = OP_BUY; // BUY
   aTicket[1406] = -1; // Ticket given by broker
   aSymbol[1406] = "GBPUSD";
   aLots[1406] = 1.0;
   aDate[1406] = D'2012.05.11 10:26:18'+time_offset*3600;
   aPrice[1406] = 1.61047;

   // ========== 1407 ===== 137 ==========
   aPseudoTicket[1407] = 705;
   aAction[1407] = 1; // OPEN
   aReturn[705] = 1407;
   aType[1407] = OP_BUY; // BUY
   aTicket[1407] = -1; // Ticket given by broker
   aSymbol[1407] = "GBPUSD";
   aLots[1407] = 1.0;
   aDate[1407] = D'2012.05.11 12:37:47'+time_offset*3600;
   aPrice[1407] = 1.60926;

   // ========== 1408 ===== 137 ==========
   aPseudoTicket[1408] = 705;
   aAction[1408] = 0; // CLOSE
   aType[1408] = OP_BUY; // BUY
   aTicket[1408] = -1; // Ticket given by broker
   aSymbol[1408] = "GBPUSD";
   aLots[1408] = 1.0;
   aDate[1408] = D'2012.05.11 14:25:22'+time_offset*3600;
   aPrice[1408] = 1.6103;

   // ========== 1409 ===== 136 ==========
   aPseudoTicket[1409] = 704;
   aAction[1409] = 0; // CLOSE
   aType[1409] = OP_BUY; // BUY
   aTicket[1409] = -1; // Ticket given by broker
   aSymbol[1409] = "GBPUSD";
   aLots[1409] = 1.0;
   aDate[1409] = D'2012.05.11 14:32:48'+time_offset*3600;
   aPrice[1409] = 1.61075;

   // ========== 1410 ===== 133 ==========
   aPseudoTicket[1410] = 706;
   aAction[1410] = 1; // OPEN
   aReturn[706] = 1410;
   aType[1410] = OP_BUY; // BUY
   aTicket[1410] = -1; // Ticket given by broker
   aSymbol[1410] = "AUDUSD";
   aLots[1410] = 1.0;
   aDate[1410] = D'2012.05.14 07:38:53'+time_offset*3600;
   aPrice[1410] = 0.99856;

   // ========== 1411 ===== 135 ==========
   aPseudoTicket[1411] = 707;
   aAction[1411] = 1; // OPEN
   aReturn[707] = 1411;
   aType[1411] = OP_BUY; // BUY
   aTicket[1411] = -1; // Ticket given by broker
   aSymbol[1411] = "AUDUSD";
   aLots[1411] = 1.0;
   aDate[1411] = D'2012.05.14 08:24:17'+time_offset*3600;
   aPrice[1411] = 0.99687;

   // ========== 1412 ===== 135 ==========
   aPseudoTicket[1412] = 707;
   aAction[1412] = 0; // CLOSE
   aType[1412] = OP_BUY; // BUY
   aTicket[1412] = -1; // Ticket given by broker
   aSymbol[1412] = "AUDUSD";
   aLots[1412] = 1.0;
   aDate[1412] = D'2012.05.14 12:15:58'+time_offset*3600;
   aPrice[1412] = 0.99846;

   // ========== 1413 ===== 132 ==========
   aPseudoTicket[1413] = 708;
   aAction[1413] = 1; // OPEN
   aReturn[708] = 1413;
   aType[1413] = OP_SELL; // SELL
   aTicket[1413] = -1; // Ticket given by broker
   aSymbol[1413] = "USDCHF";
   aLots[1413] = 1.0;
   aDate[1413] = D'2012.05.14 12:16:20'+time_offset*3600;
   aPrice[1413] = 0.93357;

   // ========== 1414 ===== 134 ==========
   aPseudoTicket[1414] = 709;
   aAction[1414] = 1; // OPEN
   aReturn[709] = 1414;
   aType[1414] = OP_BUY; // BUY
   aTicket[1414] = -1; // Ticket given by broker
   aSymbol[1414] = "AUDUSD";
   aLots[1414] = 1.0;
   aDate[1414] = D'2012.05.15 01:42:29'+time_offset*3600;
   aPrice[1414] = 0.99582;

   // ========== 1415 ===== 134 ==========
   aPseudoTicket[1415] = 709;
   aAction[1415] = 0; // CLOSE
   aType[1415] = OP_BUY; // BUY
   aTicket[1415] = -1; // Ticket given by broker
   aSymbol[1415] = "AUDUSD";
   aLots[1415] = 1.0;
   aDate[1415] = D'2012.05.15 04:13:09'+time_offset*3600;
   aPrice[1415] = 0.99759;

   // ========== 1416 ===== 133 ==========
   aPseudoTicket[1416] = 706;
   aAction[1416] = 0; // CLOSE
   aType[1416] = OP_BUY; // BUY
   aTicket[1416] = -1; // Ticket given by broker
   aSymbol[1416] = "AUDUSD";
   aLots[1416] = 1.0;
   aDate[1416] = D'2012.05.15 06:12:53'+time_offset*3600;
   aPrice[1416] = 1.00008;

   // ========== 1417 ===== 132 ==========
   aPseudoTicket[1417] = 708;
   aAction[1417] = 0; // CLOSE
   aType[1417] = OP_SELL; // SELL
   aTicket[1417] = -1; // Ticket given by broker
   aSymbol[1417] = "USDCHF";
   aLots[1417] = 1.0;
   aDate[1417] = D'2012.05.15 07:51:22'+time_offset*3600;
   aPrice[1417] = 0.93367;

   // ========== 1418 ===== 130 ==========
   aPseudoTicket[1418] = 710;
   aAction[1418] = 1; // OPEN
   aReturn[710] = 1418;
   aType[1418] = OP_BUY; // BUY
   aTicket[1418] = -1; // Ticket given by broker
   aSymbol[1418] = "GBPUSD";
   aLots[1418] = 1.0;
   aDate[1418] = D'2012.05.16 01:42:21'+time_offset*3600;
   aPrice[1418] = 1.59794;

   // ========== 1419 ===== 129 ==========
   aPseudoTicket[1419] = 711;
   aAction[1419] = 1; // OPEN
   aReturn[711] = 1419;
   aType[1419] = OP_BUY; // BUY
   aTicket[1419] = -1; // Ticket given by broker
   aSymbol[1419] = "AUDUSD";
   aLots[1419] = 1.0;
   aDate[1419] = D'2012.05.16 06:21:09'+time_offset*3600;
   aPrice[1419] = 0.9895;

   // ========== 1420 ===== 131 ==========
   aPseudoTicket[1420] = 712;
   aAction[1420] = 1; // OPEN
   aReturn[712] = 1420;
   aType[1420] = OP_BUY; // BUY
   aTicket[1420] = -1; // Ticket given by broker
   aSymbol[1420] = "GBPUSD";
   aLots[1420] = 1.0;
   aDate[1420] = D'2012.05.16 07:39:54'+time_offset*3600;
   aPrice[1420] = 1.59373;

   // ========== 1421 ===== 131 ==========
   aPseudoTicket[1421] = 712;
   aAction[1421] = 0; // CLOSE
   aType[1421] = OP_BUY; // BUY
   aTicket[1421] = -1; // Ticket given by broker
   aSymbol[1421] = "GBPUSD";
   aLots[1421] = 1.0;
   aDate[1421] = D'2012.05.16 08:04:11'+time_offset*3600;
   aPrice[1421] = 1.5966;

   // ========== 1422 ===== 130 ==========
   aPseudoTicket[1422] = 710;
   aAction[1422] = 0; // CLOSE
   aType[1422] = OP_BUY; // BUY
   aTicket[1422] = -1; // Ticket given by broker
   aSymbol[1422] = "GBPUSD";
   aLots[1422] = 1.0;
   aDate[1422] = D'2012.05.16 08:15:38'+time_offset*3600;
   aPrice[1422] = 1.5971;

   // ========== 1423 ===== 129 ==========
   aPseudoTicket[1423] = 711;
   aAction[1423] = 0; // CLOSE
   aType[1423] = OP_BUY; // BUY
   aTicket[1423] = -1; // Ticket given by broker
   aSymbol[1423] = "AUDUSD";
   aLots[1423] = 1.0;
   aDate[1423] = D'2012.05.16 09:20:42'+time_offset*3600;
   aPrice[1423] = 0.99194;

   // ========== 1424 ===== 128 ==========
   aPseudoTicket[1424] = 713;
   aAction[1424] = 1; // OPEN
   aReturn[713] = 1424;
   aType[1424] = OP_BUY; // BUY
   aTicket[1424] = -1; // Ticket given by broker
   aSymbol[1424] = "GBPUSD";
   aLots[1424] = 1.0;
   aDate[1424] = D'2012.05.16 09:31:31'+time_offset*3600;
   aPrice[1424] = 1.59179;

   // ========== 1425 ===== 128 ==========
   aPseudoTicket[1425] = 713;
   aAction[1425] = 0; // CLOSE
   aType[1425] = OP_BUY; // BUY
   aTicket[1425] = -1; // Ticket given by broker
   aSymbol[1425] = "GBPUSD";
   aLots[1425] = 1.0;
   aDate[1425] = D'2012.05.16 10:43:18'+time_offset*3600;
   aPrice[1425] = 1.59236;

   // ========== 1426 ===== 127 ==========
   aPseudoTicket[1426] = 714;
   aAction[1426] = 1; // OPEN
   aReturn[714] = 1426;
   aType[1426] = OP_SELL; // SELL
   aTicket[1426] = -1; // Ticket given by broker
   aSymbol[1426] = "AUDUSD";
   aLots[1426] = 1.0;
   aDate[1426] = D'2012.05.16 14:23:24'+time_offset*3600;
   aPrice[1426] = 0.99623;

   // ========== 1427 ===== 127 ==========
   aPseudoTicket[1427] = 714;
   aAction[1427] = 0; // CLOSE
   aType[1427] = OP_SELL; // SELL
   aTicket[1427] = -1; // Ticket given by broker
   aSymbol[1427] = "AUDUSD";
   aLots[1427] = 1.0;
   aDate[1427] = D'2012.05.16 15:05:54'+time_offset*3600;
   aPrice[1427] = 0.99278;

   // ========== 1428 ===== 126 ==========
   aPseudoTicket[1428] = 715;
   aAction[1428] = 1; // OPEN
   aReturn[715] = 1428;
   aType[1428] = OP_BUY; // BUY
   aTicket[1428] = -1; // Ticket given by broker
   aSymbol[1428] = "AUDUSD";
   aLots[1428] = 1.0;
   aDate[1428] = D'2012.05.16 18:54:52'+time_offset*3600;
   aPrice[1428] = 0.99229;

   // ========== 1429 ===== 126 ==========
   aPseudoTicket[1429] = 715;
   aAction[1429] = 0; // CLOSE
   aType[1429] = OP_BUY; // BUY
   aTicket[1429] = -1; // Ticket given by broker
   aSymbol[1429] = "AUDUSD";
   aLots[1429] = 1.0;
   aDate[1429] = D'2012.05.17 00:05:56'+time_offset*3600;
   aPrice[1429] = 0.99327;

   // ========== 1430 ===== 124 ==========
   aPseudoTicket[1430] = 716;
   aAction[1430] = 1; // OPEN
   aReturn[716] = 1430;
   aType[1430] = OP_BUY; // BUY
   aTicket[1430] = -1; // Ticket given by broker
   aSymbol[1430] = "GBPUSD";
   aLots[1430] = 1.0;
   aDate[1430] = D'2012.05.17 09:53:33'+time_offset*3600;
   aPrice[1430] = 1.58782;

   // ========== 1431 ===== 123 ==========
   aPseudoTicket[1431] = 717;
   aAction[1431] = 1; // OPEN
   aReturn[717] = 1431;
   aType[1431] = OP_BUY; // BUY
   aTicket[1431] = -1; // Ticket given by broker
   aSymbol[1431] = "GBPUSD";
   aLots[1431] = 1.0;
   aDate[1431] = D'2012.05.17 12:30:39'+time_offset*3600;
   aPrice[1431] = 1.581;

   // ========== 1432 ===== 122 ==========
   aPseudoTicket[1432] = 718;
   aAction[1432] = 1; // OPEN
   aReturn[718] = 1432;
   aType[1432] = OP_BUY; // BUY
   aTicket[1432] = -1; // Ticket given by broker
   aSymbol[1432] = "GBPUSD";
   aLots[1432] = 1.0;
   aDate[1432] = D'2012.05.17 15:07:28'+time_offset*3600;
   aPrice[1432] = 1.58114;

   // ========== 1433 ===== 125 ==========
   aPseudoTicket[1433] = 719;
   aAction[1433] = 1; // OPEN
   aReturn[719] = 1433;
   aType[1433] = OP_BUY; // BUY
   aTicket[1433] = -1; // Ticket given by broker
   aSymbol[1433] = "GBPUSD";
   aLots[1433] = 1.0;
   aDate[1433] = D'2012.05.17 21:51:27'+time_offset*3600;
   aPrice[1433] = 1.5784;

   // ========== 1434 ===== 125 ==========
   aPseudoTicket[1434] = 719;
   aAction[1434] = 0; // CLOSE
   aType[1434] = OP_BUY; // BUY
   aTicket[1434] = -1; // Ticket given by broker
   aSymbol[1434] = "GBPUSD";
   aLots[1434] = 1.0;
   aDate[1434] = D'2012.05.18 09:45:29'+time_offset*3600;
   aPrice[1434] = 1.5805;

   // ========== 1435 ===== 123 ==========
   aPseudoTicket[1435] = 717;
   aAction[1435] = 0; // CLOSE
   aType[1435] = OP_BUY; // BUY
   aTicket[1435] = -1; // Ticket given by broker
   aSymbol[1435] = "GBPUSD";
   aLots[1435] = 1.0;
   aDate[1435] = D'2012.05.18 09:51:49'+time_offset*3600;
   aPrice[1435] = 1.582;

   // ========== 1436 ===== 124 ==========
   aPseudoTicket[1436] = 716;
   aAction[1436] = 0; // CLOSE
   aType[1436] = OP_BUY; // BUY
   aTicket[1436] = -1; // Ticket given by broker
   aSymbol[1436] = "GBPUSD";
   aLots[1436] = 1.0;
   aDate[1436] = D'2012.05.18 09:51:49'+time_offset*3600;
   aPrice[1436] = 1.582;

   // ========== 1437 ===== 122 ==========
   aPseudoTicket[1437] = 718;
   aAction[1437] = 0; // CLOSE
   aType[1437] = OP_BUY; // BUY
   aTicket[1437] = -1; // Ticket given by broker
   aSymbol[1437] = "GBPUSD";
   aLots[1437] = 1.0;
   aDate[1437] = D'2012.05.18 09:52:11'+time_offset*3600;
   aPrice[1437] = 1.58184;

   // ========== 1438 ===== 120 ==========
   aPseudoTicket[1438] = 720;
   aAction[1438] = 1; // OPEN
   aReturn[720] = 1438;
   aType[1438] = OP_SELL; // SELL
   aTicket[1438] = -1; // Ticket given by broker
   aSymbol[1438] = "GBPUSD";
   aLots[1438] = 1.0;
   aDate[1438] = D'2012.05.18 12:30:50'+time_offset*3600;
   aPrice[1438] = 1.58266;

   // ========== 1439 ===== 121 ==========
   aPseudoTicket[1439] = 721;
   aAction[1439] = 1; // OPEN
   aReturn[721] = 1439;
   aType[1439] = OP_SELL; // SELL
   aTicket[1439] = -1; // Ticket given by broker
   aSymbol[1439] = "GBPUSD";
   aLots[1439] = 1.0;
   aDate[1439] = D'2012.05.18 13:31:12'+time_offset*3600;
   aPrice[1439] = 1.58325;

   // ========== 1440 ===== 121 ==========
   aPseudoTicket[1440] = 721;
   aAction[1440] = 0; // CLOSE
   aType[1440] = OP_SELL; // SELL
   aTicket[1440] = -1; // Ticket given by broker
   aSymbol[1440] = "GBPUSD";
   aLots[1440] = 1.0;
   aDate[1440] = D'2012.05.18 14:06:11'+time_offset*3600;
   aPrice[1440] = 1.58181;

   // ========== 1441 ===== 120 ==========
   aPseudoTicket[1441] = 720;
   aAction[1441] = 0; // CLOSE
   aType[1441] = OP_SELL; // SELL
   aTicket[1441] = -1; // Ticket given by broker
   aSymbol[1441] = "GBPUSD";
   aLots[1441] = 1.0;
   aDate[1441] = D'2012.05.18 15:27:38'+time_offset*3600;
   aPrice[1441] = 1.58145;

   // ========== 1442 ===== 118 ==========
   aPseudoTicket[1442] = 722;
   aAction[1442] = 1; // OPEN
   aReturn[722] = 1442;
   aType[1442] = OP_SELL; // SELL
   aTicket[1442] = -1; // Ticket given by broker
   aSymbol[1442] = "EURUSD";
   aLots[1442] = 1.0;
   aDate[1442] = D'2012.05.20 21:02:19'+time_offset*3600;
   aPrice[1442] = 1.27653;

   // ========== 1443 ===== 119 ==========
   aPseudoTicket[1443] = 723;
   aAction[1443] = 1; // OPEN
   aReturn[723] = 1443;
   aType[1443] = OP_SELL; // SELL
   aTicket[1443] = -1; // Ticket given by broker
   aSymbol[1443] = "EURUSD";
   aLots[1443] = 1.0;
   aDate[1443] = D'2012.05.21 01:36:59'+time_offset*3600;
   aPrice[1443] = 1.28085;

   // ========== 1444 ===== 119 ==========
   aPseudoTicket[1444] = 723;
   aAction[1444] = 0; // CLOSE
   aType[1444] = OP_SELL; // SELL
   aTicket[1444] = -1; // Ticket given by broker
   aSymbol[1444] = "EURUSD";
   aLots[1444] = 1.0;
   aDate[1444] = D'2012.05.21 03:40:47'+time_offset*3600;
   aPrice[1444] = 1.27951;

   // ========== 1445 ===== 118 ==========
   aPseudoTicket[1445] = 722;
   aAction[1445] = 0; // CLOSE
   aType[1445] = OP_SELL; // SELL
   aTicket[1445] = -1; // Ticket given by broker
   aSymbol[1445] = "EURUSD";
   aLots[1445] = 1.0;
   aDate[1445] = D'2012.05.21 11:44:32'+time_offset*3600;
   aPrice[1445] = 1.2765;

   // ========== 1446 ===== 117 ==========
   aPseudoTicket[1446] = 724;
   aAction[1446] = 1; // OPEN
   aReturn[724] = 1446;
   aType[1446] = OP_SELL; // SELL
   aTicket[1446] = -1; // Ticket given by broker
   aSymbol[1446] = "GBPUSD";
   aLots[1446] = 1.0;
   aDate[1446] = D'2012.05.22 08:08:15'+time_offset*3600;
   aPrice[1446] = 1.58341;

   // ========== 1447 ===== 117 ==========
   aPseudoTicket[1447] = 724;
   aAction[1447] = 0; // CLOSE
   aType[1447] = OP_SELL; // SELL
   aTicket[1447] = -1; // Ticket given by broker
   aSymbol[1447] = "GBPUSD";
   aLots[1447] = 1.0;
   aDate[1447] = D'2012.05.22 08:45:50'+time_offset*3600;
   aPrice[1447] = 1.58008;

   // ========== 1448 ===== 116 ==========
   aPseudoTicket[1448] = 725;
   aAction[1448] = 1; // OPEN
   aReturn[725] = 1448;
   aType[1448] = OP_SELL; // SELL
   aTicket[1448] = -1; // Ticket given by broker
   aSymbol[1448] = "EURUSD";
   aLots[1448] = 1.0;
   aDate[1448] = D'2012.05.22 09:05:51'+time_offset*3600;
   aPrice[1448] = 1.27602;

   // ========== 1449 ===== 116 ==========
   aPseudoTicket[1449] = 725;
   aAction[1449] = 0; // CLOSE
   aType[1449] = OP_SELL; // SELL
   aTicket[1449] = -1; // Ticket given by broker
   aSymbol[1449] = "EURUSD";
   aLots[1449] = 1.0;
   aDate[1449] = D'2012.05.22 09:39:51'+time_offset*3600;
   aPrice[1449] = 1.27579;

   // ========== 1450 ===== 115 ==========
   aPseudoTicket[1450] = 726;
   aAction[1450] = 1; // OPEN
   aReturn[726] = 1450;
   aType[1450] = OP_BUY; // BUY
   aTicket[1450] = -1; // Ticket given by broker
   aSymbol[1450] = "AUDUSD";
   aLots[1450] = 1.0;
   aDate[1450] = D'2012.05.22 17:45:23'+time_offset*3600;
   aPrice[1450] = 0.9838;

   // ========== 1451 ===== 113 ==========
   aPseudoTicket[1451] = 727;
   aAction[1451] = 1; // OPEN
   aReturn[727] = 1451;
   aType[1451] = OP_BUY; // BUY
   aTicket[1451] = -1; // Ticket given by broker
   aSymbol[1451] = "EURUSD";
   aLots[1451] = 1.0;
   aDate[1451] = D'2012.05.22 21:31:35'+time_offset*3600;
   aPrice[1451] = 1.26777;

   // ========== 1452 ===== 114 ==========
   aPseudoTicket[1452] = 728;
   aAction[1452] = 1; // OPEN
   aReturn[728] = 1452;
   aType[1452] = OP_BUY; // BUY
   aTicket[1452] = -1; // Ticket given by broker
   aSymbol[1452] = "EURUSD";
   aLots[1452] = 1.0;
   aDate[1452] = D'2012.05.23 00:23:25'+time_offset*3600;
   aPrice[1452] = 1.26611;

   // ========== 1453 ===== 115 ==========
   aPseudoTicket[1453] = 726;
   aAction[1453] = 0; // CLOSE
   aType[1453] = OP_BUY; // BUY
   aTicket[1453] = -1; // Ticket given by broker
   aSymbol[1453] = "AUDUSD";
   aLots[1453] = 1.0;
   aDate[1453] = D'2012.05.23 04:56:38'+time_offset*3600;
   aPrice[1453] = 0.97738;

   // ========== 1454 ===== 114 ==========
   aPseudoTicket[1454] = 728;
   aAction[1454] = 0; // CLOSE
   aType[1454] = OP_BUY; // BUY
   aTicket[1454] = -1; // Ticket given by broker
   aSymbol[1454] = "EURUSD";
   aLots[1454] = 1.0;
   aDate[1454] = D'2012.05.23 12:34:22'+time_offset*3600;
   aPrice[1454] = 1.26574;

   // ========== 1455 ===== 113 ==========
   aPseudoTicket[1455] = 727;
   aAction[1455] = 0; // CLOSE
   aType[1455] = OP_BUY; // BUY
   aTicket[1455] = -1; // Ticket given by broker
   aSymbol[1455] = "EURUSD";
   aLots[1455] = 1.0;
   aDate[1455] = D'2012.05.23 12:36:08'+time_offset*3600;
   aPrice[1455] = 1.2654;

   // ========== 1456 ===== 112 ==========
   aPseudoTicket[1456] = 729;
   aAction[1456] = 1; // OPEN
   aReturn[729] = 1456;
   aType[1456] = OP_SELL; // SELL
   aTicket[1456] = -1; // Ticket given by broker
   aSymbol[1456] = "EURUSD";
   aLots[1456] = 1.0;
   aDate[1456] = D'2012.05.24 07:44:54'+time_offset*3600;
   aPrice[1456] = 1.25449;

   // ========== 1457 ===== 112 ==========
   aPseudoTicket[1457] = 729;
   aAction[1457] = 0; // CLOSE
   aType[1457] = OP_SELL; // SELL
   aTicket[1457] = -1; // Ticket given by broker
   aSymbol[1457] = "EURUSD";
   aLots[1457] = 1.0;
   aDate[1457] = D'2012.05.24 07:57:48'+time_offset*3600;
   aPrice[1457] = 1.25419;

   // ========== 1458 ===== 111 ==========
   aPseudoTicket[1458] = 730;
   aAction[1458] = 1; // OPEN
   aReturn[730] = 1458;
   aType[1458] = OP_BUY; // BUY
   aTicket[1458] = -1; // Ticket given by broker
   aSymbol[1458] = "AUDUSD";
   aLots[1458] = 1.0;
   aDate[1458] = D'2012.05.24 08:50:27'+time_offset*3600;
   aPrice[1458] = 0.97178;

   // ========== 1459 ===== 111 ==========
   aPseudoTicket[1459] = 730;
   aAction[1459] = 0; // CLOSE
   aType[1459] = OP_BUY; // BUY
   aTicket[1459] = -1; // Ticket given by broker
   aSymbol[1459] = "AUDUSD";
   aLots[1459] = 1.0;
   aDate[1459] = D'2012.05.24 09:14:41'+time_offset*3600;
   aPrice[1459] = 0.97395;

   // ========== 1460 ===== 110 ==========
   aPseudoTicket[1460] = 731;
   aAction[1460] = 1; // OPEN
   aReturn[731] = 1460;
   aType[1460] = OP_BUY; // BUY
   aTicket[1460] = -1; // Ticket given by broker
   aSymbol[1460] = "EURUSD";
   aLots[1460] = 1.0;
   aDate[1460] = D'2012.05.24 19:15:40'+time_offset*3600;
   aPrice[1460] = 1.25256;

   // ========== 1461 ===== 110 ==========
   aPseudoTicket[1461] = 731;
   aAction[1461] = 0; // CLOSE
   aType[1461] = OP_BUY; // BUY
   aTicket[1461] = -1; // Ticket given by broker
   aSymbol[1461] = "EURUSD";
   aLots[1461] = 1.0;
   aDate[1461] = D'2012.05.24 19:31:19'+time_offset*3600;
   aPrice[1461] = 1.25412;

   // ========== 1462 ===== 109 ==========
   aPseudoTicket[1462] = 732;
   aAction[1462] = 1; // OPEN
   aReturn[732] = 1462;
   aType[1462] = OP_SELL; // SELL
   aTicket[1462] = -1; // Ticket given by broker
   aSymbol[1462] = "EURUSD";
   aLots[1462] = 1.0;
   aDate[1462] = D'2012.05.25 12:29:41'+time_offset*3600;
   aPrice[1462] = 1.25233;

   // ========== 1463 ===== 109 ==========
   aPseudoTicket[1463] = 732;
   aAction[1463] = 0; // CLOSE
   aType[1463] = OP_SELL; // SELL
   aTicket[1463] = -1; // Ticket given by broker
   aSymbol[1463] = "EURUSD";
   aLots[1463] = 1.0;
   aDate[1463] = D'2012.05.25 12:36:14'+time_offset*3600;
   aPrice[1463] = 1.25088;

   // ========== 1464 ===== 107 ==========
   aPseudoTicket[1464] = 733;
   aAction[1464] = 1; // OPEN
   aReturn[733] = 1464;
   aType[1464] = OP_SELL; // SELL
   aTicket[1464] = -1; // Ticket given by broker
   aSymbol[1464] = "EURUSD";
   aLots[1464] = 1.0;
   aDate[1464] = D'2012.05.28 03:00:43'+time_offset*3600;
   aPrice[1464] = 1.25898;

   // ========== 1465 ===== 108 ==========
   aPseudoTicket[1465] = 734;
   aAction[1465] = 1; // OPEN
   aReturn[734] = 1465;
   aType[1465] = OP_SELL; // SELL
   aTicket[1465] = -1; // Ticket given by broker
   aSymbol[1465] = "EURUSD";
   aLots[1465] = 1.0;
   aDate[1465] = D'2012.05.28 05:43:29'+time_offset*3600;
   aPrice[1465] = 1.2603;

   // ========== 1466 ===== 108 ==========
   aPseudoTicket[1466] = 734;
   aAction[1466] = 0; // CLOSE
   aType[1466] = OP_SELL; // SELL
   aTicket[1466] = -1; // Ticket given by broker
   aSymbol[1466] = "EURUSD";
   aLots[1466] = 1.0;
   aDate[1466] = D'2012.05.28 06:05:45'+time_offset*3600;
   aPrice[1466] = 1.25967;

   // ========== 1467 ===== 107 ==========
   aPseudoTicket[1467] = 733;
   aAction[1467] = 0; // CLOSE
   aType[1467] = OP_SELL; // SELL
   aTicket[1467] = -1; // Ticket given by broker
   aSymbol[1467] = "EURUSD";
   aLots[1467] = 1.0;
   aDate[1467] = D'2012.05.28 08:08:20'+time_offset*3600;
   aPrice[1467] = 1.25752;

   // ========== 1468 ===== 106 ==========
   aPseudoTicket[1468] = 735;
   aAction[1468] = 1; // OPEN
   aReturn[735] = 1468;
   aType[1468] = OP_SELL; // SELL
   aTicket[1468] = -1; // Ticket given by broker
   aSymbol[1468] = "AUDUSD";
   aLots[1468] = 1.0;
   aDate[1468] = D'2012.05.28 10:21:14'+time_offset*3600;
   aPrice[1468] = 0.9879;

   // ========== 1469 ===== 106 ==========
   aPseudoTicket[1469] = 735;
   aAction[1469] = 0; // CLOSE
   aType[1469] = OP_SELL; // SELL
   aTicket[1469] = -1; // Ticket given by broker
   aSymbol[1469] = "AUDUSD";
   aLots[1469] = 1.0;
   aDate[1469] = D'2012.05.28 11:46:37'+time_offset*3600;
   aPrice[1469] = 0.98737;

   // ========== 1470 ===== 105 ==========
   aPseudoTicket[1470] = 736;
   aAction[1470] = 1; // OPEN
   aReturn[736] = 1470;
   aType[1470] = OP_BUY; // BUY
   aTicket[1470] = -1; // Ticket given by broker
   aSymbol[1470] = "EURUSD";
   aLots[1470] = 1.0;
   aDate[1470] = D'2012.05.29 07:05:08'+time_offset*3600;
   aPrice[1470] = 1.25619;

   // ========== 1471 ===== 105 ==========
   aPseudoTicket[1471] = 736;
   aAction[1471] = 0; // CLOSE
   aType[1471] = OP_BUY; // BUY
   aTicket[1471] = -1; // Ticket given by broker
   aSymbol[1471] = "EURUSD";
   aLots[1471] = 1.0;
   aDate[1471] = D'2012.05.29 09:14:52'+time_offset*3600;
   aPrice[1471] = 1.25606;

   // ========== 1472 ===== 104 ==========
   aPseudoTicket[1472] = 737;
   aAction[1472] = 1; // OPEN
   aReturn[737] = 1472;
   aType[1472] = OP_SELL; // SELL
   aTicket[1472] = -1; // Ticket given by broker
   aSymbol[1472] = "EURUSD";
   aLots[1472] = 1.0;
   aDate[1472] = D'2012.05.29 11:45:06'+time_offset*3600;
   aPrice[1472] = 1.25215;

   // ========== 1473 ===== 104 ==========
   aPseudoTicket[1473] = 737;
   aAction[1473] = 0; // CLOSE
   aType[1473] = OP_SELL; // SELL
   aTicket[1473] = -1; // Ticket given by broker
   aSymbol[1473] = "EURUSD";
   aLots[1473] = 1.0;
   aDate[1473] = D'2012.05.29 12:09:08'+time_offset*3600;
   aPrice[1473] = 1.25212;

   // ========== 1474 ===== 103 ==========
   aPseudoTicket[1474] = 738;
   aAction[1474] = 1; // OPEN
   aReturn[738] = 1474;
   aType[1474] = OP_BUY; // BUY
   aTicket[1474] = -1; // Ticket given by broker
   aSymbol[1474] = "EURUSD";
   aLots[1474] = 1.0;
   aDate[1474] = D'2012.05.30 01:38:54'+time_offset*3600;
   aPrice[1474] = 1.24657;

   // ========== 1475 ===== 103 ==========
   aPseudoTicket[1475] = 738;
   aAction[1475] = 0; // CLOSE
   aType[1475] = OP_BUY; // BUY
   aTicket[1475] = -1; // Ticket given by broker
   aSymbol[1475] = "EURUSD";
   aLots[1475] = 1.0;
   aDate[1475] = D'2012.05.30 06:31:35'+time_offset*3600;
   aPrice[1475] = 1.24722;

   // ========== 1476 ===== 97 ==========
   aPseudoTicket[1476] = 739;
   aAction[1476] = 1; // OPEN
   aReturn[739] = 1476;
   aType[1476] = OP_BUY; // BUY
   aTicket[1476] = -1; // Ticket given by broker
   aSymbol[1476] = "EURUSD";
   aLots[1476] = 1.0;
   aDate[1476] = D'2012.05.30 07:58:08'+time_offset*3600;
   aPrice[1476] = 1.24584;

   // ========== 1477 ===== 98 ==========
   aPseudoTicket[1477] = 740;
   aAction[1477] = 1; // OPEN
   aReturn[740] = 1477;
   aType[1477] = OP_BUY; // BUY
   aTicket[1477] = -1; // Ticket given by broker
   aSymbol[1477] = "EURUSD";
   aLots[1477] = 1.0;
   aDate[1477] = D'2012.05.30 09:12:22'+time_offset*3600;
   aPrice[1477] = 1.24416;

   // ========== 1478 ===== 101 ==========
   aPseudoTicket[1478] = 741;
   aAction[1478] = 1; // OPEN
   aReturn[741] = 1478;
   aType[1478] = OP_SELL; // SELL
   aTicket[1478] = -1; // Ticket given by broker
   aSymbol[1478] = "GBPUSD";
   aLots[1478] = 1.0;
   aDate[1478] = D'2012.05.30 14:21:00'+time_offset*3600;
   aPrice[1478] = 1.55345;

   // ========== 1479 ===== 102 ==========
   aPseudoTicket[1479] = 742;
   aAction[1479] = 1; // OPEN
   aReturn[742] = 1479;
   aType[1479] = OP_SELL; // SELL
   aTicket[1479] = -1; // Ticket given by broker
   aSymbol[1479] = "GBPUSD";
   aLots[1479] = 1.0;
   aDate[1479] = D'2012.05.30 14:30:50'+time_offset*3600;
   aPrice[1479] = 1.55498;

   // ========== 1480 ===== 102 ==========
   aPseudoTicket[1480] = 742;
   aAction[1480] = 0; // CLOSE
   aType[1480] = OP_SELL; // SELL
   aTicket[1480] = -1; // Ticket given by broker
   aSymbol[1480] = "GBPUSD";
   aLots[1480] = 1.0;
   aDate[1480] = D'2012.05.30 14:37:40'+time_offset*3600;
   aPrice[1480] = 1.55344;

   // ========== 1481 ===== 101 ==========
   aPseudoTicket[1481] = 741;
   aAction[1481] = 0; // CLOSE
   aType[1481] = OP_SELL; // SELL
   aTicket[1481] = -1; // Ticket given by broker
   aSymbol[1481] = "GBPUSD";
   aLots[1481] = 1.0;
   aDate[1481] = D'2012.05.30 14:48:21'+time_offset*3600;
   aPrice[1481] = 1.55267;

   // ========== 1482 ===== 100 ==========
   aPseudoTicket[1482] = 743;
   aAction[1482] = 1; // OPEN
   aReturn[743] = 1482;
   aType[1482] = OP_BUY; // BUY
   aTicket[1482] = -1; // Ticket given by broker
   aSymbol[1482] = "EURUSD";
   aLots[1482] = 1.0;
   aDate[1482] = D'2012.05.30 20:26:56'+time_offset*3600;
   aPrice[1482] = 1.23676;

   // ========== 1483 ===== 100 ==========
   aPseudoTicket[1483] = 743;
   aAction[1483] = 0; // CLOSE
   aType[1483] = OP_BUY; // BUY
   aTicket[1483] = -1; // Ticket given by broker
   aSymbol[1483] = "EURUSD";
   aLots[1483] = 1.0;
   aDate[1483] = D'2012.05.31 03:25:20'+time_offset*3600;
   aPrice[1483] = 1.23741;

   // ========== 1484 ===== 99 ==========
   aPseudoTicket[1484] = 744;
   aAction[1484] = 1; // OPEN
   aReturn[744] = 1484;
   aType[1484] = OP_BUY; // BUY
   aTicket[1484] = -1; // Ticket given by broker
   aSymbol[1484] = "GBPUSD";
   aLots[1484] = 1.0;
   aDate[1484] = D'2012.05.31 07:09:15'+time_offset*3600;
   aPrice[1484] = 1.54898;

   // ========== 1485 ===== 99 ==========
   aPseudoTicket[1485] = 744;
   aAction[1485] = 0; // CLOSE
   aType[1485] = OP_BUY; // BUY
   aTicket[1485] = -1; // Ticket given by broker
   aSymbol[1485] = "GBPUSD";
   aLots[1485] = 1.0;
   aDate[1485] = D'2012.05.31 07:26:39'+time_offset*3600;
   aPrice[1485] = 1.54974;

   // ========== 1486 ===== 98 ==========
   aPseudoTicket[1486] = 740;
   aAction[1486] = 0; // CLOSE
   aType[1486] = OP_BUY; // BUY
   aTicket[1486] = -1; // Ticket given by broker
   aSymbol[1486] = "EURUSD";
   aLots[1486] = 1.0;
   aDate[1486] = D'2012.05.31 08:41:47'+time_offset*3600;
   aPrice[1486] = 1.24146;

   // ========== 1487 ===== 97 ==========
   aPseudoTicket[1487] = 739;
   aAction[1487] = 0; // CLOSE
   aType[1487] = OP_BUY; // BUY
   aTicket[1487] = -1; // Ticket given by broker
   aSymbol[1487] = "EURUSD";
   aLots[1487] = 1.0;
   aDate[1487] = D'2012.05.31 09:09:40'+time_offset*3600;
   aPrice[1487] = 1.24203;

   // ========== 1488 ===== 94 ==========
   aPseudoTicket[1488] = 745;
   aAction[1488] = 1; // OPEN
   aReturn[745] = 1488;
   aType[1488] = OP_BUY; // BUY
   aTicket[1488] = -1; // Ticket given by broker
   aSymbol[1488] = "EURUSD";
   aLots[1488] = 1.0;
   aDate[1488] = D'2012.06.01 00:56:46'+time_offset*3600;
   aPrice[1488] = 1.23448;

   // ========== 1489 ===== 96 ==========
   aPseudoTicket[1489] = 746;
   aAction[1489] = 1; // OPEN
   aReturn[746] = 1489;
   aType[1489] = OP_BUY; // BUY
   aTicket[1489] = -1; // Ticket given by broker
   aSymbol[1489] = "GBPUSD";
   aLots[1489] = 1.0;
   aDate[1489] = D'2012.06.01 08:28:02'+time_offset*3600;
   aPrice[1489] = 1.5305;

   // ========== 1490 ===== 93 ==========
   aPseudoTicket[1490] = 747;
   aAction[1490] = 1; // OPEN
   aReturn[747] = 1490;
   aType[1490] = OP_BUY; // BUY
   aTicket[1490] = -1; // Ticket given by broker
   aSymbol[1490] = "EURUSD";
   aLots[1490] = 1.0;
   aDate[1490] = D'2012.06.01 12:15:31'+time_offset*3600;
   aPrice[1490] = 1.23229;

   // ========== 1491 ===== 95 ==========
   aPseudoTicket[1491] = 748;
   aAction[1491] = 1; // OPEN
   aReturn[748] = 1491;
   aType[1491] = OP_BUY; // BUY
   aTicket[1491] = -1; // Ticket given by broker
   aSymbol[1491] = "EURUSD";
   aLots[1491] = 1.0;
   aDate[1491] = D'2012.06.01 12:31:23'+time_offset*3600;
   aPrice[1491] = 1.22984;

   // ========== 1492 ===== 96 ==========
   aPseudoTicket[1492] = 746;
   aAction[1492] = 0; // CLOSE
   aType[1492] = OP_BUY; // BUY
   aTicket[1492] = -1; // Ticket given by broker
   aSymbol[1492] = "GBPUSD";
   aLots[1492] = 1.0;
   aDate[1492] = D'2012.06.01 13:10:51'+time_offset*3600;
   aPrice[1492] = 1.53482;

   // ========== 1493 ===== 95 ==========
   aPseudoTicket[1493] = 748;
   aAction[1493] = 0; // CLOSE
   aType[1493] = OP_BUY; // BUY
   aTicket[1493] = -1; // Ticket given by broker
   aSymbol[1493] = "EURUSD";
   aLots[1493] = 1.0;
   aDate[1493] = D'2012.06.01 13:27:29'+time_offset*3600;
   aPrice[1493] = 1.23929;

   // ========== 1494 ===== 94 ==========
   aPseudoTicket[1494] = 745;
   aAction[1494] = 0; // CLOSE
   aType[1494] = OP_BUY; // BUY
   aTicket[1494] = -1; // Ticket given by broker
   aSymbol[1494] = "EURUSD";
   aLots[1494] = 1.0;
   aDate[1494] = D'2012.06.01 13:28:27'+time_offset*3600;
   aPrice[1494] = 1.24001;

   // ========== 1495 ===== 93 ==========
   aPseudoTicket[1495] = 747;
   aAction[1495] = 0; // CLOSE
   aType[1495] = OP_BUY; // BUY
   aTicket[1495] = -1; // Ticket given by broker
   aSymbol[1495] = "EURUSD";
   aLots[1495] = 1.0;
   aDate[1495] = D'2012.06.01 13:32:16'+time_offset*3600;
   aPrice[1495] = 1.24112;

   // ========== 1496 ===== 91 ==========
   aPseudoTicket[1496] = 749;
   aAction[1496] = 1; // OPEN
   aReturn[749] = 1496;
   aType[1496] = OP_BUY; // BUY
   aTicket[1496] = -1; // Ticket given by broker
   aSymbol[1496] = "EURUSD";
   aLots[1496] = 1.0;
   aDate[1496] = D'2012.06.01 13:52:13'+time_offset*3600;
   aPrice[1496] = 1.241;

   // ========== 1497 ===== 92 ==========
   aPseudoTicket[1497] = 750;
   aAction[1497] = 1; // OPEN
   aReturn[750] = 1497;
   aType[1497] = OP_BUY; // BUY
   aTicket[1497] = -1; // Ticket given by broker
   aSymbol[1497] = "EURUSD";
   aLots[1497] = 1.0;
   aDate[1497] = D'2012.06.01 13:57:47'+time_offset*3600;
   aPrice[1497] = 1.23946;

   // ========== 1498 ===== 92 ==========
   aPseudoTicket[1498] = 750;
   aAction[1498] = 0; // CLOSE
   aType[1498] = OP_BUY; // BUY
   aTicket[1498] = -1; // Ticket given by broker
   aSymbol[1498] = "EURUSD";
   aLots[1498] = 1.0;
   aDate[1498] = D'2012.06.01 14:01:03'+time_offset*3600;
   aPrice[1498] = 1.24158;

   // ========== 1499 ===== 91 ==========
   aPseudoTicket[1499] = 749;
   aAction[1499] = 0; // CLOSE
   aType[1499] = OP_BUY; // BUY
   aTicket[1499] = -1; // Ticket given by broker
   aSymbol[1499] = "EURUSD";
   aLots[1499] = 1.0;
   aDate[1499] = D'2012.06.01 14:10:18'+time_offset*3600;
   aPrice[1499] = 1.24259;

   // ========== 1500 ===== 90 ==========
   aPseudoTicket[1500] = 751;
   aAction[1500] = 1; // OPEN
   aReturn[751] = 1500;
   aType[1500] = OP_BUY; // BUY
   aTicket[1500] = -1; // Ticket given by broker
   aSymbol[1500] = "EURUSD";
   aLots[1500] = 1.0;
   aDate[1500] = D'2012.06.01 14:59:27'+time_offset*3600;
   aPrice[1500] = 1.2365;

   // ========== 1501 ===== 90 ==========
   aPseudoTicket[1501] = 751;
   aAction[1501] = 0; // CLOSE
   aType[1501] = OP_BUY; // BUY
   aTicket[1501] = -1; // Ticket given by broker
   aSymbol[1501] = "EURUSD";
   aLots[1501] = 1.0;
   aDate[1501] = D'2012.06.01 15:38:57'+time_offset*3600;
   aPrice[1501] = 1.23826;

   // ========== 1502 ===== 89 ==========
   aPseudoTicket[1502] = 752;
   aAction[1502] = 1; // OPEN
   aReturn[752] = 1502;
   aType[1502] = OP_SELL; // SELL
   aTicket[1502] = -1; // Ticket given by broker
   aSymbol[1502] = "EURUSD";
   aLots[1502] = 1.0;
   aDate[1502] = D'2012.06.04 13:38:33'+time_offset*3600;
   aPrice[1502] = 1.24951;

   // ========== 1503 ===== 89 ==========
   aPseudoTicket[1503] = 752;
   aAction[1503] = 0; // CLOSE
   aType[1503] = OP_SELL; // SELL
   aTicket[1503] = -1; // Ticket given by broker
   aSymbol[1503] = "EURUSD";
   aLots[1503] = 1.0;
   aDate[1503] = D'2012.06.04 13:43:44'+time_offset*3600;
   aPrice[1503] = 1.2487;

   // ========== 1504 ===== 87 ==========
   aPseudoTicket[1504] = 753;
   aAction[1504] = 1; // OPEN
   aReturn[753] = 1504;
   aType[1504] = OP_SELL; // SELL
   aTicket[1504] = -1; // Ticket given by broker
   aSymbol[1504] = "EURUSD";
   aLots[1504] = 1.0;
   aDate[1504] = D'2012.06.04 14:07:54'+time_offset*3600;
   aPrice[1504] = 1.24906;

   // ========== 1505 ===== 88 ==========
   aPseudoTicket[1505] = 754;
   aAction[1505] = 1; // OPEN
   aReturn[754] = 1505;
   aType[1505] = OP_SELL; // SELL
   aTicket[1505] = -1; // Ticket given by broker
   aSymbol[1505] = "EURUSD";
   aLots[1505] = 1.0;
   aDate[1505] = D'2012.06.05 00:07:06'+time_offset*3600;
   aPrice[1505] = 1.25357;

   // ========== 1506 ===== 88 ==========
   aPseudoTicket[1506] = 754;
   aAction[1506] = 0; // CLOSE
   aType[1506] = OP_SELL; // SELL
   aTicket[1506] = -1; // Ticket given by broker
   aSymbol[1506] = "EURUSD";
   aLots[1506] = 1.0;
   aDate[1506] = D'2012.06.05 06:41:33'+time_offset*3600;
   aPrice[1506] = 1.24994;

   // ========== 1507 ===== 87 ==========
   aPseudoTicket[1507] = 753;
   aAction[1507] = 0; // CLOSE
   aType[1507] = OP_SELL; // SELL
   aTicket[1507] = -1; // Ticket given by broker
   aSymbol[1507] = "EURUSD";
   aLots[1507] = 1.0;
   aDate[1507] = D'2012.06.05 06:49:41'+time_offset*3600;
   aPrice[1507] = 1.24951;

   // ========== 1508 ===== 86 ==========
   aPseudoTicket[1508] = 755;
   aAction[1508] = 1; // OPEN
   aReturn[755] = 1508;
   aType[1508] = OP_SELL; // SELL
   aTicket[1508] = -1; // Ticket given by broker
   aSymbol[1508] = "GBPUSD";
   aLots[1508] = 1.0;
   aDate[1508] = D'2012.06.06 07:34:32'+time_offset*3600;
   aPrice[1508] = 1.54545;

   // ========== 1509 ===== 86 ==========
   aPseudoTicket[1509] = 755;
   aAction[1509] = 0; // CLOSE
   aType[1509] = OP_SELL; // SELL
   aTicket[1509] = -1; // Ticket given by broker
   aSymbol[1509] = "GBPUSD";
   aLots[1509] = 1.0;
   aDate[1509] = D'2012.06.06 09:21:15'+time_offset*3600;
   aPrice[1509] = 1.54485;

   // ========== 1510 ===== 82 ==========
   aPseudoTicket[1510] = 756;
   aAction[1510] = 1; // OPEN
   aReturn[756] = 1510;
   aType[1510] = OP_SELL; // SELL
   aTicket[1510] = -1; // Ticket given by broker
   aSymbol[1510] = "AUDUSD";
   aLots[1510] = 1.0;
   aDate[1510] = D'2012.06.06 11:06:24'+time_offset*3600;
   aPrice[1510] = 0.98614;

   // ========== 1511 ===== 85 ==========
   aPseudoTicket[1511] = 757;
   aAction[1511] = 1; // OPEN
   aReturn[757] = 1511;
   aType[1511] = OP_SELL; // SELL
   aTicket[1511] = -1; // Ticket given by broker
   aSymbol[1511] = "GBPUSD";
   aLots[1511] = 1.0;
   aDate[1511] = D'2012.06.06 11:25:31'+time_offset*3600;
   aPrice[1511] = 1.5513;

   // ========== 1512 ===== 85 ==========
   aPseudoTicket[1512] = 757;
   aAction[1512] = 0; // CLOSE
   aType[1512] = OP_SELL; // SELL
   aTicket[1512] = -1; // Ticket given by broker
   aSymbol[1512] = "GBPUSD";
   aLots[1512] = 1.0;
   aDate[1512] = D'2012.06.06 11:39:02'+time_offset*3600;
   aPrice[1512] = 1.55063;

   // ========== 1513 ===== 84 ==========
   aPseudoTicket[1513] = 758;
   aAction[1513] = 1; // OPEN
   aReturn[758] = 1513;
   aType[1513] = OP_SELL; // SELL
   aTicket[1513] = -1; // Ticket given by broker
   aSymbol[1513] = "USDJPY";
   aLots[1513] = 1.0;
   aDate[1513] = D'2012.06.07 05:40:38'+time_offset*3600;
   aPrice[1513] = 79.447;

   // ========== 1514 ===== 84 ==========
   aPseudoTicket[1514] = 758;
   aAction[1514] = 0; // CLOSE
   aType[1514] = OP_SELL; // SELL
   aTicket[1514] = -1; // Ticket given by broker
   aSymbol[1514] = "USDJPY";
   aLots[1514] = 1.0;
   aDate[1514] = D'2012.06.07 09:01:36'+time_offset*3600;
   aPrice[1514] = 79.451;

   // ========== 1515 ===== 83 ==========
   aPseudoTicket[1515] = 759;
   aAction[1515] = 1; // OPEN
   aReturn[759] = 1515;
   aType[1515] = OP_SELL; // SELL
   aTicket[1515] = -1; // Ticket given by broker
   aSymbol[1515] = "EURUSD";
   aLots[1515] = 1.0;
   aDate[1515] = D'2012.06.07 11:27:24'+time_offset*3600;
   aPrice[1515] = 1.25859;

   // ========== 1516 ===== 83 ==========
   aPseudoTicket[1516] = 759;
   aAction[1516] = 0; // CLOSE
   aType[1516] = OP_SELL; // SELL
   aTicket[1516] = -1; // Ticket given by broker
   aSymbol[1516] = "EURUSD";
   aLots[1516] = 1.0;
   aDate[1516] = D'2012.06.07 14:19:56'+time_offset*3600;
   aPrice[1516] = 1.25629;

   // ========== 1517 ===== 80 ==========
   aPseudoTicket[1517] = 760;
   aAction[1517] = 1; // OPEN
   aReturn[760] = 1517;
   aType[1517] = OP_SELL; // SELL
   aTicket[1517] = -1; // Ticket given by broker
   aSymbol[1517] = "USDJPY";
   aLots[1517] = 1.0;
   aDate[1517] = D'2012.06.07 14:30:38'+time_offset*3600;
   aPrice[1517] = 79.64;

   // ========== 1518 ===== 82 ==========
   aPseudoTicket[1518] = 756;
   aAction[1518] = 0; // CLOSE
   aType[1518] = OP_SELL; // SELL
   aTicket[1518] = -1; // Ticket given by broker
   aSymbol[1518] = "AUDUSD";
   aLots[1518] = 1.0;
   aDate[1518] = D'2012.06.07 20:20:46'+time_offset*3600;
   aPrice[1518] = 0.99003;

   // ========== 1519 ===== 81 ==========
   aPseudoTicket[1519] = 761;
   aAction[1519] = 1; // OPEN
   aReturn[761] = 1519;
   aType[1519] = OP_SELL; // SELL
   aTicket[1519] = -1; // Ticket given by broker
   aSymbol[1519] = "USDJPY";
   aLots[1519] = 1.0;
   aDate[1519] = D'2012.06.07 23:55:30'+time_offset*3600;
   aPrice[1519] = 79.742;

   // ========== 1520 ===== 81 ==========
   aPseudoTicket[1520] = 761;
   aAction[1520] = 0; // CLOSE
   aType[1520] = OP_SELL; // SELL
   aTicket[1520] = -1; // Ticket given by broker
   aSymbol[1520] = "USDJPY";
   aLots[1520] = 1.0;
   aDate[1520] = D'2012.06.08 00:33:50'+time_offset*3600;
   aPrice[1520] = 79.592;

   // ========== 1521 ===== 80 ==========
   aPseudoTicket[1521] = 760;
   aAction[1521] = 0; // CLOSE
   aType[1521] = OP_SELL; // SELL
   aTicket[1521] = -1; // Ticket given by broker
   aSymbol[1521] = "USDJPY";
   aLots[1521] = 1.0;
   aDate[1521] = D'2012.06.08 02:03:46'+time_offset*3600;
   aPrice[1521] = 79.407;

   // ========== 1522 ===== 79 ==========
   aPseudoTicket[1522] = 762;
   aAction[1522] = 1; // OPEN
   aReturn[762] = 1522;
   aType[1522] = OP_BUY; // BUY
   aTicket[1522] = -1; // Ticket given by broker
   aSymbol[1522] = "GBPUSD";
   aLots[1522] = 1.0;
   aDate[1522] = D'2012.06.08 09:09:38'+time_offset*3600;
   aPrice[1522] = 1.5414;

   // ========== 1523 ===== 79 ==========
   aPseudoTicket[1523] = 762;
   aAction[1523] = 0; // CLOSE
   aType[1523] = OP_BUY; // BUY
   aTicket[1523] = -1; // Ticket given by broker
   aSymbol[1523] = "GBPUSD";
   aLots[1523] = 1.0;
   aDate[1523] = D'2012.06.08 09:30:32'+time_offset*3600;
   aPrice[1523] = 1.54154;

   // ========== 1524 ===== 76 ==========
   aPseudoTicket[1524] = 763;
   aAction[1524] = 1; // OPEN
   aReturn[763] = 1524;
   aType[1524] = OP_SELL; // SELL
   aTicket[1524] = -1; // Ticket given by broker
   aSymbol[1524] = "EURUSD";
   aLots[1524] = 1.0;
   aDate[1524] = D'2012.06.10 21:39:35'+time_offset*3600;
   aPrice[1524] = 1.266;

   // ========== 1525 ===== 77 ==========
   aPseudoTicket[1525] = 764;
   aAction[1525] = 1; // OPEN
   aReturn[764] = 1525;
   aType[1525] = OP_SELL; // SELL
   aTicket[1525] = -1; // Ticket given by broker
   aSymbol[1525] = "GBPUSD";
   aLots[1525] = 1.0;
   aDate[1525] = D'2012.06.11 01:20:17'+time_offset*3600;
   aPrice[1525] = 1.55537;

   // ========== 1526 ===== 78 ==========
   aPseudoTicket[1526] = 765;
   aAction[1526] = 1; // OPEN
   aReturn[765] = 1526;
   aType[1526] = OP_SELL; // SELL
   aTicket[1526] = -1; // Ticket given by broker
   aSymbol[1526] = "EURUSD";
   aLots[1526] = 1.0;
   aDate[1526] = D'2012.06.11 05:37:38'+time_offset*3600;
   aPrice[1526] = 1.26445;

   // ========== 1527 ===== 78 ==========
   aPseudoTicket[1527] = 765;
   aAction[1527] = 0; // CLOSE
   aType[1527] = OP_SELL; // SELL
   aTicket[1527] = -1; // Ticket given by broker
   aSymbol[1527] = "EURUSD";
   aLots[1527] = 1.0;
   aDate[1527] = D'2012.06.11 06:16:35'+time_offset*3600;
   aPrice[1527] = 1.26286;

   // ========== 1528 ===== 77 ==========
   aPseudoTicket[1528] = 764;
   aAction[1528] = 0; // CLOSE
   aType[1528] = OP_SELL; // SELL
   aTicket[1528] = -1; // Ticket given by broker
   aSymbol[1528] = "GBPUSD";
   aLots[1528] = 1.0;
   aDate[1528] = D'2012.06.11 07:21:15'+time_offset*3600;
   aPrice[1528] = 1.55426;

   // ========== 1529 ===== 76 ==========
   aPseudoTicket[1529] = 763;
   aAction[1529] = 0; // CLOSE
   aType[1529] = OP_SELL; // SELL
   aTicket[1529] = -1; // Ticket given by broker
   aSymbol[1529] = "EURUSD";
   aLots[1529] = 1.0;
   aDate[1529] = D'2012.06.11 07:25:10'+time_offset*3600;
   aPrice[1529] = 1.26194;

   // ========== 1530 ===== 74 ==========
   aPseudoTicket[1530] = 766;
   aAction[1530] = 1; // OPEN
   aReturn[766] = 1530;
   aType[1530] = OP_BUY; // BUY
   aTicket[1530] = -1; // Ticket given by broker
   aSymbol[1530] = "EURUSD";
   aLots[1530] = 1.0;
   aDate[1530] = D'2012.06.11 21:08:52'+time_offset*3600;
   aPrice[1530] = 1.24746;

   // ========== 1531 ===== 75 ==========
   aPseudoTicket[1531] = 767;
   aAction[1531] = 1; // OPEN
   aReturn[767] = 1531;
   aType[1531] = OP_BUY; // BUY
   aTicket[1531] = -1; // Ticket given by broker
   aSymbol[1531] = "EURUSD";
   aLots[1531] = 1.0;
   aDate[1531] = D'2012.06.11 22:10:31'+time_offset*3600;
   aPrice[1531] = 1.24644;

   // ========== 1532 ===== 75 ==========
   aPseudoTicket[1532] = 767;
   aAction[1532] = 0; // CLOSE
   aType[1532] = OP_BUY; // BUY
   aTicket[1532] = -1; // Ticket given by broker
   aSymbol[1532] = "EURUSD";
   aLots[1532] = 1.0;
   aDate[1532] = D'2012.06.11 22:40:17'+time_offset*3600;
   aPrice[1532] = 1.24709;

   // ========== 1533 ===== 74 ==========
   aPseudoTicket[1533] = 766;
   aAction[1533] = 0; // CLOSE
   aType[1533] = OP_BUY; // BUY
   aTicket[1533] = -1; // Ticket given by broker
   aSymbol[1533] = "EURUSD";
   aLots[1533] = 1.0;
   aDate[1533] = D'2012.06.11 23:56:05'+time_offset*3600;
   aPrice[1533] = 1.24765;

   // ========== 1534 ===== 73 ==========
   aPseudoTicket[1534] = 768;
   aAction[1534] = 1; // OPEN
   aReturn[768] = 1534;
   aType[1534] = OP_SELL; // SELL
   aTicket[1534] = -1; // Ticket given by broker
   aSymbol[1534] = "EURUSD";
   aLots[1534] = 1.0;
   aDate[1534] = D'2012.06.12 14:08:29'+time_offset*3600;
   aPrice[1534] = 1.24568;

   // ========== 1535 ===== 73 ==========
   aPseudoTicket[1535] = 768;
   aAction[1535] = 0; // CLOSE
   aType[1535] = OP_SELL; // SELL
   aTicket[1535] = -1; // Ticket given by broker
   aSymbol[1535] = "EURUSD";
   aLots[1535] = 1.0;
   aDate[1535] = D'2012.06.12 15:13:52'+time_offset*3600;
   aPrice[1535] = 1.24784;

   // ========== 1536 ===== 72 ==========
   aPseudoTicket[1536] = 769;
   aAction[1536] = 1; // OPEN
   aReturn[769] = 1536;
   aType[1536] = OP_SELL; // SELL
   aTicket[1536] = -1; // Ticket given by broker
   aSymbol[1536] = "EURUSD";
   aLots[1536] = 1.0;
   aDate[1536] = D'2012.06.13 11:50:20'+time_offset*3600;
   aPrice[1536] = 1.25363;

   // ========== 1537 ===== 71 ==========
   aPseudoTicket[1537] = 770;
   aAction[1537] = 1; // OPEN
   aReturn[770] = 1537;
   aType[1537] = OP_SELL; // SELL
   aTicket[1537] = -1; // Ticket given by broker
   aSymbol[1537] = "EURUSD";
   aLots[1537] = 1.0;
   aDate[1537] = D'2012.06.13 12:46:13'+time_offset*3600;
   aPrice[1537] = 1.25378;

   // ========== 1538 ===== 72 ==========
   aPseudoTicket[1538] = 769;
   aAction[1538] = 0; // CLOSE
   aType[1538] = OP_SELL; // SELL
   aTicket[1538] = -1; // Ticket given by broker
   aSymbol[1538] = "EURUSD";
   aLots[1538] = 1.0;
   aDate[1538] = D'2012.06.13 13:41:03'+time_offset*3600;
   aPrice[1538] = 1.25241;

   // ========== 1539 ===== 71 ==========
   aPseudoTicket[1539] = 770;
   aAction[1539] = 0; // CLOSE
   aType[1539] = OP_SELL; // SELL
   aTicket[1539] = -1; // Ticket given by broker
   aSymbol[1539] = "EURUSD";
   aLots[1539] = 1.0;
   aDate[1539] = D'2012.06.13 13:48:38'+time_offset*3600;
   aPrice[1539] = 1.25278;

   // ========== 1540 ===== 70 ==========
   aPseudoTicket[1540] = 771;
   aAction[1540] = 1; // OPEN
   aReturn[771] = 1540;
   aType[1540] = OP_SELL; // SELL
   aTicket[1540] = -1; // Ticket given by broker
   aSymbol[1540] = "EURUSD";
   aLots[1540] = 1.0;
   aDate[1540] = D'2012.06.13 15:37:00'+time_offset*3600;
   aPrice[1540] = 1.26009;

   // ========== 1541 ===== 70 ==========
   aPseudoTicket[1541] = 771;
   aAction[1541] = 0; // CLOSE
   aType[1541] = OP_SELL; // SELL
   aTicket[1541] = -1; // Ticket given by broker
   aSymbol[1541] = "EURUSD";
   aLots[1541] = 1.0;
   aDate[1541] = D'2012.06.13 15:51:49'+time_offset*3600;
   aPrice[1541] = 1.25936;

   // ========== 1542 ===== 69 ==========
   aPseudoTicket[1542] = 772;
   aAction[1542] = 1; // OPEN
   aReturn[772] = 1542;
   aType[1542] = OP_SELL; // SELL
   aTicket[1542] = -1; // Ticket given by broker
   aSymbol[1542] = "GBPUSD";
   aLots[1542] = 1.0;
   aDate[1542] = D'2012.06.14 06:21:36'+time_offset*3600;
   aPrice[1542] = 1.54928;

   // ========== 1543 ===== 69 ==========
   aPseudoTicket[1543] = 772;
   aAction[1543] = 0; // CLOSE
   aType[1543] = OP_SELL; // SELL
   aTicket[1543] = -1; // Ticket given by broker
   aSymbol[1543] = "GBPUSD";
   aLots[1543] = 1.0;
   aDate[1543] = D'2012.06.14 06:49:25'+time_offset*3600;
   aPrice[1543] = 1.5481;

   // ========== 1544 ===== 68 ==========
   aPseudoTicket[1544] = 773;
   aAction[1544] = 1; // OPEN
   aReturn[773] = 1544;
   aType[1544] = OP_SELL; // SELL
   aTicket[1544] = -1; // Ticket given by broker
   aSymbol[1544] = "EURUSD";
   aLots[1544] = 1.0;
   aDate[1544] = D'2012.06.14 08:53:48'+time_offset*3600;
   aPrice[1544] = 1.2546;

   // ========== 1545 ===== 68 ==========
   aPseudoTicket[1545] = 773;
   aAction[1545] = 0; // CLOSE
   aType[1545] = OP_SELL; // SELL
   aTicket[1545] = -1; // Ticket given by broker
   aSymbol[1545] = "EURUSD";
   aLots[1545] = 1.0;
   aDate[1545] = D'2012.06.14 10:16:49'+time_offset*3600;
   aPrice[1545] = 1.25653;

   // ========== 1546 ===== 67 ==========
   aPseudoTicket[1546] = 774;
   aAction[1546] = 1; // OPEN
   aReturn[774] = 1546;
   aType[1546] = OP_SELL; // SELL
   aTicket[1546] = -1; // Ticket given by broker
   aSymbol[1546] = "EURUSD";
   aLots[1546] = 1.0;
   aDate[1546] = D'2012.06.14 21:38:46'+time_offset*3600;
   aPrice[1546] = 1.26284;

   // ========== 1547 ===== 67 ==========
   aPseudoTicket[1547] = 774;
   aAction[1547] = 0; // CLOSE
   aType[1547] = OP_SELL; // SELL
   aTicket[1547] = -1; // Ticket given by broker
   aSymbol[1547] = "EURUSD";
   aLots[1547] = 1.0;
   aDate[1547] = D'2012.06.15 00:49:11'+time_offset*3600;
   aPrice[1547] = 1.26163;

   // ========== 1548 ===== 66 ==========
   aPseudoTicket[1548] = 775;
   aAction[1548] = 1; // OPEN
   aReturn[775] = 1548;
   aType[1548] = OP_SELL; // SELL
   aTicket[1548] = -1; // Ticket given by broker
   aSymbol[1548] = "EURUSD";
   aLots[1548] = 1.0;
   aDate[1548] = D'2012.06.15 03:44:01'+time_offset*3600;
   aPrice[1548] = 1.2639;

   // ========== 1549 ===== 66 ==========
   aPseudoTicket[1549] = 775;
   aAction[1549] = 0; // CLOSE
   aType[1549] = OP_SELL; // SELL
   aTicket[1549] = -1; // Ticket given by broker
   aSymbol[1549] = "EURUSD";
   aLots[1549] = 1.0;
   aDate[1549] = D'2012.06.15 07:28:35'+time_offset*3600;
   aPrice[1549] = 1.26256;

   // ========== 1550 ===== 65 ==========
   aPseudoTicket[1550] = 776;
   aAction[1550] = 1; // OPEN
   aReturn[776] = 1550;
   aType[1550] = OP_SELL; // SELL
   aTicket[1550] = -1; // Ticket given by broker
   aSymbol[1550] = "AUDUSD";
   aLots[1550] = 1.0;
   aDate[1550] = D'2012.06.15 15:35:49'+time_offset*3600;
   aPrice[1550] = 1.00653;

   // ========== 1551 ===== 65 ==========
   aPseudoTicket[1551] = 776;
   aAction[1551] = 0; // CLOSE
   aType[1551] = OP_SELL; // SELL
   aTicket[1551] = -1; // Ticket given by broker
   aSymbol[1551] = "AUDUSD";
   aLots[1551] = 1.0;
   aDate[1551] = D'2012.06.15 16:24:07'+time_offset*3600;
   aPrice[1551] = 1.00547;

   // ========== 1552 ===== 64 ==========
   aPseudoTicket[1552] = 777;
   aAction[1552] = 1; // OPEN
   aReturn[777] = 1552;
   aType[1552] = OP_SELL; // SELL
   aTicket[1552] = -1; // Ticket given by broker
   aSymbol[1552] = "AUDUSD";
   aLots[1552] = 1.0;
   aDate[1552] = D'2012.06.18 00:33:27'+time_offset*3600;
   aPrice[1552] = 1.01149;

   // ========== 1553 ===== 64 ==========
   aPseudoTicket[1553] = 777;
   aAction[1553] = 0; // CLOSE
   aType[1553] = OP_SELL; // SELL
   aTicket[1553] = -1; // Ticket given by broker
   aSymbol[1553] = "AUDUSD";
   aLots[1553] = 1.0;
   aDate[1553] = D'2012.06.18 01:45:49'+time_offset*3600;
   aPrice[1553] = 1.00929;

   // ========== 1554 ===== 63 ==========
   aPseudoTicket[1554] = 778;
   aAction[1554] = 1; // OPEN
   aReturn[778] = 1554;
   aType[1554] = OP_SELL; // SELL
   aTicket[1554] = -1; // Ticket given by broker
   aSymbol[1554] = "AUDUSD";
   aLots[1554] = 1.0;
   aDate[1554] = D'2012.06.18 06:12:31'+time_offset*3600;
   aPrice[1554] = 1.01151;

   // ========== 1555 ===== 63 ==========
   aPseudoTicket[1555] = 778;
   aAction[1555] = 0; // CLOSE
   aType[1555] = OP_SELL; // SELL
   aTicket[1555] = -1; // Ticket given by broker
   aSymbol[1555] = "AUDUSD";
   aLots[1555] = 1.0;
   aDate[1555] = D'2012.06.18 07:23:37'+time_offset*3600;
   aPrice[1555] = 1.01023;

   // ========== 1556 ===== 62 ==========
   aPseudoTicket[1556] = 779;
   aAction[1556] = 1; // OPEN
   aReturn[779] = 1556;
   aType[1556] = OP_BUY; // BUY
   aTicket[1556] = -1; // Ticket given by broker
   aSymbol[1556] = "EURUSD";
   aLots[1556] = 1.0;
   aDate[1556] = D'2012.06.18 12:38:43'+time_offset*3600;
   aPrice[1556] = 1.26066;

   // ========== 1557 ===== 62 ==========
   aPseudoTicket[1557] = 779;
   aAction[1557] = 0; // CLOSE
   aType[1557] = OP_BUY; // BUY
   aTicket[1557] = -1; // Ticket given by broker
   aSymbol[1557] = "EURUSD";
   aLots[1557] = 1.0;
   aDate[1557] = D'2012.06.18 14:23:10'+time_offset*3600;
   aPrice[1557] = 1.26009;

   // ========== 1558 ===== 59 ==========
   aPseudoTicket[1558] = 780;
   aAction[1558] = 1; // OPEN
   aReturn[780] = 1558;
   aType[1558] = OP_SELL; // SELL
   aTicket[1558] = -1; // Ticket given by broker
   aSymbol[1558] = "AUDUSD";
   aLots[1558] = 1.0;
   aDate[1558] = D'2012.06.19 14:09:45'+time_offset*3600;
   aPrice[1558] = 1.01744;

   // ========== 1559 ===== 58 ==========
   aPseudoTicket[1559] = 781;
   aAction[1559] = 1; // OPEN
   aReturn[781] = 1559;
   aType[1559] = OP_SELL; // SELL
   aTicket[1559] = -1; // Ticket given by broker
   aSymbol[1559] = "AUDUSD";
   aLots[1559] = 1.0;
   aDate[1559] = D'2012.06.19 14:23:17'+time_offset*3600;
   aPrice[1559] = 1.01762;

   // ========== 1560 ===== 61 ==========
   aPseudoTicket[1560] = 782;
   aAction[1560] = 1; // OPEN
   aReturn[782] = 1560;
   aType[1560] = OP_SELL; // SELL
   aTicket[1560] = -1; // Ticket given by broker
   aSymbol[1560] = "AUDUSD";
   aLots[1560] = 1.0;
   aDate[1560] = D'2012.06.19 15:49:23'+time_offset*3600;
   aPrice[1560] = 1.01914;

   // ========== 1561 ===== 61 ==========
   aPseudoTicket[1561] = 782;
   aAction[1561] = 0; // CLOSE
   aType[1561] = OP_SELL; // SELL
   aTicket[1561] = -1; // Ticket given by broker
   aSymbol[1561] = "AUDUSD";
   aLots[1561] = 1.0;
   aDate[1561] = D'2012.06.19 18:50:21'+time_offset*3600;
   aPrice[1561] = 1.01771;

   // ========== 1562 ===== 60 ==========
   aPseudoTicket[1562] = 783;
   aAction[1562] = 1; // OPEN
   aReturn[783] = 1562;
   aType[1562] = OP_SELL; // SELL
   aTicket[1562] = -1; // Ticket given by broker
   aSymbol[1562] = "AUDUSD";
   aLots[1562] = 1.0;
   aDate[1562] = D'2012.06.20 11:31:51'+time_offset*3600;
   aPrice[1562] = 1.0206;

   // ========== 1563 ===== 60 ==========
   aPseudoTicket[1563] = 783;
   aAction[1563] = 0; // CLOSE
   aType[1563] = OP_SELL; // SELL
   aTicket[1563] = -1; // Ticket given by broker
   aSymbol[1563] = "AUDUSD";
   aLots[1563] = 1.0;
   aDate[1563] = D'2012.06.20 12:50:45'+time_offset*3600;
   aPrice[1563] = 1.01942;

   // ========== 1564 ===== 59 ==========
   aPseudoTicket[1564] = 780;
   aAction[1564] = 0; // CLOSE
   aType[1564] = OP_SELL; // SELL
   aTicket[1564] = -1; // Ticket given by broker
   aSymbol[1564] = "AUDUSD";
   aLots[1564] = 1.0;
   aDate[1564] = D'2012.06.20 16:32:15'+time_offset*3600;
   aPrice[1564] = 1.017;

   // ========== 1565 ===== 58 ==========
   aPseudoTicket[1565] = 781;
   aAction[1565] = 0; // CLOSE
   aType[1565] = OP_SELL; // SELL
   aTicket[1565] = -1; // Ticket given by broker
   aSymbol[1565] = "AUDUSD";
   aLots[1565] = 1.0;
   aDate[1565] = D'2012.06.21 02:23:26'+time_offset*3600;
   aPrice[1565] = 1.0172;

   // ========== 1566 ===== 57 ==========
   aPseudoTicket[1566] = 784;
   aAction[1566] = 1; // OPEN
   aReturn[784] = 1566;
   aType[1566] = OP_SELL; // SELL
   aTicket[1566] = -1; // Ticket given by broker
   aSymbol[1566] = "EURUSD";
   aLots[1566] = 1.0;
   aDate[1566] = D'2012.06.21 18:07:48'+time_offset*3600;
   aPrice[1566] = 1.25646;

   // ========== 1567 ===== 57 ==========
   aPseudoTicket[1567] = 784;
   aAction[1567] = 0; // CLOSE
   aType[1567] = OP_SELL; // SELL
   aTicket[1567] = -1; // Ticket given by broker
   aSymbol[1567] = "EURUSD";
   aLots[1567] = 1.0;
   aDate[1567] = D'2012.06.21 18:16:12'+time_offset*3600;
   aPrice[1567] = 1.25611;

   // ========== 1568 ===== 56 ==========
   aPseudoTicket[1568] = 785;
   aAction[1568] = 1; // OPEN
   aReturn[785] = 1568;
   aType[1568] = OP_SELL; // SELL
   aTicket[1568] = -1; // Ticket given by broker
   aSymbol[1568] = "EURUSD";
   aLots[1568] = 1.0;
   aDate[1568] = D'2012.06.22 10:34:45'+time_offset*3600;
   aPrice[1568] = 1.25537;

   // ========== 1569 ===== 56 ==========
   aPseudoTicket[1569] = 785;
   aAction[1569] = 0; // CLOSE
   aType[1569] = OP_SELL; // SELL
   aTicket[1569] = -1; // Ticket given by broker
   aSymbol[1569] = "EURUSD";
   aLots[1569] = 1.0;
   aDate[1569] = D'2012.06.25 05:39:23'+time_offset*3600;
   aPrice[1569] = 1.25267;

   // ========== 1570 ===== 55 ==========
   aPseudoTicket[1570] = 786;
   aAction[1570] = 1; // OPEN
   aReturn[786] = 1570;
   aType[1570] = OP_SELL; // SELL
   aTicket[1570] = -1; // Ticket given by broker
   aSymbol[1570] = "EURUSD";
   aLots[1570] = 1.0;
   aDate[1570] = D'2012.06.25 06:37:55'+time_offset*3600;
   aPrice[1570] = 1.24993;

   // ========== 1571 ===== 54 ==========
   aPseudoTicket[1571] = 787;
   aAction[1571] = 1; // OPEN
   aReturn[787] = 1571;
   aType[1571] = OP_SELL; // SELL
   aTicket[1571] = -1; // Ticket given by broker
   aSymbol[1571] = "EURUSD";
   aLots[1571] = 1.0;
   aDate[1571] = D'2012.06.25 06:40:47'+time_offset*3600;
   aPrice[1571] = 1.25058;

   // ========== 1572 ===== 55 ==========
   aPseudoTicket[1572] = 786;
   aAction[1572] = 0; // CLOSE
   aType[1572] = OP_SELL; // SELL
   aTicket[1572] = -1; // Ticket given by broker
   aSymbol[1572] = "EURUSD";
   aLots[1572] = 1.0;
   aDate[1572] = D'2012.06.25 09:21:34'+time_offset*3600;
   aPrice[1572] = 1.2493;

   // ========== 1573 ===== 54 ==========
   aPseudoTicket[1573] = 787;
   aAction[1573] = 0; // CLOSE
   aType[1573] = OP_SELL; // SELL
   aTicket[1573] = -1; // Ticket given by broker
   aSymbol[1573] = "EURUSD";
   aLots[1573] = 1.0;
   aDate[1573] = D'2012.06.25 09:25:01'+time_offset*3600;
   aPrice[1573] = 1.24917;

   // ========== 1574 ===== 53 ==========
   aPseudoTicket[1574] = 788;
   aAction[1574] = 1; // OPEN
   aReturn[788] = 1574;
   aType[1574] = OP_BUY; // BUY
   aTicket[1574] = -1; // Ticket given by broker
   aSymbol[1574] = "USDJPY";
   aLots[1574] = 1.0;
   aDate[1574] = D'2012.06.25 12:28:26'+time_offset*3600;
   aPrice[1574] = 79.674;

   // ========== 1575 ===== 53 ==========
   aPseudoTicket[1575] = 788;
   aAction[1575] = 0; // CLOSE
   aType[1575] = OP_BUY; // BUY
   aTicket[1575] = -1; // Ticket given by broker
   aSymbol[1575] = "USDJPY";
   aLots[1575] = 1.0;
   aDate[1575] = D'2012.06.25 22:18:31'+time_offset*3600;
   aPrice[1575] = 79.598;

   // ========== 1576 ===== 52 ==========
   aPseudoTicket[1576] = 789;
   aAction[1576] = 1; // OPEN
   aReturn[789] = 1576;
   aType[1576] = OP_SELL; // SELL
   aTicket[1576] = -1; // Ticket given by broker
   aSymbol[1576] = "EURUSD";
   aLots[1576] = 1.0;
   aDate[1576] = D'2012.06.26 08:49:15'+time_offset*3600;
   aPrice[1576] = 1.2488;

   // ========== 1577 ===== 52 ==========
   aPseudoTicket[1577] = 789;
   aAction[1577] = 0; // CLOSE
   aType[1577] = OP_SELL; // SELL
   aTicket[1577] = -1; // Ticket given by broker
   aSymbol[1577] = "EURUSD";
   aLots[1577] = 1.0;
   aDate[1577] = D'2012.06.26 09:41:18'+time_offset*3600;
   aPrice[1577] = 1.24981;

   // ========== 1578 ===== 51 ==========
   aPseudoTicket[1578] = 790;
   aAction[1578] = 1; // OPEN
   aReturn[790] = 1578;
   aType[1578] = OP_SELL; // SELL
   aTicket[1578] = -1; // Ticket given by broker
   aSymbol[1578] = "EURUSD";
   aLots[1578] = 1.0;
   aDate[1578] = D'2012.06.26 12:18:26'+time_offset*3600;
   aPrice[1578] = 1.24614;

   // ========== 1579 ===== 51 ==========
   aPseudoTicket[1579] = 790;
   aAction[1579] = 0; // CLOSE
   aType[1579] = OP_SELL; // SELL
   aTicket[1579] = -1; // Ticket given by broker
   aSymbol[1579] = "EURUSD";
   aLots[1579] = 1.0;
   aDate[1579] = D'2012.06.26 12:53:23'+time_offset*3600;
   aPrice[1579] = 1.24726;

   // ========== 1580 ===== 48 ==========
   aPseudoTicket[1580] = 791;
   aAction[1580] = 1; // OPEN
   aReturn[791] = 1580;
   aType[1580] = OP_SELL; // SELL
   aTicket[1580] = -1; // Ticket given by broker
   aSymbol[1580] = "EURUSD";
   aLots[1580] = 1.0;
   aDate[1580] = D'2012.06.28 08:55:50'+time_offset*3600;
   aPrice[1580] = 1.24262;

   // ========== 1581 ===== 49 ==========
   aPseudoTicket[1581] = 792;
   aAction[1581] = 1; // OPEN
   aReturn[792] = 1581;
   aType[1581] = OP_SELL; // SELL
   aTicket[1581] = -1; // Ticket given by broker
   aSymbol[1581] = "EURUSD";
   aLots[1581] = 1.0;
   aDate[1581] = D'2012.06.28 09:07:06'+time_offset*3600;
   aPrice[1581] = 1.24323;

   // ========== 1582 ===== 50 ==========
   aPseudoTicket[1582] = 793;
   aAction[1582] = 1; // OPEN
   aReturn[793] = 1582;
   aType[1582] = OP_SELL; // SELL
   aTicket[1582] = -1; // Ticket given by broker
   aSymbol[1582] = "EURUSD";
   aLots[1582] = 1.0;
   aDate[1582] = D'2012.06.28 11:28:22'+time_offset*3600;
   aPrice[1582] = 1.24486;

   // ========== 1583 ===== 50 ==========
   aPseudoTicket[1583] = 793;
   aAction[1583] = 0; // CLOSE
   aType[1583] = OP_SELL; // SELL
   aTicket[1583] = -1; // Ticket given by broker
   aSymbol[1583] = "EURUSD";
   aLots[1583] = 1.0;
   aDate[1583] = D'2012.06.28 11:55:52'+time_offset*3600;
   aPrice[1583] = 1.24314;

   // ========== 1584 ===== 49 ==========
   aPseudoTicket[1584] = 792;
   aAction[1584] = 0; // CLOSE
   aType[1584] = OP_SELL; // SELL
   aTicket[1584] = -1; // Ticket given by broker
   aSymbol[1584] = "EURUSD";
   aLots[1584] = 1.0;
   aDate[1584] = D'2012.06.29 02:49:17'+time_offset*3600;
   aPrice[1584] = 1.24716;

   // ========== 1585 ===== 48 ==========
   aPseudoTicket[1585] = 791;
   aAction[1585] = 0; // CLOSE
   aType[1585] = OP_SELL; // SELL
   aTicket[1585] = -1; // Ticket given by broker
   aSymbol[1585] = "EURUSD";
   aLots[1585] = 1.0;
   aDate[1585] = D'2012.06.29 02:49:21'+time_offset*3600;
   aPrice[1585] = 1.24704;

   // ========== 1586 ===== 47 ==========
   aPseudoTicket[1586] = 794;
   aAction[1586] = 1; // OPEN
   aReturn[794] = 1586;
   aType[1586] = OP_SELL; // SELL
   aTicket[1586] = -1; // Ticket given by broker
   aSymbol[1586] = "EURUSD";
   aLots[1586] = 1.0;
   aDate[1586] = D'2012.06.29 03:02:51'+time_offset*3600;
   aPrice[1586] = 1.26047;

   // ========== 1587 ===== 47 ==========
   aPseudoTicket[1587] = 794;
   aAction[1587] = 0; // CLOSE
   aType[1587] = OP_SELL; // SELL
   aTicket[1587] = -1; // Ticket given by broker
   aSymbol[1587] = "EURUSD";
   aLots[1587] = 1.0;
   aDate[1587] = D'2012.06.29 03:03:40'+time_offset*3600;
   aPrice[1587] = 1.2585;

   // ========== 1588 ===== 46 ==========
   aPseudoTicket[1588] = 795;
   aAction[1588] = 1; // OPEN
   aReturn[795] = 1588;
   aType[1588] = OP_BUY; // BUY
   aTicket[1588] = -1; // Ticket given by broker
   aSymbol[1588] = "EURUSD";
   aLots[1588] = 1.0;
   aDate[1588] = D'2012.07.02 17:34:16'+time_offset*3600;
   aPrice[1588] = 1.25851;

   // ========== 1589 ===== 46 ==========
   aPseudoTicket[1589] = 795;
   aAction[1589] = 0; // CLOSE
   aType[1589] = OP_BUY; // BUY
   aTicket[1589] = -1; // Ticket given by broker
   aSymbol[1589] = "EURUSD";
   aLots[1589] = 1.0;
   aDate[1589] = D'2012.07.03 04:07:13'+time_offset*3600;
   aPrice[1589] = 1.26018;

   // ========== 1590 ===== 45 ==========
   aPseudoTicket[1590] = 796;
   aAction[1590] = 1; // OPEN
   aReturn[796] = 1590;
   aType[1590] = OP_SELL; // SELL
   aTicket[1590] = -1; // Ticket given by broker
   aSymbol[1590] = "GBPUSD";
   aLots[1590] = 1.0;
   aDate[1590] = D'2012.07.04 10:10:09'+time_offset*3600;
   aPrice[1590] = 1.56538;

   // ========== 1591 ===== 45 ==========
   aPseudoTicket[1591] = 796;
   aAction[1591] = 0; // CLOSE
   aType[1591] = OP_SELL; // SELL
   aTicket[1591] = -1; // Ticket given by broker
   aSymbol[1591] = "GBPUSD";
   aLots[1591] = 1.0;
   aDate[1591] = D'2012.07.04 11:01:09'+time_offset*3600;
   aPrice[1591] = 1.56443;

   // ========== 1592 ===== 43 ==========
   aPseudoTicket[1592] = 797;
   aAction[1592] = 1; // OPEN
   aReturn[797] = 1592;
   aType[1592] = OP_BUY; // BUY
   aTicket[1592] = -1; // Ticket given by broker
   aSymbol[1592] = "AUDUSD";
   aLots[1592] = 1.0;
   aDate[1592] = D'2012.07.05 11:01:40'+time_offset*3600;
   aPrice[1592] = 1.03184;

   // ========== 1593 ===== 44 ==========
   aPseudoTicket[1593] = 798;
   aAction[1593] = 1; // OPEN
   aReturn[798] = 1593;
   aType[1593] = OP_BUY; // BUY
   aTicket[1593] = -1; // Ticket given by broker
   aSymbol[1593] = "AUDUSD";
   aLots[1593] = 1.0;
   aDate[1593] = D'2012.07.05 11:02:57'+time_offset*3600;
   aPrice[1593] = 1.03072;

   // ========== 1594 ===== 43 ==========
   aPseudoTicket[1594] = 797;
   aAction[1594] = 0; // CLOSE
   aType[1594] = OP_BUY; // BUY
   aTicket[1594] = -1; // Ticket given by broker
   aSymbol[1594] = "AUDUSD";
   aLots[1594] = 1.0;
   aDate[1594] = D'2012.07.05 12:32:07'+time_offset*3600;
   aPrice[1594] = 1.0281;

   // ========== 1595 ===== 44 ==========
   aPseudoTicket[1595] = 798;
   aAction[1595] = 0; // CLOSE
   aType[1595] = OP_BUY; // BUY
   aTicket[1595] = -1; // Ticket given by broker
   aSymbol[1595] = "AUDUSD";
   aLots[1595] = 1.0;
   aDate[1595] = D'2012.07.05 12:32:07'+time_offset*3600;
   aPrice[1595] = 1.0281;

   // ========== 1596 ===== 42 ==========
   aPseudoTicket[1596] = 799;
   aAction[1596] = 1; // OPEN
   aReturn[799] = 1596;
   aType[1596] = OP_SELL; // SELL
   aTicket[1596] = -1; // Ticket given by broker
   aSymbol[1596] = "AUDUSD";
   aLots[1596] = 1.0;
   aDate[1596] = D'2012.07.05 12:36:57'+time_offset*3600;
   aPrice[1596] = 1.02608;

   // ========== 1597 ===== 41 ==========
   aPseudoTicket[1597] = 800;
   aAction[1597] = 1; // OPEN
   aReturn[800] = 1597;
   aType[1597] = OP_SELL; // SELL
   aTicket[1597] = -1; // Ticket given by broker
   aSymbol[1597] = "AUDUSD";
   aLots[1597] = 1.0;
   aDate[1597] = D'2012.07.05 12:38:42'+time_offset*3600;
   aPrice[1597] = 1.0264;

   // ========== 1598 ===== 39 ==========
   aPseudoTicket[1598] = 801;
   aAction[1598] = 1; // OPEN
   aReturn[801] = 1598;
   aType[1598] = OP_SELL; // SELL
   aTicket[1598] = -1; // Ticket given by broker
   aSymbol[1598] = "AUDUSD";
   aLots[1598] = 1.0;
   aDate[1598] = D'2012.07.05 12:39:22'+time_offset*3600;
   aPrice[1598] = 1.02614;

   // ========== 1599 ===== 40 ==========
   aPseudoTicket[1599] = 802;
   aAction[1599] = 1; // OPEN
   aReturn[802] = 1599;
   aType[1599] = OP_SELL; // SELL
   aTicket[1599] = -1; // Ticket given by broker
   aSymbol[1599] = "AUDUSD";
   aLots[1599] = 1.0;
   aDate[1599] = D'2012.07.05 12:43:41'+time_offset*3600;
   aPrice[1599] = 1.02623;

   // ========== 1600 ===== 42 ==========
   aPseudoTicket[1600] = 799;
   aAction[1600] = 0; // CLOSE
   aType[1600] = OP_SELL; // SELL
   aTicket[1600] = -1; // Ticket given by broker
   aSymbol[1600] = "AUDUSD";
   aLots[1600] = 1.0;
   aDate[1600] = D'2012.07.06 02:35:02'+time_offset*3600;
   aPrice[1600] = 1.02589;

   // ========== 1601 ===== 41 ==========
   aPseudoTicket[1601] = 800;
   aAction[1601] = 0; // CLOSE
   aType[1601] = OP_SELL; // SELL
   aTicket[1601] = -1; // Ticket given by broker
   aSymbol[1601] = "AUDUSD";
   aLots[1601] = 1.0;
   aDate[1601] = D'2012.07.06 02:36:21'+time_offset*3600;
   aPrice[1601] = 1.02583;

   // ========== 1602 ===== 40 ==========
   aPseudoTicket[1602] = 802;
   aAction[1602] = 0; // CLOSE
   aType[1602] = OP_SELL; // SELL
   aTicket[1602] = -1; // Ticket given by broker
   aSymbol[1602] = "AUDUSD";
   aLots[1602] = 1.0;
   aDate[1602] = D'2012.07.06 02:40:25'+time_offset*3600;
   aPrice[1602] = 1.0255;

   // ========== 1603 ===== 39 ==========
   aPseudoTicket[1603] = 801;
   aAction[1603] = 0; // CLOSE
   aType[1603] = OP_SELL; // SELL
   aTicket[1603] = -1; // Ticket given by broker
   aSymbol[1603] = "AUDUSD";
   aLots[1603] = 1.0;
   aDate[1603] = D'2012.07.06 02:40:30'+time_offset*3600;
   aPrice[1603] = 1.02553;

   // ========== 1604 ===== 38 ==========
   aPseudoTicket[1604] = 803;
   aAction[1604] = 1; // OPEN
   aReturn[803] = 1604;
   aType[1604] = OP_BUY; // BUY
   aTicket[1604] = -1; // Ticket given by broker
   aSymbol[1604] = "EURUSD";
   aLots[1604] = 1.0;
   aDate[1604] = D'2012.07.06 07:02:45'+time_offset*3600;
   aPrice[1604] = 1.23711;

   // ========== 1605 ===== 38 ==========
   aPseudoTicket[1605] = 803;
   aAction[1605] = 0; // CLOSE
   aType[1605] = OP_BUY; // BUY
   aTicket[1605] = -1; // Ticket given by broker
   aSymbol[1605] = "EURUSD";
   aLots[1605] = 1.0;
   aDate[1605] = D'2012.07.06 08:00:08'+time_offset*3600;
   aPrice[1605] = 1.2383;

   // ========== 1606 ===== 36 ==========
   aPseudoTicket[1606] = 804;
   aAction[1606] = 1; // OPEN
   aReturn[804] = 1606;
   aType[1606] = OP_BUY; // BUY
   aTicket[1606] = -1; // Ticket given by broker
   aSymbol[1606] = "EURUSD";
   aLots[1606] = 1.0;
   aDate[1606] = D'2012.07.06 12:47:21'+time_offset*3600;
   aPrice[1606] = 1.23545;

   // ========== 1607 ===== 37 ==========
   aPseudoTicket[1607] = 805;
   aAction[1607] = 1; // OPEN
   aReturn[805] = 1607;
   aType[1607] = OP_SELL; // SELL
   aTicket[1607] = -1; // Ticket given by broker
   aSymbol[1607] = "USDCHF";
   aLots[1607] = 1.0;
   aDate[1607] = D'2012.07.06 14:28:38'+time_offset*3600;
   aPrice[1607] = 0.97526;

   // ========== 1608 ===== 37 ==========
   aPseudoTicket[1608] = 805;
   aAction[1608] = 0; // CLOSE
   aType[1608] = OP_SELL; // SELL
   aTicket[1608] = -1; // Ticket given by broker
   aSymbol[1608] = "USDCHF";
   aLots[1608] = 1.0;
   aDate[1608] = D'2012.07.09 12:50:43'+time_offset*3600;
   aPrice[1608] = 0.97657;

   // ========== 1609 ===== 36 ==========
   aPseudoTicket[1609] = 804;
   aAction[1609] = 0; // CLOSE
   aType[1609] = OP_BUY; // BUY
   aTicket[1609] = -1; // Ticket given by broker
   aSymbol[1609] = "EURUSD";
   aLots[1609] = 1.0;
   aDate[1609] = D'2012.07.09 20:32:29'+time_offset*3600;
   aPrice[1609] = 1.23193;

   // ========== 1610 ===== 35 ==========
   aPseudoTicket[1610] = 806;
   aAction[1610] = 1; // OPEN
   aReturn[806] = 1610;
   aType[1610] = OP_SELL; // SELL
   aTicket[1610] = -1; // Ticket given by broker
   aSymbol[1610] = "EURUSD";
   aLots[1610] = 1.0;
   aDate[1610] = D'2012.07.09 20:32:34'+time_offset*3600;
   aPrice[1610] = 1.23192;

   // ========== 1611 ===== 35 ==========
   aPseudoTicket[1611] = 806;
   aAction[1611] = 0; // CLOSE
   aType[1611] = OP_SELL; // SELL
   aTicket[1611] = -1; // Ticket given by broker
   aSymbol[1611] = "EURUSD";
   aLots[1611] = 1.0;
   aDate[1611] = D'2012.07.10 00:55:35'+time_offset*3600;
   aPrice[1611] = 1.2299;

   // ========== 1612 ===== 34 ==========
   aPseudoTicket[1612] = 807;
   aAction[1612] = 1; // OPEN
   aReturn[807] = 1612;
   aType[1612] = OP_BUY; // BUY
   aTicket[1612] = -1; // Ticket given by broker
   aSymbol[1612] = "USDCHF";
   aLots[1612] = 1.0;
   aDate[1612] = D'2012.07.10 12:55:16'+time_offset*3600;
   aPrice[1612] = 0.97804;

   // ========== 1613 ===== 34 ==========
   aPseudoTicket[1613] = 807;
   aAction[1613] = 0; // CLOSE
   aType[1613] = OP_BUY; // BUY
   aTicket[1613] = -1; // Ticket given by broker
   aSymbol[1613] = "USDCHF";
   aLots[1613] = 1.0;
   aDate[1613] = D'2012.07.10 13:25:08'+time_offset*3600;
   aPrice[1613] = 0.9766;

   // ========== 1614 ===== 32 ==========
   aPseudoTicket[1614] = 808;
   aAction[1614] = 1; // OPEN
   aReturn[808] = 1614;
   aType[1614] = OP_SELL; // SELL
   aTicket[1614] = -1; // Ticket given by broker
   aSymbol[1614] = "GBPUSD";
   aLots[1614] = 1.0;
   aDate[1614] = D'2012.07.11 08:58:31'+time_offset*3600;
   aPrice[1614] = 1.55571;

   // ========== 1615 ===== 33 ==========
   aPseudoTicket[1615] = 809;
   aAction[1615] = 1; // OPEN
   aReturn[809] = 1615;
   aType[1615] = OP_SELL; // SELL
   aTicket[1615] = -1; // Ticket given by broker
   aSymbol[1615] = "GBPUSD";
   aLots[1615] = 1.0;
   aDate[1615] = D'2012.07.11 11:24:16'+time_offset*3600;
   aPrice[1615] = 1.55754;

   // ========== 1616 ===== 33 ==========
   aPseudoTicket[1616] = 809;
   aAction[1616] = 0; // CLOSE
   aType[1616] = OP_SELL; // SELL
   aTicket[1616] = -1; // Ticket given by broker
   aSymbol[1616] = "GBPUSD";
   aLots[1616] = 1.0;
   aDate[1616] = D'2012.07.11 12:36:05'+time_offset*3600;
   aPrice[1616] = 1.55542;

   // ========== 1617 ===== 32 ==========
   aPseudoTicket[1617] = 808;
   aAction[1617] = 0; // CLOSE
   aType[1617] = OP_SELL; // SELL
   aTicket[1617] = -1; // Ticket given by broker
   aSymbol[1617] = "GBPUSD";
   aLots[1617] = 1.0;
   aDate[1617] = D'2012.07.11 15:12:28'+time_offset*3600;
   aPrice[1617] = 1.55391;

   // ========== 1618 ===== 30 ==========
   aPseudoTicket[1618] = 810;
   aAction[1618] = 1; // OPEN
   aReturn[810] = 1618;
   aType[1618] = OP_BUY; // BUY
   aTicket[1618] = -1; // Ticket given by broker
   aSymbol[1618] = "EURUSD";
   aLots[1618] = 1.0;
   aDate[1618] = D'2012.07.12 07:19:27'+time_offset*3600;
   aPrice[1618] = 1.22236;

   // ========== 1619 ===== 31 ==========
   aPseudoTicket[1619] = 811;
   aAction[1619] = 1; // OPEN
   aReturn[811] = 1619;
   aType[1619] = OP_BUY; // BUY
   aTicket[1619] = -1; // Ticket given by broker
   aSymbol[1619] = "EURUSD";
   aLots[1619] = 1.0;
   aDate[1619] = D'2012.07.12 10:18:38'+time_offset*3600;
   aPrice[1619] = 1.22008;

   // ========== 1620 ===== 31 ==========
   aPseudoTicket[1620] = 811;
   aAction[1620] = 0; // CLOSE
   aType[1620] = OP_BUY; // BUY
   aTicket[1620] = -1; // Ticket given by broker
   aSymbol[1620] = "EURUSD";
   aLots[1620] = 1.0;
   aDate[1620] = D'2012.07.13 03:32:35'+time_offset*3600;
   aPrice[1620] = 1.22061;

   // ========== 1621 ===== 30 ==========
   aPseudoTicket[1621] = 810;
   aAction[1621] = 0; // CLOSE
   aType[1621] = OP_BUY; // BUY
   aTicket[1621] = -1; // Ticket given by broker
   aSymbol[1621] = "EURUSD";
   aLots[1621] = 1.0;
   aDate[1621] = D'2012.07.13 14:01:30'+time_offset*3600;
   aPrice[1621] = 1.22336;

   // ========== 1622 ===== 29 ==========
   aPseudoTicket[1622] = 812;
   aAction[1622] = 1; // OPEN
   aReturn[812] = 1622;
   aType[1622] = OP_SELL; // SELL
   aTicket[1622] = -1; // Ticket given by broker
   aSymbol[1622] = "GBPUSD";
   aLots[1622] = 1.0;
   aDate[1622] = D'2012.07.15 22:48:56'+time_offset*3600;
   aPrice[1622] = 1.55897;

   // ========== 1623 ===== 29 ==========
   aPseudoTicket[1623] = 812;
   aAction[1623] = 0; // CLOSE
   aType[1623] = OP_SELL; // SELL
   aTicket[1623] = -1; // Ticket given by broker
   aSymbol[1623] = "GBPUSD";
   aLots[1623] = 1.0;
   aDate[1623] = D'2012.07.16 00:04:11'+time_offset*3600;
   aPrice[1623] = 1.55794;

   // ========== 1624 ===== 28 ==========
   aPseudoTicket[1624] = 813;
   aAction[1624] = 1; // OPEN
   aReturn[813] = 1624;
   aType[1624] = OP_SELL; // SELL
   aTicket[1624] = -1; // Ticket given by broker
   aSymbol[1624] = "EURUSD";
   aLots[1624] = 1.0;
   aDate[1624] = D'2012.07.16 12:03:37'+time_offset*3600;
   aPrice[1624] = 1.2186;

   // ========== 1625 ===== 28 ==========
   aPseudoTicket[1625] = 813;
   aAction[1625] = 0; // CLOSE
   aType[1625] = OP_SELL; // SELL
   aTicket[1625] = -1; // Ticket given by broker
   aSymbol[1625] = "EURUSD";
   aLots[1625] = 1.0;
   aDate[1625] = D'2012.07.16 12:15:35'+time_offset*3600;
   aPrice[1625] = 1.2179;

   // ========== 1626 ===== 27 ==========
   aPseudoTicket[1626] = 814;
   aAction[1626] = 1; // OPEN
   aReturn[814] = 1626;
   aType[1626] = OP_BUY; // BUY
   aTicket[1626] = -1; // Ticket given by broker
   aSymbol[1626] = "EURUSD";
   aLots[1626] = 1.0;
   aDate[1626] = D'2012.07.17 14:33:18'+time_offset*3600;
   aPrice[1626] = 1.22127;

   // ========== 1627 ===== 27 ==========
   aPseudoTicket[1627] = 814;
   aAction[1627] = 0; // CLOSE
   aType[1627] = OP_BUY; // BUY
   aTicket[1627] = -1; // Ticket given by broker
   aSymbol[1627] = "EURUSD";
   aLots[1627] = 1.0;
   aDate[1627] = D'2012.07.17 15:04:11'+time_offset*3600;
   aPrice[1627] = 1.22193;

   // ========== 1628 ===== 26 ==========
   aPseudoTicket[1628] = 815;
   aAction[1628] = 1; // OPEN
   aReturn[815] = 1628;
   aType[1628] = OP_SELL; // SELL
   aTicket[1628] = -1; // Ticket given by broker
   aSymbol[1628] = "EURUSD";
   aLots[1628] = 1.0;
   aDate[1628] = D'2012.07.18 10:00:10'+time_offset*3600;
   aPrice[1628] = 1.22333;

   // ========== 1629 ===== 26 ==========
   aPseudoTicket[1629] = 815;
   aAction[1629] = 0; // CLOSE
   aType[1629] = OP_SELL; // SELL
   aTicket[1629] = -1; // Ticket given by broker
   aSymbol[1629] = "EURUSD";
   aLots[1629] = 1.0;
   aDate[1629] = D'2012.07.18 13:11:18'+time_offset*3600;
   aPrice[1629] = 1.22222;

   // ========== 1630 ===== 25 ==========
   aPseudoTicket[1630] = 816;
   aAction[1630] = 1; // OPEN
   aReturn[816] = 1630;
   aType[1630] = OP_SELL; // SELL
   aTicket[1630] = -1; // Ticket given by broker
   aSymbol[1630] = "AUDUSD";
   aLots[1630] = 1.0;
   aDate[1630] = D'2012.07.18 16:35:59'+time_offset*3600;
   aPrice[1630] = 1.03607;

   // ========== 1631 ===== 25 ==========
   aPseudoTicket[1631] = 816;
   aAction[1631] = 0; // CLOSE
   aType[1631] = OP_SELL; // SELL
   aTicket[1631] = -1; // Ticket given by broker
   aSymbol[1631] = "AUDUSD";
   aLots[1631] = 1.0;
   aDate[1631] = D'2012.07.18 18:42:10'+time_offset*3600;
   aPrice[1631] = 1.035;

   // ========== 1632 ===== 20 ==========
   aPseudoTicket[1632] = 817;
   aAction[1632] = 1; // OPEN
   aReturn[817] = 1632;
   aType[1632] = OP_SELL; // SELL
   aTicket[1632] = -1; // Ticket given by broker
   aSymbol[1632] = "AUDUSD";
   aLots[1632] = 1.0;
   aDate[1632] = D'2012.07.19 00:26:51'+time_offset*3600;
   aPrice[1632] = 1.03729;

   // ========== 1633 ===== 21 ==========
   aPseudoTicket[1633] = 818;
   aAction[1633] = 1; // OPEN
   aReturn[818] = 1633;
   aType[1633] = OP_SELL; // SELL
   aTicket[1633] = -1; // Ticket given by broker
   aSymbol[1633] = "AUDUSD";
   aLots[1633] = 1.0;
   aDate[1633] = D'2012.07.19 03:56:39'+time_offset*3600;
   aPrice[1633] = 1.03929;

   // ========== 1634 ===== 23 ==========
   aPseudoTicket[1634] = 819;
   aAction[1634] = 1; // OPEN
   aReturn[819] = 1634;
   aType[1634] = OP_SELL; // SELL
   aTicket[1634] = -1; // Ticket given by broker
   aSymbol[1634] = "AUDUSD";
   aLots[1634] = 1.0;
   aDate[1634] = D'2012.07.19 07:33:30'+time_offset*3600;
   aPrice[1634] = 1.04095;

   // ========== 1635 ===== 24 ==========
   aPseudoTicket[1635] = 820;
   aAction[1635] = 1; // OPEN
   aReturn[820] = 1635;
   aType[1635] = OP_SELL; // SELL
   aTicket[1635] = -1; // Ticket given by broker
   aSymbol[1635] = "AUDUSD";
   aLots[1635] = 1.0;
   aDate[1635] = D'2012.07.19 10:00:08'+time_offset*3600;
   aPrice[1635] = 1.04172;

   // ========== 1636 ===== 24 ==========
   aPseudoTicket[1636] = 820;
   aAction[1636] = 0; // CLOSE
   aType[1636] = OP_SELL; // SELL
   aTicket[1636] = -1; // Ticket given by broker
   aSymbol[1636] = "AUDUSD";
   aLots[1636] = 1.0;
   aDate[1636] = D'2012.07.20 04:45:05'+time_offset*3600;
   aPrice[1636] = 1.04065;

   // ========== 1637 ===== 23 ==========
   aPseudoTicket[1637] = 819;
   aAction[1637] = 0; // CLOSE
   aType[1637] = OP_SELL; // SELL
   aTicket[1637] = -1; // Ticket given by broker
   aSymbol[1637] = "AUDUSD";
   aLots[1637] = 1.0;
   aDate[1637] = D'2012.07.20 04:45:10'+time_offset*3600;
   aPrice[1637] = 1.04065;

   // ========== 1638 ===== 22 ==========
   aPseudoTicket[1638] = 821;
   aAction[1638] = 1; // OPEN
   aReturn[821] = 1638;
   aType[1638] = OP_SELL; // SELL
   aTicket[1638] = -1; // Ticket given by broker
   aSymbol[1638] = "AUDUSD";
   aLots[1638] = 1.0;
   aDate[1638] = D'2012.07.20 09:06:39'+time_offset*3600;
   aPrice[1638] = 1.04238;

   // ========== 1639 ===== 22 ==========
   aPseudoTicket[1639] = 821;
   aAction[1639] = 0; // CLOSE
   aType[1639] = OP_SELL; // SELL
   aTicket[1639] = -1; // Ticket given by broker
   aSymbol[1639] = "AUDUSD";
   aLots[1639] = 1.0;
   aDate[1639] = D'2012.07.20 09:56:25'+time_offset*3600;
   aPrice[1639] = 1.04138;

   // ========== 1640 ===== 21 ==========
   aPseudoTicket[1640] = 818;
   aAction[1640] = 0; // CLOSE
   aType[1640] = OP_SELL; // SELL
   aTicket[1640] = -1; // Ticket given by broker
   aSymbol[1640] = "AUDUSD";
   aLots[1640] = 1.0;
   aDate[1640] = D'2012.07.20 12:25:21'+time_offset*3600;
   aPrice[1640] = 1.03914;

   // ========== 1641 ===== 20 ==========
   aPseudoTicket[1641] = 817;
   aAction[1641] = 0; // CLOSE
   aType[1641] = OP_SELL; // SELL
   aTicket[1641] = -1; // Ticket given by broker
   aSymbol[1641] = "AUDUSD";
   aLots[1641] = 1.0;
   aDate[1641] = D'2012.07.20 12:27:13'+time_offset*3600;
   aPrice[1641] = 1.03905;

   // ========== 1642 ===== 19 ==========
   aPseudoTicket[1642] = 822;
   aAction[1642] = 1; // OPEN
   aReturn[822] = 1642;
   aType[1642] = OP_SELL; // SELL
   aTicket[1642] = -1; // Ticket given by broker
   aSymbol[1642] = "AUDUSD";
   aLots[1642] = 1.0;
   aDate[1642] = D'2012.07.25 12:25:31'+time_offset*3600;
   aPrice[1642] = 1.02933;

   // ========== 1643 ===== 19 ==========
   aPseudoTicket[1643] = 822;
   aAction[1643] = 0; // CLOSE
   aType[1643] = OP_SELL; // SELL
   aTicket[1643] = -1; // Ticket given by broker
   aSymbol[1643] = "AUDUSD";
   aLots[1643] = 1.0;
   aDate[1643] = D'2012.07.25 14:12:49'+time_offset*3600;
   aPrice[1643] = 1.02808;

   // ========== 1644 ===== 18 ==========
   aPseudoTicket[1644] = 823;
   aAction[1644] = 1; // OPEN
   aReturn[823] = 1644;
   aType[1644] = OP_SELL; // SELL
   aTicket[1644] = -1; // Ticket given by broker
   aSymbol[1644] = "AUDUSD";
   aLots[1644] = 1.0;
   aDate[1644] = D'2012.07.29 21:45:28'+time_offset*3600;
   aPrice[1644] = 1.04802;

   // ========== 1645 ===== 18 ==========
   aPseudoTicket[1645] = 823;
   aAction[1645] = 0; // CLOSE
   aType[1645] = OP_SELL; // SELL
   aTicket[1645] = -1; // Ticket given by broker
   aSymbol[1645] = "AUDUSD";
   aLots[1645] = 1.0;
   aDate[1645] = D'2012.07.29 22:22:07'+time_offset*3600;
   aPrice[1645] = 1.04701;

   // ========== 1646 ===== 17 ==========
   aPseudoTicket[1646] = 824;
   aAction[1646] = 1; // OPEN
   aReturn[824] = 1646;
   aType[1646] = OP_SELL; // SELL
   aTicket[1646] = -1; // Ticket given by broker
   aSymbol[1646] = "AUDUSD";
   aLots[1646] = 1.0;
   aDate[1646] = D'2012.07.30 12:05:58'+time_offset*3600;
   aPrice[1646] = 1.04936;

   // ========== 1647 ===== 17 ==========
   aPseudoTicket[1647] = 824;
   aAction[1647] = 0; // CLOSE
   aType[1647] = OP_SELL; // SELL
   aTicket[1647] = -1; // Ticket given by broker
   aSymbol[1647] = "AUDUSD";
   aLots[1647] = 1.0;
   aDate[1647] = D'2012.07.30 12:50:07'+time_offset*3600;
   aPrice[1647] = 1.04844;

   // ========== 1648 ===== 16 ==========
   aPseudoTicket[1648] = 825;
   aAction[1648] = 1; // OPEN
   aReturn[825] = 1648;
   aType[1648] = OP_SELL; // SELL
   aTicket[1648] = -1; // Ticket given by broker
   aSymbol[1648] = "AUDUSD";
   aLots[1648] = 1.0;
   aDate[1648] = D'2012.07.30 13:46:42'+time_offset*3600;
   aPrice[1648] = 1.04959;

   // ========== 1649 ===== 16 ==========
   aPseudoTicket[1649] = 825;
   aAction[1649] = 0; // CLOSE
   aType[1649] = OP_SELL; // SELL
   aTicket[1649] = -1; // Ticket given by broker
   aSymbol[1649] = "AUDUSD";
   aLots[1649] = 1.0;
   aDate[1649] = D'2012.07.30 16:21:40'+time_offset*3600;
   aPrice[1649] = 1.04834;

   // ========== 1650 ===== 15 ==========
   aPseudoTicket[1650] = 826;
   aAction[1650] = 1; // OPEN
   aReturn[826] = 1650;
   aType[1650] = OP_SELL; // SELL
   aTicket[1650] = -1; // Ticket given by broker
   aSymbol[1650] = "AUDUSD";
   aLots[1650] = 1.0;
   aDate[1650] = D'2012.07.31 05:18:51'+time_offset*3600;
   aPrice[1650] = 1.05309;

   // ========== 1651 ===== 15 ==========
   aPseudoTicket[1651] = 826;
   aAction[1651] = 0; // CLOSE
   aType[1651] = OP_SELL; // SELL
   aTicket[1651] = -1; // Ticket given by broker
   aSymbol[1651] = "AUDUSD";
   aLots[1651] = 1.0;
   aDate[1651] = D'2012.07.31 06:14:02'+time_offset*3600;
   aPrice[1651] = 1.05189;

   // ========== 1652 ===== 14 ==========
   aPseudoTicket[1652] = 827;
   aAction[1652] = 1; // OPEN
   aReturn[827] = 1652;
   aType[1652] = OP_BUY; // BUY
   aTicket[1652] = -1; // Ticket given by broker
   aSymbol[1652] = "EURUSD";
   aLots[1652] = 1.0;
   aDate[1652] = D'2012.08.02 11:52:16'+time_offset*3600;
   aPrice[1652] = 1.22935;

   // ========== 1653 ===== 14 ==========
   aPseudoTicket[1653] = 827;
   aAction[1653] = 0; // CLOSE
   aType[1653] = OP_BUY; // BUY
   aTicket[1653] = -1; // Ticket given by broker
   aSymbol[1653] = "EURUSD";
   aLots[1653] = 1.0;
   aDate[1653] = D'2012.08.02 12:02:39'+time_offset*3600;
   aPrice[1653] = 1.2312;

   // ========== 1654 ===== 13 ==========
   aPseudoTicket[1654] = 828;
   aAction[1654] = 1; // OPEN
   aReturn[828] = 1654;
   aType[1654] = OP_SELL; // SELL
   aTicket[1654] = -1; // Ticket given by broker
   aSymbol[1654] = "AUDUSD";
   aLots[1654] = 1.0;
   aDate[1654] = D'2012.08.02 12:35:07'+time_offset*3600;
   aPrice[1654] = 1.05615;

   // ========== 1655 ===== 12 ==========
   aPseudoTicket[1655] = 829;
   aAction[1655] = 1; // OPEN
   aReturn[829] = 1655;
   aType[1655] = OP_SELL; // SELL
   aTicket[1655] = -1; // Ticket given by broker
   aSymbol[1655] = "AUDUSD";
   aLots[1655] = 1.0;
   aDate[1655] = D'2012.08.02 12:36:19'+time_offset*3600;
   aPrice[1655] = 1.0568;

   // ========== 1656 ===== 13 ==========
   aPseudoTicket[1656] = 828;
   aAction[1656] = 0; // CLOSE
   aType[1656] = OP_SELL; // SELL
   aTicket[1656] = -1; // Ticket given by broker
   aSymbol[1656] = "AUDUSD";
   aLots[1656] = 1.0;
   aDate[1656] = D'2012.08.02 12:37:29'+time_offset*3600;
   aPrice[1656] = 1.05423;

   // ========== 1657 ===== 12 ==========
   aPseudoTicket[1657] = 829;
   aAction[1657] = 0; // CLOSE
   aType[1657] = OP_SELL; // SELL
   aTicket[1657] = -1; // Ticket given by broker
   aSymbol[1657] = "AUDUSD";
   aLots[1657] = 1.0;
   aDate[1657] = D'2012.08.02 12:39:17'+time_offset*3600;
   aPrice[1657] = 1.05369;

   // ========== 1658 ===== 11 ==========
   aPseudoTicket[1658] = 830;
   aAction[1658] = 1; // OPEN
   aReturn[830] = 1658;
   aType[1658] = OP_BUY; // BUY
   aTicket[1658] = -1; // Ticket given by broker
   aSymbol[1658] = "AUDUSD";
   aLots[1658] = 1.0;
   aDate[1658] = D'2012.08.02 13:01:40'+time_offset*3600;
   aPrice[1658] = 1.04665;

   // ========== 1659 ===== 11 ==========
   aPseudoTicket[1659] = 830;
   aAction[1659] = 0; // CLOSE
   aType[1659] = OP_BUY; // BUY
   aTicket[1659] = -1; // Ticket given by broker
   aSymbol[1659] = "AUDUSD";
   aLots[1659] = 1.0;
   aDate[1659] = D'2012.08.02 13:07:53'+time_offset*3600;
   aPrice[1659] = 1.04686;

   // ========== 1660 ===== 7 ==========
   aPseudoTicket[1660] = 831;
   aAction[1660] = 1; // OPEN
   aReturn[831] = 1660;
   aType[1660] = OP_SELL; // SELL
   aTicket[1660] = -1; // Ticket given by broker
   aSymbol[1660] = "EURUSD";
   aLots[1660] = 1.0;
   aDate[1660] = D'2012.08.02 18:27:57'+time_offset*3600;
   aPrice[1660] = 1.21686;

   // ========== 1661 ===== 8 ==========
   aPseudoTicket[1661] = 832;
   aAction[1661] = 1; // OPEN
   aReturn[832] = 1661;
   aType[1661] = OP_SELL; // SELL
   aTicket[1661] = -1; // Ticket given by broker
   aSymbol[1661] = "EURUSD";
   aLots[1661] = 1.0;
   aDate[1661] = D'2012.08.03 07:34:24'+time_offset*3600;
   aPrice[1661] = 1.22034;

   // ========== 1662 ===== 9 ==========
   aPseudoTicket[1662] = 833;
   aAction[1662] = 1; // OPEN
   aReturn[833] = 1662;
   aType[1662] = OP_SELL; // SELL
   aTicket[1662] = -1; // Ticket given by broker
   aSymbol[1662] = "EURUSD";
   aLots[1662] = 1.0;
   aDate[1662] = D'2012.08.03 09:25:37'+time_offset*3600;
   aPrice[1662] = 1.22205;

   // ========== 1663 ===== 10 ==========
   aPseudoTicket[1663] = 834;
   aAction[1663] = 1; // OPEN
   aReturn[834] = 1663;
   aType[1663] = OP_SELL; // SELL
   aTicket[1663] = -1; // Ticket given by broker
   aSymbol[1663] = "EURUSD";
   aLots[1663] = 1.0;
   aDate[1663] = D'2012.08.03 09:27:06'+time_offset*3600;
   aPrice[1663] = 1.22294;

   // ========== 1664 ===== 10 ==========
   aPseudoTicket[1664] = 834;
   aAction[1664] = 0; // CLOSE
   aType[1664] = OP_SELL; // SELL
   aTicket[1664] = -1; // Ticket given by broker
   aSymbol[1664] = "EURUSD";
   aLots[1664] = 1.0;
   aDate[1664] = D'2012.08.03 12:06:39'+time_offset*3600;
   aPrice[1664] = 1.22532;

   // ========== 1665 ===== 9 ==========
   aPseudoTicket[1665] = 833;
   aAction[1665] = 0; // CLOSE
   aType[1665] = OP_SELL; // SELL
   aTicket[1665] = -1; // Ticket given by broker
   aSymbol[1665] = "EURUSD";
   aLots[1665] = 1.0;
   aDate[1665] = D'2012.08.03 12:06:44'+time_offset*3600;
   aPrice[1665] = 1.22516;

   // ========== 1666 ===== 8 ==========
   aPseudoTicket[1666] = 832;
   aAction[1666] = 0; // CLOSE
   aType[1666] = OP_SELL; // SELL
   aTicket[1666] = -1; // Ticket given by broker
   aSymbol[1666] = "EURUSD";
   aLots[1666] = 1.0;
   aDate[1666] = D'2012.08.03 12:07:01'+time_offset*3600;
   aPrice[1666] = 1.22524;

   // ========== 1667 ===== 7 ==========
   aPseudoTicket[1667] = 831;
   aAction[1667] = 0; // CLOSE
   aType[1667] = OP_SELL; // SELL
   aTicket[1667] = -1; // Ticket given by broker
   aSymbol[1667] = "EURUSD";
   aLots[1667] = 1.0;
   aDate[1667] = D'2012.08.03 12:08:59'+time_offset*3600;
   aPrice[1667] = 1.22499;

   // ========== 1668 ===== 6 ==========
   aPseudoTicket[1668] = 835;
   aAction[1668] = 1; // OPEN
   aReturn[835] = 1668;
   aType[1668] = OP_BUY; // BUY
   aTicket[1668] = -1; // Ticket given by broker
   aSymbol[1668] = "USDJPY";
   aLots[1668] = 1.0;
   aDate[1668] = D'2012.08.03 13:18:30'+time_offset*3600;
   aPrice[1668] = 78.699;

   // ========== 1669 ===== 2 ==========
   aPseudoTicket[1669] = 836;
   aAction[1669] = 1; // OPEN
   aReturn[836] = 1669;
   aType[1669] = OP_SELL; // SELL
   aTicket[1669] = -1; // Ticket given by broker
   aSymbol[1669] = "EURUSD";
   aLots[1669] = 1.0;
   aDate[1669] = D'2012.08.03 14:30:51'+time_offset*3600;
   aPrice[1669] = 1.23408;

   // ========== 1670 ===== 3 ==========
   aPseudoTicket[1670] = 837;
   aAction[1670] = 1; // OPEN
   aReturn[837] = 1670;
   aType[1670] = OP_SELL; // SELL
   aTicket[1670] = -1; // Ticket given by broker
   aSymbol[1670] = "EURUSD";
   aLots[1670] = 1.0;
   aDate[1670] = D'2012.08.03 15:06:12'+time_offset*3600;
   aPrice[1670] = 1.23447;

   // ========== 1671 ===== 4 ==========
   aPseudoTicket[1671] = 838;
   aAction[1671] = 1; // OPEN
   aReturn[838] = 1671;
   aType[1671] = OP_SELL; // SELL
   aTicket[1671] = -1; // Ticket given by broker
   aSymbol[1671] = "EURUSD";
   aLots[1671] = 1.0;
   aDate[1671] = D'2012.08.03 15:14:01'+time_offset*3600;
   aPrice[1671] = 1.23541;

   // ========== 1672 ===== 6 ==========
   aPseudoTicket[1672] = 835;
   aAction[1672] = 0; // CLOSE
   aType[1672] = OP_BUY; // BUY
   aTicket[1672] = -1; // Ticket given by broker
   aSymbol[1672] = "USDJPY";
   aLots[1672] = 1.0;
   aDate[1672] = D'2012.08.03 15:18:31'+time_offset*3600;
   aPrice[1672] = 78.545;

   // ========== 1673 ===== 5 ==========
   aPseudoTicket[1673] = 839;
   aAction[1673] = 1; // OPEN
   aReturn[839] = 1673;
   aType[1673] = OP_SELL; // SELL
   aTicket[1673] = -1; // Ticket given by broker
   aSymbol[1673] = "EURUSD";
   aLots[1673] = 1.0;
   aDate[1673] = D'2012.08.03 15:19:08'+time_offset*3600;
   aPrice[1673] = 1.23645;

   // ========== 1674 ===== 5 ==========
   aPseudoTicket[1674] = 839;
   aAction[1674] = 0; // CLOSE
   aType[1674] = OP_SELL; // SELL
   aTicket[1674] = -1; // Ticket given by broker
   aSymbol[1674] = "EURUSD";
   aLots[1674] = 1.0;
   aDate[1674] = D'2012.08.06 07:04:21'+time_offset*3600;
   aPrice[1674] = 1.23689;

   // ========== 1675 ===== 4 ==========
   aPseudoTicket[1675] = 838;
   aAction[1675] = 0; // CLOSE
   aType[1675] = OP_SELL; // SELL
   aTicket[1675] = -1; // Ticket given by broker
   aSymbol[1675] = "EURUSD";
   aLots[1675] = 1.0;
   aDate[1675] = D'2012.08.06 07:04:25'+time_offset*3600;
   aPrice[1675] = 1.23689;

   // ========== 1676 ===== 3 ==========
   aPseudoTicket[1676] = 837;
   aAction[1676] = 0; // CLOSE
   aType[1676] = OP_SELL; // SELL
   aTicket[1676] = -1; // Ticket given by broker
   aSymbol[1676] = "EURUSD";
   aLots[1676] = 1.0;
   aDate[1676] = D'2012.08.06 07:22:13'+time_offset*3600;
   aPrice[1676] = 1.23653;

   // ========== 1677 ===== 2 ==========
   aPseudoTicket[1677] = 836;
   aAction[1677] = 0; // CLOSE
   aType[1677] = OP_SELL; // SELL
   aTicket[1677] = -1; // Ticket given by broker
   aSymbol[1677] = "EURUSD";
   aLots[1677] = 1.0;
   aDate[1677] = D'2012.08.06 07:39:13'+time_offset*3600;
   aPrice[1677] = 1.2356;

   // ========== 1678 ===== 1 ==========
   aPseudoTicket[1678] = 840;
   aAction[1678] = 1; // OPEN
   aReturn[840] = 1678;
   aType[1678] = OP_SELL; // SELL
   aTicket[1678] = -1; // Ticket given by broker
   aSymbol[1678] = "GBPUSD";
   aLots[1678] = 1.0;
   aDate[1678] = D'2012.08.16 06:12:32'+time_offset*3600;
   aPrice[1678] = 1.5636;

   // ========== 1679 ===== 1 ==========
   aPseudoTicket[1679] = 840;
   aAction[1679] = 0; // CLOSE
   aType[1679] = OP_SELL; // SELL
   aTicket[1679] = -1; // Ticket given by broker
   aSymbol[1679] = "GBPUSD";
   aLots[1679] = 1.0;
   aDate[1679] = D'2012.08.16 08:30:01'+time_offset*3600;
   aPrice[1679] = 1.5682;

   // ========== 1680 ===== 0 ==========
   aPseudoTicket[1680] = 841;
   aAction[1680] = 1; // OPEN
   aReturn[841] = 1680;
   aType[1680] = OP_BUY; // BUY
   aTicket[1680] = -1; // Ticket given by broker
   aSymbol[1680] = "USDCAD";
   aLots[1680] = 1.0;
   aDate[1680] = D'2012.08.21 10:41:35'+time_offset*3600;
   aPrice[1680] = 0.98548;

   // ========== 1681 ===== 0 ==========
   aPseudoTicket[1681] = 841;
   aAction[1681] = 0; // CLOSE
   aType[1681] = OP_BUY; // BUY
   aTicket[1681] = -1; // Ticket given by broker
   aSymbol[1681] = "USDCAD";
   aLots[1681] = 1.0;
   aDate[1681] = D'2012.08.21 23:57:15'+time_offset*3600;
   aPrice[1681] = 0.9897;
}
