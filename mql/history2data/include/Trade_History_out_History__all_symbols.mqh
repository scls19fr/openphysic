//+------------------------------------------------------------------+
//|include/Trade_History_out_History__all_symbols.mqh
//|                                 Copyright (c) 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

int NbOrdersInFile = 841;

int aType[841];
string aSymbol[841];
double aLots[841];
datetime aDateOpen[841];
double aPriceOpen[841];
datetime aDateClose[841];
double aPriceClose[841];

int time_offset = 3;

void init_tab() {

   // ========== 0 ===== 840 ==========
   aType[0] = OP_BUY;
   aSymbol[0] = "USDCAD";
   aLots[0] = 1.0;
   aDateOpen[0] = D'2011.05.16 07:02:20'+time_offset*3600;
   aPriceOpen[0] = 0.96882;
   aDateClose[0] = D'2011.05.16 10:00:22'+time_offset*3600;
   aPriceClose[0] = 0.97431;

   // ========== 1 ===== 838 ==========
   aType[1] = OP_BUY;
   aSymbol[1] = "USDCAD";
   aLots[1] = 0.5;
   aDateOpen[1] = D'2011.05.18 23:49:14'+time_offset*3600;
   aPriceOpen[1] = 0.96953;
   aDateClose[1] = D'2011.05.23 08:33:42'+time_offset*3600;
   aPriceClose[1] = 0.97854;

   // ========== 2 ===== 839 ==========
   aType[2] = OP_SELL;
   aSymbol[2] = "GBPUSD";
   aLots[2] = 0.5;
   aDateOpen[2] = D'2011.05.19 02:11:40'+time_offset*3600;
   aPriceOpen[2] = 1.618;
   aDateClose[2] = D'2011.05.19 19:45:50'+time_offset*3600;
   aPriceClose[2] = 1.623;

   // ========== 3 ===== 836 ==========
   aType[3] = OP_SELL;
   aSymbol[3] = "EURUSD";
   aLots[3] = 1.0;
   aDateOpen[3] = D'2011.05.24 05:24:00'+time_offset*3600;
   aPriceOpen[3] = 1.40736;
   aDateClose[3] = D'2011.05.25 06:30:32'+time_offset*3600;
   aPriceClose[3] = 1.40444;

   // ========== 4 ===== 837 ==========
   aType[4] = OP_BUY;
   aSymbol[4] = "USDCAD";
   aLots[4] = 1.0;
   aDateOpen[4] = D'2011.05.24 09:41:03'+time_offset*3600;
   aPriceOpen[4] = 0.97642;
   aDateClose[4] = D'2011.05.25 06:15:07'+time_offset*3600;
   aPriceClose[4] = 0.98144;

   // ========== 5 ===== 835 ==========
   aType[5] = OP_BUY;
   aSymbol[5] = "USDCHF";
   aLots[5] = 1.0;
   aDateOpen[5] = D'2011.05.25 10:05:54'+time_offset*3600;
   aPriceOpen[5] = 0.87688;
   aDateClose[5] = D'2011.05.26 12:47:35'+time_offset*3600;
   aPriceClose[5] = 0.86718;

   // ========== 6 ===== 834 ==========
   aType[6] = OP_BUY;
   aSymbol[6] = "USDCAD";
   aLots[6] = 1.0;
   aDateOpen[6] = D'2011.05.26 02:39:00'+time_offset*3600;
   aPriceOpen[6] = 0.9765;
   aDateClose[6] = D'2011.05.26 23:04:30'+time_offset*3600;
   aPriceClose[6] = 0.97911;

   // ========== 7 ===== 833 ==========
   aType[7] = OP_BUY;
   aSymbol[7] = "GBPUSD";
   aLots[7] = 1.0;
   aDateOpen[7] = D'2011.06.01 16:30:02'+time_offset*3600;
   aPriceOpen[7] = 1.636;
   aDateClose[7] = D'2011.06.03 00:48:48'+time_offset*3600;
   aPriceClose[7] = 1.63707;

   // ========== 8 ===== 832 ==========
   aType[8] = OP_SELL;
   aSymbol[8] = "USDCHF";
   aLots[8] = 1.0;
   aDateOpen[8] = D'2011.06.03 04:35:02'+time_offset*3600;
   aPriceOpen[8] = 0.84414;
   aDateClose[8] = D'2011.06.03 10:09:29'+time_offset*3600;
   aPriceClose[8] = 0.84103;

   // ========== 9 ===== 831 ==========
   aType[9] = OP_SELL;
   aSymbol[9] = "EURUSD";
   aLots[9] = 1.0;
   aDateOpen[9] = D'2011.06.09 12:48:24'+time_offset*3600;
   aPriceOpen[9] = 1.45446;
   aDateClose[9] = D'2011.06.09 13:19:05'+time_offset*3600;
   aPriceClose[9] = 1.45;

   // ========== 10 ===== 830 ==========
   aType[10] = OP_SELL;
   aSymbol[10] = "EURUSD";
   aLots[10] = 1.0;
   aDateOpen[10] = D'2011.06.10 01:05:56'+time_offset*3600;
   aPriceOpen[10] = 1.45337;
   aDateClose[10] = D'2011.06.10 05:04:16'+time_offset*3600;
   aPriceClose[10] = 1.44906;

   // ========== 11 ===== 829 ==========
   aType[11] = OP_SELL;
   aSymbol[11] = "GBPUSD";
   aLots[11] = 1.0;
   aDateOpen[11] = D'2011.06.10 11:16:09'+time_offset*3600;
   aPriceOpen[11] = 1.63052;
   aDateClose[11] = D'2011.06.10 13:24:47'+time_offset*3600;
   aPriceClose[11] = 1.62631;

   // ========== 12 ===== 828 ==========
   aType[12] = OP_SELL;
   aSymbol[12] = "GBPUSD";
   aLots[12] = 1.0;
   aDateOpen[12] = D'2011.06.13 12:56:01'+time_offset*3600;
   aPriceOpen[12] = 1.63242;
   aDateClose[12] = D'2011.06.13 19:42:58'+time_offset*3600;
   aPriceClose[12] = 1.63785;

   // ========== 13 ===== 827 ==========
   aType[13] = OP_SELL;
   aSymbol[13] = "GBPUSD";
   aLots[13] = 1.0;
   aDateOpen[13] = D'2011.06.14 03:56:26'+time_offset*3600;
   aPriceOpen[13] = 1.64078;
   aDateClose[13] = D'2011.06.14 15:59:42'+time_offset*3600;
   aPriceClose[13] = 1.63877;

   // ========== 14 ===== 826 ==========
   aType[14] = OP_SELL;
   aSymbol[14] = "EURUSD";
   aLots[14] = 1.0;
   aDateOpen[14] = D'2011.06.14 05:50:57'+time_offset*3600;
   aPriceOpen[14] = 1.44354;
   aDateClose[14] = D'2011.06.15 01:46:22'+time_offset*3600;
   aPriceClose[14] = 1.44148;

   // ========== 15 ===== 825 ==========
   aType[15] = OP_SELL;
   aSymbol[15] = "EURUSD";
   aLots[15] = 1.0;
   aDateOpen[15] = D'2011.06.16 22:24:17'+time_offset*3600;
   aPriceOpen[15] = 1.42035;
   aDateClose[15] = D'2011.06.17 04:30:05'+time_offset*3600;
   aPriceClose[15] = 1.41487;

   // ========== 16 ===== 824 ==========
   aType[16] = OP_SELL;
   aSymbol[16] = "GBPUSD";
   aLots[16] = 1.0;
   aDateOpen[16] = D'2011.06.17 10:47:47'+time_offset*3600;
   aPriceOpen[16] = 1.61711;
   aDateClose[16] = D'2011.06.20 01:00:43'+time_offset*3600;
   aPriceClose[16] = 1.61584;

   // ========== 17 ===== 823 ==========
   aType[17] = OP_BUY;
   aSymbol[17] = "EURUSD";
   aLots[17] = 1.0;
   aDateOpen[17] = D'2011.06.20 05:41:36'+time_offset*3600;
   aPriceOpen[17] = 1.42279;
   aDateClose[17] = D'2011.06.20 10:52:15'+time_offset*3600;
   aPriceClose[17] = 1.42331;

   // ========== 18 ===== 821 ==========
   aType[18] = OP_SELL;
   aSymbol[18] = "GBPUSD";
   aLots[18] = 1.0;
   aDateOpen[18] = D'2011.06.20 10:52:12'+time_offset*3600;
   aPriceOpen[18] = 1.61782;
   aDateClose[18] = D'2011.06.22 11:06:29'+time_offset*3600;
   aPriceClose[18] = 1.61264;

   // ========== 19 ===== 822 ==========
   aType[19] = OP_BUY;
   aSymbol[19] = "USDCAD";
   aLots[19] = 1.0;
   aDateOpen[19] = D'2011.06.21 02:58:52'+time_offset*3600;
   aPriceOpen[19] = 0.97872;
   aDateClose[19] = D'2011.06.21 12:30:00'+time_offset*3600;
   aPriceClose[19] = 0.97492;

   // ========== 20 ===== 820 ==========
   aType[20] = OP_BUY;
   aSymbol[20] = "USDCHF";
   aLots[20] = 1.0;
   aDateOpen[20] = D'2011.06.21 22:02:05'+time_offset*3600;
   aPriceOpen[20] = 0.84133;
   aDateClose[20] = D'2011.06.22 13:40:28'+time_offset*3600;
   aPriceClose[20] = 0.83888;

   // ========== 21 ===== 819 ==========
   aType[21] = OP_SELL;
   aSymbol[21] = "USDCHF";
   aLots[21] = 1.0;
   aDateOpen[21] = D'2011.06.22 14:48:34'+time_offset*3600;
   aPriceOpen[21] = 0.83525;
   aDateClose[21] = D'2011.06.22 16:00:34'+time_offset*3600;
   aPriceClose[21] = 0.83618;

   // ========== 22 ===== 817 ==========
   aType[22] = OP_BUY;
   aSymbol[22] = "EURUSD";
   aLots[22] = 1.0;
   aDateOpen[22] = D'2011.06.23 09:36:16'+time_offset*3600;
   aPriceOpen[22] = 1.42506;
   aDateClose[22] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPriceClose[22] = 1.4182;

   // ========== 23 ===== 816 ==========
   aType[23] = OP_BUY;
   aSymbol[23] = "EURUSD";
   aLots[23] = 1.0;
   aDateOpen[23] = D'2011.06.23 12:17:42'+time_offset*3600;
   aPriceOpen[23] = 1.421;
   aDateClose[23] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPriceClose[23] = 1.4182;

   // ========== 24 ===== 818 ==========
   aType[24] = OP_BUY;
   aSymbol[24] = "EURUSD";
   aLots[24] = 1.0;
   aDateOpen[24] = D'2011.06.23 14:26:22'+time_offset*3600;
   aPriceOpen[24] = 1.41495;
   aDateClose[24] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPriceClose[24] = 1.4182;

   // ========== 25 ===== 814 ==========
   aType[25] = OP_SELL;
   aSymbol[25] = "EURUSD";
   aLots[25] = 1.0;
   aDateOpen[25] = D'2011.06.23 19:02:08'+time_offset*3600;
   aPriceOpen[25] = 1.4225;
   aDateClose[25] = D'2011.06.24 08:18:48'+time_offset*3600;
   aPriceClose[25] = 1.42449;

   // ========== 26 ===== 815 ==========
   aType[26] = OP_SELL;
   aSymbol[26] = "GBPUSD";
   aLots[26] = 1.0;
   aDateOpen[26] = D'2011.06.24 04:20:18'+time_offset*3600;
   aPriceOpen[26] = 1.60209;
   aDateClose[26] = D'2011.06.24 07:30:07'+time_offset*3600;
   aPriceClose[26] = 1.59663;

   // ========== 27 ===== 813 ==========
   aType[27] = OP_SELL;
   aSymbol[27] = "EURUSD";
   aLots[27] = 1.0;
   aDateOpen[27] = D'2011.06.24 10:19:42'+time_offset*3600;
   aPriceOpen[27] = 1.42233;
   aDateClose[27] = D'2011.06.24 10:59:16'+time_offset*3600;
   aPriceClose[27] = 1.4203;

   // ========== 28 ===== 812 ==========
   aType[28] = OP_SELL;
   aSymbol[28] = "GBPUSD";
   aLots[28] = 1.0;
   aDateOpen[28] = D'2011.06.24 11:31:07'+time_offset*3600;
   aPriceOpen[28] = 1.60265;
   aDateClose[28] = D'2011.06.24 17:25:42'+time_offset*3600;
   aPriceClose[28] = 1.59713;

   // ========== 29 ===== 811 ==========
   aType[29] = OP_SELL;
   aSymbol[29] = "EURUSD";
   aLots[29] = 1.0;
   aDateOpen[29] = D'2011.06.27 22:38:34'+time_offset*3600;
   aPriceOpen[29] = 1.42979;
   aDateClose[29] = D'2011.06.28 03:42:03'+time_offset*3600;
   aPriceClose[29] = 1.42979;

   // ========== 30 ===== 810 ==========
   aType[30] = OP_SELL;
   aSymbol[30] = "AUDUSD";
   aLots[30] = 1.0;
   aDateOpen[30] = D'2011.06.28 02:58:55'+time_offset*3600;
   aPriceOpen[30] = 1.04705;
   aDateClose[30] = D'2011.06.28 04:31:28'+time_offset*3600;
   aPriceClose[30] = 1.04489;

   // ========== 31 ===== 809 ==========
   aType[31] = OP_SELL;
   aSymbol[31] = "AUDUSD";
   aLots[31] = 1.0;
   aDateOpen[31] = D'2011.06.28 12:41:33'+time_offset*3600;
   aPriceOpen[31] = 1.04831;
   aDateClose[31] = D'2011.06.28 14:30:33'+time_offset*3600;
   aPriceClose[31] = 1.05228;

   // ========== 32 ===== 808 ==========
   aType[32] = OP_BUY;
   aSymbol[32] = "USDCAD";
   aLots[32] = 1.0;
   aDateOpen[32] = D'2011.06.28 22:10:03'+time_offset*3600;
   aPriceOpen[32] = 0.98117;
   aDateClose[32] = D'2011.06.29 11:16:41'+time_offset*3600;
   aPriceClose[32] = 0.97336;

   // ========== 33 ===== 807 ==========
   aType[33] = OP_SELL;
   aSymbol[33] = "GBPUSD";
   aLots[33] = 1.0;
   aDateOpen[33] = D'2011.06.29 11:34:10'+time_offset*3600;
   aPriceOpen[33] = 1.60338;
   aDateClose[33] = D'2011.06.30 08:23:53'+time_offset*3600;
   aPriceClose[33] = 1.60254;

   // ========== 34 ===== 806 ==========
   aType[34] = OP_SELL;
   aSymbol[34] = "GBPUSD";
   aLots[34] = 1.0;
   aDateOpen[34] = D'2011.06.30 03:01:25'+time_offset*3600;
   aPriceOpen[34] = 1.61151;
   aDateClose[34] = D'2011.06.30 08:27:32'+time_offset*3600;
   aPriceClose[34] = 1.60145;

   // ========== 35 ===== 805 ==========
   aType[35] = OP_SELL;
   aSymbol[35] = "GBPUSD";
   aLots[35] = 1.0;
   aDateOpen[35] = D'2011.07.06 05:18:44'+time_offset*3600;
   aPriceOpen[35] = 1.60655;
   aDateClose[35] = D'2011.07.06 14:32:06'+time_offset*3600;
   aPriceClose[35] = 1.59701;

   // ========== 36 ===== 804 ==========
   aType[36] = OP_BUY;
   aSymbol[36] = "EURUSD";
   aLots[36] = 1.0;
   aDateOpen[36] = D'2011.07.06 10:50:36'+time_offset*3600;
   aPriceOpen[36] = 1.43404;
   aDateClose[36] = D'2011.07.06 23:46:26'+time_offset*3600;
   aPriceClose[36] = 1.43262;

   // ========== 37 ===== 803 ==========
   aType[37] = OP_SELL;
   aSymbol[37] = "EURUSD";
   aLots[37] = 1.0;
   aDateOpen[37] = D'2011.07.07 06:50:26'+time_offset*3600;
   aPriceOpen[37] = 1.43334;
   aDateClose[37] = D'2011.07.07 08:10:29'+time_offset*3600;
   aPriceClose[37] = 1.43022;

   // ========== 38 ===== 802 ==========
   aType[38] = OP_BUY;
   aSymbol[38] = "AUDUSD";
   aLots[38] = 1.0;
   aDateOpen[38] = D'2011.07.07 12:56:31'+time_offset*3600;
   aPriceOpen[38] = 1.07666;
   aDateClose[38] = D'2011.07.07 15:05:18'+time_offset*3600;
   aPriceClose[38] = 1.07675;

   // ========== 39 ===== 801 ==========
   aType[39] = OP_SELL;
   aSymbol[39] = "USDCAD";
   aLots[39] = 1.0;
   aDateOpen[39] = D'2011.07.08 10:30:07'+time_offset*3600;
   aPriceOpen[39] = 0.95962;
   aDateClose[39] = D'2011.07.08 11:20:55'+time_offset*3600;
   aPriceClose[39] = 0.95855;

   // ========== 40 ===== 800 ==========
   aType[40] = OP_BUY;
   aSymbol[40] = "GBPUSD";
   aLots[40] = 1.0;
   aDateOpen[40] = D'2011.07.08 12:39:30'+time_offset*3600;
   aPriceOpen[40] = 1.60089;
   aDateClose[40] = D'2011.07.08 14:49:21'+time_offset*3600;
   aPriceClose[40] = 1.60599;

   // ========== 41 ===== 799 ==========
   aType[41] = OP_BUY;
   aSymbol[41] = "AUDUSD";
   aLots[41] = 1.0;
   aDateOpen[41] = D'2011.07.11 09:26:40'+time_offset*3600;
   aPriceOpen[41] = 1.06991;
   aDateClose[41] = D'2011.07.12 02:04:01'+time_offset*3600;
   aPriceClose[41] = 1.059;

   // ========== 42 ===== 798 ==========
   aType[42] = OP_BUY;
   aSymbol[42] = "AUDUSD";
   aLots[42] = 1.0;
   aDateOpen[42] = D'2011.07.12 03:02:08'+time_offset*3600;
   aPriceOpen[42] = 1.05892;
   aDateClose[42] = D'2011.07.12 07:14:23'+time_offset*3600;
   aPriceClose[42] = 1.05419;

   // ========== 43 ===== 796 ==========
   aType[43] = OP_SELL;
   aSymbol[43] = "USDJPY";
   aLots[43] = 1.0;
   aDateOpen[43] = D'2011.07.12 08:16:31'+time_offset*3600;
   aPriceOpen[43] = 79.451;
   aDateClose[43] = D'2011.07.13 09:17:25'+time_offset*3600;
   aPriceClose[43] = 79.297;

   // ========== 44 ===== 797 ==========
   aType[44] = OP_SELL;
   aSymbol[44] = "EURUSD";
   aLots[44] = 1.0;
   aDateOpen[44] = D'2011.07.12 18:11:30'+time_offset*3600;
   aPriceOpen[44] = 1.4037;
   aDateClose[44] = D'2011.07.12 19:26:40'+time_offset*3600;
   aPriceClose[44] = 1.3987;

   // ========== 45 ===== 794 ==========
   aType[45] = OP_SELL;
   aSymbol[45] = "GBPUSD";
   aLots[45] = 1.0;
   aDateOpen[45] = D'2011.07.13 03:07:13'+time_offset*3600;
   aPriceOpen[45] = 1.59366;
   aDateClose[45] = D'2011.07.13 11:56:05'+time_offset*3600;
   aPriceClose[45] = 1.59642;

   // ========== 46 ===== 792 ==========
   aType[46] = OP_SELL;
   aSymbol[46] = "EURUSD";
   aLots[46] = 1.0;
   aDateOpen[46] = D'2011.07.13 09:35:48'+time_offset*3600;
   aPriceOpen[46] = 1.40938;
   aDateClose[46] = D'2011.07.14 03:23:03'+time_offset*3600;
   aPriceClose[46] = 1.42222;

   // ========== 47 ===== 795 ==========
   aType[47] = OP_SELL;
   aSymbol[47] = "EURUSD";
   aLots[47] = 1.0;
   aDateOpen[47] = D'2011.07.13 10:03:16'+time_offset*3600;
   aPriceOpen[47] = 1.41012;
   aDateClose[47] = D'2011.07.13 11:29:13'+time_offset*3600;
   aPriceClose[47] = 1.40689;

   // ========== 48 ===== 789 ==========
   aType[48] = OP_SELL;
   aSymbol[48] = "EURUSD";
   aLots[48] = 1.0;
   aDateOpen[48] = D'2011.07.13 22:10:39'+time_offset*3600;
   aPriceOpen[48] = 1.4222;
   aDateClose[48] = D'2011.07.14 06:00:49'+time_offset*3600;
   aPriceClose[48] = 1.41805;

   // ========== 49 ===== 793 ==========
   aType[49] = OP_SELL;
   aSymbol[49] = "USDJPY";
   aLots[49] = 1.0;
   aDateOpen[49] = D'2011.07.13 23:17:10'+time_offset*3600;
   aPriceOpen[49] = 78.9;
   aDateClose[49] = D'2011.07.13 23:53:52'+time_offset*3600;
   aPriceClose[49] = 78.861;

   // ========== 50 ===== 790 ==========
   aType[50] = OP_SELL;
   aSymbol[50] = "EURUSD";
   aLots[50] = 1.0;
   aDateOpen[50] = D'2011.07.13 23:43:09'+time_offset*3600;
   aPriceOpen[50] = 1.42465;
   aDateClose[50] = D'2011.07.14 05:58:14'+time_offset*3600;
   aPriceClose[50] = 1.41961;

   // ========== 51 ===== 791 ==========
   aType[51] = OP_SELL;
   aSymbol[51] = "EURUSD";
   aLots[51] = 1.0;
   aDateOpen[51] = D'2011.07.13 23:53:59'+time_offset*3600;
   aPriceOpen[51] = 1.4272;
   aDateClose[51] = D'2011.07.14 04:01:49'+time_offset*3600;
   aPriceClose[51] = 1.42134;

   // ========== 52 ===== 782 ==========
   aType[52] = OP_SELL;
   aSymbol[52] = "USDCHF";
   aLots[52] = 1.0;
   aDateOpen[52] = D'2011.07.14 03:23:07'+time_offset*3600;
   aPriceOpen[52] = 0.81165;
   aDateClose[52] = D'2011.07.19 06:28:06'+time_offset*3600;
   aPriceClose[52] = 0.821;

   // ========== 53 ===== 788 ==========
   aType[53] = OP_BUY;
   aSymbol[53] = "EURUSD";
   aLots[53] = 1.0;
   aDateOpen[53] = D'2011.07.14 06:06:40'+time_offset*3600;
   aPriceOpen[53] = 1.41784;
   aDateClose[53] = D'2011.07.14 07:03:06'+time_offset*3600;
   aPriceClose[53] = 1.41847;

   // ========== 54 ===== 787 ==========
   aType[54] = OP_BUY;
   aSymbol[54] = "GBPUSD";
   aLots[54] = 1.0;
   aDateOpen[54] = D'2011.07.14 11:15:29'+time_offset*3600;
   aPriceOpen[54] = 1.61148;
   aDateClose[54] = D'2011.07.14 13:08:48'+time_offset*3600;
   aPriceClose[54] = 1.61316;

   // ========== 55 ===== 786 ==========
   aType[55] = OP_SELL;
   aSymbol[55] = "USDCHF";
   aLots[55] = 1.0;
   aDateOpen[55] = D'2011.07.14 13:20:11'+time_offset*3600;
   aPriceOpen[55] = 0.81717;
   aDateClose[55] = D'2011.07.14 16:29:37'+time_offset*3600;
   aPriceClose[55] = 0.81649;

   // ========== 56 ===== 783 ==========
   aType[56] = OP_SELL;
   aSymbol[56] = "USDCHF";
   aLots[56] = 1.0;
   aDateOpen[56] = D'2011.07.15 06:09:46'+time_offset*3600;
   aPriceOpen[56] = 0.81569;
   aDateClose[56] = D'2011.07.17 21:31:56'+time_offset*3600;
   aPriceClose[56] = 0.80998;

   // ========== 57 ===== 784 ==========
   aType[57] = OP_SELL;
   aSymbol[57] = "USDCHF";
   aLots[57] = 1.0;
   aDateOpen[57] = D'2011.07.15 07:47:11'+time_offset*3600;
   aPriceOpen[57] = 0.81752;
   aDateClose[57] = D'2011.07.17 21:14:25'+time_offset*3600;
   aPriceClose[57] = 0.80986;

   // ========== 58 ===== 785 ==========
   aType[58] = OP_SELL;
   aSymbol[58] = "GBPUSD";
   aLots[58] = 1.0;
   aDateOpen[58] = D'2011.07.15 12:52:10'+time_offset*3600;
   aPriceOpen[58] = 1.60755;
   aDateClose[58] = D'2011.07.15 13:01:27'+time_offset*3600;
   aPriceClose[58] = 1.60991;

   // ========== 59 ===== 781 ==========
   aType[59] = OP_SELL;
   aSymbol[59] = "USDCHF";
   aLots[59] = 1.0;
   aDateOpen[59] = D'2011.07.18 09:22:53'+time_offset*3600;
   aPriceOpen[59] = 0.81631;
   aDateClose[59] = D'2011.07.19 06:28:07'+time_offset*3600;
   aPriceClose[59] = 0.821;

   // ========== 60 ===== 780 ==========
   aType[60] = OP_BUY;
   aSymbol[60] = "EURUSD";
   aLots[60] = 1.0;
   aDateOpen[60] = D'2011.07.19 07:20:59'+time_offset*3600;
   aPriceOpen[60] = 1.41482;
   aDateClose[60] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPriceClose[60] = 1.412;

   // ========== 61 ===== 779 ==========
   aType[61] = OP_BUY;
   aSymbol[61] = "EURUSD";
   aLots[61] = 1.0;
   aDateOpen[61] = D'2011.07.19 11:19:28'+time_offset*3600;
   aPriceOpen[61] = 1.41682;
   aDateClose[61] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPriceClose[61] = 1.412;

   // ========== 62 ===== 778 ==========
   aType[62] = OP_SELL;
   aSymbol[62] = "USDCHF";
   aLots[62] = 1.0;
   aDateOpen[62] = D'2011.07.19 19:16:07'+time_offset*3600;
   aPriceOpen[62] = 0.8265;
   aDateClose[62] = D'2011.07.20 07:12:21'+time_offset*3600;
   aPriceClose[62] = 0.8235;

   // ========== 63 ===== 776 ==========
   aType[63] = OP_SELL;
   aSymbol[63] = "USDJPY";
   aLots[63] = 1.0;
   aDateOpen[63] = D'2011.07.20 04:50:58'+time_offset*3600;
   aPriceOpen[63] = 79.132;
   aDateClose[63] = D'2011.07.21 03:52:15'+time_offset*3600;
   aPriceClose[63] = 78.69;

   // ========== 64 ===== 777 ==========
   aType[64] = OP_BUY;
   aSymbol[64] = "EURUSD";
   aLots[64] = 1.0;
   aDateOpen[64] = D'2011.07.20 06:35:58'+time_offset*3600;
   aPriceOpen[64] = 1.41849;
   aDateClose[64] = D'2011.07.20 07:16:27'+time_offset*3600;
   aPriceClose[64] = 1.4164;

   // ========== 65 ===== 775 ==========
   aType[65] = OP_SELL;
   aSymbol[65] = "USDJPY";
   aLots[65] = 1.0;
   aDateOpen[65] = D'2011.07.20 08:40:30'+time_offset*3600;
   aPriceOpen[65] = 78.785;
   aDateClose[65] = D'2011.07.21 05:36:00'+time_offset*3600;
   aPriceClose[65] = 78.868;

   // ========== 66 ===== 774 ==========
   aType[66] = OP_BUY;
   aSymbol[66] = "EURUSD";
   aLots[66] = 1.0;
   aDateOpen[66] = D'2011.07.21 09:06:48'+time_offset*3600;
   aPriceOpen[66] = 1.4195;
   aDateClose[66] = D'2011.07.21 11:35:33'+time_offset*3600;
   aPriceClose[66] = 1.41811;

   // ========== 67 ===== 773 ==========
   aType[67] = OP_SELL;
   aSymbol[67] = "EURUSD";
   aLots[67] = 1.0;
   aDateOpen[67] = D'2011.07.21 11:39:01'+time_offset*3600;
   aPriceOpen[67] = 1.41763;
   aDateClose[67] = D'2011.07.21 12:12:40'+time_offset*3600;
   aPriceClose[67] = 1.42214;

   // ========== 68 ===== 772 ==========
   aType[68] = OP_BUY;
   aSymbol[68] = "EURUSD";
   aLots[68] = 1.0;
   aDateOpen[68] = D'2011.07.21 13:24:41'+time_offset*3600;
   aPriceOpen[68] = 1.43315;
   aDateClose[68] = D'2011.07.21 21:11:47'+time_offset*3600;
   aPriceClose[68] = 1.44305;

   // ========== 69 ===== 771 ==========
   aType[69] = OP_BUY;
   aSymbol[69] = "EURUSD";
   aLots[69] = 1.0;
   aDateOpen[69] = D'2011.07.22 02:26:05'+time_offset*3600;
   aPriceOpen[69] = 1.43888;
   aDateClose[69] = D'2011.07.22 07:33:02'+time_offset*3600;
   aPriceClose[69] = 1.44238;

   // ========== 70 ===== 770 ==========
   aType[70] = OP_BUY;
   aSymbol[70] = "USDCHF";
   aLots[70] = 1.0;
   aDateOpen[70] = D'2011.07.22 07:29:27'+time_offset*3600;
   aPriceOpen[70] = 0.82281;
   aDateClose[70] = D'2011.07.22 11:32:39'+time_offset*3600;
   aPriceClose[70] = 0.82016;

   // ========== 71 ===== 768 ==========
   aType[71] = OP_BUY;
   aSymbol[71] = "EURUSD";
   aLots[71] = 1.0;
   aDateOpen[71] = D'2011.07.22 11:56:02'+time_offset*3600;
   aPriceOpen[71] = 1.4384;
   aDateClose[71] = D'2011.07.24 21:05:26'+time_offset*3600;
   aPriceClose[71] = 1.4387;

   // ========== 72 ===== 769 ==========
   aType[72] = OP_BUY;
   aSymbol[72] = "EURUSD";
   aLots[72] = 1.0;
   aDateOpen[72] = D'2011.07.22 13:46:17'+time_offset*3600;
   aPriceOpen[72] = 1.434;
   aDateClose[72] = D'2011.07.24 21:01:28'+time_offset*3600;
   aPriceClose[72] = 1.4386;

   // ========== 73 ===== 766 ==========
   aType[73] = OP_BUY;
   aSymbol[73] = "EURUSD";
   aLots[73] = 1.0;
   aDateOpen[73] = D'2011.07.25 07:07:10'+time_offset*3600;
   aPriceOpen[73] = 1.43508;
   aDateClose[73] = D'2011.07.26 06:50:21'+time_offset*3600;
   aPriceClose[73] = 1.45126;

   // ========== 74 ===== 767 ==========
   aType[74] = OP_SELL;
   aSymbol[74] = "USDCHF";
   aLots[74] = 1.0;
   aDateOpen[74] = D'2011.07.25 08:07:52'+time_offset*3600;
   aPriceOpen[74] = 0.80632;
   aDateClose[74] = D'2011.07.26 03:34:33'+time_offset*3600;
   aPriceClose[74] = 0.80186;

   // ========== 75 ===== 765 ==========
   aType[75] = OP_BUY;
   aSymbol[75] = "EURUSD";
   aLots[75] = 1.0;
   aDateOpen[75] = D'2011.07.26 09:07:28'+time_offset*3600;
   aPriceOpen[75] = 1.44751;
   aDateClose[75] = D'2011.07.26 12:08:02'+time_offset*3600;
   aPriceClose[75] = 1.44765;

   // ========== 76 ===== 764 ==========
   aType[76] = OP_BUY;
   aSymbol[76] = "EURUSD";
   aLots[76] = 1.0;
   aDateOpen[76] = D'2011.07.26 12:07:54'+time_offset*3600;
   aPriceOpen[76] = 1.44781;
   aDateClose[76] = D'2011.07.26 12:08:46'+time_offset*3600;
   aPriceClose[76] = 1.44788;

   // ========== 77 ===== 763 ==========
   aType[77] = OP_BUY;
   aSymbol[77] = "EURUSD";
   aLots[77] = 1.0;
   aDateOpen[77] = D'2011.07.26 12:09:21'+time_offset*3600;
   aPriceOpen[77] = 1.4479;
   aDateClose[77] = D'2011.07.26 12:09:49'+time_offset*3600;
   aPriceClose[77] = 1.44759;

   // ========== 78 ===== 762 ==========
   aType[78] = OP_SELL;
   aSymbol[78] = "EURUSD";
   aLots[78] = 1.0;
   aDateOpen[78] = D'2011.07.26 12:09:54'+time_offset*3600;
   aPriceOpen[78] = 1.44753;
   aDateClose[78] = D'2011.07.26 12:10:12'+time_offset*3600;
   aPriceClose[78] = 1.44773;

   // ========== 79 ===== 761 ==========
   aType[79] = OP_BUY;
   aSymbol[79] = "EURUSD";
   aLots[79] = 1.0;
   aDateOpen[79] = D'2011.07.26 12:10:19'+time_offset*3600;
   aPriceOpen[79] = 1.44774;
   aDateClose[79] = D'2011.07.26 12:10:29'+time_offset*3600;
   aPriceClose[79] = 1.44776;

   // ========== 80 ===== 760 ==========
   aType[80] = OP_BUY;
   aSymbol[80] = "EURUSD";
   aLots[80] = 1.0;
   aDateOpen[80] = D'2011.07.26 13:01:13'+time_offset*3600;
   aPriceOpen[80] = 1.44681;
   aDateClose[80] = D'2011.07.26 18:44:45'+time_offset*3600;
   aPriceClose[80] = 1.45133;

   // ========== 81 ===== 759 ==========
   aType[81] = OP_BUY;
   aSymbol[81] = "EURUSD";
   aLots[81] = 1.0;
   aDateOpen[81] = D'2011.07.27 11:32:30'+time_offset*3600;
   aPriceOpen[81] = 1.44602;
   aDateClose[81] = D'2011.07.27 15:10:41'+time_offset*3600;
   aPriceClose[81] = 1.436;

   // ========== 82 ===== 758 ==========
   aType[82] = OP_BUY;
   aSymbol[82] = "EURUSD";
   aLots[82] = 1.0;
   aDateOpen[82] = D'2011.07.27 16:09:51'+time_offset*3600;
   aPriceOpen[82] = 1.434;
   aDateClose[82] = D'2011.07.28 04:34:21'+time_offset*3600;
   aPriceClose[82] = 1.43607;

   // ========== 83 ===== 757 ==========
   aType[83] = OP_BUY;
   aSymbol[83] = "GBPUSD";
   aLots[83] = 1.0;
   aDateOpen[83] = D'2011.07.28 02:55:58'+time_offset*3600;
   aPriceOpen[83] = 1.63239;
   aDateClose[83] = D'2011.07.28 04:35:19'+time_offset*3600;
   aPriceClose[83] = 1.63314;

   // ========== 84 ===== 756 ==========
   aType[84] = OP_SELL;
   aSymbol[84] = "EURUSD";
   aLots[84] = 1.0;
   aDateOpen[84] = D'2011.07.28 09:53:06'+time_offset*3600;
   aPriceOpen[84] = 1.43234;
   aDateClose[84] = D'2011.07.29 02:31:19'+time_offset*3600;
   aPriceClose[84] = 1.429;

   // ========== 85 ===== 753 ==========
   aType[85] = OP_BUY;
   aSymbol[85] = "AUDUSD";
   aLots[85] = 1.0;
   aDateOpen[85] = D'2011.07.29 03:00:26'+time_offset*3600;
   aPriceOpen[85] = 1.0976;
   aDateClose[85] = D'2011.07.29 15:07:40'+time_offset*3600;
   aPriceClose[85] = 1.09967;

   // ========== 86 ===== 755 ==========
   aType[86] = OP_SELL;
   aSymbol[86] = "USDCAD";
   aLots[86] = 1.0;
   aDateOpen[86] = D'2011.07.29 06:21:28'+time_offset*3600;
   aPriceOpen[86] = 0.95115;
   aDateClose[86] = D'2011.07.29 12:31:42'+time_offset*3600;
   aPriceClose[86] = 0.95433;

   // ========== 87 ===== 754 ==========
   aType[87] = OP_BUY;
   aSymbol[87] = "USDCAD";
   aLots[87] = 1.0;
   aDateOpen[87] = D'2011.07.29 12:39:29'+time_offset*3600;
   aPriceOpen[87] = 0.95606;
   aDateClose[87] = D'2011.07.29 14:57:37'+time_offset*3600;
   aPriceClose[87] = 0.95387;

   // ========== 88 ===== 752 ==========
   aType[88] = OP_BUY;
   aSymbol[88] = "GBPUSD";
   aLots[88] = 1.0;
   aDateOpen[88] = D'2011.07.29 13:30:51'+time_offset*3600;
   aPriceOpen[88] = 1.63988;
   aDateClose[88] = D'2011.07.29 15:10:12'+time_offset*3600;
   aPriceClose[88] = 1.6451;

   // ========== 89 ===== 750 ==========
   aType[89] = OP_SELL;
   aSymbol[89] = "AUDUSD";
   aLots[89] = 1.0;
   aDateOpen[89] = D'2011.07.31 23:11:23'+time_offset*3600;
   aPriceOpen[89] = 1.10127;
   aDateClose[89] = D'2011.08.01 09:33:22'+time_offset*3600;
   aPriceClose[89] = 1.10393;

   // ========== 90 ===== 751 ==========
   aType[90] = OP_SELL;
   aSymbol[90] = "USDCHF";
   aLots[90] = 1.0;
   aDateOpen[90] = D'2011.08.01 00:57:02'+time_offset*3600;
   aPriceOpen[90] = 0.79489;
   aDateClose[90] = D'2011.08.01 04:19:10'+time_offset*3600;
   aPriceClose[90] = 0.79076;

   // ========== 91 ===== 749 ==========
   aType[91] = OP_SELL;
   aSymbol[91] = "EURUSD";
   aLots[91] = 1.0;
   aDateOpen[91] = D'2011.08.01 09:33:28'+time_offset*3600;
   aPriceOpen[91] = 1.443;
   aDateClose[91] = D'2011.08.01 14:05:37'+time_offset*3600;
   aPriceClose[91] = 1.42876;

   // ========== 92 ===== 748 ==========
   aType[92] = OP_SELL;
   aSymbol[92] = "USDCHF";
   aLots[92] = 1.0;
   aDateOpen[92] = D'2011.08.01 20:04:41'+time_offset*3600;
   aPriceOpen[92] = 0.7835;
   aDateClose[92] = D'2011.08.02 04:56:52'+time_offset*3600;
   aPriceClose[92] = 0.78147;

   // ========== 93 ===== 747 ==========
   aType[93] = OP_SELL;
   aSymbol[93] = "EURUSD";
   aLots[93] = 1.0;
   aDateOpen[93] = D'2011.08.02 00:31:44'+time_offset*3600;
   aPriceOpen[93] = 1.42684;
   aDateClose[93] = D'2011.08.02 06:29:43'+time_offset*3600;
   aPriceClose[93] = 1.42419;

   // ========== 94 ===== 746 ==========
   aType[94] = OP_SELL;
   aSymbol[94] = "EURUSD";
   aLots[94] = 1.0;
   aDateOpen[94] = D'2011.08.02 09:26:21'+time_offset*3600;
   aPriceOpen[94] = 1.41713;
   aDateClose[94] = D'2011.08.02 12:32:15'+time_offset*3600;
   aPriceClose[94] = 1.41688;

   // ========== 95 ===== 744 ==========
   aType[95] = OP_BUY;
   aSymbol[95] = "AUDUSD";
   aLots[95] = 1.0;
   aDateOpen[95] = D'2011.08.02 12:19:39'+time_offset*3600;
   aPriceOpen[95] = 1.08343;
   aDateClose[95] = D'2011.08.02 22:39:58'+time_offset*3600;
   aPriceClose[95] = 1.07596;

   // ========== 96 ===== 745 ==========
   aType[96] = OP_BUY;
   aSymbol[96] = "AUDUSD";
   aLots[96] = 1.0;
   aDateOpen[96] = D'2011.08.02 21:37:28'+time_offset*3600;
   aPriceOpen[96] = 1.07824;
   aDateClose[96] = D'2011.08.02 22:39:54'+time_offset*3600;
   aPriceClose[96] = 1.07601;

   // ========== 97 ===== 742 ==========
   aType[97] = OP_BUY;
   aSymbol[97] = "AUDUSD";
   aLots[97] = 1.0;
   aDateOpen[97] = D'2011.08.02 22:55:28'+time_offset*3600;
   aPriceOpen[97] = 1.07394;
   aDateClose[97] = D'2011.08.03 01:30:31'+time_offset*3600;
   aPriceClose[97] = 1.06897;

   // ========== 98 ===== 743 ==========
   aType[98] = OP_BUY;
   aSymbol[98] = "AUDUSD";
   aLots[98] = 1.0;
   aDateOpen[98] = D'2011.08.03 00:19:04'+time_offset*3600;
   aPriceOpen[98] = 1.07294;
   aDateClose[98] = D'2011.08.03 01:30:28'+time_offset*3600;
   aPriceClose[98] = 1.06851;

   // ========== 99 ===== 741 ==========
   aType[99] = OP_SELL;
   aSymbol[99] = "GBPUSD";
   aLots[99] = 1.0;
   aDateOpen[99] = D'2011.08.03 07:53:45'+time_offset*3600;
   aPriceOpen[99] = 1.63029;
   aDateClose[99] = D'2011.08.03 08:28:48'+time_offset*3600;
   aPriceClose[99] = 1.63575;

   // ========== 100 ===== 740 ==========
   aType[100] = OP_BUY;
   aSymbol[100] = "GBPUSD";
   aLots[100] = 1.0;
   aDateOpen[100] = D'2011.08.03 08:31:59'+time_offset*3600;
   aPriceOpen[100] = 1.6365;
   aDateClose[100] = D'2011.08.03 11:13:26'+time_offset*3600;
   aPriceClose[100] = 1.63873;

   // ========== 101 ===== 738 ==========
   aType[101] = OP_SELL;
   aSymbol[101] = "AUDUSD";
   aLots[101] = 1.0;
   aDateOpen[101] = D'2011.08.03 14:06:10'+time_offset*3600;
   aPriceOpen[101] = 1.07283;
   aDateClose[101] = D'2011.08.04 08:25:13'+time_offset*3600;
   aPriceClose[101] = 1.06337;

   // ========== 102 ===== 739 ==========
   aType[102] = OP_BUY;
   aSymbol[102] = "GBPUSD";
   aLots[102] = 1.0;
   aDateOpen[102] = D'2011.08.03 14:59:45'+time_offset*3600;
   aPriceOpen[102] = 1.6413;
   aDateClose[102] = D'2011.08.03 16:20:14'+time_offset*3600;
   aPriceClose[102] = 1.64071;

   // ========== 103 ===== 737 ==========
   aType[103] = OP_SELL;
   aSymbol[103] = "USDCHF";
   aLots[103] = 1.0;
   aDateOpen[103] = D'2011.08.04 07:34:02'+time_offset*3600;
   aPriceOpen[103] = 0.77823;
   aDateClose[103] = D'2011.08.04 09:36:41'+time_offset*3600;
   aPriceClose[103] = 0.77758;

   // ========== 104 ===== 736 ==========
   aType[104] = OP_SELL;
   aSymbol[104] = "USDJPY";
   aLots[104] = 1.0;
   aDateOpen[104] = D'2011.08.04 10:30:14'+time_offset*3600;
   aPriceOpen[104] = 80.029;
   aDateClose[104] = D'2011.08.04 12:15:23'+time_offset*3600;
   aPriceClose[104] = 79.642;

   // ========== 105 ===== 735 ==========
   aType[105] = OP_BUY;
   aSymbol[105] = "USDJPY";
   aLots[105] = 1.0;
   aDateOpen[105] = D'2011.08.04 13:46:20'+time_offset*3600;
   aPriceOpen[105] = 79.148;
   aDateClose[105] = D'2011.08.04 20:12:29'+time_offset*3600;
   aPriceClose[105] = 79.111;

   // ========== 106 ===== 733 ==========
   aType[106] = OP_BUY;
   aSymbol[106] = "AUDUSD";
   aLots[106] = 1.0;
   aDateOpen[106] = D'2011.08.04 20:14:56'+time_offset*3600;
   aPriceOpen[106] = 1.0464;
   aDateClose[106] = D'2011.08.05 02:01:27'+time_offset*3600;
   aPriceClose[106] = 1.04886;

   // ========== 107 ===== 734 ==========
   aType[107] = OP_BUY;
   aSymbol[107] = "EURUSD";
   aLots[107] = 1.0;
   aDateOpen[107] = D'2011.08.04 23:41:13'+time_offset*3600;
   aPriceOpen[107] = 1.4073;
   aDateClose[107] = D'2011.08.05 02:01:11'+time_offset*3600;
   aPriceClose[107] = 1.41058;

   // ========== 108 ===== 732 ==========
   aType[108] = OP_SELL;
   aSymbol[108] = "EURUSD";
   aLots[108] = 1.0;
   aDateOpen[108] = D'2011.08.05 07:27:46'+time_offset*3600;
   aPriceOpen[108] = 1.4155;
   aDateClose[108] = D'2011.08.05 07:41:04'+time_offset*3600;
   aPriceClose[108] = 1.41435;

   // ========== 109 ===== 731 ==========
   aType[109] = OP_SELL;
   aSymbol[109] = "USDCAD";
   aLots[109] = 1.0;
   aDateOpen[109] = D'2011.08.05 08:06:54'+time_offset*3600;
   aPriceOpen[109] = 0.97969;
   aDateClose[109] = D'2011.08.05 09:34:16'+time_offset*3600;
   aPriceClose[109] = 0.97943;

   // ========== 110 ===== 730 ==========
   aType[110] = OP_SELL;
   aSymbol[110] = "EURUSD";
   aLots[110] = 1.0;
   aDateOpen[110] = D'2011.08.05 09:20:21'+time_offset*3600;
   aPriceOpen[110] = 1.41623;
   aDateClose[110] = D'2011.08.05 10:03:22'+time_offset*3600;
   aPriceClose[110] = 1.41301;

   // ========== 111 ===== 729 ==========
   aType[111] = OP_SELL;
   aSymbol[111] = "EURUSD";
   aLots[111] = 1.0;
   aDateOpen[111] = D'2011.08.05 11:15:11'+time_offset*3600;
   aPriceOpen[111] = 1.41649;
   aDateClose[111] = D'2011.08.05 13:20:52'+time_offset*3600;
   aPriceClose[111] = 1.42;

   // ========== 112 ===== 728 ==========
   aType[112] = OP_BUY;
   aSymbol[112] = "GBPUSD";
   aLots[112] = 1.0;
   aDateOpen[112] = D'2011.08.05 13:31:47'+time_offset*3600;
   aPriceOpen[112] = 1.63458;
   aDateClose[112] = D'2011.08.05 13:47:00'+time_offset*3600;
   aPriceClose[112] = 1.63228;

   // ========== 113 ===== 727 ==========
   aType[113] = OP_SELL;
   aSymbol[113] = "AUDUSD";
   aLots[113] = 1.0;
   aDateOpen[113] = D'2011.08.05 13:55:40'+time_offset*3600;
   aPriceOpen[113] = 1.04476;
   aDateClose[113] = D'2011.08.05 15:01:44'+time_offset*3600;
   aPriceClose[113] = 1.04431;

   // ========== 114 ===== 726 ==========
   aType[114] = OP_BUY;
   aSymbol[114] = "GBPUSD";
   aLots[114] = 1.0;
   aDateOpen[114] = D'2011.08.05 14:14:15'+time_offset*3600;
   aPriceOpen[114] = 1.63631;
   aDateClose[114] = D'2011.08.05 15:40:50'+time_offset*3600;
   aPriceClose[114] = 1.63673;

   // ========== 115 ===== 725 ==========
   aType[115] = OP_SELL;
   aSymbol[115] = "AUDUSD";
   aLots[115] = 1.0;
   aDateOpen[115] = D'2011.08.05 15:47:13'+time_offset*3600;
   aPriceOpen[115] = 1.04;
   aDateClose[115] = D'2011.08.05 16:10:55'+time_offset*3600;
   aPriceClose[115] = 1.04556;

   // ========== 116 ===== 724 ==========
   aType[116] = OP_BUY;
   aSymbol[116] = "EURUSD";
   aLots[116] = 1.0;
   aDateOpen[116] = D'2011.08.05 16:39:23'+time_offset*3600;
   aPriceOpen[116] = 1.42395;
   aDateClose[116] = D'2011.08.07 21:16:44'+time_offset*3600;
   aPriceClose[116] = 1.43911;

   // ========== 117 ===== 723 ==========
   aType[117] = OP_BUY;
   aSymbol[117] = "EURUSD";
   aLots[117] = 1.0;
   aDateOpen[117] = D'2011.08.07 22:58:42'+time_offset*3600;
   aPriceOpen[117] = 1.43;
   aDateClose[117] = D'2011.08.08 01:12:04'+time_offset*3600;
   aPriceClose[117] = 1.4351;

   // ========== 118 ===== 722 ==========
   aType[118] = OP_SELL;
   aSymbol[118] = "USDCAD";
   aLots[118] = 1.0;
   aDateOpen[118] = D'2011.08.08 19:53:35'+time_offset*3600;
   aPriceOpen[118] = 0.99018;
   aDateClose[118] = D'2011.08.09 02:28:59'+time_offset*3600;
   aPriceClose[118] = 1.0;

   // ========== 119 ===== 721 ==========
   aType[119] = OP_SELL;
   aSymbol[119] = "USDCAD";
   aLots[119] = 1.0;
   aDateOpen[119] = D'2011.08.09 03:16:50'+time_offset*3600;
   aPriceOpen[119] = 0.99883;
   aDateClose[119] = D'2011.08.09 06:04:58'+time_offset*3600;
   aPriceClose[119] = 0.99469;

   // ========== 120 ===== 720 ==========
   aType[120] = OP_SELL;
   aSymbol[120] = "AUDUSD";
   aLots[120] = 1.0;
   aDateOpen[120] = D'2011.08.09 05:06:07'+time_offset*3600;
   aPriceOpen[120] = 1.0131;
   aDateClose[120] = D'2011.08.09 07:00:08'+time_offset*3600;
   aPriceClose[120] = 1.0231;

   // ========== 121 ===== 719 ==========
   aType[121] = OP_SELL;
   aSymbol[121] = "AUDUSD";
   aLots[121] = 1.0;
   aDateOpen[121] = D'2011.08.09 07:06:44'+time_offset*3600;
   aPriceOpen[121] = 1.02241;
   aDateClose[121] = D'2011.08.09 07:44:57'+time_offset*3600;
   aPriceClose[121] = 1.01488;

   // ========== 122 ===== 718 ==========
   aType[122] = OP_BUY;
   aSymbol[122] = "USDJPY";
   aLots[122] = 1.0;
   aDateOpen[122] = D'2011.08.09 10:00:33'+time_offset*3600;
   aPriceOpen[122] = 77.064;
   aDateClose[122] = D'2011.08.09 13:37:18'+time_offset*3600;
   aPriceClose[122] = 77.221;

   // ========== 123 ===== 717 ==========
   aType[123] = OP_SELL;
   aSymbol[123] = "AUDUSD";
   aLots[123] = 1.0;
   aDateOpen[123] = D'2011.08.09 20:20:12'+time_offset*3600;
   aPriceOpen[123] = 1.03526;
   aDateClose[123] = D'2011.08.10 00:02:38'+time_offset*3600;
   aPriceClose[123] = 1.03419;

   // ========== 124 ===== 715 ==========
   aType[124] = OP_BUY;
   aSymbol[124] = "EURUSD";
   aLots[124] = 1.0;
   aDateOpen[124] = D'2011.08.09 23:47:00'+time_offset*3600;
   aPriceOpen[124] = 1.43699;
   aDateClose[124] = D'2011.08.10 09:40:03'+time_offset*3600;
   aPriceClose[124] = 1.4384;

   // ========== 125 ===== 716 ==========
   aType[125] = OP_SELL;
   aSymbol[125] = "USDCHF";
   aLots[125] = 1.0;
   aDateOpen[125] = D'2011.08.10 05:34:29'+time_offset*3600;
   aPriceOpen[125] = 0.7267;
   aDateClose[125] = D'2011.08.10 06:40:05'+time_offset*3600;
   aPriceClose[125] = 0.7217;

   // ========== 126 ===== 714 ==========
   aType[126] = OP_BUY;
   aSymbol[126] = "USDJPY";
   aLots[126] = 1.0;
   aDateOpen[126] = D'2011.08.10 08:09:40'+time_offset*3600;
   aPriceOpen[126] = 76.67;
   aDateClose[126] = D'2011.08.10 14:50:19'+time_offset*3600;
   aPriceClose[126] = 76.516;

   // ========== 127 ===== 712 ==========
   aType[127] = OP_SELL;
   aSymbol[127] = "EURUSD";
   aLots[127] = 1.0;
   aDateOpen[127] = D'2011.08.10 12:51:52'+time_offset*3600;
   aPriceOpen[127] = 1.43023;
   aDateClose[127] = D'2011.08.10 22:20:12'+time_offset*3600;
   aPriceClose[127] = 1.4146;

   // ========== 128 ===== 713 ==========
   aType[128] = OP_SELL;
   aSymbol[128] = "GBPUSD";
   aLots[128] = 1.0;
   aDateOpen[128] = D'2011.08.10 16:07:18'+time_offset*3600;
   aPriceOpen[128] = 1.61817;
   aDateClose[128] = D'2011.08.10 22:19:04'+time_offset*3600;
   aPriceClose[128] = 1.61267;

   // ========== 129 ===== 709 ==========
   aType[129] = OP_SELL;
   aSymbol[129] = "EURUSD";
   aLots[129] = 1.0;
   aDateOpen[129] = D'2011.08.11 01:48:26'+time_offset*3600;
   aPriceOpen[129] = 1.421;
   aDateClose[129] = D'2011.08.11 10:03:13'+time_offset*3600;
   aPriceClose[129] = 1.41711;

   // ========== 130 ===== 711 ==========
   aType[130] = OP_BUY;
   aSymbol[130] = "USDCHF";
   aLots[130] = 1.0;
   aDateOpen[130] = D'2011.08.11 05:57:22'+time_offset*3600;
   aPriceOpen[130] = 0.73175;
   aDateClose[130] = D'2011.08.11 06:11:36'+time_offset*3600;
   aPriceClose[130] = 0.72875;

   // ========== 131 ===== 710 ==========
   aType[131] = OP_SELL;
   aSymbol[131] = "GBPUSD";
   aLots[131] = 1.0;
   aDateOpen[131] = D'2011.08.11 06:43:29'+time_offset*3600;
   aPriceOpen[131] = 1.61966;
   aDateClose[131] = D'2011.08.11 08:11:24'+time_offset*3600;
   aPriceClose[131] = 1.61825;

   // ========== 132 ===== 708 ==========
   aType[132] = OP_SELL;
   aSymbol[132] = "EURUSD";
   aLots[132] = 1.0;
   aDateOpen[132] = D'2011.08.11 11:42:13'+time_offset*3600;
   aPriceOpen[132] = 1.41499;
   aDateClose[132] = D'2011.08.11 13:00:36'+time_offset*3600;
   aPriceClose[132] = 1.41671;

   // ========== 133 ===== 707 ==========
   aType[133] = OP_SELL;
   aSymbol[133] = "USDCHF";
   aLots[133] = 1.0;
   aDateOpen[133] = D'2011.08.11 14:00:22'+time_offset*3600;
   aPriceOpen[133] = 0.76761;
   aDateClose[133] = D'2011.08.11 14:45:59'+time_offset*3600;
   aPriceClose[133] = 0.76084;

   // ========== 134 ===== 706 ==========
   aType[134] = OP_SELL;
   aSymbol[134] = "EURUSD";
   aLots[134] = 1.0;
   aDateOpen[134] = D'2011.08.12 07:11:56'+time_offset*3600;
   aPriceOpen[134] = 1.41596;
   aDateClose[134] = D'2011.08.12 07:32:55'+time_offset*3600;
   aPriceClose[134] = 1.41792;

   // ========== 135 ===== 705 ==========
   aType[135] = OP_BUY;
   aSymbol[135] = "GBPUSD";
   aLots[135] = 1.0;
   aDateOpen[135] = D'2011.08.12 09:10:00'+time_offset*3600;
   aPriceOpen[135] = 1.62892;
   aDateClose[135] = D'2011.08.12 13:36:19'+time_offset*3600;
   aPriceClose[135] = 1.62906;

   // ========== 136 ===== 704 ==========
   aType[136] = OP_BUY;
   aSymbol[136] = "USDCHF";
   aLots[136] = 1.0;
   aDateOpen[136] = D'2011.08.12 14:47:48'+time_offset*3600;
   aPriceOpen[136] = 0.77358;
   aDateClose[136] = D'2011.08.12 15:36:25'+time_offset*3600;
   aPriceClose[136] = 0.768;

   // ========== 137 ===== 702 ==========
   aType[137] = OP_SELL;
   aSymbol[137] = "USDCHF";
   aLots[137] = 1.0;
   aDateOpen[137] = D'2011.08.15 00:18:17'+time_offset*3600;
   aPriceOpen[137] = 0.78765;
   aDateClose[137] = D'2011.08.15 13:18:19'+time_offset*3600;
   aPriceClose[137] = 0.78452;

   // ========== 138 ===== 703 ==========
   aType[138] = OP_SELL;
   aSymbol[138] = "USDCHF";
   aLots[138] = 1.0;
   aDateOpen[138] = D'2011.08.15 06:11:24'+time_offset*3600;
   aPriceOpen[138] = 0.79818;
   aDateClose[138] = D'2011.08.15 12:54:02'+time_offset*3600;
   aPriceClose[138] = 0.7877;

   // ========== 139 ===== 698 ==========
   aType[139] = OP_BUY;
   aSymbol[139] = "EURUSD";
   aLots[139] = 1.0;
   aDateOpen[139] = D'2011.08.15 12:55:01'+time_offset*3600;
   aPriceOpen[139] = 1.43703;
   aDateClose[139] = D'2011.08.17 07:06:17'+time_offset*3600;
   aPriceClose[139] = 1.435;

   // ========== 140 ===== 701 ==========
   aType[140] = OP_SELL;
   aSymbol[140] = "AUDUSD";
   aLots[140] = 1.0;
   aDateOpen[140] = D'2011.08.16 02:40:45'+time_offset*3600;
   aPriceOpen[140] = 1.0496;
   aDateClose[140] = D'2011.08.16 03:21:48'+time_offset*3600;
   aPriceClose[140] = 1.04856;

   // ========== 141 ===== 700 ==========
   aType[141] = OP_BUY;
   aSymbol[141] = "EURUSD";
   aLots[141] = 1.0;
   aDateOpen[141] = D'2011.08.16 05:41:18'+time_offset*3600;
   aPriceOpen[141] = 1.44165;
   aDateClose[141] = D'2011.08.16 13:53:55'+time_offset*3600;
   aPriceClose[141] = 1.4389;

   // ========== 142 ===== 699 ==========
   aType[142] = OP_SELL;
   aSymbol[142] = "USDCHF";
   aLots[142] = 1.0;
   aDateOpen[142] = D'2011.08.17 07:01:47'+time_offset*3600;
   aPriceOpen[142] = 0.79118;
   aDateClose[142] = D'2011.08.17 07:05:17'+time_offset*3600;
   aPriceClose[142] = 0.78702;

   // ========== 143 ===== 697 ==========
   aType[143] = OP_SELL;
   aSymbol[143] = "EURUSD";
   aLots[143] = 1.0;
   aDateOpen[143] = D'2011.08.17 07:07:00'+time_offset*3600;
   aPriceOpen[143] = 1.43362;
   aDateClose[143] = D'2011.08.17 07:27:32'+time_offset*3600;
   aPriceClose[143] = 1.438;

   // ========== 144 ===== 696 ==========
   aType[144] = OP_BUY;
   aSymbol[144] = "EURUSD";
   aLots[144] = 1.0;
   aDateOpen[144] = D'2011.08.17 08:06:25'+time_offset*3600;
   aPriceOpen[144] = 1.44041;
   aDateClose[144] = D'2011.08.17 15:16:27'+time_offset*3600;
   aPriceClose[144] = 1.44327;

   // ========== 145 ===== 695 ==========
   aType[145] = OP_SELL;
   aSymbol[145] = "AUDUSD";
   aLots[145] = 1.0;
   aDateOpen[145] = D'2011.08.17 14:10:39'+time_offset*3600;
   aPriceOpen[145] = 1.05851;
   aDateClose[145] = D'2011.08.17 15:37:28'+time_offset*3600;
   aPriceClose[145] = 1.05658;

   // ========== 146 ===== 694 ==========
   aType[146] = OP_BUY;
   aSymbol[146] = "EURUSD";
   aLots[146] = 1.0;
   aDateOpen[146] = D'2011.08.17 15:36:51'+time_offset*3600;
   aPriceOpen[146] = 1.44309;
   aDateClose[146] = D'2011.08.18 01:16:14'+time_offset*3600;
   aPriceClose[146] = 1.44;

   // ========== 147 ===== 693 ==========
   aType[147] = OP_BUY;
   aSymbol[147] = "EURUSD";
   aLots[147] = 1.0;
   aDateOpen[147] = D'2011.08.18 00:03:13'+time_offset*3600;
   aPriceOpen[147] = 1.44142;
   aDateClose[147] = D'2011.08.18 06:07:35'+time_offset*3600;
   aPriceClose[147] = 1.439;

   // ========== 148 ===== 692 ==========
   aType[148] = OP_BUY;
   aSymbol[148] = "GBPUSD";
   aLots[148] = 1.0;
   aDateOpen[148] = D'2011.08.18 10:40:40'+time_offset*3600;
   aPriceOpen[148] = 1.64966;
   aDateClose[148] = D'2011.08.18 13:13:21'+time_offset*3600;
   aPriceClose[148] = 1.65169;

   // ========== 149 ===== 690 ==========
   aType[149] = OP_SELL;
   aSymbol[149] = "GBPUSD";
   aLots[149] = 1.0;
   aDateOpen[149] = D'2011.08.18 13:44:47'+time_offset*3600;
   aPriceOpen[149] = 1.64829;
   aDateClose[149] = D'2011.08.18 14:30:10'+time_offset*3600;
   aPriceClose[149] = 1.64479;

   // ========== 150 ===== 691 ==========
   aType[150] = OP_SELL;
   aSymbol[150] = "USDCHF";
   aLots[150] = 1.0;
   aDateOpen[150] = D'2011.08.18 14:01:57'+time_offset*3600;
   aPriceOpen[150] = 0.78768;
   aDateClose[150] = D'2011.08.18 14:24:13'+time_offset*3600;
   aPriceClose[150] = 0.78912;

   // ========== 151 ===== 689 ==========
   aType[151] = OP_SELL;
   aSymbol[151] = "EURUSD";
   aLots[151] = 1.0;
   aDateOpen[151] = D'2011.08.18 14:50:48'+time_offset*3600;
   aPriceOpen[151] = 1.43041;
   aDateClose[151] = D'2011.08.19 00:14:43'+time_offset*3600;
   aPriceClose[151] = 1.43028;

   // ========== 152 ===== 686 ==========
   aType[152] = OP_SELL;
   aSymbol[152] = "EURUSD";
   aLots[152] = 1.0;
   aDateOpen[152] = D'2011.08.19 02:02:11'+time_offset*3600;
   aPriceOpen[152] = 1.4314;
   aDateClose[152] = D'2011.08.19 09:03:48'+time_offset*3600;
   aPriceClose[152] = 1.43324;

   // ========== 153 ===== 688 ==========
   aType[153] = OP_SELL;
   aSymbol[153] = "USDCHF";
   aLots[153] = 1.0;
   aDateOpen[153] = D'2011.08.19 06:56:28'+time_offset*3600;
   aPriceOpen[153] = 0.79049;
   aDateClose[153] = D'2011.08.19 07:50:35'+time_offset*3600;
   aPriceClose[153] = 0.78996;

   // ========== 154 ===== 687 ==========
   aType[154] = OP_SELL;
   aSymbol[154] = "EURUSD";
   aLots[154] = 1.0;
   aDateOpen[154] = D'2011.08.19 08:26:22'+time_offset*3600;
   aPriceOpen[154] = 1.42904;
   aDateClose[154] = D'2011.08.19 08:27:31'+time_offset*3600;
   aPriceClose[154] = 1.42898;

   // ========== 155 ===== 685 ==========
   aType[155] = OP_SELL;
   aSymbol[155] = "EURUSD";
   aLots[155] = 1.0;
   aDateOpen[155] = D'2011.08.19 11:08:12'+time_offset*3600;
   aPriceOpen[155] = 1.43119;
   aDateClose[155] = D'2011.08.19 11:50:54'+time_offset*3600;
   aPriceClose[155] = 1.43572;

   // ========== 156 ===== 684 ==========
   aType[156] = OP_BUY;
   aSymbol[156] = "EURUSD";
   aLots[156] = 1.0;
   aDateOpen[156] = D'2011.08.19 12:07:17'+time_offset*3600;
   aPriceOpen[156] = 1.43935;
   aDateClose[156] = D'2011.08.19 13:52:08'+time_offset*3600;
   aPriceClose[156] = 1.44157;

   // ========== 157 ===== 683 ==========
   aType[157] = OP_SELL;
   aSymbol[157] = "AUDUSD";
   aLots[157] = 1.0;
   aDateOpen[157] = D'2011.08.19 12:13:24'+time_offset*3600;
   aPriceOpen[157] = 1.04373;
   aDateClose[157] = D'2011.08.19 17:41:47'+time_offset*3600;
   aPriceClose[157] = 1.04214;

   // ========== 158 ===== 682 ==========
   aType[158] = OP_BUY;
   aSymbol[158] = "GBPUSD";
   aLots[158] = 1.0;
   aDateOpen[158] = D'2011.08.19 17:29:04'+time_offset*3600;
   aPriceOpen[158] = 1.652;
   aDateClose[158] = D'2011.08.22 07:10:49'+time_offset*3600;
   aPriceClose[158] = 1.64975;

   // ========== 159 ===== 681 ==========
   aType[159] = OP_BUY;
   aSymbol[159] = "EURUSD";
   aLots[159] = 1.0;
   aDateOpen[159] = D'2011.08.22 06:33:47'+time_offset*3600;
   aPriceOpen[159] = 1.4355;
   aDateClose[159] = D'2011.08.22 08:49:22'+time_offset*3600;
   aPriceClose[159] = 1.43987;

   // ========== 160 ===== 680 ==========
   aType[160] = OP_BUY;
   aSymbol[160] = "GBPUSD";
   aLots[160] = 1.0;
   aDateOpen[160] = D'2011.08.23 07:21:59'+time_offset*3600;
   aPriceOpen[160] = 1.65166;
   aDateClose[160] = D'2011.08.23 07:46:33'+time_offset*3600;
   aPriceClose[160] = 1.65189;

   // ========== 161 ===== 679 ==========
   aType[161] = OP_BUY;
   aSymbol[161] = "EURUSD";
   aLots[161] = 1.0;
   aDateOpen[161] = D'2011.08.23 07:30:05'+time_offset*3600;
   aPriceOpen[161] = 1.44215;
   aDateClose[161] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPriceClose[161] = 1.4394;

   // ========== 162 ===== 678 ==========
   aType[162] = OP_BUY;
   aSymbol[162] = "EURUSD";
   aLots[162] = 1.0;
   aDateOpen[162] = D'2011.08.23 09:02:16'+time_offset*3600;
   aPriceOpen[162] = 1.44455;
   aDateClose[162] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPriceClose[162] = 1.4394;

   // ========== 163 ===== 677 ==========
   aType[163] = OP_SELL;
   aSymbol[163] = "AUDUSD";
   aLots[163] = 1.0;
   aDateOpen[163] = D'2011.08.23 21:39:05'+time_offset*3600;
   aPriceOpen[163] = 1.05274;
   aDateClose[163] = D'2011.08.23 23:50:04'+time_offset*3600;
   aPriceClose[163] = 1.05201;

   // ========== 164 ===== 676 ==========
   aType[164] = OP_BUY;
   aSymbol[164] = "EURUSD";
   aLots[164] = 1.0;
   aDateOpen[164] = D'2011.08.24 08:28:39'+time_offset*3600;
   aPriceOpen[164] = 1.44425;
   aDateClose[164] = D'2011.08.24 10:06:57'+time_offset*3600;
   aPriceClose[164] = 1.44681;

   // ========== 165 ===== 675 ==========
   aType[165] = OP_SELL;
   aSymbol[165] = "GBPUSD";
   aLots[165] = 1.0;
   aDateOpen[165] = D'2011.08.24 11:35:47'+time_offset*3600;
   aPriceOpen[165] = 1.64698;
   aDateClose[165] = D'2011.08.24 11:50:01'+time_offset*3600;
   aPriceClose[165] = 1.6472;

   // ========== 166 ===== 674 ==========
   aType[166] = OP_BUY;
   aSymbol[166] = "EURUSD";
   aLots[166] = 1.0;
   aDateOpen[166] = D'2011.08.24 12:33:06'+time_offset*3600;
   aPriceOpen[166] = 1.44684;
   aDateClose[166] = D'2011.08.24 14:45:45'+time_offset*3600;
   aPriceClose[166] = 1.44347;

   // ========== 167 ===== 673 ==========
   aType[167] = OP_BUY;
   aSymbol[167] = "USDCHF";
   aLots[167] = 1.0;
   aDateOpen[167] = D'2011.08.24 14:39:01'+time_offset*3600;
   aPriceOpen[167] = 0.79075;
   aDateClose[167] = D'2011.08.24 23:14:26'+time_offset*3600;
   aPriceClose[167] = 0.79577;

   // ========== 168 ===== 672 ==========
   aType[168] = OP_BUY;
   aSymbol[168] = "EURUSD";
   aLots[168] = 1.0;
   aDateOpen[168] = D'2011.08.25 07:08:39'+time_offset*3600;
   aPriceOpen[168] = 1.4446;
   aDateClose[168] = D'2011.08.25 09:05:01'+time_offset*3600;
   aPriceClose[168] = 1.44329;

   // ========== 169 ===== 669 ==========
   aType[169] = OP_SELL;
   aSymbol[169] = "USDJPY";
   aLots[169] = 1.0;
   aDateOpen[169] = D'2011.08.25 09:06:29'+time_offset*3600;
   aPriceOpen[169] = 77.099;
   aDateClose[169] = D'2011.08.25 17:47:11'+time_offset*3600;
   aPriceClose[169] = 77.59;

   // ========== 170 ===== 671 ==========
   aType[170] = OP_SELL;
   aSymbol[170] = "GBPUSD";
   aLots[170] = 1.0;
   aDateOpen[170] = D'2011.08.25 13:08:15'+time_offset*3600;
   aPriceOpen[170] = 1.63312;
   aDateClose[170] = D'2011.08.25 13:10:36'+time_offset*3600;
   aPriceClose[170] = 1.6356;

   // ========== 171 ===== 670 ==========
   aType[171] = OP_BUY;
   aSymbol[171] = "EURUSD";
   aLots[171] = 1.0;
   aDateOpen[171] = D'2011.08.25 13:16:46'+time_offset*3600;
   aPriceOpen[171] = 1.44586;
   aDateClose[171] = D'2011.08.25 13:53:26'+time_offset*3600;
   aPriceClose[171] = 1.4418;

   // ========== 172 ===== 668 ==========
   aType[172] = OP_SELL;
   aSymbol[172] = "EURUSD";
   aLots[172] = 1.0;
   aDateOpen[172] = D'2011.08.25 22:49:05'+time_offset*3600;
   aPriceOpen[172] = 1.4373;
   aDateClose[172] = D'2011.08.26 00:44:27'+time_offset*3600;
   aPriceClose[172] = 1.44;

   // ========== 173 ===== 667 ==========
   aType[173] = OP_BUY;
   aSymbol[173] = "EURUSD";
   aLots[173] = 1.0;
   aDateOpen[173] = D'2011.08.26 00:58:01'+time_offset*3600;
   aPriceOpen[173] = 1.44164;
   aDateClose[173] = D'2011.08.26 03:35:22'+time_offset*3600;
   aPriceClose[173] = 1.44103;

   // ========== 174 ===== 666 ==========
   aType[174] = OP_SELL;
   aSymbol[174] = "EURUSD";
   aLots[174] = 1.0;
   aDateOpen[174] = D'2011.08.26 05:40:35'+time_offset*3600;
   aPriceOpen[174] = 1.4426;
   aDateClose[174] = D'2011.08.26 08:31:22'+time_offset*3600;
   aPriceClose[174] = 1.44467;

   // ========== 175 ===== 665 ==========
   aType[175] = OP_SELL;
   aSymbol[175] = "USDCHF";
   aLots[175] = 1.0;
   aDateOpen[175] = D'2011.08.26 07:02:31'+time_offset*3600;
   aPriceOpen[175] = 0.78931;
   aDateClose[175] = D'2011.08.26 09:38:24'+time_offset*3600;
   aPriceClose[175] = 0.7939;

   // ========== 176 ===== 664 ==========
   aType[176] = OP_BUY;
   aSymbol[176] = "EURUSD";
   aLots[176] = 1.0;
   aDateOpen[176] = D'2011.08.26 13:49:23'+time_offset*3600;
   aPriceOpen[176] = 1.44411;
   aDateClose[176] = D'2011.08.26 14:02:34'+time_offset*3600;
   aPriceClose[176] = 1.43996;

   // ========== 177 ===== 663 ==========
   aType[177] = OP_BUY;
   aSymbol[177] = "USDCHF";
   aLots[177] = 1.0;
   aDateOpen[177] = D'2011.08.26 14:25:22'+time_offset*3600;
   aPriceOpen[177] = 0.79999;
   aDateClose[177] = D'2011.08.26 15:37:06'+time_offset*3600;
   aPriceClose[177] = 0.80465;

   // ========== 178 ===== 662 ==========
   aType[178] = OP_SELL;
   aSymbol[178] = "EURUSD";
   aLots[178] = 1.0;
   aDateOpen[178] = D'2011.08.26 14:46:57'+time_offset*3600;
   aPriceOpen[178] = 1.4353;
   aDateClose[178] = D'2011.08.26 15:45:37'+time_offset*3600;
   aPriceClose[178] = 1.44592;

   // ========== 179 ===== 659 ==========
   aType[179] = OP_BUY;
   aSymbol[179] = "EURUSD";
   aLots[179] = 1.0;
   aDateOpen[179] = D'2011.08.26 15:45:46'+time_offset*3600;
   aPriceOpen[179] = 1.44709;
   aDateClose[179] = D'2011.08.30 06:09:04'+time_offset*3600;
   aPriceClose[179] = 1.45149;

   // ========== 180 ===== 661 ==========
   aType[180] = OP_SELL;
   aSymbol[180] = "GBPUSD";
   aLots[180] = 1.0;
   aDateOpen[180] = D'2011.08.29 11:26:06'+time_offset*3600;
   aPriceOpen[180] = 1.63974;
   aDateClose[180] = D'2011.08.29 11:43:33'+time_offset*3600;
   aPriceClose[180] = 1.63951;

   // ========== 181 ===== 660 ==========
   aType[181] = OP_SELL;
   aSymbol[181] = "GBPUSD";
   aLots[181] = 1.0;
   aDateOpen[181] = D'2011.08.29 14:27:46'+time_offset*3600;
   aPriceOpen[181] = 1.6439;
   aDateClose[181] = D'2011.08.30 01:27:52'+time_offset*3600;
   aPriceClose[181] = 1.64084;

   // ========== 182 ===== 658 ==========
   aType[182] = OP_BUY;
   aSymbol[182] = "EURUSD";
   aLots[182] = 1.0;
   aDateOpen[182] = D'2011.08.30 08:33:18'+time_offset*3600;
   aPriceOpen[182] = 1.44406;
   aDateClose[182] = D'2011.08.30 09:46:08'+time_offset*3600;
   aPriceClose[182] = 1.44108;

   // ========== 183 ===== 657 ==========
   aType[183] = OP_SELL;
   aSymbol[183] = "GBPUSD";
   aLots[183] = 1.0;
   aDateOpen[183] = D'2011.08.31 08:32:19'+time_offset*3600;
   aPriceOpen[183] = 1.62669;
   aDateClose[183] = D'2011.08.31 09:29:35'+time_offset*3600;
   aPriceClose[183] = 1.62898;

   // ========== 184 ===== 656 ==========
   aType[184] = OP_SELL;
   aSymbol[184] = "EURUSD";
   aLots[184] = 1.0;
   aDateOpen[184] = D'2011.08.31 15:47:35'+time_offset*3600;
   aPriceOpen[184] = 1.44093;
   aDateClose[184] = D'2011.08.31 19:03:53'+time_offset*3600;
   aPriceClose[184] = 1.43777;

   // ========== 185 ===== 655 ==========
   aType[185] = OP_BUY;
   aSymbol[185] = "AUDUSD";
   aLots[185] = 1.0;
   aDateOpen[185] = D'2011.09.01 01:33:08'+time_offset*3600;
   aPriceOpen[185] = 1.07131;
   aDateClose[185] = D'2011.09.01 03:23:06'+time_offset*3600;
   aPriceClose[185] = 1.0696;

   // ========== 186 ===== 652 ==========
   aType[186] = OP_BUY;
   aSymbol[186] = "USDCAD";
   aLots[186] = 1.0;
   aDateOpen[186] = D'2011.09.01 05:34:00'+time_offset*3600;
   aPriceOpen[186] = 0.97758;
   aDateClose[186] = D'2011.09.04 22:45:02'+time_offset*3600;
   aPriceClose[186] = 0.9867;

   // ========== 187 ===== 654 ==========
   aType[187] = OP_SELL;
   aSymbol[187] = "EURUSD";
   aLots[187] = 1.0;
   aDateOpen[187] = D'2011.09.01 07:16:58'+time_offset*3600;
   aPriceOpen[187] = 1.43236;
   aDateClose[187] = D'2011.09.01 22:39:28'+time_offset*3600;
   aPriceClose[187] = 1.42623;

   // ========== 188 ===== 653 ==========
   aType[188] = OP_SELL;
   aSymbol[188] = "GBPUSD";
   aLots[188] = 1.0;
   aDateOpen[188] = D'2011.09.02 12:23:42'+time_offset*3600;
   aPriceOpen[188] = 1.62177;
   aDateClose[188] = D'2011.09.02 13:23:22'+time_offset*3600;
   aPriceClose[188] = 1.61987;

   // ========== 189 ===== 651 ==========
   aType[189] = OP_SELL;
   aSymbol[189] = "USDCHF";
   aLots[189] = 1.0;
   aDateOpen[189] = D'2011.09.02 15:17:33'+time_offset*3600;
   aPriceOpen[189] = 0.785;
   aDateClose[189] = D'2011.09.05 09:17:11'+time_offset*3600;
   aPriceClose[189] = 0.78777;

   // ========== 190 ===== 648 ==========
   aType[190] = OP_BUY;
   aSymbol[190] = "AUDUSD";
   aLots[190] = 1.0;
   aDateOpen[190] = D'2011.09.05 01:28:26'+time_offset*3600;
   aPriceOpen[190] = 1.05785;
   aDateClose[190] = D'2011.09.06 08:02:40'+time_offset*3600;
   aPriceClose[190] = 1.059;

   // ========== 191 ===== 649 ==========
   aType[191] = OP_BUY;
   aSymbol[191] = "EURUSD";
   aLots[191] = 1.0;
   aDateOpen[191] = D'2011.09.06 04:59:11'+time_offset*3600;
   aPriceOpen[191] = 1.40595;
   aDateClose[191] = D'2011.09.06 08:02:11'+time_offset*3600;
   aPriceClose[191] = 1.413;

   // ========== 192 ===== 650 ==========
   aType[192] = OP_BUY;
   aSymbol[192] = "USDCHF";
   aLots[192] = 1.0;
   aDateOpen[192] = D'2011.09.06 07:04:34'+time_offset*3600;
   aPriceOpen[192] = 0.79255;
   aDateClose[192] = D'2011.09.06 07:18:55'+time_offset*3600;
   aPriceClose[192] = 0.79302;

   // ========== 193 ===== 647 ==========
   aType[193] = OP_SELL;
   aSymbol[193] = "EURUSD";
   aLots[193] = 1.0;
   aDateOpen[193] = D'2011.09.06 08:02:27'+time_offset*3600;
   aPriceOpen[193] = 1.4179;
   aDateClose[193] = D'2011.09.06 08:02:46'+time_offset*3600;
   aPriceClose[193] = 1.4279;

   // ========== 194 ===== 646 ==========
   aType[194] = OP_SELL;
   aSymbol[194] = "USDCHF";
   aLots[194] = 1.0;
   aDateOpen[194] = D'2011.09.06 08:13:07'+time_offset*3600;
   aPriceOpen[194] = 0.85063;
   aDateClose[194] = D'2011.09.06 09:16:29'+time_offset*3600;
   aPriceClose[194] = 0.84509;

   // ========== 195 ===== 645 ==========
   aType[195] = OP_SELL;
   aSymbol[195] = "EURUSD";
   aLots[195] = 1.0;
   aDateOpen[195] = D'2011.09.06 09:32:54'+time_offset*3600;
   aPriceOpen[195] = 1.4211;
   aDateClose[195] = D'2011.09.06 10:12:05'+time_offset*3600;
   aPriceClose[195] = 1.4175;

   // ========== 196 ===== 644 ==========
   aType[196] = OP_BUY;
   aSymbol[196] = "EURUSD";
   aLots[196] = 1.0;
   aDateOpen[196] = D'2011.09.06 11:49:25'+time_offset*3600;
   aPriceOpen[196] = 1.41331;
   aDateClose[196] = D'2011.09.06 22:27:34'+time_offset*3600;
   aPriceClose[196] = 1.40011;

   // ========== 197 ===== 643 ==========
   aType[197] = OP_SELL;
   aSymbol[197] = "USDCHF";
   aLots[197] = 1.0;
   aDateOpen[197] = D'2011.09.06 12:14:10'+time_offset*3600;
   aPriceOpen[197] = 0.85342;
   aDateClose[197] = D'2011.09.07 06:43:13'+time_offset*3600;
   aPriceClose[197] = 0.85644;

   // ========== 198 ===== 640 ==========
   aType[198] = OP_SELL;
   aSymbol[198] = "EURUSD";
   aLots[198] = 1.0;
   aDateOpen[198] = D'2011.09.07 06:04:52'+time_offset*3600;
   aPriceOpen[198] = 1.40595;
   aDateClose[198] = D'2011.09.07 08:49:21'+time_offset*3600;
   aPriceClose[198] = 1.40888;

   // ========== 199 ===== 641 ==========
   aType[199] = OP_SELL;
   aSymbol[199] = "EURUSD";
   aLots[199] = 1.0;
   aDateOpen[199] = D'2011.09.07 06:38:15'+time_offset*3600;
   aPriceOpen[199] = 1.40716;
   aDateClose[199] = D'2011.09.07 08:49:17'+time_offset*3600;
   aPriceClose[199] = 1.4088;

   // ========== 200 ===== 642 ==========
   aType[200] = OP_SELL;
   aSymbol[200] = "GBPUSD";
   aLots[200] = 1.0;
   aDateOpen[200] = D'2011.09.07 08:07:51'+time_offset*3600;
   aPriceOpen[200] = 1.60147;
   aDateClose[200] = D'2011.09.07 08:48:57'+time_offset*3600;
   aPriceClose[200] = 1.59955;

   // ========== 201 ===== 639 ==========
   aType[201] = OP_SELL;
   aSymbol[201] = "GBPUSD";
   aLots[201] = 1.0;
   aDateOpen[201] = D'2011.09.07 09:08:34'+time_offset*3600;
   aPriceOpen[201] = 1.6009;
   aDateClose[201] = D'2011.09.07 10:28:17'+time_offset*3600;
   aPriceClose[201] = 1.59747;

   // ========== 202 ===== 638 ==========
   aType[202] = OP_SELL;
   aSymbol[202] = "EURUSD";
   aLots[202] = 1.0;
   aDateOpen[202] = D'2011.09.07 09:08:53'+time_offset*3600;
   aPriceOpen[202] = 1.41001;
   aDateClose[202] = D'2011.09.07 10:43:01'+time_offset*3600;
   aPriceClose[202] = 1.40444;

   // ========== 203 ===== 637 ==========
   aType[203] = OP_BUY;
   aSymbol[203] = "USDCAD";
   aLots[203] = 1.0;
   aDateOpen[203] = D'2011.09.07 11:50:38'+time_offset*3600;
   aPriceOpen[203] = 0.98642;
   aDateClose[203] = D'2011.09.07 15:58:48'+time_offset*3600;
   aPriceClose[203] = 0.98804;

   // ========== 204 ===== 634 ==========
   aType[204] = OP_BUY;
   aSymbol[204] = "USDCAD";
   aLots[204] = 1.0;
   aDateOpen[204] = D'2011.09.08 08:19:53'+time_offset*3600;
   aPriceOpen[204] = 0.98523;
   aDateClose[204] = D'2011.09.08 14:15:00'+time_offset*3600;
   aPriceClose[204] = 0.9847;

   // ========== 205 ===== 636 ==========
   aType[205] = OP_SELL;
   aSymbol[205] = "USDCHF";
   aLots[205] = 1.0;
   aDateOpen[205] = D'2011.09.08 09:23:25'+time_offset*3600;
   aPriceOpen[205] = 0.86253;
   aDateClose[205] = D'2011.09.08 11:05:03'+time_offset*3600;
   aPriceClose[205] = 0.86412;

   // ========== 206 ===== 635 ==========
   aType[206] = OP_SELL;
   aSymbol[206] = "EURUSD";
   aLots[206] = 1.0;
   aDateOpen[206] = D'2011.09.08 12:35:08'+time_offset*3600;
   aPriceOpen[206] = 1.40056;
   aDateClose[206] = D'2011.09.08 13:20:02'+time_offset*3600;
   aPriceClose[206] = 1.39956;

   // ========== 207 ===== 633 ==========
   aType[207] = OP_BUY;
   aSymbol[207] = "GBPUSD";
   aLots[207] = 1.0;
   aDateOpen[207] = D'2011.09.08 19:16:14'+time_offset*3600;
   aPriceOpen[207] = 1.59538;
   aDateClose[207] = D'2011.09.09 06:40:10'+time_offset*3600;
   aPriceClose[207] = 1.59574;

   // ========== 208 ===== 632 ==========
   aType[208] = OP_SELL;
   aSymbol[208] = "USDJPY";
   aLots[208] = 1.0;
   aDateOpen[208] = D'2011.09.09 05:31:37'+time_offset*3600;
   aPriceOpen[208] = 77.465;
   aDateClose[208] = D'2011.09.09 18:42:03'+time_offset*3600;
   aPriceClose[208] = 77.431;

   // ========== 209 ===== 630 ==========
   aType[209] = OP_SELL;
   aSymbol[209] = "USDCHF";
   aLots[209] = 1.0;
   aDateOpen[209] = D'2011.09.11 23:00:02'+time_offset*3600;
   aPriceOpen[209] = 0.88673;
   aDateClose[209] = D'2011.09.12 09:58:51'+time_offset*3600;
   aPriceClose[209] = 0.8842;

   // ========== 210 ===== 631 ==========
   aType[210] = OP_BUY;
   aSymbol[210] = "EURUSD";
   aLots[210] = 1.0;
   aDateOpen[210] = D'2011.09.12 02:19:19'+time_offset*3600;
   aPriceOpen[210] = 1.35867;
   aDateClose[210] = D'2011.09.12 09:49:10'+time_offset*3600;
   aPriceClose[210] = 1.364;

   // ========== 211 ===== 628 ==========
   aType[211] = OP_BUY;
   aSymbol[211] = "USDCHF";
   aLots[211] = 1.0;
   aDateOpen[211] = D'2011.09.12 11:48:58'+time_offset*3600;
   aPriceOpen[211] = 0.88254;
   aDateClose[211] = D'2011.09.12 15:03:04'+time_offset*3600;
   aPriceClose[211] = 0.88459;

   // ========== 212 ===== 629 ==========
   aType[212] = OP_SELL;
   aSymbol[212] = "AUDUSD";
   aLots[212] = 1.0;
   aDateOpen[212] = D'2011.09.12 14:08:12'+time_offset*3600;
   aPriceOpen[212] = 1.03776;
   aDateClose[212] = D'2011.09.12 15:02:02'+time_offset*3600;
   aPriceClose[212] = 1.03307;

   // ========== 213 ===== 627 ==========
   aType[213] = OP_BUY;
   aSymbol[213] = "USDCAD";
   aLots[213] = 1.0;
   aDateOpen[213] = D'2011.09.13 02:43:49'+time_offset*3600;
   aPriceOpen[213] = 0.99186;
   aDateClose[213] = D'2011.09.13 08:11:33'+time_offset*3600;
   aPriceClose[213] = 0.996;

   // ========== 214 ===== 626 ==========
   aType[214] = OP_SELL;
   aSymbol[214] = "GBPUSD";
   aLots[214] = 1.0;
   aDateOpen[214] = D'2011.09.14 11:16:36'+time_offset*3600;
   aPriceOpen[214] = 1.58024;
   aDateClose[214] = D'2011.09.14 14:11:28'+time_offset*3600;
   aPriceClose[214] = 1.57872;

   // ========== 215 ===== 625 ==========
   aType[215] = OP_SELL;
   aSymbol[215] = "EURUSD";
   aLots[215] = 1.0;
   aDateOpen[215] = D'2011.09.15 10:00:41'+time_offset*3600;
   aPriceOpen[215] = 1.38097;
   aDateClose[215] = D'2011.09.15 12:37:45'+time_offset*3600;
   aPriceClose[215] = 1.37962;

   // ========== 216 ===== 624 ==========
   aType[216] = OP_BUY;
   aSymbol[216] = "USDCHF";
   aLots[216] = 1.0;
   aDateOpen[216] = D'2011.09.15 10:39:44'+time_offset*3600;
   aPriceOpen[216] = 0.87294;
   aDateClose[216] = D'2011.09.15 13:07:22'+time_offset*3600;
   aPriceClose[216] = 0.86936;

   // ========== 217 ===== 623 ==========
   aType[217] = OP_BUY;
   aSymbol[217] = "EURUSD";
   aLots[217] = 1.0;
   aDateOpen[217] = D'2011.09.15 13:06:25'+time_offset*3600;
   aPriceOpen[217] = 1.385;
   aDateClose[217] = D'2011.09.15 13:10:42'+time_offset*3600;
   aPriceClose[217] = 1.38595;

   // ========== 218 ===== 622 ==========
   aType[218] = OP_SELL;
   aSymbol[218] = "USDCHF";
   aLots[218] = 1.0;
   aDateOpen[218] = D'2011.09.15 13:11:22'+time_offset*3600;
   aPriceOpen[218] = 0.86978;
   aDateClose[218] = D'2011.09.15 13:28:40'+time_offset*3600;
   aPriceClose[218] = 0.86864;

   // ========== 219 ===== 621 ==========
   aType[219] = OP_SELL;
   aSymbol[219] = "EURUSD";
   aLots[219] = 1.0;
   aDateOpen[219] = D'2011.09.15 13:30:17'+time_offset*3600;
   aPriceOpen[219] = 1.38852;
   aDateClose[219] = D'2011.09.15 21:57:16'+time_offset*3600;
   aPriceClose[219] = 1.38838;

   // ========== 220 ===== 620 ==========
   aType[220] = OP_SELL;
   aSymbol[220] = "USDJPY";
   aLots[220] = 1.0;
   aDateOpen[220] = D'2011.09.15 15:50:53'+time_offset*3600;
   aPriceOpen[220] = 76.701;
   aDateClose[220] = D'2011.09.16 14:36:15'+time_offset*3600;
   aPriceClose[220] = 76.964;

   // ========== 221 ===== 618 ==========
   aType[221] = OP_SELL;
   aSymbol[221] = "AUDUSD";
   aLots[221] = 1.0;
   aDateOpen[221] = D'2011.09.16 13:03:42'+time_offset*3600;
   aPriceOpen[221] = 1.03494;
   aDateClose[221] = D'2011.09.18 21:20:04'+time_offset*3600;
   aPriceClose[221] = 1.0299;

   // ========== 222 ===== 619 ==========
   aType[222] = OP_SELL;
   aSymbol[222] = "AUDUSD";
   aLots[222] = 1.0;
   aDateOpen[222] = D'2011.09.16 14:07:01'+time_offset*3600;
   aPriceOpen[222] = 1.03746;
   aDateClose[222] = D'2011.09.16 18:32:22'+time_offset*3600;
   aPriceClose[222] = 1.03658;

   // ========== 223 ===== 617 ==========
   aType[223] = OP_BUY;
   aSymbol[223] = "GBPUSD";
   aLots[223] = 1.0;
   aDateOpen[223] = D'2011.09.20 09:54:51'+time_offset*3600;
   aPriceOpen[223] = 1.57279;
   aDateClose[223] = D'2011.09.20 11:25:45'+time_offset*3600;
   aPriceClose[223] = 1.56866;

   // ========== 224 ===== 616 ==========
   aType[224] = OP_BUY;
   aSymbol[224] = "USDCHF";
   aLots[224] = 1.0;
   aDateOpen[224] = D'2011.09.20 13:01:50'+time_offset*3600;
   aPriceOpen[224] = 0.88919;
   aDateClose[224] = D'2011.09.20 15:58:01'+time_offset*3600;
   aPriceClose[224] = 0.88712;

   // ========== 225 ===== 615 ==========
   aType[225] = OP_SELL;
   aSymbol[225] = "GBPUSD";
   aLots[225] = 1.0;
   aDateOpen[225] = D'2011.09.21 01:29:22'+time_offset*3600;
   aPriceOpen[225] = 1.57347;
   aDateClose[225] = D'2011.09.21 04:48:19'+time_offset*3600;
   aPriceClose[225] = 1.5731;

   // ========== 226 ===== 613 ==========
   aType[226] = OP_BUY;
   aSymbol[226] = "GBPUSD";
   aLots[226] = 1.0;
   aDateOpen[226] = D'2011.09.22 08:40:24'+time_offset*3600;
   aPriceOpen[226] = 1.54505;
   aDateClose[226] = D'2011.09.23 00:02:18'+time_offset*3600;
   aPriceClose[226] = 1.53968;

   // ========== 227 ===== 614 ==========
   aType[227] = OP_SELL;
   aSymbol[227] = "EURUSD";
   aLots[227] = 1.0;
   aDateOpen[227] = D'2011.09.22 17:34:59'+time_offset*3600;
   aPriceOpen[227] = 1.34776;
   aDateClose[227] = D'2011.09.22 19:25:21'+time_offset*3600;
   aPriceClose[227] = 1.34401;

   // ========== 228 ===== 612 ==========
   aType[228] = OP_SELL;
   aSymbol[228] = "AUDUSD";
   aLots[228] = 1.0;
   aDateOpen[228] = D'2011.09.22 23:50:11'+time_offset*3600;
   aPriceOpen[228] = 0.98046;
   aDateClose[228] = D'2011.09.23 01:55:39'+time_offset*3600;
   aPriceClose[228] = 0.97748;

   // ========== 229 ===== 610 ==========
   aType[229] = OP_SELL;
   aSymbol[229] = "GBPUSD";
   aLots[229] = 1.0;
   aDateOpen[229] = D'2011.09.23 00:15:08'+time_offset*3600;
   aPriceOpen[229] = 1.5423;
   aDateClose[229] = D'2011.09.23 05:48:56'+time_offset*3600;
   aPriceClose[229] = 1.53925;

   // ========== 230 ===== 611 ==========
   aType[230] = OP_BUY;
   aSymbol[230] = "USDCAD";
   aLots[230] = 1.0;
   aDateOpen[230] = D'2011.09.23 00:21:37'+time_offset*3600;
   aPriceOpen[230] = 1.02284;
   aDateClose[230] = D'2011.09.23 02:10:50'+time_offset*3600;
   aPriceClose[230] = 1.02723;

   // ========== 231 ===== 609 ==========
   aType[231] = OP_SELL;
   aSymbol[231] = "GBPUSD";
   aLots[231] = 1.0;
   aDateOpen[231] = D'2011.09.23 07:05:37'+time_offset*3600;
   aPriceOpen[231] = 1.54268;
   aDateClose[231] = D'2011.09.23 12:12:00'+time_offset*3600;
   aPriceClose[231] = 1.5407;

   // ========== 232 ===== 608 ==========
   aType[232] = OP_SELL;
   aSymbol[232] = "EURUSD";
   aLots[232] = 1.0;
   aDateOpen[232] = D'2011.09.26 08:55:30'+time_offset*3600;
   aPriceOpen[232] = 1.34569;
   aDateClose[232] = D'2011.09.26 09:41:24'+time_offset*3600;
   aPriceClose[232] = 1.34551;

   // ========== 233 ===== 607 ==========
   aType[233] = OP_SELL;
   aSymbol[233] = "AUDUSD";
   aLots[233] = 1.0;
   aDateOpen[233] = D'2011.09.26 09:11:39'+time_offset*3600;
   aPriceOpen[233] = 0.97592;
   aDateClose[233] = D'2011.09.26 14:01:37'+time_offset*3600;
   aPriceClose[233] = 0.9723;

   // ========== 234 ===== 606 ==========
   aType[234] = OP_SELL;
   aSymbol[234] = "GBPUSD";
   aLots[234] = 1.0;
   aDateOpen[234] = D'2011.09.26 10:56:45'+time_offset*3600;
   aPriceOpen[234] = 1.55191;
   aDateClose[234] = D'2011.09.26 15:06:33'+time_offset*3600;
   aPriceClose[234] = 1.557;

   // ========== 235 ===== 605 ==========
   aType[235] = OP_SELL;
   aSymbol[235] = "GBPUSD";
   aLots[235] = 1.0;
   aDateOpen[235] = D'2011.09.27 02:09:47'+time_offset*3600;
   aPriceOpen[235] = 1.55726;
   aDateClose[235] = D'2011.09.27 08:53:22'+time_offset*3600;
   aPriceClose[235] = 1.55415;

   // ========== 236 ===== 603 ==========
   aType[236] = OP_SELL;
   aSymbol[236] = "AUDUSD";
   aLots[236] = 1.0;
   aDateOpen[236] = D'2011.09.27 11:26:28'+time_offset*3600;
   aPriceOpen[236] = 0.99078;
   aDateClose[236] = D'2011.09.27 21:42:12'+time_offset*3600;
   aPriceClose[236] = 0.9914;

   // ========== 237 ===== 604 ==========
   aType[237] = OP_BUY;
   aSymbol[237] = "GBPUSD";
   aLots[237] = 1.0;
   aDateOpen[237] = D'2011.09.27 11:41:14'+time_offset*3600;
   aPriceOpen[237] = 1.56287;
   aDateClose[237] = D'2011.09.27 13:00:36'+time_offset*3600;
   aPriceClose[237] = 1.56192;

   // ========== 238 ===== 602 ==========
   aType[238] = OP_SELL;
   aSymbol[238] = "AUDUSD";
   aLots[238] = 1.0;
   aDateOpen[238] = D'2011.09.29 07:20:10'+time_offset*3600;
   aPriceOpen[238] = 0.98279;
   aDateClose[238] = D'2011.09.29 11:42:02'+time_offset*3600;
   aPriceClose[238] = 0.98204;

   // ========== 239 ===== 601 ==========
   aType[239] = OP_SELL;
   aSymbol[239] = "EURUSD";
   aLots[239] = 1.0;
   aDateOpen[239] = D'2011.09.30 07:10:04'+time_offset*3600;
   aPriceOpen[239] = 1.34938;
   aDateClose[239] = D'2011.09.30 12:17:08'+time_offset*3600;
   aPriceClose[239] = 1.35036;

   // ========== 240 ===== 599 ==========
   aType[240] = OP_SELL;
   aSymbol[240] = "USDCAD";
   aLots[240] = 1.0;
   aDateOpen[240] = D'2011.09.30 13:01:12'+time_offset*3600;
   aPriceOpen[240] = 1.04357;
   aDateClose[240] = D'2011.09.30 14:24:44'+time_offset*3600;
   aPriceClose[240] = 1.0375;

   // ========== 241 ===== 600 ==========
   aType[241] = OP_SELL;
   aSymbol[241] = "GBPUSD";
   aLots[241] = 1.0;
   aDateOpen[241] = D'2011.09.30 13:37:07'+time_offset*3600;
   aPriceOpen[241] = 1.55317;
   aDateClose[241] = D'2011.09.30 14:05:36'+time_offset*3600;
   aPriceClose[241] = 1.55655;

   // ========== 242 ===== 598 ==========
   aType[242] = OP_SELL;
   aSymbol[242] = "EURUSD";
   aLots[242] = 1.0;
   aDateOpen[242] = D'2011.10.03 18:18:53'+time_offset*3600;
   aPriceOpen[242] = 1.32382;
   aDateClose[242] = D'2011.10.03 19:25:48'+time_offset*3600;
   aPriceClose[242] = 1.32075;

   // ========== 243 ===== 597 ==========
   aType[243] = OP_BUY;
   aSymbol[243] = "AUDUSD";
   aLots[243] = 1.0;
   aDateOpen[243] = D'2011.10.04 14:15:07'+time_offset*3600;
   aPriceOpen[243] = 0.9433;
   aDateClose[243] = D'2011.10.04 16:01:26'+time_offset*3600;
   aPriceClose[243] = 0.94561;

   // ========== 244 ===== 595 ==========
   aType[244] = OP_SELL;
   aSymbol[244] = "USDCAD";
   aLots[244] = 1.0;
   aDateOpen[244] = D'2011.10.04 15:17:03'+time_offset*3600;
   aPriceOpen[244] = 1.05981;
   aDateClose[244] = D'2011.10.04 16:51:27'+time_offset*3600;
   aPriceClose[244] = 1.06018;

   // ========== 245 ===== 596 ==========
   aType[245] = OP_SELL;
   aSymbol[245] = "EURUSD";
   aLots[245] = 1.0;
   aDateOpen[245] = D'2011.10.04 16:09:28'+time_offset*3600;
   aPriceOpen[245] = 1.33045;
   aDateClose[245] = D'2011.10.04 16:42:19'+time_offset*3600;
   aPriceClose[245] = 1.32918;

   // ========== 246 ===== 593 ==========
   aType[246] = OP_SELL;
   aSymbol[246] = "USDCHF";
   aLots[246] = 1.0;
   aDateOpen[246] = D'2011.10.05 00:43:30'+time_offset*3600;
   aPriceOpen[246] = 0.91997;
   aDateClose[246] = D'2011.10.05 10:31:42'+time_offset*3600;
   aPriceClose[246] = 0.91834;

   // ========== 247 ===== 594 ==========
   aType[247] = OP_BUY;
   aSymbol[247] = "USDCAD";
   aLots[247] = 1.0;
   aDateOpen[247] = D'2011.10.05 09:06:03'+time_offset*3600;
   aPriceOpen[247] = 1.05312;
   aDateClose[247] = D'2011.10.05 09:30:55'+time_offset*3600;
   aPriceClose[247] = 1.05403;

   // ========== 248 ===== 592 ==========
   aType[248] = OP_SELL;
   aSymbol[248] = "AUDUSD";
   aLots[248] = 1.0;
   aDateOpen[248] = D'2011.10.05 12:13:06'+time_offset*3600;
   aPriceOpen[248] = 0.95802;
   aDateClose[248] = D'2011.10.06 06:17:10'+time_offset*3600;
   aPriceClose[248] = 0.968;

   // ========== 249 ===== 590 ==========
   aType[249] = OP_BUY;
   aSymbol[249] = "USDCAD";
   aLots[249] = 1.0;
   aDateOpen[249] = D'2011.10.05 15:55:14'+time_offset*3600;
   aPriceOpen[249] = 1.046;
   aDateClose[249] = D'2011.10.06 08:15:27'+time_offset*3600;
   aPriceClose[249] = 1.03855;

   // ========== 250 ===== 591 ==========
   aType[250] = OP_BUY;
   aSymbol[250] = "USDCAD";
   aLots[250] = 1.0;
   aDateOpen[250] = D'2011.10.06 07:01:38'+time_offset*3600;
   aPriceOpen[250] = 1.04133;
   aDateClose[250] = D'2011.10.06 08:14:57'+time_offset*3600;
   aPriceClose[250] = 1.03875;

   // ========== 251 ===== 588 ==========
   aType[251] = OP_SELL;
   aSymbol[251] = "USDCHF";
   aLots[251] = 1.0;
   aDateOpen[251] = D'2011.10.06 08:20:34'+time_offset*3600;
   aPriceOpen[251] = 0.92418;
   aDateClose[251] = D'2011.10.06 23:43:41'+time_offset*3600;
   aPriceClose[251] = 0.91968;

   // ========== 252 ===== 589 ==========
   aType[252] = OP_SELL;
   aSymbol[252] = "GBPUSD";
   aLots[252] = 1.0;
   aDateOpen[252] = D'2011.10.06 11:12:52'+time_offset*3600;
   aPriceOpen[252] = 1.52814;
   aDateClose[252] = D'2011.10.06 23:03:29'+time_offset*3600;
   aPriceClose[252] = 1.54328;

   // ========== 253 ===== 582 ==========
   aType[253] = OP_SELL;
   aSymbol[253] = "AUDUSD";
   aLots[253] = 1.0;
   aDateOpen[253] = D'2011.10.07 04:49:34'+time_offset*3600;
   aPriceOpen[253] = 0.97827;
   aDateClose[253] = D'2011.10.07 16:04:30'+time_offset*3600;
   aPriceClose[253] = 0.98302;

   // ========== 254 ===== 587 ==========
   aType[254] = OP_BUY;
   aSymbol[254] = "EURUSD";
   aLots[254] = 1.0;
   aDateOpen[254] = D'2011.10.07 07:22:54'+time_offset*3600;
   aPriceOpen[254] = 1.34636;
   aDateClose[254] = D'2011.10.07 07:49:07'+time_offset*3600;
   aPriceClose[254] = 1.34405;

   // ========== 255 ===== 586 ==========
   aType[255] = OP_BUY;
   aSymbol[255] = "USDCHF";
   aLots[255] = 1.0;
   aDateOpen[255] = D'2011.10.07 13:02:51'+time_offset*3600;
   aPriceOpen[255] = 0.91965;
   aDateClose[255] = D'2011.10.07 14:52:31'+time_offset*3600;
   aPriceClose[255] = 0.9155;

   // ========== 256 ===== 583 ==========
   aType[256] = OP_SELL;
   aSymbol[256] = "USDCHF";
   aLots[256] = 1.0;
   aDateOpen[256] = D'2011.10.07 14:52:48'+time_offset*3600;
   aPriceOpen[256] = 0.91526;
   aDateClose[256] = D'2011.10.07 16:04:08'+time_offset*3600;
   aPriceClose[256] = 0.91834;

   // ========== 257 ===== 584 ==========
   aType[257] = OP_SELL;
   aSymbol[257] = "USDCHF";
   aLots[257] = 1.0;
   aDateOpen[257] = D'2011.10.07 14:57:05'+time_offset*3600;
   aPriceOpen[257] = 0.91523;
   aDateClose[257] = D'2011.10.07 16:03:55'+time_offset*3600;
   aPriceClose[257] = 0.91828;

   // ========== 258 ===== 585 ==========
   aType[258] = OP_SELL;
   aSymbol[258] = "USDCHF";
   aLots[258] = 1.0;
   aDateOpen[258] = D'2011.10.07 14:58:04'+time_offset*3600;
   aPriceOpen[258] = 0.91487;
   aDateClose[258] = D'2011.10.07 16:03:52'+time_offset*3600;
   aPriceClose[258] = 0.91891;

   // ========== 259 ===== 579 ==========
   aType[259] = OP_BUY;
   aSymbol[259] = "USDCHF";
   aLots[259] = 1.0;
   aDateOpen[259] = D'2011.10.07 16:04:44'+time_offset*3600;
   aPriceOpen[259] = 0.91778;
   aDateClose[259] = D'2011.10.07 19:15:39'+time_offset*3600;
   aPriceClose[259] = 0.92721;

   // ========== 260 ===== 578 ==========
   aType[260] = OP_BUY;
   aSymbol[260] = "USDCHF";
   aLots[260] = 1.0;
   aDateOpen[260] = D'2011.10.07 16:05:16'+time_offset*3600;
   aPriceOpen[260] = 0.91786;
   aDateClose[260] = D'2011.10.07 19:59:29'+time_offset*3600;
   aPriceClose[260] = 0.92668;

   // ========== 261 ===== 580 ==========
   aType[261] = OP_BUY;
   aSymbol[261] = "USDCHF";
   aLots[261] = 1.0;
   aDateOpen[261] = D'2011.10.07 16:05:56'+time_offset*3600;
   aPriceOpen[261] = 0.91798;
   aDateClose[261] = D'2011.10.07 18:56:07'+time_offset*3600;
   aPriceClose[261] = 0.92737;

   // ========== 262 ===== 581 ==========
   aType[262] = OP_BUY;
   aSymbol[262] = "USDCHF";
   aLots[262] = 1.0;
   aDateOpen[262] = D'2011.10.07 16:06:46'+time_offset*3600;
   aPriceOpen[262] = 0.9175;
   aDateClose[262] = D'2011.10.07 18:45:49'+time_offset*3600;
   aPriceClose[262] = 0.92661;

   // ========== 263 ===== 575 ==========
   aType[263] = OP_SELL;
   aSymbol[263] = "AUDUSD";
   aLots[263] = 1.0;
   aDateOpen[263] = D'2011.10.10 01:08:54'+time_offset*3600;
   aPriceOpen[263] = 0.98374;
   aDateClose[263] = D'2011.10.11 08:26:29'+time_offset*3600;
   aPriceClose[263] = 0.99345;

   // ========== 264 ===== 576 ==========
   aType[264] = OP_SELL;
   aSymbol[264] = "EURUSD";
   aLots[264] = 1.0;
   aDateOpen[264] = D'2011.10.10 01:37:33'+time_offset*3600;
   aPriceOpen[264] = 1.3459;
   aDateClose[264] = D'2011.10.11 01:02:18'+time_offset*3600;
   aPriceClose[264] = 1.36277;

   // ========== 265 ===== 577 ==========
   aType[265] = OP_SELL;
   aSymbol[265] = "EURUSD";
   aLots[265] = 1.0;
   aDateOpen[265] = D'2011.10.10 14:08:04'+time_offset*3600;
   aPriceOpen[265] = 1.36553;
   aDateClose[265] = D'2011.10.10 22:42:15'+time_offset*3600;
   aPriceClose[265] = 1.36329;

   // ========== 266 ===== 574 ==========
   aType[266] = OP_BUY;
   aSymbol[266] = "EURUSD";
   aLots[266] = 1.0;
   aDateOpen[266] = D'2011.10.11 08:56:08'+time_offset*3600;
   aPriceOpen[266] = 1.35995;
   aDateClose[266] = D'2011.10.11 09:17:24'+time_offset*3600;
   aPriceClose[266] = 1.3599;

   // ========== 267 ===== 573 ==========
   aType[267] = OP_BUY;
   aSymbol[267] = "EURUSD";
   aLots[267] = 1.0;
   aDateOpen[267] = D'2011.10.11 10:28:46'+time_offset*3600;
   aPriceOpen[267] = 1.35975;
   aDateClose[267] = D'2011.10.11 15:58:40'+time_offset*3600;
   aPriceClose[267] = 1.36585;

   // ========== 268 ===== 571 ==========
   aType[268] = OP_SELL;
   aSymbol[268] = "USDCHF";
   aLots[268] = 1.0;
   aDateOpen[268] = D'2011.10.11 10:31:22'+time_offset*3600;
   aPriceOpen[268] = 0.91091;
   aDateClose[268] = D'2011.10.12 08:43:44'+time_offset*3600;
   aPriceClose[268] = 0.90124;

   // ========== 269 ===== 572 ==========
   aType[269] = OP_BUY;
   aSymbol[269] = "EURUSD";
   aLots[269] = 1.0;
   aDateOpen[269] = D'2011.10.12 08:15:59'+time_offset*3600;
   aPriceOpen[269] = 1.37282;
   aDateClose[269] = D'2011.10.12 08:21:18'+time_offset*3600;
   aPriceClose[269] = 1.3738;

   // ========== 270 ===== 565 ==========
   aType[270] = OP_SELL;
   aSymbol[270] = "AUDUSD";
   aLots[270] = 1.0;
   aDateOpen[270] = D'2011.10.12 13:01:24'+time_offset*3600;
   aPriceOpen[270] = 1.01334;
   aDateClose[270] = D'2011.10.13 06:00:14'+time_offset*3600;
   aPriceClose[270] = 1.0188;

   // ========== 271 ===== 570 ==========
   aType[271] = OP_BUY;
   aSymbol[271] = "USDJPY";
   aLots[271] = 1.0;
   aDateOpen[271] = D'2011.10.12 13:09:58'+time_offset*3600;
   aPriceOpen[271] = 77.314;
   aDateClose[271] = D'2011.10.12 18:45:35'+time_offset*3600;
   aPriceClose[271] = 77.335;

   // ========== 272 ===== 569 ==========
   aType[272] = OP_SELL;
   aSymbol[272] = "AUDUSD";
   aLots[272] = 1.0;
   aDateOpen[272] = D'2011.10.12 14:28:14'+time_offset*3600;
   aPriceOpen[272] = 1.01651;
   aDateClose[272] = D'2011.10.12 21:47:11'+time_offset*3600;
   aPriceClose[272] = 1.0133;

   // ========== 273 ===== 567 ==========
   aType[273] = OP_SELL;
   aSymbol[273] = "AUDUSD";
   aLots[273] = 1.0;
   aDateOpen[273] = D'2011.10.12 17:06:21'+time_offset*3600;
   aPriceOpen[273] = 1.01963;
   aDateClose[273] = D'2011.10.12 22:07:57'+time_offset*3600;
   aPriceClose[273] = 1.01458;

   // ========== 274 ===== 568 ==========
   aType[274] = OP_SELL;
   aSymbol[274] = "AUDUSD";
   aLots[274] = 1.0;
   aDateOpen[274] = D'2011.10.12 18:45:43'+time_offset*3600;
   aPriceOpen[274] = 1.01947;
   aDateClose[274] = D'2011.10.12 21:48:59'+time_offset*3600;
   aPriceClose[274] = 1.013;

   // ========== 275 ===== 566 ==========
   aType[275] = OP_SELL;
   aSymbol[275] = "AUDUSD";
   aLots[275] = 1.0;
   aDateOpen[275] = D'2011.10.13 00:31:20'+time_offset*3600;
   aPriceOpen[275] = 1.02241;
   aDateClose[275] = D'2011.10.13 01:10:46'+time_offset*3600;
   aPriceClose[275] = 1.01933;

   // ========== 276 ===== 564 ==========
   aType[276] = OP_BUY;
   aSymbol[276] = "EURUSD";
   aLots[276] = 1.0;
   aDateOpen[276] = D'2011.10.13 07:27:46'+time_offset*3600;
   aPriceOpen[276] = 1.38193;
   aDateClose[276] = D'2011.10.13 08:05:47'+time_offset*3600;
   aPriceClose[276] = 1.37923;

   // ========== 277 ===== 560 ==========
   aType[277] = OP_SELL;
   aSymbol[277] = "AUDUSD";
   aLots[277] = 1.0;
   aDateOpen[277] = D'2011.10.13 08:29:46'+time_offset*3600;
   aPriceOpen[277] = 1.01674;
   aDateClose[277] = D'2011.10.13 10:22:56'+time_offset*3600;
   aPriceClose[277] = 1.01468;

   // ========== 278 ===== 562 ==========
   aType[278] = OP_SELL;
   aSymbol[278] = "AUDUSD";
   aLots[278] = 1.0;
   aDateOpen[278] = D'2011.10.13 08:31:11'+time_offset*3600;
   aPriceOpen[278] = 1.01737;
   aDateClose[278] = D'2011.10.13 09:04:18'+time_offset*3600;
   aPriceClose[278] = 1.01671;

   // ========== 279 ===== 563 ==========
   aType[279] = OP_SELL;
   aSymbol[279] = "AUDUSD";
   aLots[279] = 1.0;
   aDateOpen[279] = D'2011.10.13 08:32:08'+time_offset*3600;
   aPriceOpen[279] = 1.01736;
   aDateClose[279] = D'2011.10.13 08:40:24'+time_offset*3600;
   aPriceClose[279] = 1.01433;

   // ========== 280 ===== 556 ==========
   aType[280] = OP_SELL;
   aSymbol[280] = "USDJPY";
   aLots[280] = 1.0;
   aDateOpen[280] = D'2011.10.13 08:57:15'+time_offset*3600;
   aPriceOpen[280] = 76.799;
   aDateClose[280] = D'2011.10.14 00:43:53'+time_offset*3600;
   aPriceClose[280] = 76.963;

   // ========== 281 ===== 557 ==========
   aType[281] = OP_SELL;
   aSymbol[281] = "USDJPY";
   aLots[281] = 1.0;
   aDateOpen[281] = D'2011.10.13 09:00:38'+time_offset*3600;
   aPriceOpen[281] = 76.824;
   aDateClose[281] = D'2011.10.13 15:59:16'+time_offset*3600;
   aPriceClose[281] = 76.89;

   // ========== 282 ===== 561 ==========
   aType[282] = OP_SELL;
   aSymbol[282] = "EURUSD";
   aLots[282] = 1.0;
   aDateOpen[282] = D'2011.10.13 09:34:00'+time_offset*3600;
   aPriceOpen[282] = 1.37345;
   aDateClose[282] = D'2011.10.13 10:06:28'+time_offset*3600;
   aPriceClose[282] = 1.37211;

   // ========== 283 ===== 558 ==========
   aType[283] = OP_SELL;
   aSymbol[283] = "USDCHF";
   aLots[283] = 1.0;
   aDateOpen[283] = D'2011.10.13 13:28:57'+time_offset*3600;
   aPriceOpen[283] = 0.90023;
   aDateClose[283] = D'2011.10.13 15:40:38'+time_offset*3600;
   aPriceClose[283] = 0.9005;

   // ========== 284 ===== 559 ==========
   aType[284] = OP_SELL;
   aSymbol[284] = "USDCHF";
   aLots[284] = 1.0;
   aDateOpen[284] = D'2011.10.13 13:35:31'+time_offset*3600;
   aPriceOpen[284] = 0.901;
   aDateClose[284] = D'2011.10.13 15:25:18'+time_offset*3600;
   aPriceClose[284] = 0.90014;

   // ========== 285 ===== 554 ==========
   aType[285] = OP_BUY;
   aSymbol[285] = "USDCAD";
   aLots[285] = 1.0;
   aDateOpen[285] = D'2011.10.14 04:27:28'+time_offset*3600;
   aPriceOpen[285] = 1.02152;
   aDateClose[285] = D'2011.10.14 08:33:11'+time_offset*3600;
   aPriceClose[285] = 1.01732;

   // ========== 286 ===== 555 ==========
   aType[286] = OP_SELL;
   aSymbol[286] = "EURUSD";
   aLots[286] = 1.0;
   aDateOpen[286] = D'2011.10.14 05:57:31'+time_offset*3600;
   aPriceOpen[286] = 1.3785;
   aDateClose[286] = D'2011.10.14 08:32:56'+time_offset*3600;
   aPriceClose[286] = 1.38082;

   // ========== 287 ===== 550 ==========
   aType[287] = OP_BUY;
   aSymbol[287] = "USDCAD";
   aLots[287] = 1.0;
   aDateOpen[287] = D'2011.10.14 08:53:53'+time_offset*3600;
   aPriceOpen[287] = 1.01779;
   aDateClose[287] = D'2011.10.14 12:37:58'+time_offset*3600;
   aPriceClose[287] = 1.01159;

   // ========== 288 ===== 553 ==========
   aType[288] = OP_BUY;
   aSymbol[288] = "USDCAD";
   aLots[288] = 1.0;
   aDateOpen[288] = D'2011.10.14 09:01:15'+time_offset*3600;
   aPriceOpen[288] = 1.01824;
   aDateClose[288] = D'2011.10.14 12:30:00'+time_offset*3600;
   aPriceClose[288] = 1.013;

   // ========== 289 ===== 552 ==========
   aType[289] = OP_BUY;
   aSymbol[289] = "USDCAD";
   aLots[289] = 1.0;
   aDateOpen[289] = D'2011.10.14 09:37:04'+time_offset*3600;
   aPriceOpen[289] = 1.01686;
   aDateClose[289] = D'2011.10.14 12:30:00'+time_offset*3600;
   aPriceClose[289] = 1.013;

   // ========== 290 ===== 551 ==========
   aType[290] = OP_BUY;
   aSymbol[290] = "USDCAD";
   aLots[290] = 1.0;
   aDateOpen[290] = D'2011.10.14 09:48:30'+time_offset*3600;
   aPriceOpen[290] = 1.01663;
   aDateClose[290] = D'2011.10.14 12:30:00'+time_offset*3600;
   aPriceClose[290] = 1.013;

   // ========== 291 ===== 549 ==========
   aType[291] = OP_BUY;
   aSymbol[291] = "EURUSD";
   aLots[291] = 1.0;
   aDateOpen[291] = D'2011.10.14 13:15:06'+time_offset*3600;
   aPriceOpen[291] = 1.38507;
   aDateClose[291] = D'2011.10.14 14:31:03'+time_offset*3600;
   aPriceClose[291] = 1.38727;

   // ========== 292 ===== 548 ==========
   aType[292] = OP_BUY;
   aSymbol[292] = "USDCAD";
   aLots[292] = 1.0;
   aDateOpen[292] = D'2011.10.17 05:55:11'+time_offset*3600;
   aPriceOpen[292] = 1.00856;
   aDateClose[292] = D'2011.10.17 11:19:34'+time_offset*3600;
   aPriceClose[292] = 1.01269;

   // ========== 293 ===== 544 ==========
   aType[293] = OP_BUY;
   aSymbol[293] = "USDCAD";
   aLots[293] = 1.0;
   aDateOpen[293] = D'2011.10.18 21:05:51'+time_offset*3600;
   aPriceOpen[293] = 1.01475;
   aDateClose[293] = D'2011.10.20 01:39:19'+time_offset*3600;
   aPriceClose[293] = 1.02042;

   // ========== 294 ===== 547 ==========
   aType[294] = OP_BUY;
   aSymbol[294] = "USDCAD";
   aLots[294] = 1.0;
   aDateOpen[294] = D'2011.10.19 01:55:57'+time_offset*3600;
   aPriceOpen[294] = 1.01426;
   aDateClose[294] = D'2011.10.19 18:34:04'+time_offset*3600;
   aPriceClose[294] = 1.01842;

   // ========== 295 ===== 545 ==========
   aType[295] = OP_BUY;
   aSymbol[295] = "USDCAD";
   aLots[295] = 1.0;
   aDateOpen[295] = D'2011.10.19 02:43:07'+time_offset*3600;
   aPriceOpen[295] = 1.01328;
   aDateClose[295] = D'2011.10.20 01:38:55'+time_offset*3600;
   aPriceClose[295] = 1.02048;

   // ========== 296 ===== 546 ==========
   aType[296] = OP_BUY;
   aSymbol[296] = "USDCAD";
   aLots[296] = 1.0;
   aDateOpen[296] = D'2011.10.19 03:15:44'+time_offset*3600;
   aPriceOpen[296] = 1.0124;
   aDateClose[296] = D'2011.10.20 01:12:03'+time_offset*3600;
   aPriceClose[296] = 1.02025;

   // ========== 297 ===== 543 ==========
   aType[297] = OP_SELL;
   aSymbol[297] = "USDCHF";
   aLots[297] = 1.0;
   aDateOpen[297] = D'2011.10.20 06:12:31'+time_offset*3600;
   aPriceOpen[297] = 0.90777;
   aDateClose[297] = D'2011.10.20 07:15:37'+time_offset*3600;
   aPriceClose[297] = 0.90553;

   // ========== 298 ===== 542 ==========
   aType[298] = OP_BUY;
   aSymbol[298] = "USDCHF";
   aLots[298] = 1.0;
   aDateOpen[298] = D'2011.10.20 10:28:48'+time_offset*3600;
   aPriceOpen[298] = 0.89434;
   aDateClose[298] = D'2011.10.20 10:36:08'+time_offset*3600;
   aPriceClose[298] = 0.895;

   // ========== 299 ===== 541 ==========
   aType[299] = OP_SELL;
   aSymbol[299] = "USDCHF";
   aLots[299] = 1.0;
   aDateOpen[299] = D'2011.10.21 04:00:11'+time_offset*3600;
   aPriceOpen[299] = 0.88912;
   aDateClose[299] = D'2011.10.21 05:38:50'+time_offset*3600;
   aPriceClose[299] = 0.88896;

   // ========== 300 ===== 538 ==========
   aType[300] = OP_SELL;
   aSymbol[300] = "USDJPY";
   aLots[300] = 1.0;
   aDateOpen[300] = D'2011.10.21 12:55:08'+time_offset*3600;
   aPriceOpen[300] = 76.437;
   aDateClose[300] = D'2011.10.24 20:51:59'+time_offset*3600;
   aPriceClose[300] = 76.099;

   // ========== 301 ===== 536 ==========
   aType[301] = OP_SELL;
   aSymbol[301] = "USDJPY";
   aLots[301] = 1.0;
   aDateOpen[301] = D'2011.10.21 13:25:38'+time_offset*3600;
   aPriceOpen[301] = 76.099;
   aDateClose[301] = D'2011.10.25 19:47:49'+time_offset*3600;
   aPriceClose[301] = 75.967;

   // ========== 302 ===== 540 ==========
   aType[302] = OP_BUY;
   aSymbol[302] = "GBPUSD";
   aLots[302] = 1.0;
   aDateOpen[302] = D'2011.10.24 10:39:24'+time_offset*3600;
   aPriceOpen[302] = 1.59253;
   aDateClose[302] = D'2011.10.24 10:54:56'+time_offset*3600;
   aPriceClose[302] = 1.59243;

   // ========== 303 ===== 539 ==========
   aType[303] = OP_BUY;
   aSymbol[303] = "GBPUSD";
   aLots[303] = 1.0;
   aDateOpen[303] = D'2011.10.24 13:21:40'+time_offset*3600;
   aPriceOpen[303] = 1.5905;
   aDateClose[303] = D'2011.10.24 15:44:05'+time_offset*3600;
   aPriceClose[303] = 1.599;

   // ========== 304 ===== 537 ==========
   aType[304] = OP_SELL;
   aSymbol[304] = "EURUSD";
   aLots[304] = 1.0;
   aDateOpen[304] = D'2011.10.25 12:03:39'+time_offset*3600;
   aPriceOpen[304] = 1.3913;
   aDateClose[304] = D'2011.10.25 12:26:54'+time_offset*3600;
   aPriceClose[304] = 1.39159;

   // ========== 305 ===== 535 ==========
   aType[305] = OP_BUY;
   aSymbol[305] = "USDCHF";
   aLots[305] = 1.0;
   aDateOpen[305] = D'2011.10.25 19:51:35'+time_offset*3600;
   aPriceOpen[305] = 0.87908;
   aDateClose[305] = D'2011.10.25 23:50:04'+time_offset*3600;
   aPriceClose[305] = 0.87873;

   // ========== 306 ===== 534 ==========
   aType[306] = OP_BUY;
   aSymbol[306] = "AUDUSD";
   aLots[306] = 1.0;
   aDateOpen[306] = D'2011.10.26 00:37:07'+time_offset*3600;
   aPriceOpen[306] = 1.03831;
   aDateClose[306] = D'2011.10.26 01:12:55'+time_offset*3600;
   aPriceClose[306] = 1.03752;

   // ========== 307 ===== 532 ==========
   aType[307] = OP_BUY;
   aSymbol[307] = "AUDUSD";
   aLots[307] = 1.0;
   aDateOpen[307] = D'2011.10.26 03:21:04'+time_offset*3600;
   aPriceOpen[307] = 1.0371;
   aDateClose[307] = D'2011.10.26 11:35:24'+time_offset*3600;
   aPriceClose[307] = 1.03774;

   // ========== 308 ===== 533 ==========
   aType[308] = OP_BUY;
   aSymbol[308] = "AUDUSD";
   aLots[308] = 1.0;
   aDateOpen[308] = D'2011.10.26 08:33:44'+time_offset*3600;
   aPriceOpen[308] = 1.03563;
   aDateClose[308] = D'2011.10.26 11:35:19'+time_offset*3600;
   aPriceClose[308] = 1.03776;

   // ========== 309 ===== 527 ==========
   aType[309] = OP_BUY;
   aSymbol[309] = "USDCAD";
   aLots[309] = 1.0;
   aDateOpen[309] = D'2011.10.26 20:52:40'+time_offset*3600;
   aPriceOpen[309] = 1.00408;
   aDateClose[309] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPriceClose[309] = 0.996;

   // ========== 310 ===== 530 ==========
   aType[310] = OP_BUY;
   aSymbol[310] = "USDCAD";
   aLots[310] = 1.0;
   aDateOpen[310] = D'2011.10.27 00:09:20'+time_offset*3600;
   aPriceOpen[310] = 1.002;
   aDateClose[310] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPriceClose[310] = 0.996;

   // ========== 311 ===== 528 ==========
   aType[311] = OP_BUY;
   aSymbol[311] = "USDCAD";
   aLots[311] = 1.0;
   aDateOpen[311] = D'2011.10.27 01:43:19'+time_offset*3600;
   aPriceOpen[311] = 1.00095;
   aDateClose[311] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPriceClose[311] = 0.996;

   // ========== 312 ===== 531 ==========
   aType[312] = OP_BUY;
   aSymbol[312] = "EURUSD";
   aLots[312] = 1.0;
   aDateOpen[312] = D'2011.10.27 03:00:14'+time_offset*3600;
   aPriceOpen[312] = 1.39581;
   aDateClose[312] = D'2011.10.27 04:30:33'+time_offset*3600;
   aPriceClose[312] = 1.39681;

   // ========== 313 ===== 529 ==========
   aType[313] = OP_BUY;
   aSymbol[313] = "USDCAD";
   aLots[313] = 1.0;
   aDateOpen[313] = D'2011.10.27 05:14:27'+time_offset*3600;
   aPriceOpen[313] = 0.99918;
   aDateClose[313] = D'2011.10.27 08:05:19'+time_offset*3600;
   aPriceClose[313] = 0.996;

   // ========== 314 ===== 524 ==========
   aType[314] = OP_SELL;
   aSymbol[314] = "AUDUSD";
   aLots[314] = 1.0;
   aDateOpen[314] = D'2011.10.27 10:40:50'+time_offset*3600;
   aPriceOpen[314] = 1.06189;
   aDateClose[314] = D'2011.10.28 03:19:54'+time_offset*3600;
   aPriceClose[314] = 1.066;

   // ========== 315 ===== 523 ==========
   aType[315] = OP_SELL;
   aSymbol[315] = "AUDUSD";
   aLots[315] = 1.0;
   aDateOpen[315] = D'2011.10.27 13:19:15'+time_offset*3600;
   aPriceOpen[315] = 1.06841;
   aDateClose[315] = D'2011.10.28 03:19:54'+time_offset*3600;
   aPriceClose[315] = 1.066;

   // ========== 316 ===== 525 ==========
   aType[316] = OP_SELL;
   aSymbol[316] = "AUDUSD";
   aLots[316] = 1.0;
   aDateOpen[316] = D'2011.10.27 13:57:26'+time_offset*3600;
   aPriceOpen[316] = 1.0687;
   aDateClose[316] = D'2011.10.28 02:51:19'+time_offset*3600;
   aPriceClose[316] = 1.067;

   // ========== 317 ===== 526 ==========
   aType[317] = OP_SELL;
   aSymbol[317] = "AUDUSD";
   aLots[317] = 1.0;
   aDateOpen[317] = D'2011.10.27 14:44:34'+time_offset*3600;
   aPriceOpen[317] = 1.06634;
   aDateClose[317] = D'2011.10.28 02:51:19'+time_offset*3600;
   aPriceClose[317] = 1.067;

   // ========== 318 ===== 522 ==========
   aType[318] = OP_BUY;
   aSymbol[318] = "EURUSD";
   aLots[318] = 1.0;
   aDateOpen[318] = D'2011.10.28 07:42:16'+time_offset*3600;
   aPriceOpen[318] = 1.41674;
   aDateClose[318] = D'2011.10.28 08:41:04'+time_offset*3600;
   aPriceClose[318] = 1.41822;

   // ========== 319 ===== 521 ==========
   aType[319] = OP_BUY;
   aSymbol[319] = "EURUSD";
   aLots[319] = 1.0;
   aDateOpen[319] = D'2011.10.28 10:26:26'+time_offset*3600;
   aPriceOpen[319] = 1.41505;
   aDateClose[319] = D'2011.10.28 12:32:40'+time_offset*3600;
   aPriceClose[319] = 1.41679;

   // ========== 320 ===== 520 ==========
   aType[320] = OP_BUY;
   aSymbol[320] = "EURUSD";
   aLots[320] = 1.0;
   aDateOpen[320] = D'2011.10.30 23:43:13'+time_offset*3600;
   aPriceOpen[320] = 1.41464;
   aDateClose[320] = D'2011.10.31 02:19:00'+time_offset*3600;
   aPriceClose[320] = 1.40792;

   // ========== 321 ===== 518 ==========
   aType[321] = OP_BUY;
   aSymbol[321] = "USDJPY";
   aLots[321] = 1.0;
   aDateOpen[321] = D'2011.10.31 01:34:15'+time_offset*3600;
   aPriceOpen[321] = 78.165;
   aDateClose[321] = D'2011.10.31 04:26:31'+time_offset*3600;
   aPriceClose[321] = 79.187;

   // ========== 322 ===== 517 ==========
   aType[322] = OP_BUY;
   aSymbol[322] = "USDJPY";
   aLots[322] = 1.0;
   aDateOpen[322] = D'2011.10.31 02:01:34'+time_offset*3600;
   aPriceOpen[322] = 78.213;
   aDateClose[322] = D'2011.10.31 05:58:48'+time_offset*3600;
   aPriceClose[322] = 79.324;

   // ========== 323 ===== 519 ==========
   aType[323] = OP_BUY;
   aSymbol[323] = "USDJPY";
   aLots[323] = 1.0;
   aDateOpen[323] = D'2011.10.31 02:05:07'+time_offset*3600;
   aPriceOpen[323] = 77.936;
   aDateClose[323] = D'2011.10.31 04:15:34'+time_offset*3600;
   aPriceClose[323] = 79.189;

   // ========== 324 ===== 516 ==========
   aType[324] = OP_BUY;
   aSymbol[324] = "USDJPY";
   aLots[324] = 1.0;
   aDateOpen[324] = D'2011.10.31 08:53:54'+time_offset*3600;
   aPriceOpen[324] = 78.02;
   aDateClose[324] = D'2011.10.31 15:19:44'+time_offset*3600;
   aPriceClose[324] = 77.967;

   // ========== 325 ===== 515 ==========
   aType[325] = OP_SELL;
   aSymbol[325] = "GBPUSD";
   aLots[325] = 1.0;
   aDateOpen[325] = D'2011.10.31 13:40:58'+time_offset*3600;
   aPriceOpen[325] = 1.60406;
   aDateClose[325] = D'2011.10.31 19:20:03'+time_offset*3600;
   aPriceClose[325] = 1.61;

   // ========== 326 ===== 514 ==========
   aType[326] = OP_SELL;
   aSymbol[326] = "AUDUSD";
   aLots[326] = 1.0;
   aDateOpen[326] = D'2011.10.31 14:41:25'+time_offset*3600;
   aPriceOpen[326] = 1.06049;
   aDateClose[326] = D'2011.10.31 21:40:05'+time_offset*3600;
   aPriceClose[326] = 1.05381;

   // ========== 327 ===== 512 ==========
   aType[327] = OP_SELL;
   aSymbol[327] = "USDCHF";
   aLots[327] = 1.0;
   aDateOpen[327] = D'2011.11.01 02:31:15'+time_offset*3600;
   aPriceOpen[327] = 0.87719;
   aDateClose[327] = D'2011.11.01 05:15:55'+time_offset*3600;
   aPriceClose[327] = 0.88054;

   // ========== 328 ===== 513 ==========
   aType[328] = OP_SELL;
   aSymbol[328] = "USDCHF";
   aLots[328] = 1.0;
   aDateOpen[328] = D'2011.11.01 03:52:16'+time_offset*3600;
   aPriceOpen[328] = 0.87848;
   aDateClose[328] = D'2011.11.01 05:15:50'+time_offset*3600;
   aPriceClose[328] = 0.88055;

   // ========== 329 ===== 511 ==========
   aType[329] = OP_SELL;
   aSymbol[329] = "GBPUSD";
   aLots[329] = 1.0;
   aDateOpen[329] = D'2011.11.01 05:23:17'+time_offset*3600;
   aPriceOpen[329] = 1.60285;
   aDateClose[329] = D'2011.11.01 06:06:11'+time_offset*3600;
   aPriceClose[329] = 1.60535;

   // ========== 330 ===== 510 ==========
   aType[330] = OP_BUY;
   aSymbol[330] = "AUDUSD";
   aLots[330] = 1.0;
   aDateOpen[330] = D'2011.11.01 11:58:19'+time_offset*3600;
   aPriceOpen[330] = 1.02994;
   aDateClose[330] = D'2011.11.01 14:15:46'+time_offset*3600;
   aPriceClose[330] = 1.03267;

   // ========== 331 ===== 507 ==========
   aType[331] = OP_BUY;
   aSymbol[331] = "EURUSD";
   aLots[331] = 1.0;
   aDateOpen[331] = D'2011.11.01 12:40:36'+time_offset*3600;
   aPriceOpen[331] = 1.36569;
   aDateClose[331] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPriceClose[331] = 1.3681;

   // ========== 332 ===== 508 ==========
   aType[332] = OP_BUY;
   aSymbol[332] = "EURUSD";
   aLots[332] = 1.0;
   aDateOpen[332] = D'2011.11.01 12:42:23'+time_offset*3600;
   aPriceOpen[332] = 1.36491;
   aDateClose[332] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPriceClose[332] = 1.3681;

   // ========== 333 ===== 509 ==========
   aType[333] = OP_BUY;
   aSymbol[333] = "EURUSD";
   aLots[333] = 1.0;
   aDateOpen[333] = D'2011.11.01 13:14:55'+time_offset*3600;
   aPriceOpen[333] = 1.36277;
   aDateClose[333] = D'2011.11.01 14:27:11'+time_offset*3600;
   aPriceClose[333] = 1.36749;

   // ========== 334 ===== 505 ==========
   aType[334] = OP_SELL;
   aSymbol[334] = "USDCAD";
   aLots[334] = 1.0;
   aDateOpen[334] = D'2011.11.01 23:21:16'+time_offset*3600;
   aPriceOpen[334] = 1.02147;
   aDateClose[334] = D'2011.11.02 03:41:26'+time_offset*3600;
   aPriceClose[334] = 1.01875;

   // ========== 335 ===== 506 ==========
   aType[335] = OP_SELL;
   aSymbol[335] = "USDCAD";
   aLots[335] = 1.0;
   aDateOpen[335] = D'2011.11.01 23:22:04'+time_offset*3600;
   aPriceOpen[335] = 1.02162;
   aDateClose[335] = D'2011.11.02 03:24:36'+time_offset*3600;
   aPriceClose[335] = 1.01885;

   // ========== 336 ===== 503 ==========
   aType[336] = OP_SELL;
   aSymbol[336] = "AUDUSD";
   aLots[336] = 1.0;
   aDateOpen[336] = D'2011.11.02 04:54:49'+time_offset*3600;
   aPriceOpen[336] = 1.03594;
   aDateClose[336] = D'2011.11.02 11:07:29'+time_offset*3600;
   aPriceClose[336] = 1.03501;

   // ========== 337 ===== 504 ==========
   aType[337] = OP_SELL;
   aSymbol[337] = "AUDUSD";
   aLots[337] = 1.0;
   aDateOpen[337] = D'2011.11.02 06:11:39'+time_offset*3600;
   aPriceOpen[337] = 1.038;
   aDateClose[337] = D'2011.11.02 08:08:55'+time_offset*3600;
   aPriceClose[337] = 1.0417;

   // ========== 338 ===== 501 ==========
   aType[338] = OP_SELL;
   aSymbol[338] = "GBPUSD";
   aLots[338] = 1.0;
   aDateOpen[338] = D'2011.11.02 07:53:01'+time_offset*3600;
   aPriceOpen[338] = 1.5984;
   aDateClose[338] = D'2011.11.03 07:31:55'+time_offset*3600;
   aPriceClose[338] = 1.58871;

   // ========== 339 ===== 502 ==========
   aType[339] = OP_BUY;
   aSymbol[339] = "EURUSD";
   aLots[339] = 1.0;
   aDateOpen[339] = D'2011.11.02 13:35:53'+time_offset*3600;
   aPriceOpen[339] = 1.38277;
   aDateClose[339] = D'2011.11.02 16:16:24'+time_offset*3600;
   aPriceClose[339] = 1.377;

   // ========== 340 ===== 500 ==========
   aType[340] = OP_BUY;
   aSymbol[340] = "USDCHF";
   aLots[340] = 1.0;
   aDateOpen[340] = D'2011.11.04 08:25:16'+time_offset*3600;
   aPriceOpen[340] = 0.88452;
   aDateClose[340] = D'2011.11.04 09:16:28'+time_offset*3600;
   aPriceClose[340] = 0.88512;

   // ========== 341 ===== 497 ==========
   aType[341] = OP_BUY;
   aSymbol[341] = "USDJPY";
   aLots[341] = 1.0;
   aDateOpen[341] = D'2011.11.04 12:32:24'+time_offset*3600;
   aPriceOpen[341] = 78.115;
   aDateClose[341] = D'2011.11.04 13:18:26'+time_offset*3600;
   aPriceClose[341] = 78.079;

   // ========== 342 ===== 498 ==========
   aType[342] = OP_BUY;
   aSymbol[342] = "USDJPY";
   aLots[342] = 1.0;
   aDateOpen[342] = D'2011.11.04 12:34:16'+time_offset*3600;
   aPriceOpen[342] = 78.076;
   aDateClose[342] = D'2011.11.04 13:05:27'+time_offset*3600;
   aPriceClose[342] = 78.04;

   // ========== 343 ===== 499 ==========
   aType[343] = OP_BUY;
   aSymbol[343] = "GBPUSD";
   aLots[343] = 1.0;
   aDateOpen[343] = D'2011.11.04 12:36:08'+time_offset*3600;
   aPriceOpen[343] = 1.60413;
   aDateClose[343] = D'2011.11.04 12:46:14'+time_offset*3600;
   aPriceClose[343] = 1.60165;

   // ========== 344 ===== 496 ==========
   aType[344] = OP_SELL;
   aSymbol[344] = "EURUSD";
   aLots[344] = 1.0;
   aDateOpen[344] = D'2011.11.04 12:46:23'+time_offset*3600;
   aPriceOpen[344] = 1.38212;
   aDateClose[344] = D'2011.11.04 15:28:01'+time_offset*3600;
   aPriceClose[344] = 1.37404;

   // ========== 345 ===== 495 ==========
   aType[345] = OP_SELL;
   aSymbol[345] = "EURUSD";
   aLots[345] = 1.0;
   aDateOpen[345] = D'2011.11.04 14:10:35'+time_offset*3600;
   aPriceOpen[345] = 1.37354;
   aDateClose[345] = D'2011.11.04 15:46:51'+time_offset*3600;
   aPriceClose[345] = 1.37617;

   // ========== 346 ===== 494 ==========
   aType[346] = OP_BUY;
   aSymbol[346] = "GBPUSD";
   aLots[346] = 1.0;
   aDateOpen[346] = D'2011.11.04 15:48:04'+time_offset*3600;
   aPriceOpen[346] = 1.60322;
   aDateClose[346] = D'2011.11.04 18:53:46'+time_offset*3600;
   aPriceClose[346] = 1.6035;

   // ========== 347 ===== 493 ==========
   aType[347] = OP_SELL;
   aSymbol[347] = "GBPUSD";
   aLots[347] = 1.0;
   aDateOpen[347] = D'2011.11.06 22:08:20'+time_offset*3600;
   aPriceOpen[347] = 1.6054;
   aDateClose[347] = D'2011.11.07 02:08:22'+time_offset*3600;
   aPriceClose[347] = 1.60098;

   // ========== 348 ===== 492 ==========
   aType[348] = OP_SELL;
   aSymbol[348] = "GBPUSD";
   aLots[348] = 1.0;
   aDateOpen[348] = D'2011.11.07 05:04:16'+time_offset*3600;
   aPriceOpen[348] = 1.60232;
   aDateClose[348] = D'2011.11.07 10:27:06'+time_offset*3600;
   aPriceClose[348] = 1.59941;

   // ========== 349 ===== 491 ==========
   aType[349] = OP_SELL;
   aSymbol[349] = "GBPUSD";
   aLots[349] = 1.0;
   aDateOpen[349] = D'2011.11.07 22:11:44'+time_offset*3600;
   aPriceOpen[349] = 1.60546;
   aDateClose[349] = D'2011.11.08 04:57:00'+time_offset*3600;
   aPriceClose[349] = 1.60431;

   // ========== 350 ===== 490 ==========
   aType[350] = OP_SELL;
   aSymbol[350] = "EURUSD";
   aLots[350] = 1.0;
   aDateOpen[350] = D'2011.11.08 08:00:55'+time_offset*3600;
   aPriceOpen[350] = 1.37262;
   aDateClose[350] = D'2011.11.08 08:09:08'+time_offset*3600;
   aPriceClose[350] = 1.37469;

   // ========== 351 ===== 489 ==========
   aType[351] = OP_SELL;
   aSymbol[351] = "USDCHF";
   aLots[351] = 1.0;
   aDateOpen[351] = D'2011.11.08 08:15:10'+time_offset*3600;
   aPriceOpen[351] = 0.90355;
   aDateClose[351] = D'2011.11.08 08:21:29'+time_offset*3600;
   aPriceClose[351] = 0.90339;

   // ========== 352 ===== 487 ==========
   aType[352] = OP_SELL;
   aSymbol[352] = "GBPUSD";
   aLots[352] = 1.0;
   aDateOpen[352] = D'2011.11.08 08:38:42'+time_offset*3600;
   aPriceOpen[352] = 1.60616;
   aDateClose[352] = D'2011.11.09 05:22:09'+time_offset*3600;
   aPriceClose[352] = 1.60872;

   // ========== 353 ===== 488 ==========
   aType[353] = OP_SELL;
   aSymbol[353] = "GBPUSD";
   aLots[353] = 1.0;
   aDateOpen[353] = D'2011.11.08 10:25:15'+time_offset*3600;
   aPriceOpen[353] = 1.60868;
   aDateClose[353] = D'2011.11.09 05:07:12'+time_offset*3600;
   aPriceClose[353] = 1.60873;

   // ========== 354 ===== 485 ==========
   aType[354] = OP_SELL;
   aSymbol[354] = "EURUSD";
   aLots[354] = 1.0;
   aDateOpen[354] = D'2011.11.09 09:06:59'+time_offset*3600;
   aPriceOpen[354] = 1.37676;
   aDateClose[354] = D'2011.11.09 09:45:18'+time_offset*3600;
   aPriceClose[354] = 1.37204;

   // ========== 355 ===== 484 ==========
   aType[355] = OP_SELL;
   aSymbol[355] = "EURUSD";
   aLots[355] = 1.0;
   aDateOpen[355] = D'2011.11.09 09:10:56'+time_offset*3600;
   aPriceOpen[355] = 1.37596;
   aDateClose[355] = D'2011.11.09 10:40:19'+time_offset*3600;
   aPriceClose[355] = 1.3667;

   // ========== 356 ===== 483 ==========
   aType[356] = OP_SELL;
   aSymbol[356] = "EURUSD";
   aLots[356] = 1.0;
   aDateOpen[356] = D'2011.11.09 09:12:50'+time_offset*3600;
   aPriceOpen[356] = 1.37571;
   aDateClose[356] = D'2011.11.09 12:02:00'+time_offset*3600;
   aPriceClose[356] = 1.36261;

   // ========== 357 ===== 486 ==========
   aType[357] = OP_SELL;
   aSymbol[357] = "GBPUSD";
   aLots[357] = 1.0;
   aDateOpen[357] = D'2011.11.09 09:16:37'+time_offset*3600;
   aPriceOpen[357] = 1.60557;
   aDateClose[357] = D'2011.11.09 09:30:09'+time_offset*3600;
   aPriceClose[357] = 1.6028;

   // ========== 358 ===== 482 ==========
   aType[358] = OP_BUY;
   aSymbol[358] = "EURUSD";
   aLots[358] = 1.0;
   aDateOpen[358] = D'2011.11.09 14:46:44'+time_offset*3600;
   aPriceOpen[358] = 1.356;
   aDateClose[358] = D'2011.11.09 15:52:31'+time_offset*3600;
   aPriceClose[358] = 1.3593;

   // ========== 359 ===== 478 ==========
   aType[359] = OP_BUY;
   aSymbol[359] = "EURUSD";
   aLots[359] = 1.0;
   aDateOpen[359] = D'2011.11.09 22:03:43'+time_offset*3600;
   aPriceOpen[359] = 1.35422;
   aDateClose[359] = D'2011.11.10 01:51:04'+time_offset*3600;
   aPriceClose[359] = 1.35434;

   // ========== 360 ===== 481 ==========
   aType[360] = OP_BUY;
   aSymbol[360] = "AUDUSD";
   aLots[360] = 1.0;
   aDateOpen[360] = D'2011.11.09 22:39:48'+time_offset*3600;
   aPriceOpen[360] = 1.01329;
   aDateClose[360] = D'2011.11.10 00:03:56'+time_offset*3600;
   aPriceClose[360] = 1.01391;

   // ========== 361 ===== 480 ==========
   aType[361] = OP_SELL;
   aSymbol[361] = "USDCHF";
   aLots[361] = 1.0;
   aDateOpen[361] = D'2011.11.10 00:02:38'+time_offset*3600;
   aPriceOpen[361] = 0.9106;
   aDateClose[361] = D'2011.11.10 01:02:40'+time_offset*3600;
   aPriceClose[361] = 0.9107;

   // ========== 362 ===== 479 ==========
   aType[362] = OP_BUY;
   aSymbol[362] = "EURUSD";
   aLots[362] = 1.0;
   aDateOpen[362] = D'2011.11.10 00:29:30'+time_offset*3600;
   aPriceOpen[362] = 1.35208;
   aDateClose[362] = D'2011.11.10 01:48:48'+time_offset*3600;
   aPriceClose[362] = 1.35395;

   // ========== 363 ===== 475 ==========
   aType[363] = OP_SELL;
   aSymbol[363] = "EURUSD";
   aLots[363] = 1.0;
   aDateOpen[363] = D'2011.11.10 09:49:43'+time_offset*3600;
   aPriceOpen[363] = 1.361;
   aDateClose[363] = D'2011.11.10 10:41:24'+time_offset*3600;
   aPriceClose[363] = 1.357;

   // ========== 364 ===== 476 ==========
   aType[364] = OP_BUY;
   aSymbol[364] = "USDCHF";
   aLots[364] = 1.0;
   aDateOpen[364] = D'2011.11.10 10:02:33'+time_offset*3600;
   aPriceOpen[364] = 0.9053;
   aDateClose[364] = D'2011.11.10 10:40:46'+time_offset*3600;
   aPriceClose[364] = 0.90651;

   // ========== 365 ===== 477 ==========
   aType[365] = OP_BUY;
   aSymbol[365] = "USDCHF";
   aLots[365] = 1.0;
   aDateOpen[365] = D'2011.11.10 10:03:23'+time_offset*3600;
   aPriceOpen[365] = 0.90524;
   aDateClose[365] = D'2011.11.10 10:21:30'+time_offset*3600;
   aPriceClose[365] = 0.90646;

   // ========== 366 ===== 474 ==========
   aType[366] = OP_BUY;
   aSymbol[366] = "AUDUSD";
   aLots[366] = 1.0;
   aDateOpen[366] = D'2011.11.10 16:13:32'+time_offset*3600;
   aPriceOpen[366] = 1.01067;
   aDateClose[366] = D'2011.11.10 16:42:53'+time_offset*3600;
   aPriceClose[366] = 1.01293;

   // ========== 367 ===== 473 ==========
   aType[367] = OP_BUY;
   aSymbol[367] = "USDCAD";
   aLots[367] = 1.0;
   aDateOpen[367] = D'2011.11.10 23:41:59'+time_offset*3600;
   aPriceOpen[367] = 1.01678;
   aDateClose[367] = D'2011.11.11 02:08:31'+time_offset*3600;
   aPriceClose[367] = 1.01929;

   // ========== 368 ===== 472 ==========
   aType[368] = OP_BUY;
   aSymbol[368] = "USDCHF";
   aLots[368] = 1.0;
   aDateOpen[368] = D'2011.11.11 07:17:19'+time_offset*3600;
   aPriceOpen[368] = 0.90537;
   aDateClose[368] = D'2011.11.11 08:23:35'+time_offset*3600;
   aPriceClose[368] = 0.90626;

   // ========== 369 ===== 471 ==========
   aType[369] = OP_SELL;
   aSymbol[369] = "GBPUSD";
   aLots[369] = 1.0;
   aDateOpen[369] = D'2011.11.11 09:08:03'+time_offset*3600;
   aPriceOpen[369] = 1.59038;
   aDateClose[369] = D'2011.11.11 09:40:42'+time_offset*3600;
   aPriceClose[369] = 1.591;

   // ========== 370 ===== 469 ==========
   aType[370] = OP_SELL;
   aSymbol[370] = "EURUSD";
   aLots[370] = 1.0;
   aDateOpen[370] = D'2011.11.11 11:38:12'+time_offset*3600;
   aPriceOpen[370] = 1.36421;
   aDateClose[370] = D'2011.11.11 15:35:41'+time_offset*3600;
   aPriceClose[370] = 1.37173;

   // ========== 371 ===== 470 ==========
   aType[371] = OP_SELL;
   aSymbol[371] = "EURUSD";
   aLots[371] = 1.0;
   aDateOpen[371] = D'2011.11.11 14:12:13'+time_offset*3600;
   aPriceOpen[371] = 1.36784;
   aDateClose[371] = D'2011.11.11 15:35:37'+time_offset*3600;
   aPriceClose[371] = 1.37195;

   // ========== 372 ===== 468 ==========
   aType[372] = OP_BUY;
   aSymbol[372] = "GBPUSD";
   aLots[372] = 1.0;
   aDateOpen[372] = D'2011.11.14 02:08:55'+time_offset*3600;
   aPriceOpen[372] = 1.60631;
   aDateClose[372] = D'2011.11.14 08:26:32'+time_offset*3600;
   aPriceClose[372] = 1.60102;

   // ========== 373 ===== 467 ==========
   aType[373] = OP_BUY;
   aSymbol[373] = "USDCHF";
   aLots[373] = 1.0;
   aDateOpen[373] = D'2011.11.14 07:57:02'+time_offset*3600;
   aPriceOpen[373] = 0.90079;
   aDateClose[373] = D'2011.11.14 08:34:36'+time_offset*3600;
   aPriceClose[373] = 0.90207;

   // ========== 374 ===== 466 ==========
   aType[374] = OP_SELL;
   aSymbol[374] = "GBPUSD";
   aLots[374] = 1.0;
   aDateOpen[374] = D'2011.11.14 08:48:38'+time_offset*3600;
   aPriceOpen[374] = 1.59993;
   aDateClose[374] = D'2011.11.14 09:03:09'+time_offset*3600;
   aPriceClose[374] = 1.59891;

   // ========== 375 ===== 465 ==========
   aType[375] = OP_SELL;
   aSymbol[375] = "EURUSD";
   aLots[375] = 1.0;
   aDateOpen[375] = D'2011.11.14 09:23:58'+time_offset*3600;
   aPriceOpen[375] = 1.36908;
   aDateClose[375] = D'2011.11.14 09:55:59'+time_offset*3600;
   aPriceClose[375] = 1.36962;

   // ========== 376 ===== 463 ==========
   aType[376] = OP_BUY;
   aSymbol[376] = "AUDUSD";
   aLots[376] = 1.0;
   aDateOpen[376] = D'2011.11.14 09:32:03'+time_offset*3600;
   aPriceOpen[376] = 1.02514;
   aDateClose[376] = D'2011.11.14 11:00:00'+time_offset*3600;
   aPriceClose[376] = 1.02591;

   // ========== 377 ===== 464 ==========
   aType[377] = OP_BUY;
   aSymbol[377] = "EURUSD";
   aLots[377] = 1.0;
   aDateOpen[377] = D'2011.11.14 10:06:42'+time_offset*3600;
   aPriceOpen[377] = 1.36847;
   aDateClose[377] = D'2011.11.14 10:59:52'+time_offset*3600;
   aPriceClose[377] = 1.36967;

   // ========== 378 ===== 462 ==========
   aType[378] = OP_SELL;
   aSymbol[378] = "USDCAD";
   aLots[378] = 1.0;
   aDateOpen[378] = D'2011.11.14 11:06:45'+time_offset*3600;
   aPriceOpen[378] = 1.01805;
   aDateClose[378] = D'2011.11.14 11:24:15'+time_offset*3600;
   aPriceClose[378] = 1.01873;

   // ========== 379 ===== 460 ==========
   aType[379] = OP_BUY;
   aSymbol[379] = "EURUSD";
   aLots[379] = 1.0;
   aDateOpen[379] = D'2011.11.14 14:17:03'+time_offset*3600;
   aPriceOpen[379] = 1.36374;
   aDateClose[379] = D'2011.11.14 16:09:51'+time_offset*3600;
   aPriceClose[379] = 1.36408;

   // ========== 380 ===== 461 ==========
   aType[380] = OP_BUY;
   aSymbol[380] = "EURUSD";
   aLots[380] = 1.0;
   aDateOpen[380] = D'2011.11.14 15:25:38'+time_offset*3600;
   aPriceOpen[380] = 1.3623;
   aDateClose[380] = D'2011.11.14 15:51:51'+time_offset*3600;
   aPriceClose[380] = 1.36345;

   // ========== 381 ===== 459 ==========
   aType[381] = OP_SELL;
   aSymbol[381] = "EURUSD";
   aLots[381] = 1.0;
   aDateOpen[381] = D'2011.11.15 08:49:03'+time_offset*3600;
   aPriceOpen[381] = 1.35709;
   aDateClose[381] = D'2011.11.15 08:52:40'+time_offset*3600;
   aPriceClose[381] = 1.35877;

   // ========== 382 ===== 458 ==========
   aType[382] = OP_SELL;
   aSymbol[382] = "USDCHF";
   aLots[382] = 1.0;
   aDateOpen[382] = D'2011.11.15 08:57:29'+time_offset*3600;
   aPriceOpen[382] = 0.91361;
   aDateClose[382] = D'2011.11.15 09:07:58'+time_offset*3600;
   aPriceClose[382] = 0.91654;

   // ========== 383 ===== 455 ==========
   aType[383] = OP_SELL;
   aSymbol[383] = "GBPUSD";
   aLots[383] = 1.0;
   aDateOpen[383] = D'2011.11.15 09:25:11'+time_offset*3600;
   aPriceOpen[383] = 1.58517;
   aDateClose[383] = D'2011.11.16 02:45:10'+time_offset*3600;
   aPriceClose[383] = 1.57671;

   // ========== 384 ===== 454 ==========
   aType[384] = OP_SELL;
   aSymbol[384] = "GBPUSD";
   aLots[384] = 1.0;
   aDateOpen[384] = D'2011.11.15 09:25:31'+time_offset*3600;
   aPriceOpen[384] = 1.58498;
   aDateClose[384] = D'2011.11.16 06:04:40'+time_offset*3600;
   aPriceClose[384] = 1.57618;

   // ========== 385 ===== 457 ==========
   aType[385] = OP_SELL;
   aSymbol[385] = "GBPUSD";
   aLots[385] = 1.0;
   aDateOpen[385] = D'2011.11.15 09:26:00'+time_offset*3600;
   aPriceOpen[385] = 1.58519;
   aDateClose[385] = D'2011.11.15 16:40:48'+time_offset*3600;
   aPriceClose[385] = 1.58114;

   // ========== 386 ===== 456 ==========
   aType[386] = OP_SELL;
   aSymbol[386] = "GBPUSD";
   aLots[386] = 1.0;
   aDateOpen[386] = D'2011.11.15 09:26:18'+time_offset*3600;
   aPriceOpen[386] = 1.58514;
   aDateClose[386] = D'2011.11.15 23:01:58'+time_offset*3600;
   aPriceClose[386] = 1.58197;

   // ========== 387 ===== 453 ==========
   aType[387] = OP_BUY;
   aSymbol[387] = "EURUSD";
   aLots[387] = 1.0;
   aDateOpen[387] = D'2011.11.16 02:04:30'+time_offset*3600;
   aPriceOpen[387] = 1.3475;
   aDateClose[387] = D'2011.11.16 08:21:45'+time_offset*3600;
   aPriceClose[387] = 1.349;

   // ========== 388 ===== 452 ==========
   aType[388] = OP_SELL;
   aSymbol[388] = "EURUSD";
   aLots[388] = 1.0;
   aDateOpen[388] = D'2011.11.16 08:46:10'+time_offset*3600;
   aPriceOpen[388] = 1.35318;
   aDateClose[388] = D'2011.11.16 08:51:01'+time_offset*3600;
   aPriceClose[388] = 1.35303;

   // ========== 389 ===== 451 ==========
   aType[389] = OP_SELL;
   aSymbol[389] = "EURUSD";
   aLots[389] = 1.0;
   aDateOpen[389] = D'2011.11.16 09:12:18'+time_offset*3600;
   aPriceOpen[389] = 1.3541;
   aDateClose[389] = D'2011.11.16 09:14:03'+time_offset*3600;
   aPriceClose[389] = 1.35364;

   // ========== 390 ===== 450 ==========
   aType[390] = OP_SELL;
   aSymbol[390] = "AUDUSD";
   aLots[390] = 1.0;
   aDateOpen[390] = D'2011.11.16 10:05:57'+time_offset*3600;
   aPriceOpen[390] = 1.01796;
   aDateClose[390] = D'2011.11.16 10:16:23'+time_offset*3600;
   aPriceClose[390] = 1.01678;

   // ========== 391 ===== 449 ==========
   aType[391] = OP_SELL;
   aSymbol[391] = "USDCHF";
   aLots[391] = 1.0;
   aDateOpen[391] = D'2011.11.16 11:27:39'+time_offset*3600;
   aPriceOpen[391] = 0.91798;
   aDateClose[391] = D'2011.11.16 12:14:46'+time_offset*3600;
   aPriceClose[391] = 0.91786;

   // ========== 392 ===== 448 ==========
   aType[392] = OP_SELL;
   aSymbol[392] = "GBPUSD";
   aLots[392] = 1.0;
   aDateOpen[392] = D'2011.11.16 13:36:06'+time_offset*3600;
   aPriceOpen[392] = 1.57696;
   aDateClose[392] = D'2011.11.16 13:49:02'+time_offset*3600;
   aPriceClose[392] = 1.57682;

   // ========== 393 ===== 447 ==========
   aType[393] = OP_SELL;
   aSymbol[393] = "USDCAD";
   aLots[393] = 1.0;
   aDateOpen[393] = D'2011.11.17 01:16:00'+time_offset*3600;
   aPriceOpen[393] = 1.02602;
   aDateClose[393] = D'2011.11.17 01:35:12'+time_offset*3600;
   aPriceClose[393] = 1.02553;

   // ========== 394 ===== 446 ==========
   aType[394] = OP_SELL;
   aSymbol[394] = "GBPUSD";
   aLots[394] = 1.0;
   aDateOpen[394] = D'2011.11.17 09:30:50'+time_offset*3600;
   aPriceOpen[394] = 1.57812;
   aDateClose[394] = D'2011.11.17 09:46:24'+time_offset*3600;
   aPriceClose[394] = 1.57503;

   // ========== 395 ===== 444 ==========
   aType[395] = OP_SELL;
   aSymbol[395] = "GBPUSD";
   aLots[395] = 1.0;
   aDateOpen[395] = D'2011.11.17 16:46:00'+time_offset*3600;
   aPriceOpen[395] = 1.58002;
   aDateClose[395] = D'2011.11.17 17:36:15'+time_offset*3600;
   aPriceClose[395] = 1.57678;

   // ========== 396 ===== 445 ==========
   aType[396] = OP_SELL;
   aSymbol[396] = "GBPUSD";
   aLots[396] = 1.0;
   aDateOpen[396] = D'2011.11.17 16:54:57'+time_offset*3600;
   aPriceOpen[396] = 1.57937;
   aDateClose[396] = D'2011.11.17 17:36:06'+time_offset*3600;
   aPriceClose[396] = 1.57678;

   // ========== 397 ===== 443 ==========
   aType[397] = OP_BUY;
   aSymbol[397] = "EURUSD";
   aLots[397] = 1.0;
   aDateOpen[397] = D'2011.11.18 02:23:13'+time_offset*3600;
   aPriceOpen[397] = 1.34828;
   aDateClose[397] = D'2011.11.18 02:27:41'+time_offset*3600;
   aPriceClose[397] = 1.34827;

   // ========== 398 ===== 442 ==========
   aType[398] = OP_SELL;
   aSymbol[398] = "EURUSD";
   aLots[398] = 1.0;
   aDateOpen[398] = D'2011.11.18 05:16:35'+time_offset*3600;
   aPriceOpen[398] = 1.34695;
   aDateClose[398] = D'2011.11.18 07:27:18'+time_offset*3600;
   aPriceClose[398] = 1.35143;

   // ========== 399 ===== 440 ==========
   aType[399] = OP_SELL;
   aSymbol[399] = "GBPUSD";
   aLots[399] = 1.0;
   aDateOpen[399] = D'2011.11.18 08:46:55'+time_offset*3600;
   aPriceOpen[399] = 1.57741;
   aDateClose[399] = D'2011.11.18 09:25:44'+time_offset*3600;
   aPriceClose[399] = 1.5824;

   // ========== 400 ===== 441 ==========
   aType[400] = OP_SELL;
   aSymbol[400] = "GBPUSD";
   aLots[400] = 1.0;
   aDateOpen[400] = D'2011.11.18 08:58:43'+time_offset*3600;
   aPriceOpen[400] = 1.57901;
   aDateClose[400] = D'2011.11.18 09:25:23'+time_offset*3600;
   aPriceClose[400] = 1.58209;

   // ========== 401 ===== 438 ==========
   aType[401] = OP_SELL;
   aSymbol[401] = "EURUSD";
   aLots[401] = 1.0;
   aDateOpen[401] = D'2011.11.21 07:50:04'+time_offset*3600;
   aPriceOpen[401] = 1.34893;
   aDateClose[401] = D'2011.11.21 08:02:18'+time_offset*3600;
   aPriceClose[401] = 1.34774;

   // ========== 402 ===== 439 ==========
   aType[402] = OP_SELL;
   aSymbol[402] = "EURUSD";
   aLots[402] = 1.0;
   aDateOpen[402] = D'2011.11.21 07:51:27'+time_offset*3600;
   aPriceOpen[402] = 1.34925;
   aDateClose[402] = D'2011.11.21 08:02:14'+time_offset*3600;
   aPriceClose[402] = 1.34769;

   // ========== 403 ===== 437 ==========
   aType[403] = OP_BUY;
   aSymbol[403] = "AUDUSD";
   aLots[403] = 1.0;
   aDateOpen[403] = D'2011.11.21 16:11:39'+time_offset*3600;
   aPriceOpen[403] = 0.9825;
   aDateClose[403] = D'2011.11.21 17:24:58'+time_offset*3600;
   aPriceClose[403] = 0.98454;

   // ========== 404 ===== 436 ==========
   aType[404] = OP_SELL;
   aSymbol[404] = "EURUSD";
   aLots[404] = 1.0;
   aDateOpen[404] = D'2011.11.22 10:39:01'+time_offset*3600;
   aPriceOpen[404] = 1.35382;
   aDateClose[404] = D'2011.11.22 10:55:57'+time_offset*3600;
   aPriceClose[404] = 1.35359;

   // ========== 405 ===== 435 ==========
   aType[405] = OP_SELL;
   aSymbol[405] = "EURUSD";
   aLots[405] = 1.0;
   aDateOpen[405] = D'2011.11.22 11:02:19'+time_offset*3600;
   aPriceOpen[405] = 1.35398;
   aDateClose[405] = D'2011.11.22 13:28:30'+time_offset*3600;
   aPriceClose[405] = 1.35325;

   // ========== 406 ===== 434 ==========
   aType[406] = OP_SELL;
   aSymbol[406] = "GBPUSD";
   aLots[406] = 1.0;
   aDateOpen[406] = D'2011.11.23 01:14:56'+time_offset*3600;
   aPriceOpen[406] = 1.56311;
   aDateClose[406] = D'2011.11.23 01:29:39'+time_offset*3600;
   aPriceClose[406] = 1.56277;

   // ========== 407 ===== 433 ==========
   aType[407] = OP_SELL;
   aSymbol[407] = "AUDUSD";
   aLots[407] = 1.0;
   aDateOpen[407] = D'2011.11.23 01:58:25'+time_offset*3600;
   aPriceOpen[407] = 0.97877;
   aDateClose[407] = D'2011.11.23 04:26:43'+time_offset*3600;
   aPriceClose[407] = 0.97739;

   // ========== 408 ===== 432 ==========
   aType[408] = OP_SELL;
   aSymbol[408] = "AUDUSD";
   aLots[408] = 1.0;
   aDateOpen[408] = D'2011.11.23 01:59:27'+time_offset*3600;
   aPriceOpen[408] = 0.97925;
   aDateClose[408] = D'2011.11.23 05:39:45'+time_offset*3600;
   aPriceClose[408] = 0.97648;

   // ========== 409 ===== 431 ==========
   aType[409] = OP_SELL;
   aSymbol[409] = "GBPUSD";
   aLots[409] = 1.0;
   aDateOpen[409] = D'2011.11.23 08:09:44'+time_offset*3600;
   aPriceOpen[409] = 1.55892;
   aDateClose[409] = D'2011.11.23 08:21:11'+time_offset*3600;
   aPriceClose[409] = 1.55858;

   // ========== 410 ===== 430 ==========
   aType[410] = OP_SELL;
   aSymbol[410] = "GBPUSD";
   aLots[410] = 1.0;
   aDateOpen[410] = D'2011.11.23 08:33:18'+time_offset*3600;
   aPriceOpen[410] = 1.55712;
   aDateClose[410] = D'2011.11.23 08:58:07'+time_offset*3600;
   aPriceClose[410] = 1.5568;

   // ========== 411 ===== 429 ==========
   aType[411] = OP_SELL;
   aSymbol[411] = "EURUSD";
   aLots[411] = 1.0;
   aDateOpen[411] = D'2011.11.23 10:12:15'+time_offset*3600;
   aPriceOpen[411] = 1.3421;
   aDateClose[411] = D'2011.11.23 10:16:04'+time_offset*3600;
   aPriceClose[411] = 1.33978;

   // ========== 412 ===== 426 ==========
   aType[412] = OP_SELL;
   aSymbol[412] = "EURUSD";
   aLots[412] = 1.0;
   aDateOpen[412] = D'2011.11.23 10:19:28'+time_offset*3600;
   aPriceOpen[412] = 1.33951;
   aDateClose[412] = D'2011.11.23 15:45:17'+time_offset*3600;
   aPriceClose[412] = 1.33589;

   // ========== 413 ===== 427 ==========
   aType[413] = OP_SELL;
   aSymbol[413] = "EURUSD";
   aLots[413] = 1.0;
   aDateOpen[413] = D'2011.11.23 10:20:55'+time_offset*3600;
   aPriceOpen[413] = 1.33982;
   aDateClose[413] = D'2011.11.23 15:03:35'+time_offset*3600;
   aPriceClose[413] = 1.33664;

   // ========== 414 ===== 428 ==========
   aType[414] = OP_SELL;
   aSymbol[414] = "EURUSD";
   aLots[414] = 1.0;
   aDateOpen[414] = D'2011.11.23 12:16:42'+time_offset*3600;
   aPriceOpen[414] = 1.33942;
   aDateClose[414] = D'2011.11.23 15:02:43'+time_offset*3600;
   aPriceClose[414] = 1.33689;

   // ========== 415 ===== 425 ==========
   aType[415] = OP_BUY;
   aSymbol[415] = "EURUSD";
   aLots[415] = 1.0;
   aDateOpen[415] = D'2011.11.24 11:39:03'+time_offset*3600;
   aPriceOpen[415] = 1.33824;
   aDateClose[415] = D'2011.11.24 11:47:31'+time_offset*3600;
   aPriceClose[415] = 1.33842;

   // ========== 416 ===== 424 ==========
   aType[416] = OP_SELL;
   aSymbol[416] = "AUDUSD";
   aLots[416] = 1.0;
   aDateOpen[416] = D'2011.11.24 13:36:56'+time_offset*3600;
   aPriceOpen[416] = 0.97545;
   aDateClose[416] = D'2011.11.24 14:44:37'+time_offset*3600;
   aPriceClose[416] = 0.9715;

   // ========== 417 ===== 423 ==========
   aType[417] = OP_SELL;
   aSymbol[417] = "AUDUSD";
   aLots[417] = 1.0;
   aDateOpen[417] = D'2011.11.24 13:40:28'+time_offset*3600;
   aPriceOpen[417] = 0.9751;
   aDateClose[417] = D'2011.11.24 14:58:06'+time_offset*3600;
   aPriceClose[417] = 0.97191;

   // ========== 418 ===== 422 ==========
   aType[418] = OP_BUY;
   aSymbol[418] = "GBPUSD";
   aLots[418] = 1.0;
   aDateOpen[418] = D'2011.11.25 00:07:17'+time_offset*3600;
   aPriceOpen[418] = 1.54713;
   aDateClose[418] = D'2011.11.25 01:10:05'+time_offset*3600;
   aPriceClose[418] = 1.54666;

   // ========== 419 ===== 421 ==========
   aType[419] = OP_BUY;
   aSymbol[419] = "GBPUSD";
   aLots[419] = 1.0;
   aDateOpen[419] = D'2011.11.25 05:39:36'+time_offset*3600;
   aPriceOpen[419] = 1.54571;
   aDateClose[419] = D'2011.11.25 06:36:55'+time_offset*3600;
   aPriceClose[419] = 1.54598;

   // ========== 420 ===== 420 ==========
   aType[420] = OP_BUY;
   aSymbol[420] = "GBPUSD";
   aLots[420] = 1.0;
   aDateOpen[420] = D'2011.11.25 05:42:03'+time_offset*3600;
   aPriceOpen[420] = 1.54573;
   aDateClose[420] = D'2011.11.25 06:40:39'+time_offset*3600;
   aPriceClose[420] = 1.54606;

   // ========== 421 ===== 419 ==========
   aType[421] = OP_SELL;
   aSymbol[421] = "EURUSD";
   aLots[421] = 1.0;
   aDateOpen[421] = D'2011.11.25 09:04:41'+time_offset*3600;
   aPriceOpen[421] = 1.32688;
   aDateClose[421] = D'2011.11.25 09:10:17'+time_offset*3600;
   aPriceClose[421] = 1.32611;

   // ========== 422 ===== 417 ==========
   aType[422] = OP_BUY;
   aSymbol[422] = "GBPUSD";
   aLots[422] = 1.0;
   aDateOpen[422] = D'2011.11.25 12:16:23'+time_offset*3600;
   aPriceOpen[422] = 1.54953;
   aDateClose[422] = D'2011.11.25 13:35:13'+time_offset*3600;
   aPriceClose[422] = 1.54509;

   // ========== 423 ===== 418 ==========
   aType[423] = OP_BUY;
   aSymbol[423] = "GBPUSD";
   aLots[423] = 1.0;
   aDateOpen[423] = D'2011.11.25 13:00:38'+time_offset*3600;
   aPriceOpen[423] = 1.54618;
   aDateClose[423] = D'2011.11.25 13:34:55'+time_offset*3600;
   aPriceClose[423] = 1.54522;

   // ========== 424 ===== 415 ==========
   aType[424] = OP_SELL;
   aSymbol[424] = "EURUSD";
   aLots[424] = 1.0;
   aDateOpen[424] = D'2011.11.27 23:28:55'+time_offset*3600;
   aPriceOpen[424] = 1.33176;
   aDateClose[424] = D'2011.11.28 01:20:07'+time_offset*3600;
   aPriceClose[424] = 1.33168;

   // ========== 425 ===== 416 ==========
   aType[425] = OP_SELL;
   aSymbol[425] = "EURUSD";
   aLots[425] = 1.0;
   aDateOpen[425] = D'2011.11.27 23:32:53'+time_offset*3600;
   aPriceOpen[425] = 1.33222;
   aDateClose[425] = D'2011.11.28 01:06:55'+time_offset*3600;
   aPriceClose[425] = 1.33096;

   // ========== 426 ===== 414 ==========
   aType[426] = OP_SELL;
   aSymbol[426] = "EURUSD";
   aLots[426] = 1.0;
   aDateOpen[426] = D'2011.11.28 02:01:19'+time_offset*3600;
   aPriceOpen[426] = 1.33159;
   aDateClose[426] = D'2011.11.28 03:20:34'+time_offset*3600;
   aPriceClose[426] = 1.33097;

   // ========== 427 ===== 413 ==========
   aType[427] = OP_SELL;
   aSymbol[427] = "AUDUSD";
   aLots[427] = 1.0;
   aDateOpen[427] = D'2011.11.28 03:09:56'+time_offset*3600;
   aPriceOpen[427] = 0.98787;
   aDateClose[427] = D'2011.11.28 03:21:38'+time_offset*3600;
   aPriceClose[427] = 0.98407;

   // ========== 428 ===== 412 ==========
   aType[428] = OP_SELL;
   aSymbol[428] = "EURUSD";
   aLots[428] = 1.0;
   aDateOpen[428] = D'2011.11.28 04:15:44'+time_offset*3600;
   aPriceOpen[428] = 1.3278;
   aDateClose[428] = D'2011.11.28 05:53:47'+time_offset*3600;
   aPriceClose[428] = 1.33028;

   // ========== 429 ===== 405 ==========
   aType[429] = OP_BUY;
   aSymbol[429] = "USDCAD";
   aLots[429] = 1.0;
   aDateOpen[429] = D'2011.11.28 09:54:56'+time_offset*3600;
   aPriceOpen[429] = 1.035;
   aDateClose[429] = D'2011.11.28 16:40:12'+time_offset*3600;
   aPriceClose[429] = 1.03308;

   // ========== 430 ===== 410 ==========
   aType[430] = OP_BUY;
   aSymbol[430] = "USDCAD";
   aLots[430] = 1.0;
   aDateOpen[430] = D'2011.11.28 10:20:17'+time_offset*3600;
   aPriceOpen[430] = 1.033;
   aDateClose[430] = D'2011.11.28 12:30:17'+time_offset*3600;
   aPriceClose[430] = 1.03403;

   // ========== 431 ===== 411 ==========
   aType[431] = OP_BUY;
   aSymbol[431] = "USDCAD";
   aLots[431] = 1.0;
   aDateOpen[431] = D'2011.11.28 11:04:56'+time_offset*3600;
   aPriceOpen[431] = 1.03265;
   aDateClose[431] = D'2011.11.28 11:50:50'+time_offset*3600;
   aPriceClose[431] = 1.03305;

   // ========== 432 ===== 409 ==========
   aType[432] = OP_SELL;
   aSymbol[432] = "AUDUSD";
   aLots[432] = 1.0;
   aDateOpen[432] = D'2011.11.28 13:33:45'+time_offset*3600;
   aPriceOpen[432] = 0.99668;
   aDateClose[432] = D'2011.11.28 15:41:25'+time_offset*3600;
   aPriceClose[432] = 0.9952;

   // ========== 433 ===== 408 ==========
   aType[433] = OP_SELL;
   aSymbol[433] = "AUDUSD";
   aLots[433] = 1.0;
   aDateOpen[433] = D'2011.11.28 13:43:24'+time_offset*3600;
   aPriceOpen[433] = 0.99625;
   aDateClose[433] = D'2011.11.28 16:08:05'+time_offset*3600;
   aPriceClose[433] = 0.99226;

   // ========== 434 ===== 407 ==========
   aType[434] = OP_SELL;
   aSymbol[434] = "AUDUSD";
   aLots[434] = 1.0;
   aDateOpen[434] = D'2011.11.28 13:44:31'+time_offset*3600;
   aPriceOpen[434] = 0.9963;
   aDateClose[434] = D'2011.11.28 16:16:05'+time_offset*3600;
   aPriceClose[434] = 0.9913;

   // ========== 435 ===== 406 ==========
   aType[435] = OP_SELL;
   aSymbol[435] = "AUDUSD";
   aLots[435] = 1.0;
   aDateOpen[435] = D'2011.11.28 16:30:47'+time_offset*3600;
   aPriceOpen[435] = 0.99219;
   aDateClose[435] = D'2011.11.28 16:39:10'+time_offset*3600;
   aPriceClose[435] = 0.99155;

   // ========== 436 ===== 404 ==========
   aType[436] = OP_BUY;
   aSymbol[436] = "USDCAD";
   aLots[436] = 1.0;
   aDateOpen[436] = D'2011.11.28 16:45:31'+time_offset*3600;
   aPriceOpen[436] = 1.03288;
   aDateClose[436] = D'2011.11.28 16:51:43'+time_offset*3600;
   aPriceClose[436] = 1.033;

   // ========== 437 ===== 403 ==========
   aType[437] = OP_SELL;
   aSymbol[437] = "AUDUSD";
   aLots[437] = 1.0;
   aDateOpen[437] = D'2011.11.28 16:49:47'+time_offset*3600;
   aPriceOpen[437] = 0.99199;
   aDateClose[437] = D'2011.11.28 17:30:22'+time_offset*3600;
   aPriceClose[437] = 0.99113;

   // ========== 438 ===== 402 ==========
   aType[438] = OP_BUY;
   aSymbol[438] = "GBPUSD";
   aLots[438] = 1.0;
   aDateOpen[438] = D'2011.11.29 00:12:35'+time_offset*3600;
   aPriceOpen[438] = 1.54846;
   aDateClose[438] = D'2011.11.29 00:45:53'+time_offset*3600;
   aPriceClose[438] = 1.54883;

   // ========== 439 ===== 401 ==========
   aType[439] = OP_BUY;
   aSymbol[439] = "GBPUSD";
   aLots[439] = 1.0;
   aDateOpen[439] = D'2011.11.29 00:32:35'+time_offset*3600;
   aPriceOpen[439] = 1.54716;
   aDateClose[439] = D'2011.11.29 01:20:56'+time_offset*3600;
   aPriceClose[439] = 1.54873;

   // ========== 440 ===== 400 ==========
   aType[440] = OP_SELL;
   aSymbol[440] = "EURUSD";
   aLots[440] = 1.0;
   aDateOpen[440] = D'2011.11.29 08:02:11'+time_offset*3600;
   aPriceOpen[440] = 1.33325;
   aDateClose[440] = D'2011.11.29 08:17:05'+time_offset*3600;
   aPriceClose[440] = 1.33303;

   // ========== 441 ===== 399 ==========
   aType[441] = OP_SELL;
   aSymbol[441] = "EURUSD";
   aLots[441] = 1.0;
   aDateOpen[441] = D'2011.11.29 08:40:51'+time_offset*3600;
   aPriceOpen[441] = 1.33246;
   aDateClose[441] = D'2011.11.29 08:51:19'+time_offset*3600;
   aPriceClose[441] = 1.33227;

   // ========== 442 ===== 398 ==========
   aType[442] = OP_BUY;
   aSymbol[442] = "EURUSD";
   aLots[442] = 1.0;
   aDateOpen[442] = D'2011.11.29 10:14:21'+time_offset*3600;
   aPriceOpen[442] = 1.33866;
   aDateClose[442] = D'2011.11.29 10:15:43'+time_offset*3600;
   aPriceClose[442] = 1.33976;

   // ========== 443 ===== 397 ==========
   aType[443] = OP_BUY;
   aSymbol[443] = "EURUSD";
   aLots[443] = 1.0;
   aDateOpen[443] = D'2011.11.29 11:23:59'+time_offset*3600;
   aPriceOpen[443] = 1.34017;
   aDateClose[443] = D'2011.11.29 11:43:32'+time_offset*3600;
   aPriceClose[443] = 1.33882;

   // ========== 444 ===== 396 ==========
   aType[444] = OP_SELL;
   aSymbol[444] = "EURUSD";
   aLots[444] = 1.0;
   aDateOpen[444] = D'2011.11.30 06:57:02'+time_offset*3600;
   aPriceOpen[444] = 1.33015;
   aDateClose[444] = D'2011.11.30 07:04:56'+time_offset*3600;
   aPriceClose[444] = 1.32952;

   // ========== 445 ===== 395 ==========
   aType[445] = OP_SELL;
   aSymbol[445] = "EURUSD";
   aLots[445] = 1.0;
   aDateOpen[445] = D'2011.11.30 07:16:09'+time_offset*3600;
   aPriceOpen[445] = 1.32662;
   aDateClose[445] = D'2011.11.30 09:08:19'+time_offset*3600;
   aPriceClose[445] = 1.32906;

   // ========== 446 ===== 394 ==========
   aType[446] = OP_SELL;
   aSymbol[446] = "EURUSD";
   aLots[446] = 1.0;
   aDateOpen[446] = D'2011.11.30 07:17:31'+time_offset*3600;
   aPriceOpen[446] = 1.32669;
   aDateClose[446] = D'2011.11.30 09:08:23'+time_offset*3600;
   aPriceClose[446] = 1.32908;

   // ========== 447 ===== 393 ==========
   aType[447] = OP_SELL;
   aSymbol[447] = "EURUSD";
   aLots[447] = 1.0;
   aDateOpen[447] = D'2011.11.30 07:18:22'+time_offset*3600;
   aPriceOpen[447] = 1.32632;
   aDateClose[447] = D'2011.11.30 09:08:27'+time_offset*3600;
   aPriceClose[447] = 1.32906;

   // ========== 448 ===== 392 ==========
   aType[448] = OP_SELL;
   aSymbol[448] = "EURUSD";
   aLots[448] = 1.0;
   aDateOpen[448] = D'2011.11.30 07:20:09'+time_offset*3600;
   aPriceOpen[448] = 1.32623;
   aDateClose[448] = D'2011.11.30 09:08:30'+time_offset*3600;
   aPriceClose[448] = 1.32915;

   // ========== 449 ===== 389 ==========
   aType[449] = OP_BUY;
   aSymbol[449] = "EURUSD";
   aLots[449] = 1.0;
   aDateOpen[449] = D'2011.11.30 13:12:16'+time_offset*3600;
   aPriceOpen[449] = 1.34301;
   aDateClose[449] = D'2011.12.01 02:39:25'+time_offset*3600;
   aPriceClose[449] = 1.34357;

   // ========== 450 ===== 388 ==========
   aType[450] = OP_BUY;
   aSymbol[450] = "EURUSD";
   aLots[450] = 1.0;
   aDateOpen[450] = D'2011.11.30 13:23:20'+time_offset*3600;
   aPriceOpen[450] = 1.34261;
   aDateClose[450] = D'2011.12.01 02:39:33'+time_offset*3600;
   aPriceClose[450] = 1.34365;

   // ========== 451 ===== 391 ==========
   aType[451] = OP_BUY;
   aSymbol[451] = "EURUSD";
   aLots[451] = 1.0;
   aDateOpen[451] = D'2011.11.30 14:03:12'+time_offset*3600;
   aPriceOpen[451] = 1.35103;
   aDateClose[451] = D'2011.11.30 14:06:48'+time_offset*3600;
   aPriceClose[451] = 1.35127;

   // ========== 452 ===== 390 ==========
   aType[452] = OP_BUY;
   aSymbol[452] = "EURUSD";
   aLots[452] = 1.0;
   aDateOpen[452] = D'2011.11.30 14:10:09'+time_offset*3600;
   aPriceOpen[452] = 1.34987;
   aDateClose[452] = D'2011.11.30 14:16:43'+time_offset*3600;
   aPriceClose[452] = 1.35062;

   // ========== 453 ===== 383 ==========
   aType[453] = OP_BUY;
   aSymbol[453] = "EURUSD";
   aLots[453] = 1.0;
   aDateOpen[453] = D'2011.11.30 14:23:38'+time_offset*3600;
   aPriceOpen[453] = 1.34938;
   aDateClose[453] = D'2011.12.01 09:49:46'+time_offset*3600;
   aPriceClose[453] = 1.34855;

   // ========== 454 ===== 384 ==========
   aType[454] = OP_BUY;
   aSymbol[454] = "EURUSD";
   aLots[454] = 1.0;
   aDateOpen[454] = D'2011.11.30 14:32:49'+time_offset*3600;
   aPriceOpen[454] = 1.3481;
   aDateClose[454] = D'2011.12.01 09:41:38'+time_offset*3600;
   aPriceClose[454] = 1.34705;

   // ========== 455 ===== 387 ==========
   aType[455] = OP_BUY;
   aSymbol[455] = "AUDUSD";
   aLots[455] = 1.0;
   aDateOpen[455] = D'2011.12.01 02:43:13'+time_offset*3600;
   aPriceOpen[455] = 1.01913;
   aDateClose[455] = D'2011.12.01 04:36:38'+time_offset*3600;
   aPriceClose[455] = 1.0241;

   // ========== 456 ===== 386 ==========
   aType[456] = OP_BUY;
   aSymbol[456] = "AUDUSD";
   aLots[456] = 1.0;
   aDateOpen[456] = D'2011.12.01 02:44:03'+time_offset*3600;
   aPriceOpen[456] = 1.01927;
   aDateClose[456] = D'2011.12.01 04:52:42'+time_offset*3600;
   aPriceClose[456] = 1.0256;

   // ========== 457 ===== 385 ==========
   aType[457] = OP_BUY;
   aSymbol[457] = "EURUSD";
   aLots[457] = 1.0;
   aDateOpen[457] = D'2011.12.01 09:31:02'+time_offset*3600;
   aPriceOpen[457] = 1.3471;
   aDateClose[457] = D'2011.12.01 09:38:17'+time_offset*3600;
   aPriceClose[457] = 1.3471;

   // ========== 458 ===== 382 ==========
   aType[458] = OP_BUY;
   aSymbol[458] = "EURUSD";
   aLots[458] = 1.0;
   aDateOpen[458] = D'2011.12.01 13:18:40'+time_offset*3600;
   aPriceOpen[458] = 1.35094;
   aDateClose[458] = D'2011.12.01 13:22:30'+time_offset*3600;
   aPriceClose[458] = 1.35146;

   // ========== 459 ===== 381 ==========
   aType[459] = OP_SELL;
   aSymbol[459] = "EURUSD";
   aLots[459] = 1.0;
   aDateOpen[459] = D'2011.12.01 15:33:46'+time_offset*3600;
   aPriceOpen[459] = 1.34851;
   aDateClose[459] = D'2011.12.01 15:35:56'+time_offset*3600;
   aPriceClose[459] = 1.34745;

   // ========== 460 ===== 380 ==========
   aType[460] = OP_SELL;
   aSymbol[460] = "EURUSD";
   aLots[460] = 1.0;
   aDateOpen[460] = D'2011.12.01 16:08:07'+time_offset*3600;
   aPriceOpen[460] = 1.34753;
   aDateClose[460] = D'2011.12.01 16:18:11'+time_offset*3600;
   aPriceClose[460] = 1.34672;

   // ========== 461 ===== 379 ==========
   aType[461] = OP_BUY;
   aSymbol[461] = "EURUSD";
   aLots[461] = 1.0;
   aDateOpen[461] = D'2011.12.02 08:00:36'+time_offset*3600;
   aPriceOpen[461] = 1.34842;
   aDateClose[461] = D'2011.12.02 08:06:07'+time_offset*3600;
   aPriceClose[461] = 1.34857;

   // ========== 462 ===== 378 ==========
   aType[462] = OP_BUY;
   aSymbol[462] = "GBPUSD";
   aLots[462] = 1.0;
   aDateOpen[462] = D'2011.12.02 08:34:31'+time_offset*3600;
   aPriceOpen[462] = 1.57042;
   aDateClose[462] = D'2011.12.02 08:46:34'+time_offset*3600;
   aPriceClose[462] = 1.57024;

   // ========== 463 ===== 377 ==========
   aType[463] = OP_SELL;
   aSymbol[463] = "GBPUSD";
   aLots[463] = 1.0;
   aDateOpen[463] = D'2011.12.02 08:54:12'+time_offset*3600;
   aPriceOpen[463] = 1.56887;
   aDateClose[463] = D'2011.12.02 09:14:19'+time_offset*3600;
   aPriceClose[463] = 1.56951;

   // ========== 464 ===== 376 ==========
   aType[464] = OP_BUY;
   aSymbol[464] = "EURUSD";
   aLots[464] = 1.0;
   aDateOpen[464] = D'2011.12.02 09:18:30'+time_offset*3600;
   aPriceOpen[464] = 1.34918;
   aDateClose[464] = D'2011.12.02 09:35:11'+time_offset*3600;
   aPriceClose[464] = 1.34793;

   // ========== 465 ===== 372 ==========
   aType[465] = OP_BUY;
   aSymbol[465] = "GBPUSD";
   aLots[465] = 1.0;
   aDateOpen[465] = D'2011.12.02 10:09:30'+time_offset*3600;
   aPriceOpen[465] = 1.57042;
   aDateClose[465] = D'2011.12.02 13:05:18'+time_offset*3600;
   aPriceClose[465] = 1.57104;

   // ========== 466 ===== 373 ==========
   aType[466] = OP_BUY;
   aSymbol[466] = "GBPUSD";
   aLots[466] = 1.0;
   aDateOpen[466] = D'2011.12.02 10:10:13'+time_offset*3600;
   aPriceOpen[466] = 1.57037;
   aDateClose[466] = D'2011.12.02 13:05:11'+time_offset*3600;
   aPriceClose[466] = 1.57077;

   // ========== 467 ===== 374 ==========
   aType[467] = OP_BUY;
   aSymbol[467] = "GBPUSD";
   aLots[467] = 1.0;
   aDateOpen[467] = D'2011.12.02 10:11:31'+time_offset*3600;
   aPriceOpen[467] = 1.57021;
   aDateClose[467] = D'2011.12.02 12:04:15'+time_offset*3600;
   aPriceClose[467] = 1.56869;

   // ========== 468 ===== 375 ==========
   aType[468] = OP_BUY;
   aSymbol[468] = "GBPUSD";
   aLots[468] = 1.0;
   aDateOpen[468] = D'2011.12.02 10:13:50'+time_offset*3600;
   aPriceOpen[468] = 1.56999;
   aDateClose[468] = D'2011.12.02 12:04:10'+time_offset*3600;
   aPriceClose[468] = 1.56863;

   // ========== 469 ===== 368 ==========
   aType[469] = OP_BUY;
   aSymbol[469] = "EURUSD";
   aLots[469] = 1.0;
   aDateOpen[469] = D'2011.12.02 12:38:55'+time_offset*3600;
   aPriceOpen[469] = 1.35351;
   aDateClose[469] = D'2011.12.02 13:36:47'+time_offset*3600;
   aPriceClose[469] = 1.34997;

   // ========== 470 ===== 369 ==========
   aType[470] = OP_BUY;
   aSymbol[470] = "EURUSD";
   aLots[470] = 1.0;
   aDateOpen[470] = D'2011.12.02 12:39:37'+time_offset*3600;
   aPriceOpen[470] = 1.35317;
   aDateClose[470] = D'2011.12.02 13:36:43'+time_offset*3600;
   aPriceClose[470] = 1.34998;

   // ========== 471 ===== 370 ==========
   aType[471] = OP_BUY;
   aSymbol[471] = "EURUSD";
   aLots[471] = 1.0;
   aDateOpen[471] = D'2011.12.02 13:19:59'+time_offset*3600;
   aPriceOpen[471] = 1.35219;
   aDateClose[471] = D'2011.12.02 13:36:31'+time_offset*3600;
   aPriceClose[471] = 1.34991;

   // ========== 472 ===== 371 ==========
   aType[472] = OP_BUY;
   aSymbol[472] = "EURUSD";
   aLots[472] = 1.0;
   aDateOpen[472] = D'2011.12.02 13:20:23'+time_offset*3600;
   aPriceOpen[472] = 1.35242;
   aDateClose[472] = D'2011.12.02 13:36:26'+time_offset*3600;
   aPriceClose[472] = 1.34994;

   // ========== 473 ===== 367 ==========
   aType[473] = OP_SELL;
   aSymbol[473] = "USDCAD";
   aLots[473] = 1.0;
   aDateOpen[473] = D'2011.12.04 22:10:00'+time_offset*3600;
   aPriceOpen[473] = 1.01723;
   aDateClose[473] = D'2011.12.05 00:32:04'+time_offset*3600;
   aPriceClose[473] = 1.0162;

   // ========== 474 ===== 365 ==========
   aType[474] = OP_SELL;
   aSymbol[474] = "USDCAD";
   aLots[474] = 1.0;
   aDateOpen[474] = D'2011.12.04 22:56:36'+time_offset*3600;
   aPriceOpen[474] = 1.0182;
   aDateClose[474] = D'2011.12.05 07:51:44'+time_offset*3600;
   aPriceClose[474] = 1.0165;

   // ========== 475 ===== 366 ==========
   aType[475] = OP_SELL;
   aSymbol[475] = "USDCAD";
   aLots[475] = 1.0;
   aDateOpen[475] = D'2011.12.05 06:02:33'+time_offset*3600;
   aPriceOpen[475] = 1.01819;
   aDateClose[475] = D'2011.12.05 07:10:20'+time_offset*3600;
   aPriceClose[475] = 1.01715;

   // ========== 476 ===== 357 ==========
   aType[476] = OP_SELL;
   aSymbol[476] = "USDCHF";
   aLots[476] = 1.0;
   aDateOpen[476] = D'2011.12.05 07:40:57'+time_offset*3600;
   aPriceOpen[476] = 0.92031;
   aDateClose[476] = D'2011.12.06 14:04:31'+time_offset*3600;
   aPriceClose[476] = 0.9282;

   // ========== 477 ===== 356 ==========
   aType[477] = OP_SELL;
   aSymbol[477] = "USDCHF";
   aLots[477] = 1.0;
   aDateOpen[477] = D'2011.12.05 07:41:35'+time_offset*3600;
   aPriceOpen[477] = 0.92039;
   aDateClose[477] = D'2011.12.06 14:04:35'+time_offset*3600;
   aPriceClose[477] = 0.92821;

   // ========== 478 ===== 364 ==========
   aType[478] = OP_SELL;
   aSymbol[478] = "USDCHF";
   aLots[478] = 1.0;
   aDateOpen[478] = D'2011.12.06 06:34:12'+time_offset*3600;
   aPriceOpen[478] = 0.9225;
   aDateClose[478] = D'2011.12.06 07:00:46'+time_offset*3600;
   aPriceClose[478] = 0.92336;

   // ========== 479 ===== 362 ==========
   aType[479] = OP_SELL;
   aSymbol[479] = "EURUSD";
   aLots[479] = 1.0;
   aDateOpen[479] = D'2011.12.06 07:14:26'+time_offset*3600;
   aPriceOpen[479] = 1.3354;
   aDateClose[479] = D'2011.12.06 07:24:34'+time_offset*3600;
   aPriceClose[479] = 1.33527;

   // ========== 480 ===== 363 ==========
   aType[480] = OP_SELL;
   aSymbol[480] = "EURUSD";
   aLots[480] = 1.0;
   aDateOpen[480] = D'2011.12.06 07:15:03'+time_offset*3600;
   aPriceOpen[480] = 1.33581;
   aDateClose[480] = D'2011.12.06 07:24:29'+time_offset*3600;
   aPriceClose[480] = 1.33534;

   // ========== 481 ===== 360 ==========
   aType[481] = OP_SELL;
   aSymbol[481] = "EURUSD";
   aLots[481] = 1.0;
   aDateOpen[481] = D'2011.12.06 07:34:11'+time_offset*3600;
   aPriceOpen[481] = 1.3342;
   aDateClose[481] = D'2011.12.06 08:19:40'+time_offset*3600;
   aPriceClose[481] = 1.33549;

   // ========== 482 ===== 361 ==========
   aType[482] = OP_SELL;
   aSymbol[482] = "EURUSD";
   aLots[482] = 1.0;
   aDateOpen[482] = D'2011.12.06 07:40:41'+time_offset*3600;
   aPriceOpen[482] = 1.33471;
   aDateClose[482] = D'2011.12.06 08:09:53'+time_offset*3600;
   aPriceClose[482] = 1.33426;

   // ========== 483 ===== 359 ==========
   aType[483] = OP_SELL;
   aSymbol[483] = "USDCHF";
   aLots[483] = 1.0;
   aDateOpen[483] = D'2011.12.06 08:17:12'+time_offset*3600;
   aPriceOpen[483] = 0.92878;
   aDateClose[483] = D'2011.12.06 13:54:48'+time_offset*3600;
   aPriceClose[483] = 0.92686;

   // ========== 484 ===== 358 ==========
   aType[484] = OP_SELL;
   aSymbol[484] = "USDCHF";
   aLots[484] = 1.0;
   aDateOpen[484] = D'2011.12.06 09:19:24'+time_offset*3600;
   aPriceOpen[484] = 0.92695;
   aDateClose[484] = D'2011.12.06 14:04:27'+time_offset*3600;
   aPriceClose[484] = 0.9281;

   // ========== 485 ===== 355 ==========
   aType[485] = OP_SELL;
   aSymbol[485] = "USDCAD";
   aLots[485] = 1.0;
   aDateOpen[485] = D'2011.12.06 14:33:43'+time_offset*3600;
   aPriceOpen[485] = 1.01266;
   aDateClose[485] = D'2011.12.06 16:15:20'+time_offset*3600;
   aPriceClose[485] = 1.01241;

   // ========== 486 ===== 354 ==========
   aType[486] = OP_BUY;
   aSymbol[486] = "GBPUSD";
   aLots[486] = 1.0;
   aDateOpen[486] = D'2011.12.08 09:48:27'+time_offset*3600;
   aPriceOpen[486] = 1.57386;
   aDateClose[486] = D'2011.12.08 10:19:41'+time_offset*3600;
   aPriceClose[486] = 1.57182;

   // ========== 487 ===== 350 ==========
   aType[487] = OP_BUY;
   aSymbol[487] = "EURUSD";
   aLots[487] = 1.0;
   aDateOpen[487] = D'2011.12.08 12:59:21'+time_offset*3600;
   aPriceOpen[487] = 1.34195;
   aDateClose[487] = D'2011.12.08 13:58:08'+time_offset*3600;
   aPriceClose[487] = 1.338;

   // ========== 488 ===== 353 ==========
   aType[488] = OP_SELL;
   aSymbol[488] = "USDCHF";
   aLots[488] = 1.0;
   aDateOpen[488] = D'2011.12.08 13:36:45'+time_offset*3600;
   aPriceOpen[488] = 0.91775;
   aDateClose[488] = D'2011.12.08 13:58:00'+time_offset*3600;
   aPriceClose[488] = 0.922;

   // ========== 489 ===== 352 ==========
   aType[489] = OP_SELL;
   aSymbol[489] = "USDCHF";
   aLots[489] = 1.0;
   aDateOpen[489] = D'2011.12.08 13:38:42'+time_offset*3600;
   aPriceOpen[489] = 0.9184;
   aDateClose[489] = D'2011.12.08 13:58:00'+time_offset*3600;
   aPriceClose[489] = 0.922;

   // ========== 490 ===== 351 ==========
   aType[490] = OP_SELL;
   aSymbol[490] = "USDCHF";
   aLots[490] = 1.0;
   aDateOpen[490] = D'2011.12.08 13:43:02'+time_offset*3600;
   aPriceOpen[490] = 0.919;
   aDateClose[490] = D'2011.12.08 13:58:00'+time_offset*3600;
   aPriceClose[490] = 0.922;

   // ========== 491 ===== 347 ==========
   aType[491] = OP_SELL;
   aSymbol[491] = "AUDUSD";
   aLots[491] = 1.0;
   aDateOpen[491] = D'2011.12.09 11:01:37'+time_offset*3600;
   aPriceOpen[491] = 1.01416;
   aDateClose[491] = D'2011.12.09 13:50:14'+time_offset*3600;
   aPriceClose[491] = 1.01393;

   // ========== 492 ===== 348 ==========
   aType[492] = OP_SELL;
   aSymbol[492] = "AUDUSD";
   aLots[492] = 1.0;
   aDateOpen[492] = D'2011.12.09 11:02:27'+time_offset*3600;
   aPriceOpen[492] = 1.0145;
   aDateClose[492] = D'2011.12.09 13:46:46'+time_offset*3600;
   aPriceClose[492] = 1.014;

   // ========== 493 ===== 346 ==========
   aType[493] = OP_SELL;
   aSymbol[493] = "AUDUSD";
   aLots[493] = 1.0;
   aDateOpen[493] = D'2011.12.09 11:04:41'+time_offset*3600;
   aPriceOpen[493] = 1.01483;
   aDateClose[493] = D'2011.12.09 13:50:21'+time_offset*3600;
   aPriceClose[493] = 1.0137;

   // ========== 494 ===== 349 ==========
   aType[494] = OP_SELL;
   aSymbol[494] = "AUDUSD";
   aLots[494] = 1.0;
   aDateOpen[494] = D'2011.12.09 11:05:08'+time_offset*3600;
   aPriceOpen[494] = 1.01492;
   aDateClose[494] = D'2011.12.09 13:46:41'+time_offset*3600;
   aPriceClose[494] = 1.01398;

   // ========== 495 ===== 345 ==========
   aType[495] = OP_SELL;
   aSymbol[495] = "AUDUSD";
   aLots[495] = 1.0;
   aDateOpen[495] = D'2011.12.09 17:22:07'+time_offset*3600;
   aPriceOpen[495] = 1.01921;
   aDateClose[495] = D'2011.12.12 03:34:24'+time_offset*3600;
   aPriceClose[495] = 1.01705;

   // ========== 496 ===== 344 ==========
   aType[496] = OP_SELL;
   aSymbol[496] = "AUDUSD";
   aLots[496] = 1.0;
   aDateOpen[496] = D'2011.12.09 17:23:55'+time_offset*3600;
   aPriceOpen[496] = 1.01928;
   aDateClose[496] = D'2011.12.12 05:09:48'+time_offset*3600;
   aPriceClose[496] = 1.01717;

   // ========== 497 ===== 343 ==========
   aType[497] = OP_SELL;
   aSymbol[497] = "AUDUSD";
   aLots[497] = 1.0;
   aDateOpen[497] = D'2011.12.09 17:25:24'+time_offset*3600;
   aPriceOpen[497] = 1.01914;
   aDateClose[497] = D'2011.12.12 05:09:56'+time_offset*3600;
   aPriceClose[497] = 1.01709;

   // ========== 498 ===== 342 ==========
   aType[498] = OP_SELL;
   aSymbol[498] = "AUDUSD";
   aLots[498] = 1.0;
   aDateOpen[498] = D'2011.12.09 17:45:23'+time_offset*3600;
   aPriceOpen[498] = 1.01974;
   aDateClose[498] = D'2011.12.12 05:10:14'+time_offset*3600;
   aPriceClose[498] = 1.01708;

   // ========== 499 ===== 340 ==========
   aType[499] = OP_SELL;
   aSymbol[499] = "AUDUSD";
   aLots[499] = 1.0;
   aDateOpen[499] = D'2011.12.13 08:53:42'+time_offset*3600;
   aPriceOpen[499] = 1.00907;
   aDateClose[499] = D'2011.12.13 09:51:28'+time_offset*3600;
   aPriceClose[499] = 1.0112;

   // ========== 500 ===== 337 ==========
   aType[500] = OP_SELL;
   aSymbol[500] = "AUDUSD";
   aLots[500] = 1.0;
   aDateOpen[500] = D'2011.12.13 08:56:23'+time_offset*3600;
   aPriceOpen[500] = 1.0083;
   aDateClose[500] = D'2011.12.13 14:45:41'+time_offset*3600;
   aPriceClose[500] = 1.01513;

   // ========== 501 ===== 341 ==========
   aType[501] = OP_SELL;
   aSymbol[501] = "AUDUSD";
   aLots[501] = 1.0;
   aDateOpen[501] = D'2011.12.13 09:00:17'+time_offset*3600;
   aPriceOpen[501] = 1.0091;
   aDateClose[501] = D'2011.12.13 09:51:24'+time_offset*3600;
   aPriceClose[501] = 1.0112;

   // ========== 502 ===== 338 ==========
   aType[502] = OP_SELL;
   aSymbol[502] = "AUDUSD";
   aLots[502] = 1.0;
   aDateOpen[502] = D'2011.12.13 11:09:57'+time_offset*3600;
   aPriceOpen[502] = 1.01276;
   aDateClose[502] = D'2011.12.13 14:34:48'+time_offset*3600;
   aPriceClose[502] = 1.01254;

   // ========== 503 ===== 339 ==========
   aType[503] = OP_SELL;
   aSymbol[503] = "AUDUSD";
   aLots[503] = 1.0;
   aDateOpen[503] = D'2011.12.13 11:17:28'+time_offset*3600;
   aPriceOpen[503] = 1.01305;
   aDateClose[503] = D'2011.12.13 14:06:31'+time_offset*3600;
   aPriceClose[503] = 1.01249;

   // ========== 504 ===== 336 ==========
   aType[504] = OP_BUY;
   aSymbol[504] = "EURUSD";
   aLots[504] = 1.0;
   aDateOpen[504] = D'2011.12.14 12:15:11'+time_offset*3600;
   aPriceOpen[504] = 1.30042;
   aDateClose[504] = D'2011.12.15 06:48:12'+time_offset*3600;
   aPriceClose[504] = 1.29885;

   // ========== 505 ===== 334 ==========
   aType[505] = OP_SELL;
   aSymbol[505] = "USDCHF";
   aLots[505] = 1.0;
   aDateOpen[505] = D'2011.12.14 12:52:18'+time_offset*3600;
   aPriceOpen[505] = 0.94854;
   aDateClose[505] = D'2011.12.15 07:49:51'+time_offset*3600;
   aPriceClose[505] = 0.948;

   // ========== 506 ===== 335 ==========
   aType[506] = OP_SELL;
   aSymbol[506] = "USDCHF";
   aLots[506] = 1.0;
   aDateOpen[506] = D'2011.12.14 14:01:10'+time_offset*3600;
   aPriceOpen[506] = 0.94797;
   aDateClose[506] = D'2011.12.15 07:49:51'+time_offset*3600;
   aPriceClose[506] = 0.948;

   // ========== 507 ===== 329 ==========
   aType[507] = OP_BUY;
   aSymbol[507] = "USDCHF";
   aLots[507] = 1.0;
   aDateOpen[507] = D'2011.12.15 08:30:22'+time_offset*3600;
   aPriceOpen[507] = 0.94199;
   aDateClose[507] = D'2011.12.20 09:52:51'+time_offset*3600;
   aPriceClose[507] = 0.93218;

   // ========== 508 ===== 330 ==========
   aType[508] = OP_BUY;
   aSymbol[508] = "USDCHF";
   aLots[508] = 1.0;
   aDateOpen[508] = D'2011.12.15 08:41:07'+time_offset*3600;
   aPriceOpen[508] = 0.94173;
   aDateClose[508] = D'2011.12.20 09:52:48'+time_offset*3600;
   aPriceClose[508] = 0.93223;

   // ========== 509 ===== 331 ==========
   aType[509] = OP_BUY;
   aSymbol[509] = "USDCHF";
   aLots[509] = 1.0;
   aDateOpen[509] = D'2011.12.15 08:42:16'+time_offset*3600;
   aPriceOpen[509] = 0.9421;
   aDateClose[509] = D'2011.12.20 09:52:44'+time_offset*3600;
   aPriceClose[509] = 0.93218;

   // ========== 510 ===== 333 ==========
   aType[510] = OP_SELL;
   aSymbol[510] = "GBPUSD";
   aLots[510] = 1.0;
   aDateOpen[510] = D'2011.12.15 12:03:57'+time_offset*3600;
   aPriceOpen[510] = 1.55098;
   aDateClose[510] = D'2011.12.15 16:01:37'+time_offset*3600;
   aPriceClose[510] = 1.54879;

   // ========== 511 ===== 332 ==========
   aType[511] = OP_BUY;
   aSymbol[511] = "USDCHF";
   aLots[511] = 1.0;
   aDateOpen[511] = D'2011.12.16 13:26:41'+time_offset*3600;
   aPriceOpen[511] = 0.93622;
   aDateClose[511] = D'2011.12.20 09:52:39'+time_offset*3600;
   aPriceClose[511] = 0.93258;

   // ========== 512 ===== 328 ==========
   aType[512] = OP_SELL;
   aSymbol[512] = "AUDUSD";
   aLots[512] = 1.0;
   aDateOpen[512] = D'2011.12.21 07:12:50'+time_offset*3600;
   aPriceOpen[512] = 1.0176;
   aDateClose[512] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPriceClose[512] = 1.0135;

   // ========== 513 ===== 325 ==========
   aType[513] = OP_SELL;
   aSymbol[513] = "AUDUSD";
   aLots[513] = 1.0;
   aDateOpen[513] = D'2011.12.21 07:16:09'+time_offset*3600;
   aPriceOpen[513] = 1.01765;
   aDateClose[513] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPriceClose[513] = 1.0135;

   // ========== 514 ===== 327 ==========
   aType[514] = OP_SELL;
   aSymbol[514] = "AUDUSD";
   aLots[514] = 1.0;
   aDateOpen[514] = D'2011.12.21 07:18:17'+time_offset*3600;
   aPriceOpen[514] = 1.01807;
   aDateClose[514] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPriceClose[514] = 1.0135;

   // ========== 515 ===== 326 ==========
   aType[515] = OP_SELL;
   aSymbol[515] = "AUDUSD";
   aLots[515] = 1.0;
   aDateOpen[515] = D'2011.12.21 07:36:08'+time_offset*3600;
   aPriceOpen[515] = 1.01806;
   aDateClose[515] = D'2011.12.21 11:39:18'+time_offset*3600;
   aPriceClose[515] = 1.0135;

   // ========== 516 ===== 324 ==========
   aType[516] = OP_BUY;
   aSymbol[516] = "AUDUSD";
   aLots[516] = 1.0;
   aDateOpen[516] = D'2011.12.21 12:25:48'+time_offset*3600;
   aPriceOpen[516] = 1.01203;
   aDateClose[516] = D'2011.12.22 08:10:27'+time_offset*3600;
   aPriceClose[516] = 1.0125;

   // ========== 517 ===== 321 ==========
   aType[517] = OP_BUY;
   aSymbol[517] = "AUDUSD";
   aLots[517] = 1.0;
   aDateOpen[517] = D'2011.12.21 12:45:25'+time_offset*3600;
   aPriceOpen[517] = 1.01025;
   aDateClose[517] = D'2011.12.22 08:23:18'+time_offset*3600;
   aPriceClose[517] = 1.01354;

   // ========== 518 ===== 323 ==========
   aType[518] = OP_BUY;
   aSymbol[518] = "AUDUSD";
   aLots[518] = 1.0;
   aDateOpen[518] = D'2011.12.21 12:45:52'+time_offset*3600;
   aPriceOpen[518] = 1.0097;
   aDateClose[518] = D'2011.12.22 08:10:27'+time_offset*3600;
   aPriceClose[518] = 1.0125;

   // ========== 519 ===== 322 ==========
   aType[519] = OP_BUY;
   aSymbol[519] = "AUDUSD";
   aLots[519] = 1.0;
   aDateOpen[519] = D'2011.12.21 12:46:51'+time_offset*3600;
   aPriceOpen[519] = 1.00961;
   aDateClose[519] = D'2011.12.22 08:21:32'+time_offset*3600;
   aPriceClose[519] = 1.01313;

   // ========== 520 ===== 320 ==========
   aType[520] = OP_SELL;
   aSymbol[520] = "EURUSD";
   aLots[520] = 1.0;
   aDateOpen[520] = D'2011.12.23 13:15:33'+time_offset*3600;
   aPriceOpen[520] = 1.30568;
   aDateClose[520] = D'2011.12.23 14:11:34'+time_offset*3600;
   aPriceClose[520] = 1.30483;

   // ========== 521 ===== 316 ==========
   aType[521] = OP_SELL;
   aSymbol[521] = "EURUSD";
   aLots[521] = 1.0;
   aDateOpen[521] = D'2011.12.29 17:03:13'+time_offset*3600;
   aPriceOpen[521] = 1.2955;
   aDateClose[521] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPriceClose[521] = 1.2905;

   // ========== 522 ===== 317 ==========
   aType[522] = OP_SELL;
   aSymbol[522] = "EURUSD";
   aLots[522] = 1.0;
   aDateOpen[522] = D'2011.12.29 17:03:43'+time_offset*3600;
   aPriceOpen[522] = 1.29541;
   aDateClose[522] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPriceClose[522] = 1.2905;

   // ========== 523 ===== 318 ==========
   aType[523] = OP_SELL;
   aSymbol[523] = "EURUSD";
   aLots[523] = 1.0;
   aDateOpen[523] = D'2011.12.29 21:16:01'+time_offset*3600;
   aPriceOpen[523] = 1.29602;
   aDateClose[523] = D'2011.12.29 23:15:20'+time_offset*3600;
   aPriceClose[523] = 1.29543;

   // ========== 524 ===== 319 ==========
   aType[524] = OP_SELL;
   aSymbol[524] = "EURUSD";
   aLots[524] = 1.0;
   aDateOpen[524] = D'2011.12.29 22:10:50'+time_offset*3600;
   aPriceOpen[524] = 1.2959;
   aDateClose[524] = D'2011.12.29 23:15:17'+time_offset*3600;
   aPriceClose[524] = 1.29543;

   // ========== 525 ===== 314 ==========
   aType[525] = OP_SELL;
   aSymbol[525] = "EURUSD";
   aLots[525] = 1.0;
   aDateOpen[525] = D'2011.12.30 00:05:32'+time_offset*3600;
   aPriceOpen[525] = 1.29517;
   aDateClose[525] = D'2011.12.30 11:50:41'+time_offset*3600;
   aPriceClose[525] = 1.2933;

   // ========== 526 ===== 315 ==========
   aType[526] = OP_SELL;
   aSymbol[526] = "EURUSD";
   aLots[526] = 1.0;
   aDateOpen[526] = D'2011.12.30 00:50:58'+time_offset*3600;
   aPriceOpen[526] = 1.29537;
   aDateClose[526] = D'2011.12.30 11:44:43'+time_offset*3600;
   aPriceClose[526] = 1.2927;

   // ========== 527 ===== 313 ==========
   aType[527] = OP_SELL;
   aSymbol[527] = "GBPUSD";
   aLots[527] = 1.0;
   aDateOpen[527] = D'2011.12.30 12:00:03'+time_offset*3600;
   aPriceOpen[527] = 1.546;
   aDateClose[527] = D'2012.01.02 07:15:24'+time_offset*3600;
   aPriceClose[527] = 1.54996;

   // ========== 528 ===== 312 ==========
   aType[528] = OP_SELL;
   aSymbol[528] = "GBPUSD";
   aLots[528] = 1.0;
   aDateOpen[528] = D'2011.12.30 12:02:57'+time_offset*3600;
   aPriceOpen[528] = 1.54577;
   aDateClose[528] = D'2012.01.02 07:15:40'+time_offset*3600;
   aPriceClose[528] = 1.54995;

   // ========== 529 ===== 311 ==========
   aType[529] = OP_SELL;
   aSymbol[529] = "GBPUSD";
   aLots[529] = 1.0;
   aDateOpen[529] = D'2011.12.30 12:11:32'+time_offset*3600;
   aPriceOpen[529] = 1.54582;
   aDateClose[529] = D'2012.01.02 07:15:46'+time_offset*3600;
   aPriceClose[529] = 1.54909;

   // ========== 530 ===== 310 ==========
   aType[530] = OP_SELL;
   aSymbol[530] = "GBPUSD";
   aLots[530] = 1.0;
   aDateOpen[530] = D'2011.12.30 12:15:12'+time_offset*3600;
   aPriceOpen[530] = 1.5459;
   aDateClose[530] = D'2012.01.02 07:15:52'+time_offset*3600;
   aPriceClose[530] = 1.55039;

   // ========== 531 ===== 309 ==========
   aType[531] = OP_SELL;
   aSymbol[531] = "USDCHF";
   aLots[531] = 1.0;
   aDateOpen[531] = D'2012.01.03 10:04:36'+time_offset*3600;
   aPriceOpen[531] = 0.93283;
   aDateClose[531] = D'2012.01.03 11:32:21'+time_offset*3600;
   aPriceClose[531] = 0.93216;

   // ========== 532 ===== 305 ==========
   aType[532] = OP_SELL;
   aSymbol[532] = "AUDUSD";
   aLots[532] = 1.0;
   aDateOpen[532] = D'2012.01.03 11:39:49'+time_offset*3600;
   aPriceOpen[532] = 1.0359;
   aDateClose[532] = D'2012.01.04 02:19:39'+time_offset*3600;
   aPriceClose[532] = 1.03452;

   // ========== 533 ===== 306 ==========
   aType[533] = OP_SELL;
   aSymbol[533] = "AUDUSD";
   aLots[533] = 1.0;
   aDateOpen[533] = D'2012.01.03 11:40:29'+time_offset*3600;
   aPriceOpen[533] = 1.03587;
   aDateClose[533] = D'2012.01.04 02:19:33'+time_offset*3600;
   aPriceClose[533] = 1.03452;

   // ========== 534 ===== 307 ==========
   aType[534] = OP_SELL;
   aSymbol[534] = "AUDUSD";
   aLots[534] = 1.0;
   aDateOpen[534] = D'2012.01.03 11:41:34'+time_offset*3600;
   aPriceOpen[534] = 1.03594;
   aDateClose[534] = D'2012.01.04 02:19:29'+time_offset*3600;
   aPriceClose[534] = 1.0345;

   // ========== 535 ===== 308 ==========
   aType[535] = OP_SELL;
   aSymbol[535] = "AUDUSD";
   aLots[535] = 1.0;
   aDateOpen[535] = D'2012.01.03 11:42:27'+time_offset*3600;
   aPriceOpen[535] = 1.03604;
   aDateClose[535] = D'2012.01.04 02:19:26'+time_offset*3600;
   aPriceClose[535] = 1.0345;

   // ========== 536 ===== 304 ==========
   aType[536] = OP_SELL;
   aSymbol[536] = "GBPUSD";
   aLots[536] = 1.0;
   aDateOpen[536] = D'2012.01.04 07:24:39'+time_offset*3600;
   aPriceOpen[536] = 1.56479;
   aDateClose[536] = D'2012.01.04 08:08:21'+time_offset*3600;
   aPriceClose[536] = 1.56635;

   // ========== 537 ===== 303 ==========
   aType[537] = OP_SELL;
   aSymbol[537] = "GBPUSD";
   aLots[537] = 1.0;
   aDateOpen[537] = D'2012.01.04 07:25:58'+time_offset*3600;
   aPriceOpen[537] = 1.56465;
   aDateClose[537] = D'2012.01.04 08:08:25'+time_offset*3600;
   aPriceClose[537] = 1.56639;

   // ========== 538 ===== 302 ==========
   aType[538] = OP_SELL;
   aSymbol[538] = "GBPUSD";
   aLots[538] = 1.0;
   aDateOpen[538] = D'2012.01.04 07:27:18'+time_offset*3600;
   aPriceOpen[538] = 1.56471;
   aDateClose[538] = D'2012.01.04 08:24:25'+time_offset*3600;
   aPriceClose[538] = 1.56584;

   // ========== 539 ===== 301 ==========
   aType[539] = OP_SELL;
   aSymbol[539] = "GBPUSD";
   aLots[539] = 1.0;
   aDateOpen[539] = D'2012.01.04 07:28:10'+time_offset*3600;
   aPriceOpen[539] = 1.56474;
   aDateClose[539] = D'2012.01.04 08:24:30'+time_offset*3600;
   aPriceClose[539] = 1.56585;

   // ========== 540 ===== 297 ==========
   aType[540] = OP_BUY;
   aSymbol[540] = "EURUSD";
   aLots[540] = 1.0;
   aDateOpen[540] = D'2012.01.04 08:09:40'+time_offset*3600;
   aPriceOpen[540] = 1.30631;
   aDateClose[540] = D'2012.01.04 08:55:59'+time_offset*3600;
   aPriceClose[540] = 1.30357;

   // ========== 541 ===== 298 ==========
   aType[541] = OP_BUY;
   aSymbol[541] = "EURUSD";
   aLots[541] = 1.0;
   aDateOpen[541] = D'2012.01.04 08:12:40'+time_offset*3600;
   aPriceOpen[541] = 1.3064;
   aDateClose[541] = D'2012.01.04 08:55:56'+time_offset*3600;
   aPriceClose[541] = 1.30352;

   // ========== 542 ===== 299 ==========
   aType[542] = OP_BUY;
   aSymbol[542] = "EURUSD";
   aLots[542] = 1.0;
   aDateOpen[542] = D'2012.01.04 08:25:34'+time_offset*3600;
   aPriceOpen[542] = 1.30623;
   aDateClose[542] = D'2012.01.04 08:55:52'+time_offset*3600;
   aPriceClose[542] = 1.30351;

   // ========== 543 ===== 300 ==========
   aType[543] = OP_BUY;
   aSymbol[543] = "EURUSD";
   aLots[543] = 1.0;
   aDateOpen[543] = D'2012.01.04 08:26:52'+time_offset*3600;
   aPriceOpen[543] = 1.30614;
   aDateClose[543] = D'2012.01.04 08:55:49'+time_offset*3600;
   aPriceClose[543] = 1.30353;

   // ========== 544 ===== 296 ==========
   aType[544] = OP_BUY;
   aSymbol[544] = "AUDUSD";
   aLots[544] = 1.0;
   aDateOpen[544] = D'2012.01.05 11:42:45'+time_offset*3600;
   aPriceOpen[544] = 1.0248;
   aDateClose[544] = D'2012.01.05 12:12:02'+time_offset*3600;
   aPriceClose[544] = 1.02604;

   // ========== 545 ===== 293 ==========
   aType[545] = OP_BUY;
   aSymbol[545] = "AUDUSD";
   aLots[545] = 1.0;
   aDateOpen[545] = D'2012.01.08 23:36:22'+time_offset*3600;
   aPriceOpen[545] = 1.019;
   aDateClose[545] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPriceClose[545] = 1.019;

   // ========== 546 ===== 294 ==========
   aType[546] = OP_BUY;
   aSymbol[546] = "AUDUSD";
   aLots[546] = 1.0;
   aDateOpen[546] = D'2012.01.08 23:38:16'+time_offset*3600;
   aPriceOpen[546] = 1.01839;
   aDateClose[546] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPriceClose[546] = 1.019;

   // ========== 547 ===== 292 ==========
   aType[547] = OP_BUY;
   aSymbol[547] = "AUDUSD";
   aLots[547] = 1.0;
   aDateOpen[547] = D'2012.01.09 00:17:35'+time_offset*3600;
   aPriceOpen[547] = 1.0186;
   aDateClose[547] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPriceClose[547] = 1.019;

   // ========== 548 ===== 295 ==========
   aType[548] = OP_BUY;
   aSymbol[548] = "AUDUSD";
   aLots[548] = 1.0;
   aDateOpen[548] = D'2012.01.09 00:22:28'+time_offset*3600;
   aPriceOpen[548] = 1.01774;
   aDateClose[548] = D'2012.01.09 06:41:28'+time_offset*3600;
   aPriceClose[548] = 1.019;

   // ========== 549 ===== 288 ==========
   aType[549] = OP_SELL;
   aSymbol[549] = "EURUSD";
   aLots[549] = 1.0;
   aDateOpen[549] = D'2012.01.09 08:35:37'+time_offset*3600;
   aPriceOpen[549] = 1.2764;
   aDateClose[549] = D'2012.01.11 10:32:41'+time_offset*3600;
   aPriceClose[549] = 1.27542;

   // ========== 550 ===== 289 ==========
   aType[550] = OP_SELL;
   aSymbol[550] = "EURUSD";
   aLots[550] = 1.0;
   aDateOpen[550] = D'2012.01.09 08:36:19'+time_offset*3600;
   aPriceOpen[550] = 1.2767;
   aDateClose[550] = D'2012.01.11 10:31:57'+time_offset*3600;
   aPriceClose[550] = 1.27544;

   // ========== 551 ===== 290 ==========
   aType[551] = OP_SELL;
   aSymbol[551] = "EURUSD";
   aLots[551] = 1.0;
   aDateOpen[551] = D'2012.01.09 08:37:06'+time_offset*3600;
   aPriceOpen[551] = 1.2769;
   aDateClose[551] = D'2012.01.11 04:57:48'+time_offset*3600;
   aPriceClose[551] = 1.27442;

   // ========== 552 ===== 291 ==========
   aType[552] = OP_SELL;
   aSymbol[552] = "EURUSD";
   aLots[552] = 1.0;
   aDateOpen[552] = D'2012.01.09 08:37:56'+time_offset*3600;
   aPriceOpen[552] = 1.27655;
   aDateClose[552] = D'2012.01.11 04:57:44'+time_offset*3600;
   aPriceClose[552] = 1.27445;

   // ========== 553 ===== 286 ==========
   aType[553] = OP_SELL;
   aSymbol[553] = "GBPUSD";
   aLots[553] = 1.0;
   aDateOpen[553] = D'2012.01.13 06:14:12'+time_offset*3600;
   aPriceOpen[553] = 1.53768;
   aDateClose[553] = D'2012.01.13 08:48:32'+time_offset*3600;
   aPriceClose[553] = 1.5355;

   // ========== 554 ===== 285 ==========
   aType[554] = OP_SELL;
   aSymbol[554] = "GBPUSD";
   aLots[554] = 1.0;
   aDateOpen[554] = D'2012.01.13 06:40:25'+time_offset*3600;
   aPriceOpen[554] = 1.53795;
   aDateClose[554] = D'2012.01.13 09:02:16'+time_offset*3600;
   aPriceClose[554] = 1.53472;

   // ========== 555 ===== 284 ==========
   aType[555] = OP_SELL;
   aSymbol[555] = "GBPUSD";
   aLots[555] = 1.0;
   aDateOpen[555] = D'2012.01.13 06:58:02'+time_offset*3600;
   aPriceOpen[555] = 1.53772;
   aDateClose[555] = D'2012.01.13 09:02:19'+time_offset*3600;
   aPriceClose[555] = 1.53467;

   // ========== 556 ===== 287 ==========
   aType[556] = OP_SELL;
   aSymbol[556] = "GBPUSD";
   aLots[556] = 1.0;
   aDateOpen[556] = D'2012.01.13 07:05:45'+time_offset*3600;
   aPriceOpen[556] = 1.53799;
   aDateClose[556] = D'2012.01.13 08:15:13'+time_offset*3600;
   aPriceClose[556] = 1.53668;

   // ========== 557 ===== 283 ==========
   aType[557] = OP_SELL;
   aSymbol[557] = "EURUSD";
   aLots[557] = 1.0;
   aDateOpen[557] = D'2012.01.13 08:21:43'+time_offset*3600;
   aPriceOpen[557] = 1.28644;
   aDateClose[557] = D'2012.01.13 09:24:49'+time_offset*3600;
   aPriceClose[557] = 1.28388;

   // ========== 558 ===== 279 ==========
   aType[558] = OP_BUY;
   aSymbol[558] = "EURUSD";
   aLots[558] = 1.0;
   aDateOpen[558] = D'2012.01.13 14:09:03'+time_offset*3600;
   aPriceOpen[558] = 1.27199;
   aDateClose[558] = D'2012.01.13 20:36:21'+time_offset*3600;
   aPriceClose[558] = 1.26764;

   // ========== 559 ===== 281 ==========
   aType[559] = OP_BUY;
   aSymbol[559] = "EURUSD";
   aLots[559] = 1.0;
   aDateOpen[559] = D'2012.01.13 14:10:42'+time_offset*3600;
   aPriceOpen[559] = 1.27127;
   aDateClose[559] = D'2012.01.13 20:35:10'+time_offset*3600;
   aPriceClose[559] = 1.26769;

   // ========== 560 ===== 282 ==========
   aType[560] = OP_BUY;
   aSymbol[560] = "EURUSD";
   aLots[560] = 1.0;
   aDateOpen[560] = D'2012.01.13 14:11:50'+time_offset*3600;
   aPriceOpen[560] = 1.27047;
   aDateClose[560] = D'2012.01.13 20:35:04'+time_offset*3600;
   aPriceClose[560] = 1.26769;

   // ========== 561 ===== 280 ==========
   aType[561] = OP_BUY;
   aSymbol[561] = "EURUSD";
   aLots[561] = 1.0;
   aDateOpen[561] = D'2012.01.13 14:51:43'+time_offset*3600;
   aPriceOpen[561] = 1.2683;
   aDateClose[561] = D'2012.01.13 20:36:12'+time_offset*3600;
   aPriceClose[561] = 1.26769;

   // ========== 562 ===== 278 ==========
   aType[562] = OP_SELL;
   aSymbol[562] = "EURUSD";
   aLots[562] = 1.0;
   aDateOpen[562] = D'2012.01.17 02:49:50'+time_offset*3600;
   aPriceOpen[562] = 1.2725;
   aDateClose[562] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPriceClose[562] = 1.272;

   // ========== 563 ===== 277 ==========
   aType[563] = OP_SELL;
   aSymbol[563] = "EURUSD";
   aLots[563] = 1.0;
   aDateOpen[563] = D'2012.01.17 02:52:42'+time_offset*3600;
   aPriceOpen[563] = 1.27297;
   aDateClose[563] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPriceClose[563] = 1.272;

   // ========== 564 ===== 275 ==========
   aType[564] = OP_SELL;
   aSymbol[564] = "EURUSD";
   aLots[564] = 1.0;
   aDateOpen[564] = D'2012.01.17 03:05:47'+time_offset*3600;
   aPriceOpen[564] = 1.27285;
   aDateClose[564] = D'2012.01.17 14:41:53'+time_offset*3600;
   aPriceClose[564] = 1.27187;

   // ========== 565 ===== 276 ==========
   aType[565] = OP_SELL;
   aSymbol[565] = "EURUSD";
   aLots[565] = 1.0;
   aDateOpen[565] = D'2012.01.17 03:10:56'+time_offset*3600;
   aPriceOpen[565] = 1.27314;
   aDateClose[565] = D'2012.01.17 14:41:49'+time_offset*3600;
   aPriceClose[565] = 1.27189;

   // ========== 566 ===== 271 ==========
   aType[566] = OP_SELL;
   aSymbol[566] = "EURUSD";
   aLots[566] = 1.0;
   aDateOpen[566] = D'2012.01.18 22:53:44'+time_offset*3600;
   aPriceOpen[566] = 1.2852;
   aDateClose[566] = D'2012.01.20 14:16:02'+time_offset*3600;
   aPriceClose[566] = 1.2924;

   // ========== 567 ===== 272 ==========
   aType[567] = OP_SELL;
   aSymbol[567] = "EURUSD";
   aLots[567] = 1.0;
   aDateOpen[567] = D'2012.01.19 03:29:19'+time_offset*3600;
   aPriceOpen[567] = 1.28729;
   aDateClose[567] = D'2012.01.20 14:15:58'+time_offset*3600;
   aPriceClose[567] = 1.29239;

   // ========== 568 ===== 273 ==========
   aType[568] = OP_SELL;
   aSymbol[568] = "EURUSD";
   aLots[568] = 1.0;
   aDateOpen[568] = D'2012.01.19 12:38:47'+time_offset*3600;
   aPriceOpen[568] = 1.29076;
   aDateClose[568] = D'2012.01.20 14:12:39'+time_offset*3600;
   aPriceClose[568] = 1.29181;

   // ========== 569 ===== 274 ==========
   aType[569] = OP_SELL;
   aSymbol[569] = "EURUSD";
   aLots[569] = 1.0;
   aDateOpen[569] = D'2012.01.19 12:53:16'+time_offset*3600;
   aPriceOpen[569] = 1.2925;
   aDateClose[569] = D'2012.01.20 14:12:35'+time_offset*3600;
   aPriceClose[569] = 1.29178;

   // ========== 570 ===== 267 ==========
   aType[570] = OP_SELL;
   aSymbol[570] = "EURUSD";
   aLots[570] = 1.0;
   aDateOpen[570] = D'2012.01.23 10:56:31'+time_offset*3600;
   aPriceOpen[570] = 1.29703;
   aDateClose[570] = D'2012.01.24 09:09:38'+time_offset*3600;
   aPriceClose[570] = 1.30424;

   // ========== 571 ===== 268 ==========
   aType[571] = OP_SELL;
   aSymbol[571] = "EURUSD";
   aLots[571] = 1.0;
   aDateOpen[571] = D'2012.01.23 10:58:12'+time_offset*3600;
   aPriceOpen[571] = 1.29716;
   aDateClose[571] = D'2012.01.24 09:09:35'+time_offset*3600;
   aPriceClose[571] = 1.30428;

   // ========== 572 ===== 269 ==========
   aType[572] = OP_SELL;
   aSymbol[572] = "EURUSD";
   aLots[572] = 1.0;
   aDateOpen[572] = D'2012.01.23 10:59:32'+time_offset*3600;
   aPriceOpen[572] = 1.29754;
   aDateClose[572] = D'2012.01.24 09:09:24'+time_offset*3600;
   aPriceClose[572] = 1.30468;

   // ========== 573 ===== 270 ==========
   aType[573] = OP_SELL;
   aSymbol[573] = "EURUSD";
   aLots[573] = 1.0;
   aDateOpen[573] = D'2012.01.23 11:00:35'+time_offset*3600;
   aPriceOpen[573] = 1.2977;
   aDateClose[573] = D'2012.01.24 09:09:20'+time_offset*3600;
   aPriceClose[573] = 1.30472;

   // ========== 574 ===== 265 ==========
   aType[574] = OP_BUY;
   aSymbol[574] = "AUDUSD";
   aLots[574] = 1.0;
   aDateOpen[574] = D'2012.01.24 09:57:44'+time_offset*3600;
   aPriceOpen[574] = 1.04669;
   aDateClose[574] = D'2012.01.24 17:57:28'+time_offset*3600;
   aPriceClose[574] = 1.0478;

   // ========== 575 ===== 266 ==========
   aType[575] = OP_BUY;
   aSymbol[575] = "AUDUSD";
   aLots[575] = 1.0;
   aDateOpen[575] = D'2012.01.24 14:04:28'+time_offset*3600;
   aPriceOpen[575] = 1.0435;
   aDateClose[575] = D'2012.01.24 17:57:28'+time_offset*3600;
   aPriceClose[575] = 1.0478;

   // ========== 576 ===== 262 ==========
   aType[576] = OP_SELL;
   aSymbol[576] = "GBPUSD";
   aLots[576] = 1.0;
   aDateOpen[576] = D'2012.01.25 00:54:09'+time_offset*3600;
   aPriceOpen[576] = 1.56157;
   aDateClose[576] = D'2012.01.25 12:27:25'+time_offset*3600;
   aPriceClose[576] = 1.55623;

   // ========== 577 ===== 261 ==========
   aType[577] = OP_SELL;
   aSymbol[577] = "GBPUSD";
   aLots[577] = 1.0;
   aDateOpen[577] = D'2012.01.25 00:55:32'+time_offset*3600;
   aPriceOpen[577] = 1.56153;
   aDateClose[577] = D'2012.01.25 12:36:42'+time_offset*3600;
   aPriceClose[577] = 1.55602;

   // ========== 578 ===== 260 ==========
   aType[578] = OP_SELL;
   aSymbol[578] = "GBPUSD";
   aLots[578] = 1.0;
   aDateOpen[578] = D'2012.01.25 00:56:20'+time_offset*3600;
   aPriceOpen[578] = 1.5615;
   aDateClose[578] = D'2012.01.25 12:36:53'+time_offset*3600;
   aPriceClose[578] = 1.55599;

   // ========== 579 ===== 264 ==========
   aType[579] = OP_SELL;
   aSymbol[579] = "GBPUSD";
   aLots[579] = 1.0;
   aDateOpen[579] = D'2012.01.25 00:59:14'+time_offset*3600;
   aPriceOpen[579] = 1.56164;
   aDateClose[579] = D'2012.01.25 09:38:24'+time_offset*3600;
   aPriceClose[579] = 1.55569;

   // ========== 580 ===== 263 ==========
   aType[580] = OP_SELL;
   aSymbol[580] = "GBPUSD";
   aLots[580] = 1.0;
   aDateOpen[580] = D'2012.01.25 09:53:53'+time_offset*3600;
   aPriceOpen[580] = 1.55779;
   aDateClose[580] = D'2012.01.25 12:24:17'+time_offset*3600;
   aPriceClose[580] = 1.5562;

   // ========== 581 ===== 259 ==========
   aType[581] = OP_SELL;
   aSymbol[581] = "USDCHF";
   aLots[581] = 1.0;
   aDateOpen[581] = D'2012.01.25 12:26:08'+time_offset*3600;
   aPriceOpen[581] = 0.93299;
   aDateClose[581] = D'2012.01.25 21:53:51'+time_offset*3600;
   aPriceClose[581] = 0.92193;

   // ========== 582 ===== 255 ==========
   aType[582] = OP_BUY;
   aSymbol[582] = "EURUSD";
   aLots[582] = 1.0;
   aDateOpen[582] = D'2012.01.27 00:16:31'+time_offset*3600;
   aPriceOpen[582] = 1.30887;
   aDateClose[582] = D'2012.01.27 10:05:37'+time_offset*3600;
   aPriceClose[582] = 1.314;

   // ========== 583 ===== 257 ==========
   aType[583] = OP_BUY;
   aSymbol[583] = "EURUSD";
   aLots[583] = 1.0;
   aDateOpen[583] = D'2012.01.27 00:25:37'+time_offset*3600;
   aPriceOpen[583] = 1.30859;
   aDateClose[583] = D'2012.01.27 07:01:49'+time_offset*3600;
   aPriceClose[583] = 1.31081;

   // ========== 584 ===== 256 ==========
   aType[584] = OP_BUY;
   aSymbol[584] = "EURUSD";
   aLots[584] = 1.0;
   aDateOpen[584] = D'2012.01.27 00:26:14'+time_offset*3600;
   aPriceOpen[584] = 1.3083;
   aDateClose[584] = D'2012.01.27 09:57:03'+time_offset*3600;
   aPriceClose[584] = 1.31266;

   // ========== 585 ===== 258 ==========
   aType[585] = OP_BUY;
   aSymbol[585] = "EURUSD";
   aLots[585] = 1.0;
   aDateOpen[585] = D'2012.01.27 00:27:36'+time_offset*3600;
   aPriceOpen[585] = 1.30836;
   aDateClose[585] = D'2012.01.27 07:01:01'+time_offset*3600;
   aPriceClose[585] = 1.3109;

   // ========== 586 ===== 253 ==========
   aType[586] = OP_BUY;
   aSymbol[586] = "AUDUSD";
   aLots[586] = 1.0;
   aDateOpen[586] = D'2012.01.30 08:40:43'+time_offset*3600;
   aPriceOpen[586] = 1.05664;
   aDateClose[586] = D'2012.01.30 16:04:21'+time_offset*3600;
   aPriceClose[586] = 1.0579;

   // ========== 587 ===== 252 ==========
   aType[587] = OP_BUY;
   aSymbol[587] = "AUDUSD";
   aLots[587] = 1.0;
   aDateOpen[587] = D'2012.01.30 10:15:26'+time_offset*3600;
   aPriceOpen[587] = 1.053;
   aDateClose[587] = D'2012.01.30 16:04:21'+time_offset*3600;
   aPriceClose[587] = 1.0579;

   // ========== 588 ===== 254 ==========
   aType[588] = OP_BUY;
   aSymbol[588] = "AUDUSD";
   aLots[588] = 1.0;
   aDateOpen[588] = D'2012.01.30 11:12:18'+time_offset*3600;
   aPriceOpen[588] = 1.05434;
   aDateClose[588] = D'2012.01.30 15:51:23'+time_offset*3600;
   aPriceClose[588] = 1.05636;

   // ========== 589 ===== 251 ==========
   aType[589] = OP_SELL;
   aSymbol[589] = "EURUSD";
   aLots[589] = 1.0;
   aDateOpen[589] = D'2012.01.31 10:25:28'+time_offset*3600;
   aPriceOpen[589] = 1.31826;
   aDateClose[589] = D'2012.01.31 13:09:27'+time_offset*3600;
   aPriceClose[589] = 1.31756;

   // ========== 590 ===== 250 ==========
   aType[590] = OP_BUY;
   aSymbol[590] = "GBPUSD";
   aLots[590] = 1.0;
   aDateOpen[590] = D'2012.02.01 11:51:24'+time_offset*3600;
   aPriceOpen[590] = 1.57872;
   aDateClose[590] = D'2012.02.01 12:42:59'+time_offset*3600;
   aPriceClose[590] = 1.584;

   // ========== 591 ===== 249 ==========
   aType[591] = OP_SELL;
   aSymbol[591] = "GBPUSD";
   aLots[591] = 1.0;
   aDateOpen[591] = D'2012.02.03 13:50:13'+time_offset*3600;
   aPriceOpen[591] = 1.5764;
   aDateClose[591] = D'2012.02.03 14:16:19'+time_offset*3600;
   aPriceClose[591] = 1.57594;

   // ========== 592 ===== 248 ==========
   aType[592] = OP_SELL;
   aSymbol[592] = "GBPUSD";
   aLots[592] = 1.0;
   aDateOpen[592] = D'2012.02.03 13:52:52'+time_offset*3600;
   aPriceOpen[592] = 1.57718;
   aDateClose[592] = D'2012.02.03 14:17:26'+time_offset*3600;
   aPriceClose[592] = 1.57657;

   // ========== 593 ===== 247 ==========
   aType[593] = OP_BUY;
   aSymbol[593] = "AUDUSD";
   aLots[593] = 1.0;
   aDateOpen[593] = D'2012.02.07 03:41:46'+time_offset*3600;
   aPriceOpen[593] = 1.07824;
   aDateClose[593] = D'2012.02.07 04:50:26'+time_offset*3600;
   aPriceClose[593] = 1.07914;

   // ========== 594 ===== 246 ==========
   aType[594] = OP_SELL;
   aSymbol[594] = "AUDUSD";
   aLots[594] = 1.0;
   aDateOpen[594] = D'2012.02.08 13:31:43'+time_offset*3600;
   aPriceOpen[594] = 1.08381;
   aDateClose[594] = D'2012.02.08 14:36:59'+time_offset*3600;
   aPriceClose[594] = 1.08201;

   // ========== 595 ===== 245 ==========
   aType[595] = OP_BUY;
   aSymbol[595] = "EURUSD";
   aLots[595] = 1.0;
   aDateOpen[595] = D'2012.02.09 13:16:59'+time_offset*3600;
   aPriceOpen[595] = 1.32964;
   aDateClose[595] = D'2012.02.09 13:40:09'+time_offset*3600;
   aPriceClose[595] = 1.32588;

   // ========== 596 ===== 243 ==========
   aType[596] = OP_SELL;
   aSymbol[596] = "GBPUSD";
   aLots[596] = 1.0;
   aDateOpen[596] = D'2012.02.09 13:36:53'+time_offset*3600;
   aPriceOpen[596] = 1.58478;
   aDateClose[596] = D'2012.02.10 00:33:18'+time_offset*3600;
   aPriceClose[596] = 1.58101;

   // ========== 597 ===== 244 ==========
   aType[597] = OP_SELL;
   aSymbol[597] = "GBPUSD";
   aLots[597] = 1.0;
   aDateOpen[597] = D'2012.02.09 13:45:43'+time_offset*3600;
   aPriceOpen[597] = 1.58632;
   aDateClose[597] = D'2012.02.09 23:56:46'+time_offset*3600;
   aPriceClose[597] = 1.58102;

   // ========== 598 ===== 242 ==========
   aType[598] = OP_BUY;
   aSymbol[598] = "AUDUSD";
   aLots[598] = 1.0;
   aDateOpen[598] = D'2012.02.10 05:04:45'+time_offset*3600;
   aPriceOpen[598] = 1.0704;
   aDateClose[598] = D'2012.02.12 22:24:36'+time_offset*3600;
   aPriceClose[598] = 1.069;

   // ========== 599 ===== 241 ==========
   aType[599] = OP_SELL;
   aSymbol[599] = "AUDUSD";
   aLots[599] = 1.0;
   aDateOpen[599] = D'2012.02.13 08:10:40'+time_offset*3600;
   aPriceOpen[599] = 1.07532;
   aDateClose[599] = D'2012.02.13 15:49:06'+time_offset*3600;
   aPriceClose[599] = 1.07309;

   // ========== 600 ===== 240 ==========
   aType[600] = OP_SELL;
   aSymbol[600] = "AUDUSD";
   aLots[600] = 1.0;
   aDateOpen[600] = D'2012.02.13 08:35:13'+time_offset*3600;
   aPriceOpen[600] = 1.07675;
   aDateClose[600] = D'2012.02.14 02:04:38'+time_offset*3600;
   aPriceClose[600] = 1.06882;

   // ========== 601 ===== 239 ==========
   aType[601] = OP_SELL;
   aSymbol[601] = "AUDUSD";
   aLots[601] = 1.0;
   aDateOpen[601] = D'2012.02.13 08:54:30'+time_offset*3600;
   aPriceOpen[601] = 1.07741;
   aDateClose[601] = D'2012.02.14 03:30:04'+time_offset*3600;
   aPriceClose[601] = 1.06735;

   // ========== 602 ===== 237 ==========
   aType[602] = OP_SELL;
   aSymbol[602] = "USDJPY";
   aLots[602] = 1.0;
   aDateOpen[602] = D'2012.02.14 09:43:48'+time_offset*3600;
   aPriceOpen[602] = 78.158;
   aDateClose[602] = D'2012.02.15 14:55:30'+time_offset*3600;
   aPriceClose[602] = 78.259;

   // ========== 603 ===== 238 ==========
   aType[603] = OP_SELL;
   aSymbol[603] = "USDJPY";
   aLots[603] = 1.0;
   aDateOpen[603] = D'2012.02.15 12:03:15'+time_offset*3600;
   aPriceOpen[603] = 78.572;
   aDateClose[603] = D'2012.02.15 14:50:30'+time_offset*3600;
   aPriceClose[603] = 78.265;

   // ========== 604 ===== 236 ==========
   aType[604] = OP_BUY;
   aSymbol[604] = "EURUSD";
   aLots[604] = 1.0;
   aDateOpen[604] = D'2012.02.16 07:01:48'+time_offset*3600;
   aPriceOpen[604] = 1.29987;
   aDateClose[604] = D'2012.02.16 15:05:31'+time_offset*3600;
   aPriceClose[604] = 1.30392;

   // ========== 605 ===== 231 ==========
   aType[605] = OP_SELL;
   aSymbol[605] = "USDJPY";
   aLots[605] = 1.0;
   aDateOpen[605] = D'2012.02.17 13:03:52'+time_offset*3600;
   aPriceOpen[605] = 79.219;
   aDateClose[605] = D'2012.02.21 07:16:40'+time_offset*3600;
   aPriceClose[605] = 79.8;

   // ========== 606 ===== 235 ==========
   aType[606] = OP_SELL;
   aSymbol[606] = "EURUSD";
   aLots[606] = 1.0;
   aDateOpen[606] = D'2012.02.17 13:39:16'+time_offset*3600;
   aPriceOpen[606] = 1.31728;
   aDateClose[606] = D'2012.02.17 17:54:00'+time_offset*3600;
   aPriceClose[606] = 1.31541;

   // ========== 607 ===== 232 ==========
   aType[607] = OP_SELL;
   aSymbol[607] = "EURUSD";
   aLots[607] = 1.0;
   aDateOpen[607] = D'2012.02.19 22:00:08'+time_offset*3600;
   aPriceOpen[607] = 1.31771;
   aDateClose[607] = D'2012.02.21 02:51:59'+time_offset*3600;
   aPriceClose[607] = 1.32536;

   // ========== 608 ===== 233 ==========
   aType[608] = OP_SELL;
   aSymbol[608] = "EURUSD";
   aLots[608] = 1.0;
   aDateOpen[608] = D'2012.02.20 11:53:56'+time_offset*3600;
   aPriceOpen[608] = 1.32682;
   aDateClose[608] = D'2012.02.21 02:51:08'+time_offset*3600;
   aPriceClose[608] = 1.32473;

   // ========== 609 ===== 234 ==========
   aType[609] = OP_SELL;
   aSymbol[609] = "EURUSD";
   aLots[609] = 1.0;
   aDateOpen[609] = D'2012.02.20 11:54:53'+time_offset*3600;
   aPriceOpen[609] = 1.3268;
   aDateClose[609] = D'2012.02.20 23:59:27'+time_offset*3600;
   aPriceClose[609] = 1.32067;

   // ========== 610 ===== 230 ==========
   aType[610] = OP_BUY;
   aSymbol[610] = "EURUSD";
   aLots[610] = 1.0;
   aDateOpen[610] = D'2012.02.21 03:12:35'+time_offset*3600;
   aPriceOpen[610] = 1.32911;
   aDateClose[610] = D'2012.02.21 07:23:00'+time_offset*3600;
   aPriceClose[610] = 1.32525;

   // ========== 611 ===== 228 ==========
   aType[611] = OP_SELL;
   aSymbol[611] = "USDJPY";
   aLots[611] = 1.0;
   aDateOpen[611] = D'2012.02.22 05:31:16'+time_offset*3600;
   aPriceOpen[611] = 80.063;
   aDateClose[611] = D'2012.02.24 19:34:36'+time_offset*3600;
   aPriceClose[611] = 80.936;

   // ========== 612 ===== 229 ==========
   aType[612] = OP_SELL;
   aSymbol[612] = "USDJPY";
   aLots[612] = 1.0;
   aDateOpen[612] = D'2012.02.22 09:11:42'+time_offset*3600;
   aPriceOpen[612] = 80.216;
   aDateClose[612] = D'2012.02.23 22:38:18'+time_offset*3600;
   aPriceClose[612] = 79.962;

   // ========== 613 ===== 225 ==========
   aType[613] = OP_SELL;
   aSymbol[613] = "EURUSD";
   aLots[613] = 1.0;
   aDateOpen[613] = D'2012.02.24 12:00:46'+time_offset*3600;
   aPriceOpen[613] = 1.34119;
   aDateClose[613] = D'2012.02.27 10:25:26'+time_offset*3600;
   aPriceClose[613] = 1.34146;

   // ========== 614 ===== 226 ==========
   aType[614] = OP_SELL;
   aSymbol[614] = "EURUSD";
   aLots[614] = 1.0;
   aDateOpen[614] = D'2012.02.24 18:49:15'+time_offset*3600;
   aPriceOpen[614] = 1.34649;
   aDateClose[614] = D'2012.02.27 10:21:19'+time_offset*3600;
   aPriceClose[614] = 1.34194;

   // ========== 615 ===== 227 ==========
   aType[615] = OP_BUY;
   aSymbol[615] = "USDJPY";
   aLots[615] = 1.0;
   aDateOpen[615] = D'2012.02.27 09:33:51'+time_offset*3600;
   aPriceOpen[615] = 80.647;
   aDateClose[615] = D'2012.02.27 10:03:25'+time_offset*3600;
   aPriceClose[615] = 80.636;

   // ========== 616 ===== 224 ==========
   aType[616] = OP_BUY;
   aSymbol[616] = "EURUSD";
   aLots[616] = 1.0;
   aDateOpen[616] = D'2012.02.27 12:30:14'+time_offset*3600;
   aPriceOpen[616] = 1.33922;
   aDateClose[616] = D'2012.02.27 15:45:05'+time_offset*3600;
   aPriceClose[616] = 1.3413;

   // ========== 617 ===== 223 ==========
   aType[617] = OP_BUY;
   aSymbol[617] = "USDJPY";
   aLots[617] = 1.0;
   aDateOpen[617] = D'2012.02.28 03:48:08'+time_offset*3600;
   aPriceOpen[617] = 80.18;
   aDateClose[617] = D'2012.02.28 06:30:02'+time_offset*3600;
   aPriceClose[617] = 80.623;

   // ========== 618 ===== 222 ==========
   aType[618] = OP_BUY;
   aSymbol[618] = "USDCHF";
   aLots[618] = 1.0;
   aDateOpen[618] = D'2012.02.28 08:14:19'+time_offset*3600;
   aPriceOpen[618] = 0.89614;
   aDateClose[618] = D'2012.02.28 09:07:32'+time_offset*3600;
   aPriceClose[618] = 0.89667;

   // ========== 619 ===== 221 ==========
   aType[619] = OP_SELL;
   aSymbol[619] = "USDCHF";
   aLots[619] = 1.0;
   aDateOpen[619] = D'2012.02.28 09:31:00'+time_offset*3600;
   aPriceOpen[619] = 0.89746;
   aDateClose[619] = D'2012.02.28 10:00:39'+time_offset*3600;
   aPriceClose[619] = 0.89704;

   // ========== 620 ===== 220 ==========
   aType[620] = OP_BUY;
   aSymbol[620] = "EURUSD";
   aLots[620] = 1.0;
   aDateOpen[620] = D'2012.03.01 14:00:11'+time_offset*3600;
   aPriceOpen[620] = 1.32927;
   aDateClose[620] = D'2012.03.01 20:17:22'+time_offset*3600;
   aPriceClose[620] = 1.33134;

   // ========== 621 ===== 218 ==========
   aType[621] = OP_SELL;
   aSymbol[621] = "USDJPY";
   aLots[621] = 1.0;
   aDateOpen[621] = D'2012.03.02 04:05:30'+time_offset*3600;
   aPriceOpen[621] = 81.479;
   aDateClose[621] = D'2012.03.02 11:30:09'+time_offset*3600;
   aPriceClose[621] = 81.479;

   // ========== 622 ===== 219 ==========
   aType[622] = OP_SELL;
   aSymbol[622] = "USDJPY";
   aLots[622] = 1.0;
   aDateOpen[622] = D'2012.03.02 07:56:31'+time_offset*3600;
   aPriceOpen[622] = 81.611;
   aDateClose[622] = D'2012.03.02 11:05:38'+time_offset*3600;
   aPriceClose[622] = 81.502;

   // ========== 623 ===== 217 ==========
   aType[623] = OP_SELL;
   aSymbol[623] = "USDCHF";
   aLots[623] = 1.0;
   aDateOpen[623] = D'2012.03.02 12:06:18'+time_offset*3600;
   aPriceOpen[623] = 0.9125;
   aDateClose[623] = D'2012.03.05 07:08:38'+time_offset*3600;
   aPriceClose[623] = 0.91304;

   // ========== 624 ===== 216 ==========
   aType[624] = OP_BUY;
   aSymbol[624] = "EURUSD";
   aLots[624] = 1.0;
   aDateOpen[624] = D'2012.03.02 15:04:10'+time_offset*3600;
   aPriceOpen[624] = 1.319;
   aDateClose[624] = D'2012.03.05 07:08:44'+time_offset*3600;
   aPriceClose[624] = 1.32026;

   // ========== 625 ===== 215 ==========
   aType[625] = OP_BUY;
   aSymbol[625] = "GBPUSD";
   aLots[625] = 1.0;
   aDateOpen[625] = D'2012.03.05 08:02:19'+time_offset*3600;
   aPriceOpen[625] = 1.58048;
   aDateClose[625] = D'2012.03.05 08:52:20'+time_offset*3600;
   aPriceClose[625] = 1.58112;

   // ========== 626 ===== 214 ==========
   aType[626] = OP_BUY;
   aSymbol[626] = "GBPUSD";
   aLots[626] = 1.0;
   aDateOpen[626] = D'2012.03.05 08:24:15'+time_offset*3600;
   aPriceOpen[626] = 1.57926;
   aDateClose[626] = D'2012.03.05 12:08:35'+time_offset*3600;
   aPriceClose[626] = 1.58167;

   // ========== 627 ===== 213 ==========
   aType[627] = OP_BUY;
   aSymbol[627] = "EURUSD";
   aLots[627] = 1.0;
   aDateOpen[627] = D'2012.03.05 09:09:03'+time_offset*3600;
   aPriceOpen[627] = 1.31746;
   aDateClose[627] = D'2012.03.05 12:31:54'+time_offset*3600;
   aPriceClose[627] = 1.32024;

   // ========== 628 ===== 212 ==========
   aType[628] = OP_SELL;
   aSymbol[628] = "GBPUSD";
   aLots[628] = 1.0;
   aDateOpen[628] = D'2012.03.06 10:30:49'+time_offset*3600;
   aPriceOpen[628] = 1.57736;
   aDateClose[628] = D'2012.03.06 14:33:21'+time_offset*3600;
   aPriceClose[628] = 1.57658;

   // ========== 629 ===== 211 ==========
   aType[629] = OP_SELL;
   aSymbol[629] = "GBPUSD";
   aLots[629] = 1.0;
   aDateOpen[629] = D'2012.03.08 09:13:38'+time_offset*3600;
   aPriceOpen[629] = 1.5794;
   aDateClose[629] = D'2012.03.08 11:17:50'+time_offset*3600;
   aPriceClose[629] = 1.57919;

   // ========== 630 ===== 208 ==========
   aType[630] = OP_SELL;
   aSymbol[630] = "EURUSD";
   aLots[630] = 1.0;
   aDateOpen[630] = D'2012.03.08 09:33:01'+time_offset*3600;
   aPriceOpen[630] = 1.32003;
   aDateClose[630] = D'2012.03.09 08:01:28'+time_offset*3600;
   aPriceClose[630] = 1.32198;

   // ========== 631 ===== 209 ==========
   aType[631] = OP_SELL;
   aSymbol[631] = "EURUSD";
   aLots[631] = 1.0;
   aDateOpen[631] = D'2012.03.08 11:50:14'+time_offset*3600;
   aPriceOpen[631] = 1.32362;
   aDateClose[631] = D'2012.03.09 07:53:29'+time_offset*3600;
   aPriceClose[631] = 1.32237;

   // ========== 632 ===== 210 ==========
   aType[632] = OP_SELL;
   aSymbol[632] = "EURUSD";
   aLots[632] = 1.0;
   aDateOpen[632] = D'2012.03.08 12:16:30'+time_offset*3600;
   aPriceOpen[632] = 1.32441;
   aDateClose[632] = D'2012.03.09 06:29:10'+time_offset*3600;
   aPriceClose[632] = 1.32354;

   // ========== 633 ===== 207 ==========
   aType[633] = OP_BUY;
   aSymbol[633] = "USDJPY";
   aLots[633] = 1.0;
   aDateOpen[633] = D'2012.03.09 13:40:22'+time_offset*3600;
   aPriceOpen[633] = 82.136;
   aDateClose[633] = D'2012.03.09 13:42:06'+time_offset*3600;
   aPriceClose[633] = 82.276;

   // ========== 634 ===== 206 ==========
   aType[634] = OP_BUY;
   aSymbol[634] = "EURUSD";
   aLots[634] = 1.0;
   aDateOpen[634] = D'2012.03.09 13:51:54'+time_offset*3600;
   aPriceOpen[634] = 1.31397;
   aDateClose[634] = D'2012.03.12 01:27:28'+time_offset*3600;
   aPriceClose[634] = 1.30869;

   // ========== 635 ===== 205 ==========
   aType[635] = OP_BUY;
   aSymbol[635] = "USDCHF";
   aLots[635] = 1.0;
   aDateOpen[635] = D'2012.03.12 13:44:40'+time_offset*3600;
   aPriceOpen[635] = 0.91865;
   aDateClose[635] = D'2012.03.13 11:04:42'+time_offset*3600;
   aPriceClose[635] = 0.91946;

   // ========== 636 ===== 204 ==========
   aType[636] = OP_SELL;
   aSymbol[636] = "EURUSD";
   aLots[636] = 1.0;
   aDateOpen[636] = D'2012.03.14 05:49:42'+time_offset*3600;
   aPriceOpen[636] = 1.30523;
   aDateClose[636] = D'2012.03.14 11:01:29'+time_offset*3600;
   aPriceClose[636] = 1.308;

   // ========== 637 ===== 203 ==========
   aType[637] = OP_SELL;
   aSymbol[637] = "USDJPY";
   aLots[637] = 1.0;
   aDateOpen[637] = D'2012.03.14 17:58:49'+time_offset*3600;
   aPriceOpen[637] = 83.637;
   aDateClose[637] = D'2012.03.15 10:40:16'+time_offset*3600;
   aPriceClose[637] = 83.538;

   // ========== 638 ===== 201 ==========
   aType[638] = OP_SELL;
   aSymbol[638] = "USDJPY";
   aLots[638] = 1.0;
   aDateOpen[638] = D'2012.03.14 23:58:35'+time_offset*3600;
   aPriceOpen[638] = 83.837;
   aDateClose[638] = D'2012.03.15 11:29:55'+time_offset*3600;
   aPriceClose[638] = 83.3;

   // ========== 639 ===== 200 ==========
   aType[639] = OP_SELL;
   aSymbol[639] = "USDJPY";
   aLots[639] = 1.0;
   aDateOpen[639] = D'2012.03.15 00:24:24'+time_offset*3600;
   aPriceOpen[639] = 83.951;
   aDateClose[639] = D'2012.03.15 11:44:04'+time_offset*3600;
   aPriceClose[639] = 83.327;

   // ========== 640 ===== 202 ==========
   aType[640] = OP_SELL;
   aSymbol[640] = "USDJPY";
   aLots[640] = 1.0;
   aDateOpen[640] = D'2012.03.15 03:16:32'+time_offset*3600;
   aPriceOpen[640] = 84.077;
   aDateClose[640] = D'2012.03.15 10:45:48'+time_offset*3600;
   aPriceClose[640] = 83.463;

   // ========== 641 ===== 199 ==========
   aType[641] = OP_BUY;
   aSymbol[641] = "EURUSD";
   aLots[641] = 1.0;
   aDateOpen[641] = D'2012.03.16 10:53:03'+time_offset*3600;
   aPriceOpen[641] = 1.30557;
   aDateClose[641] = D'2012.03.16 11:07:08'+time_offset*3600;
   aPriceClose[641] = 1.30668;

   // ========== 642 ===== 198 ==========
   aType[642] = OP_SELL;
   aSymbol[642] = "GBPUSD";
   aLots[642] = 1.0;
   aDateOpen[642] = D'2012.03.19 15:56:56'+time_offset*3600;
   aPriceOpen[642] = 1.59006;
   aDateClose[642] = D'2012.03.19 22:28:31'+time_offset*3600;
   aPriceClose[642] = 1.58944;

   // ========== 643 ===== 197 ==========
   aType[643] = OP_SELL;
   aSymbol[643] = "EURUSD";
   aLots[643] = 1.0;
   aDateOpen[643] = D'2012.03.21 15:05:20'+time_offset*3600;
   aPriceOpen[643] = 1.31889;
   aDateClose[643] = D'2012.03.21 16:09:44'+time_offset*3600;
   aPriceClose[643] = 1.32019;

   // ========== 644 ===== 196 ==========
   aType[644] = OP_SELL;
   aSymbol[644] = "EURUSD";
   aLots[644] = 1.0;
   aDateOpen[644] = D'2012.03.22 08:31:49'+time_offset*3600;
   aPriceOpen[644] = 1.31624;
   aDateClose[644] = D'2012.03.22 16:01:45'+time_offset*3600;
   aPriceClose[644] = 1.32;

   // ========== 645 ===== 195 ==========
   aType[645] = OP_BUY;
   aSymbol[645] = "EURUSD";
   aLots[645] = 1.0;
   aDateOpen[645] = D'2012.03.23 09:23:51'+time_offset*3600;
   aPriceOpen[645] = 1.32677;
   aDateClose[645] = D'2012.03.26 06:29:41'+time_offset*3600;
   aPriceClose[645] = 1.32538;

   // ========== 646 ===== 194 ==========
   aType[646] = OP_SELL;
   aSymbol[646] = "AUDUSD";
   aLots[646] = 1.0;
   aDateOpen[646] = D'2012.03.25 22:15:16'+time_offset*3600;
   aPriceOpen[646] = 1.04814;
   aDateClose[646] = D'2012.03.26 06:39:36'+time_offset*3600;
   aPriceClose[646] = 1.0431;

   // ========== 647 ===== 193 ==========
   aType[647] = OP_SELL;
   aSymbol[647] = "EURUSD";
   aLots[647] = 1.0;
   aDateOpen[647] = D'2012.03.26 08:42:33'+time_offset*3600;
   aPriceOpen[647] = 1.32075;
   aDateClose[647] = D'2012.03.26 11:08:16'+time_offset*3600;
   aPriceClose[647] = 1.3247;

   // ========== 648 ===== 192 ==========
   aType[648] = OP_BUY;
   aSymbol[648] = "GBPUSD";
   aLots[648] = 1.0;
   aDateOpen[648] = D'2012.03.26 11:15:51'+time_offset*3600;
   aPriceOpen[648] = 1.58869;
   aDateClose[648] = D'2012.03.27 01:24:31'+time_offset*3600;
   aPriceClose[648] = 1.59672;

   // ========== 649 ===== 191 ==========
   aType[649] = OP_BUY;
   aSymbol[649] = "GBPUSD";
   aLots[649] = 1.0;
   aDateOpen[649] = D'2012.03.28 13:47:48'+time_offset*3600;
   aPriceOpen[649] = 1.58835;
   aDateClose[649] = D'2012.03.28 14:27:23'+time_offset*3600;
   aPriceClose[649] = 1.58519;

   // ========== 650 ===== 189 ==========
   aType[650] = OP_BUY;
   aSymbol[650] = "EURUSD";
   aLots[650] = 1.0;
   aDateOpen[650] = D'2012.03.30 00:45:25'+time_offset*3600;
   aPriceOpen[650] = 1.33334;
   aDateClose[650] = D'2012.03.30 13:00:53'+time_offset*3600;
   aPriceClose[650] = 1.33386;

   // ========== 651 ===== 190 ==========
   aType[651] = OP_SELL;
   aSymbol[651] = "AUDUSD";
   aLots[651] = 1.0;
   aDateOpen[651] = D'2012.03.30 02:06:10'+time_offset*3600;
   aPriceOpen[651] = 1.04029;
   aDateClose[651] = D'2012.03.30 03:14:53'+time_offset*3600;
   aPriceClose[651] = 1.03967;

   // ========== 652 ===== 188 ==========
   aType[652] = OP_BUY;
   aSymbol[652] = "EURUSD";
   aLots[652] = 1.0;
   aDateOpen[652] = D'2012.04.02 07:40:06'+time_offset*3600;
   aPriceOpen[652] = 1.33683;
   aDateClose[652] = D'2012.04.02 12:07:35'+time_offset*3600;
   aPriceClose[652] = 1.332;

   // ========== 653 ===== 187 ==========
   aType[653] = OP_BUY;
   aSymbol[653] = "USDCHF";
   aLots[653] = 1.0;
   aDateOpen[653] = D'2012.04.02 13:20:23'+time_offset*3600;
   aPriceOpen[653] = 0.90703;
   aDateClose[653] = D'2012.04.03 09:36:35'+time_offset*3600;
   aPriceClose[653] = 0.90031;

   // ========== 654 ===== 186 ==========
   aType[654] = OP_SELL;
   aSymbol[654] = "EURUSD";
   aLots[654] = 1.0;
   aDateOpen[654] = D'2012.04.03 22:49:35'+time_offset*3600;
   aPriceOpen[654] = 1.32233;
   aDateClose[654] = D'2012.04.04 11:12:18'+time_offset*3600;
   aPriceClose[654] = 1.31589;

   // ========== 655 ===== 184 ==========
   aType[655] = OP_BUY;
   aSymbol[655] = "EURUSD";
   aLots[655] = 1.0;
   aDateOpen[655] = D'2012.04.05 09:32:41'+time_offset*3600;
   aPriceOpen[655] = 1.3091;
   aDateClose[655] = D'2012.04.06 12:32:21'+time_offset*3600;
   aPriceClose[655] = 1.31;

   // ========== 656 ===== 185 ==========
   aType[656] = OP_BUY;
   aSymbol[656] = "EURUSD";
   aLots[656] = 1.0;
   aDateOpen[656] = D'2012.04.05 10:06:50'+time_offset*3600;
   aPriceOpen[656] = 1.30621;
   aDateClose[656] = D'2012.04.06 06:11:25'+time_offset*3600;
   aPriceClose[656] = 1.30726;

   // ========== 657 ===== 183 ==========
   aType[657] = OP_SELL;
   aSymbol[657] = "GBPUSD";
   aLots[657] = 1.0;
   aDateOpen[657] = D'2012.04.09 22:40:16'+time_offset*3600;
   aPriceOpen[657] = 1.58994;
   aDateClose[657] = D'2012.04.10 08:17:31'+time_offset*3600;
   aPriceClose[657] = 1.58558;

   // ========== 658 ===== 182 ==========
   aType[658] = OP_SELL;
   aSymbol[658] = "GBPUSD";
   aLots[658] = 1.0;
   aDateOpen[658] = D'2012.04.11 06:25:47'+time_offset*3600;
   aPriceOpen[658] = 1.58988;
   aDateClose[658] = D'2012.04.11 08:00:55'+time_offset*3600;
   aPriceClose[658] = 1.58867;

   // ========== 659 ===== 181 ==========
   aType[659] = OP_SELL;
   aSymbol[659] = "GBPUSD";
   aLots[659] = 1.0;
   aDateOpen[659] = D'2012.04.11 08:30:58'+time_offset*3600;
   aPriceOpen[659] = 1.59086;
   aDateClose[659] = D'2012.04.11 09:09:27'+time_offset*3600;
   aPriceClose[659] = 1.58878;

   // ========== 660 ===== 178 ==========
   aType[660] = OP_SELL;
   aSymbol[660] = "GBPUSD";
   aLots[660] = 1.0;
   aDateOpen[660] = D'2012.04.12 06:19:08'+time_offset*3600;
   aPriceOpen[660] = 1.59274;
   aDateClose[660] = D'2012.04.13 07:57:11'+time_offset*3600;
   aPriceClose[660] = 1.59348;

   // ========== 661 ===== 180 ==========
   aType[661] = OP_SELL;
   aSymbol[661] = "GBPUSD";
   aLots[661] = 1.0;
   aDateOpen[661] = D'2012.04.12 14:54:17'+time_offset*3600;
   aPriceOpen[661] = 1.59564;
   aDateClose[661] = D'2012.04.12 16:28:57'+time_offset*3600;
   aPriceClose[661] = 1.59516;

   // ========== 662 ===== 179 ==========
   aType[662] = OP_SELL;
   aSymbol[662] = "GBPUSD";
   aLots[662] = 1.0;
   aDateOpen[662] = D'2012.04.13 00:58:53'+time_offset*3600;
   aPriceOpen[662] = 1.59674;
   aDateClose[662] = D'2012.04.13 04:05:13'+time_offset*3600;
   aPriceClose[662] = 1.59418;

   // ========== 663 ===== 176 ==========
   aType[663] = OP_BUY;
   aSymbol[663] = "AUDUSD";
   aLots[663] = 1.0;
   aDateOpen[663] = D'2012.04.15 23:35:48'+time_offset*3600;
   aPriceOpen[663] = 1.03582;
   aDateClose[663] = D'2012.04.16 09:50:32'+time_offset*3600;
   aPriceClose[663] = 1.03514;

   // ========== 664 ===== 177 ==========
   aType[664] = OP_BUY;
   aSymbol[664] = "AUDUSD";
   aLots[664] = 1.0;
   aDateOpen[664] = D'2012.04.16 00:00:39'+time_offset*3600;
   aPriceOpen[664] = 1.0345;
   aDateClose[664] = D'2012.04.16 09:36:25'+time_offset*3600;
   aPriceClose[664] = 1.03451;

   // ========== 665 ===== 175 ==========
   aType[665] = OP_SELL;
   aSymbol[665] = "EURUSD";
   aLots[665] = 1.0;
   aDateOpen[665] = D'2012.04.16 20:49:47'+time_offset*3600;
   aPriceOpen[665] = 1.31418;
   aDateClose[665] = D'2012.04.17 06:31:58'+time_offset*3600;
   aPriceClose[665] = 1.30987;

   // ========== 666 ===== 174 ==========
   aType[666] = OP_BUY;
   aSymbol[666] = "GBPUSD";
   aLots[666] = 1.0;
   aDateOpen[666] = D'2012.04.17 06:30:30'+time_offset*3600;
   aPriceOpen[666] = 1.5867;
   aDateClose[666] = D'2012.04.17 07:07:09'+time_offset*3600;
   aPriceClose[666] = 1.5885;

   // ========== 667 ===== 172 ==========
   aType[667] = OP_SELL;
   aSymbol[667] = "GBPUSD";
   aLots[667] = 1.0;
   aDateOpen[667] = D'2012.04.18 22:12:46'+time_offset*3600;
   aPriceOpen[667] = 1.60162;
   aDateClose[667] = D'2012.04.19 11:35:52'+time_offset*3600;
   aPriceClose[667] = 1.60151;

   // ========== 668 ===== 173 ==========
   aType[668] = OP_SELL;
   aSymbol[668] = "GBPUSD";
   aLots[668] = 1.0;
   aDateOpen[668] = D'2012.04.19 07:08:18'+time_offset*3600;
   aPriceOpen[668] = 1.60595;
   aDateClose[668] = D'2012.04.19 10:24:11'+time_offset*3600;
   aPriceClose[668] = 1.60363;

   // ========== 669 ===== 171 ==========
   aType[669] = OP_BUY;
   aSymbol[669] = "EURUSD";
   aLots[669] = 1.0;
   aDateOpen[669] = D'2012.04.20 05:48:38'+time_offset*3600;
   aPriceOpen[669] = 1.31651;
   aDateClose[669] = D'2012.04.20 06:44:47'+time_offset*3600;
   aPriceClose[669] = 1.31456;

   // ========== 670 ===== 169 ==========
   aType[670] = OP_BUY;
   aSymbol[670] = "EURUSD";
   aLots[670] = 1.0;
   aDateOpen[670] = D'2012.04.20 08:01:17'+time_offset*3600;
   aPriceOpen[670] = 1.31763;
   aDateClose[670] = D'2012.04.20 09:23:02'+time_offset*3600;
   aPriceClose[670] = 1.31566;

   // ========== 671 ===== 170 ==========
   aType[671] = OP_BUY;
   aSymbol[671] = "EURUSD";
   aLots[671] = 1.0;
   aDateOpen[671] = D'2012.04.20 08:04:07'+time_offset*3600;
   aPriceOpen[671] = 1.31673;
   aDateClose[671] = D'2012.04.20 09:05:50'+time_offset*3600;
   aPriceClose[671] = 1.31525;

   // ========== 672 ===== 168 ==========
   aType[672] = OP_SELL;
   aSymbol[672] = "GBPUSD";
   aLots[672] = 1.0;
   aDateOpen[672] = D'2012.04.20 08:31:30'+time_offset*3600;
   aPriceOpen[672] = 1.6115;
   aDateClose[672] = D'2012.04.23 07:14:10'+time_offset*3600;
   aPriceClose[672] = 1.60914;

   // ========== 673 ===== 167 ==========
   aType[673] = OP_SELL;
   aSymbol[673] = "GBPUSD";
   aLots[673] = 1.0;
   aDateOpen[673] = D'2012.04.20 10:46:56'+time_offset*3600;
   aPriceOpen[673] = 1.61118;
   aDateClose[673] = D'2012.04.23 11:11:29'+time_offset*3600;
   aPriceClose[673] = 1.60844;

   // ========== 674 ===== 165 ==========
   aType[674] = OP_SELL;
   aSymbol[674] = "GBPUSD";
   aLots[674] = 1.0;
   aDateOpen[674] = D'2012.04.24 06:50:07'+time_offset*3600;
   aPriceOpen[674] = 1.61361;
   aDateClose[674] = D'2012.04.24 13:50:19'+time_offset*3600;
   aPriceClose[674] = 1.61334;

   // ========== 675 ===== 166 ==========
   aType[675] = OP_SELL;
   aSymbol[675] = "GBPUSD";
   aLots[675] = 1.0;
   aDateOpen[675] = D'2012.04.24 11:38:19'+time_offset*3600;
   aPriceOpen[675] = 1.61608;
   aDateClose[675] = D'2012.04.24 13:48:30'+time_offset*3600;
   aPriceClose[675] = 1.6141;

   // ========== 676 ===== 164 ==========
   aType[676] = OP_SELL;
   aSymbol[676] = "EURUSD";
   aLots[676] = 1.0;
   aDateOpen[676] = D'2012.04.25 11:33:31'+time_offset*3600;
   aPriceOpen[676] = 1.32038;
   aDateClose[676] = D'2012.04.25 16:33:07'+time_offset*3600;
   aPriceClose[676] = 1.31997;

   // ========== 677 ===== 163 ==========
   aType[677] = OP_SELL;
   aSymbol[677] = "GBPUSD";
   aLots[677] = 1.0;
   aDateOpen[677] = D'2012.04.26 06:39:44'+time_offset*3600;
   aPriceOpen[677] = 1.61856;
   aDateClose[677] = D'2012.04.27 06:20:28'+time_offset*3600;
   aPriceClose[677] = 1.61574;

   // ========== 678 ===== 162 ==========
   aType[678] = OP_BUY;
   aSymbol[678] = "USDJPY";
   aLots[678] = 1.0;
   aDateOpen[678] = D'2012.04.27 05:05:28'+time_offset*3600;
   aPriceOpen[678] = 80.883;
   aDateClose[678] = D'2012.04.27 07:37:49'+time_offset*3600;
   aPriceClose[678] = 80.619;

   // ========== 679 ===== 159 ==========
   aType[679] = OP_SELL;
   aSymbol[679] = "GBPUSD";
   aLots[679] = 1.0;
   aDateOpen[679] = D'2012.04.27 07:43:54'+time_offset*3600;
   aPriceOpen[679] = 1.61749;
   aDateClose[679] = D'2012.05.01 04:35:57'+time_offset*3600;
   aPriceClose[679] = 1.6226;

   // ========== 680 ===== 160 ==========
   aType[680] = OP_SELL;
   aSymbol[680] = "GBPUSD";
   aLots[680] = 1.0;
   aDateOpen[680] = D'2012.04.27 09:40:53'+time_offset*3600;
   aPriceOpen[680] = 1.623;
   aDateClose[680] = D'2012.05.01 03:27:21'+time_offset*3600;
   aPriceClose[680] = 1.62305;

   // ========== 681 ===== 161 ==========
   aType[681] = OP_SELL;
   aSymbol[681] = "GBPUSD";
   aLots[681] = 1.0;
   aDateOpen[681] = D'2012.04.27 13:15:08'+time_offset*3600;
   aPriceOpen[681] = 1.62488;
   aDateClose[681] = D'2012.04.30 15:28:23'+time_offset*3600;
   aPriceClose[681] = 1.62332;

   // ========== 682 ===== 158 ==========
   aType[682] = OP_BUY;
   aSymbol[682] = "USDJPY";
   aLots[682] = 1.0;
   aDateOpen[682] = D'2012.05.01 07:10:10'+time_offset*3600;
   aPriceOpen[682] = 79.671;
   aDateClose[682] = D'2012.05.01 23:07:07'+time_offset*3600;
   aPriceClose[682] = 80.141;

   // ========== 683 ===== 157 ==========
   aType[683] = OP_SELL;
   aSymbol[683] = "USDJPY";
   aLots[683] = 1.0;
   aDateOpen[683] = D'2012.05.02 07:10:07'+time_offset*3600;
   aPriceOpen[683] = 80.575;
   aDateClose[683] = D'2012.05.02 07:25:49'+time_offset*3600;
   aPriceClose[683] = 80.483;

   // ========== 684 ===== 156 ==========
   aType[684] = OP_SELL;
   aSymbol[684] = "EURUSD";
   aLots[684] = 1.0;
   aDateOpen[684] = D'2012.05.02 07:43:22'+time_offset*3600;
   aPriceOpen[684] = 1.32039;
   aDateClose[684] = D'2012.05.02 09:26:39'+time_offset*3600;
   aPriceClose[684] = 1.3143;

   // ========== 685 ===== 154 ==========
   aType[685] = OP_SELL;
   aSymbol[685] = "EURUSD";
   aLots[685] = 1.0;
   aDateOpen[685] = D'2012.05.02 07:45:13'+time_offset*3600;
   aPriceOpen[685] = 1.31933;
   aDateClose[685] = D'2012.05.03 05:18:01'+time_offset*3600;
   aPriceClose[685] = 1.31469;

   // ========== 686 ===== 155 ==========
   aType[686] = OP_SELL;
   aSymbol[686] = "EURUSD";
   aLots[686] = 1.0;
   aDateOpen[686] = D'2012.05.02 14:20:35'+time_offset*3600;
   aPriceOpen[686] = 1.31526;
   aDateClose[686] = D'2012.05.03 02:10:23'+time_offset*3600;
   aPriceClose[686] = 1.31391;

   // ========== 687 ===== 152 ==========
   aType[687] = OP_BUY;
   aSymbol[687] = "AUDUSD";
   aLots[687] = 1.0;
   aDateOpen[687] = D'2012.05.04 14:39:04'+time_offset*3600;
   aPriceOpen[687] = 1.01844;
   aDateClose[687] = D'2012.05.04 16:10:53'+time_offset*3600;
   aPriceClose[687] = 1.01949;

   // ========== 688 ===== 153 ==========
   aType[688] = OP_SELL;
   aSymbol[688] = "EURUSD";
   aLots[688] = 1.0;
   aDateOpen[688] = D'2012.05.04 15:23:57'+time_offset*3600;
   aPriceOpen[688] = 1.31025;
   aDateClose[688] = D'2012.05.04 15:45:56'+time_offset*3600;
   aPriceClose[688] = 1.30894;

   // ========== 689 ===== 150 ==========
   aType[689] = OP_BUY;
   aSymbol[689] = "AUDUSD";
   aLots[689] = 1.0;
   aDateOpen[689] = D'2012.05.06 23:06:04'+time_offset*3600;
   aPriceOpen[689] = 1.01326;
   aDateClose[689] = D'2012.05.07 06:11:21'+time_offset*3600;
   aPriceClose[689] = 1.01464;

   // ========== 690 ===== 151 ==========
   aType[690] = OP_BUY;
   aSymbol[690] = "AUDUSD";
   aLots[690] = 1.0;
   aDateOpen[690] = D'2012.05.07 00:10:34'+time_offset*3600;
   aPriceOpen[690] = 1.01176;
   aDateClose[690] = D'2012.05.07 03:16:00'+time_offset*3600;
   aPriceClose[690] = 1.01375;

   // ========== 691 ===== 147 ==========
   aType[691] = OP_SELL;
   aSymbol[691] = "EURUSD";
   aLots[691] = 1.0;
   aDateOpen[691] = D'2012.05.07 13:20:18'+time_offset*3600;
   aPriceOpen[691] = 1.30453;
   aDateClose[691] = D'2012.05.08 03:20:06'+time_offset*3600;
   aPriceClose[691] = 1.30314;

   // ========== 692 ===== 149 ==========
   aType[692] = OP_SELL;
   aSymbol[692] = "EURUSD";
   aLots[692] = 1.0;
   aDateOpen[692] = D'2012.05.07 13:27:55'+time_offset*3600;
   aPriceOpen[692] = 1.3054;
   aDateClose[692] = D'2012.05.07 13:55:57'+time_offset*3600;
   aPriceClose[692] = 1.30445;

   // ========== 693 ===== 148 ==========
   aType[693] = OP_SELL;
   aSymbol[693] = "AUDUSD";
   aLots[693] = 1.0;
   aDateOpen[693] = D'2012.05.07 18:55:41'+time_offset*3600;
   aPriceOpen[693] = 1.02093;
   aDateClose[693] = D'2012.05.08 01:34:37'+time_offset*3600;
   aPriceClose[693] = 1.01768;

   // ========== 694 ===== 146 ==========
   aType[694] = OP_SELL;
   aSymbol[694] = "AUDUSD";
   aLots[694] = 1.0;
   aDateOpen[694] = D'2012.05.08 05:39:16'+time_offset*3600;
   aPriceOpen[694] = 1.01929;
   aDateClose[694] = D'2012.05.08 06:34:01'+time_offset*3600;
   aPriceClose[694] = 1.0179;

   // ========== 695 ===== 143 ==========
   aType[695] = OP_BUY;
   aSymbol[695] = "GBPUSD";
   aLots[695] = 1.0;
   aDateOpen[695] = D'2012.05.08 06:49:15'+time_offset*3600;
   aPriceOpen[695] = 1.61581;
   aDateClose[695] = D'2012.05.08 11:17:25'+time_offset*3600;
   aPriceClose[695] = 1.61529;

   // ========== 696 ===== 144 ==========
   aType[696] = OP_BUY;
   aSymbol[696] = "GBPUSD";
   aLots[696] = 1.0;
   aDateOpen[696] = D'2012.05.08 07:32:40'+time_offset*3600;
   aPriceOpen[696] = 1.6143;
   aDateClose[696] = D'2012.05.08 11:08:30'+time_offset*3600;
   aPriceClose[696] = 1.61491;

   // ========== 697 ===== 145 ==========
   aType[697] = OP_BUY;
   aSymbol[697] = "GBPUSD";
   aLots[697] = 1.0;
   aDateOpen[697] = D'2012.05.08 09:33:04'+time_offset*3600;
   aPriceOpen[697] = 1.61281;
   aDateClose[697] = D'2012.05.08 11:07:54'+time_offset*3600;
   aPriceClose[697] = 1.61478;

   // ========== 698 ===== 142 ==========
   aType[698] = OP_BUY;
   aSymbol[698] = "GBPUSD";
   aLots[698] = 1.0;
   aDateOpen[698] = D'2012.05.08 12:25:31'+time_offset*3600;
   aPriceOpen[698] = 1.6137;
   aDateClose[698] = D'2012.05.08 15:40:19'+time_offset*3600;
   aPriceClose[698] = 1.61536;

   // ========== 699 ===== 141 ==========
   aType[699] = OP_BUY;
   aSymbol[699] = "USDJPY";
   aLots[699] = 1.0;
   aDateOpen[699] = D'2012.05.09 11:34:40'+time_offset*3600;
   aPriceOpen[699] = 79.474;
   aDateClose[699] = D'2012.05.09 22:57:06'+time_offset*3600;
   aPriceClose[699] = 79.632;

   // ========== 700 ===== 140 ==========
   aType[700] = OP_SELL;
   aSymbol[700] = "AUDUSD";
   aLots[700] = 1.0;
   aDateOpen[700] = D'2012.05.10 07:01:52'+time_offset*3600;
   aPriceOpen[700] = 1.01189;
   aDateClose[700] = D'2012.05.10 08:12:57'+time_offset*3600;
   aPriceClose[700] = 1.00895;

   // ========== 701 ===== 139 ==========
   aType[701] = OP_BUY;
   aSymbol[701] = "GBPUSD";
   aLots[701] = 1.0;
   aDateOpen[701] = D'2012.05.11 05:41:20'+time_offset*3600;
   aPriceOpen[701] = 1.6115;
   aDateClose[701] = D'2012.05.11 06:49:23'+time_offset*3600;
   aPriceClose[701] = 1.61225;

   // ========== 702 ===== 138 ==========
   aType[702] = OP_BUY;
   aSymbol[702] = "GBPUSD";
   aLots[702] = 1.0;
   aDateOpen[702] = D'2012.05.11 07:21:26'+time_offset*3600;
   aPriceOpen[702] = 1.61055;
   aDateClose[702] = D'2012.05.11 08:48:02'+time_offset*3600;
   aPriceClose[702] = 1.61243;

   // ========== 703 ===== 136 ==========
   aType[703] = OP_BUY;
   aSymbol[703] = "GBPUSD";
   aLots[703] = 1.0;
   aDateOpen[703] = D'2012.05.11 10:26:18'+time_offset*3600;
   aPriceOpen[703] = 1.61047;
   aDateClose[703] = D'2012.05.11 14:32:48'+time_offset*3600;
   aPriceClose[703] = 1.61075;

   // ========== 704 ===== 137 ==========
   aType[704] = OP_BUY;
   aSymbol[704] = "GBPUSD";
   aLots[704] = 1.0;
   aDateOpen[704] = D'2012.05.11 12:37:47'+time_offset*3600;
   aPriceOpen[704] = 1.60926;
   aDateClose[704] = D'2012.05.11 14:25:22'+time_offset*3600;
   aPriceClose[704] = 1.6103;

   // ========== 705 ===== 133 ==========
   aType[705] = OP_BUY;
   aSymbol[705] = "AUDUSD";
   aLots[705] = 1.0;
   aDateOpen[705] = D'2012.05.14 07:38:53'+time_offset*3600;
   aPriceOpen[705] = 0.99856;
   aDateClose[705] = D'2012.05.15 06:12:53'+time_offset*3600;
   aPriceClose[705] = 1.00008;

   // ========== 706 ===== 135 ==========
   aType[706] = OP_BUY;
   aSymbol[706] = "AUDUSD";
   aLots[706] = 1.0;
   aDateOpen[706] = D'2012.05.14 08:24:17'+time_offset*3600;
   aPriceOpen[706] = 0.99687;
   aDateClose[706] = D'2012.05.14 12:15:58'+time_offset*3600;
   aPriceClose[706] = 0.99846;

   // ========== 707 ===== 132 ==========
   aType[707] = OP_SELL;
   aSymbol[707] = "USDCHF";
   aLots[707] = 1.0;
   aDateOpen[707] = D'2012.05.14 12:16:20'+time_offset*3600;
   aPriceOpen[707] = 0.93357;
   aDateClose[707] = D'2012.05.15 07:51:22'+time_offset*3600;
   aPriceClose[707] = 0.93367;

   // ========== 708 ===== 134 ==========
   aType[708] = OP_BUY;
   aSymbol[708] = "AUDUSD";
   aLots[708] = 1.0;
   aDateOpen[708] = D'2012.05.15 01:42:29'+time_offset*3600;
   aPriceOpen[708] = 0.99582;
   aDateClose[708] = D'2012.05.15 04:13:09'+time_offset*3600;
   aPriceClose[708] = 0.99759;

   // ========== 709 ===== 130 ==========
   aType[709] = OP_BUY;
   aSymbol[709] = "GBPUSD";
   aLots[709] = 1.0;
   aDateOpen[709] = D'2012.05.16 01:42:21'+time_offset*3600;
   aPriceOpen[709] = 1.59794;
   aDateClose[709] = D'2012.05.16 08:15:38'+time_offset*3600;
   aPriceClose[709] = 1.5971;

   // ========== 710 ===== 129 ==========
   aType[710] = OP_BUY;
   aSymbol[710] = "AUDUSD";
   aLots[710] = 1.0;
   aDateOpen[710] = D'2012.05.16 06:21:09'+time_offset*3600;
   aPriceOpen[710] = 0.9895;
   aDateClose[710] = D'2012.05.16 09:20:42'+time_offset*3600;
   aPriceClose[710] = 0.99194;

   // ========== 711 ===== 131 ==========
   aType[711] = OP_BUY;
   aSymbol[711] = "GBPUSD";
   aLots[711] = 1.0;
   aDateOpen[711] = D'2012.05.16 07:39:54'+time_offset*3600;
   aPriceOpen[711] = 1.59373;
   aDateClose[711] = D'2012.05.16 08:04:11'+time_offset*3600;
   aPriceClose[711] = 1.5966;

   // ========== 712 ===== 128 ==========
   aType[712] = OP_BUY;
   aSymbol[712] = "GBPUSD";
   aLots[712] = 1.0;
   aDateOpen[712] = D'2012.05.16 09:31:31'+time_offset*3600;
   aPriceOpen[712] = 1.59179;
   aDateClose[712] = D'2012.05.16 10:43:18'+time_offset*3600;
   aPriceClose[712] = 1.59236;

   // ========== 713 ===== 127 ==========
   aType[713] = OP_SELL;
   aSymbol[713] = "AUDUSD";
   aLots[713] = 1.0;
   aDateOpen[713] = D'2012.05.16 14:23:24'+time_offset*3600;
   aPriceOpen[713] = 0.99623;
   aDateClose[713] = D'2012.05.16 15:05:54'+time_offset*3600;
   aPriceClose[713] = 0.99278;

   // ========== 714 ===== 126 ==========
   aType[714] = OP_BUY;
   aSymbol[714] = "AUDUSD";
   aLots[714] = 1.0;
   aDateOpen[714] = D'2012.05.16 18:54:52'+time_offset*3600;
   aPriceOpen[714] = 0.99229;
   aDateClose[714] = D'2012.05.17 00:05:56'+time_offset*3600;
   aPriceClose[714] = 0.99327;

   // ========== 715 ===== 124 ==========
   aType[715] = OP_BUY;
   aSymbol[715] = "GBPUSD";
   aLots[715] = 1.0;
   aDateOpen[715] = D'2012.05.17 09:53:33'+time_offset*3600;
   aPriceOpen[715] = 1.58782;
   aDateClose[715] = D'2012.05.18 09:51:49'+time_offset*3600;
   aPriceClose[715] = 1.582;

   // ========== 716 ===== 123 ==========
   aType[716] = OP_BUY;
   aSymbol[716] = "GBPUSD";
   aLots[716] = 1.0;
   aDateOpen[716] = D'2012.05.17 12:30:39'+time_offset*3600;
   aPriceOpen[716] = 1.581;
   aDateClose[716] = D'2012.05.18 09:51:49'+time_offset*3600;
   aPriceClose[716] = 1.582;

   // ========== 717 ===== 122 ==========
   aType[717] = OP_BUY;
   aSymbol[717] = "GBPUSD";
   aLots[717] = 1.0;
   aDateOpen[717] = D'2012.05.17 15:07:28'+time_offset*3600;
   aPriceOpen[717] = 1.58114;
   aDateClose[717] = D'2012.05.18 09:52:11'+time_offset*3600;
   aPriceClose[717] = 1.58184;

   // ========== 718 ===== 125 ==========
   aType[718] = OP_BUY;
   aSymbol[718] = "GBPUSD";
   aLots[718] = 1.0;
   aDateOpen[718] = D'2012.05.17 21:51:27'+time_offset*3600;
   aPriceOpen[718] = 1.5784;
   aDateClose[718] = D'2012.05.18 09:45:29'+time_offset*3600;
   aPriceClose[718] = 1.5805;

   // ========== 719 ===== 120 ==========
   aType[719] = OP_SELL;
   aSymbol[719] = "GBPUSD";
   aLots[719] = 1.0;
   aDateOpen[719] = D'2012.05.18 12:30:50'+time_offset*3600;
   aPriceOpen[719] = 1.58266;
   aDateClose[719] = D'2012.05.18 15:27:38'+time_offset*3600;
   aPriceClose[719] = 1.58145;

   // ========== 720 ===== 121 ==========
   aType[720] = OP_SELL;
   aSymbol[720] = "GBPUSD";
   aLots[720] = 1.0;
   aDateOpen[720] = D'2012.05.18 13:31:12'+time_offset*3600;
   aPriceOpen[720] = 1.58325;
   aDateClose[720] = D'2012.05.18 14:06:11'+time_offset*3600;
   aPriceClose[720] = 1.58181;

   // ========== 721 ===== 118 ==========
   aType[721] = OP_SELL;
   aSymbol[721] = "EURUSD";
   aLots[721] = 1.0;
   aDateOpen[721] = D'2012.05.20 21:02:19'+time_offset*3600;
   aPriceOpen[721] = 1.27653;
   aDateClose[721] = D'2012.05.21 11:44:32'+time_offset*3600;
   aPriceClose[721] = 1.2765;

   // ========== 722 ===== 119 ==========
   aType[722] = OP_SELL;
   aSymbol[722] = "EURUSD";
   aLots[722] = 1.0;
   aDateOpen[722] = D'2012.05.21 01:36:59'+time_offset*3600;
   aPriceOpen[722] = 1.28085;
   aDateClose[722] = D'2012.05.21 03:40:47'+time_offset*3600;
   aPriceClose[722] = 1.27951;

   // ========== 723 ===== 117 ==========
   aType[723] = OP_SELL;
   aSymbol[723] = "GBPUSD";
   aLots[723] = 1.0;
   aDateOpen[723] = D'2012.05.22 08:08:15'+time_offset*3600;
   aPriceOpen[723] = 1.58341;
   aDateClose[723] = D'2012.05.22 08:45:50'+time_offset*3600;
   aPriceClose[723] = 1.58008;

   // ========== 724 ===== 116 ==========
   aType[724] = OP_SELL;
   aSymbol[724] = "EURUSD";
   aLots[724] = 1.0;
   aDateOpen[724] = D'2012.05.22 09:05:51'+time_offset*3600;
   aPriceOpen[724] = 1.27602;
   aDateClose[724] = D'2012.05.22 09:39:51'+time_offset*3600;
   aPriceClose[724] = 1.27579;

   // ========== 725 ===== 115 ==========
   aType[725] = OP_BUY;
   aSymbol[725] = "AUDUSD";
   aLots[725] = 1.0;
   aDateOpen[725] = D'2012.05.22 17:45:23'+time_offset*3600;
   aPriceOpen[725] = 0.9838;
   aDateClose[725] = D'2012.05.23 04:56:38'+time_offset*3600;
   aPriceClose[725] = 0.97738;

   // ========== 726 ===== 113 ==========
   aType[726] = OP_BUY;
   aSymbol[726] = "EURUSD";
   aLots[726] = 1.0;
   aDateOpen[726] = D'2012.05.22 21:31:35'+time_offset*3600;
   aPriceOpen[726] = 1.26777;
   aDateClose[726] = D'2012.05.23 12:36:08'+time_offset*3600;
   aPriceClose[726] = 1.2654;

   // ========== 727 ===== 114 ==========
   aType[727] = OP_BUY;
   aSymbol[727] = "EURUSD";
   aLots[727] = 1.0;
   aDateOpen[727] = D'2012.05.23 00:23:25'+time_offset*3600;
   aPriceOpen[727] = 1.26611;
   aDateClose[727] = D'2012.05.23 12:34:22'+time_offset*3600;
   aPriceClose[727] = 1.26574;

   // ========== 728 ===== 112 ==========
   aType[728] = OP_SELL;
   aSymbol[728] = "EURUSD";
   aLots[728] = 1.0;
   aDateOpen[728] = D'2012.05.24 07:44:54'+time_offset*3600;
   aPriceOpen[728] = 1.25449;
   aDateClose[728] = D'2012.05.24 07:57:48'+time_offset*3600;
   aPriceClose[728] = 1.25419;

   // ========== 729 ===== 111 ==========
   aType[729] = OP_BUY;
   aSymbol[729] = "AUDUSD";
   aLots[729] = 1.0;
   aDateOpen[729] = D'2012.05.24 08:50:27'+time_offset*3600;
   aPriceOpen[729] = 0.97178;
   aDateClose[729] = D'2012.05.24 09:14:41'+time_offset*3600;
   aPriceClose[729] = 0.97395;

   // ========== 730 ===== 110 ==========
   aType[730] = OP_BUY;
   aSymbol[730] = "EURUSD";
   aLots[730] = 1.0;
   aDateOpen[730] = D'2012.05.24 19:15:40'+time_offset*3600;
   aPriceOpen[730] = 1.25256;
   aDateClose[730] = D'2012.05.24 19:31:19'+time_offset*3600;
   aPriceClose[730] = 1.25412;

   // ========== 731 ===== 109 ==========
   aType[731] = OP_SELL;
   aSymbol[731] = "EURUSD";
   aLots[731] = 1.0;
   aDateOpen[731] = D'2012.05.25 12:29:41'+time_offset*3600;
   aPriceOpen[731] = 1.25233;
   aDateClose[731] = D'2012.05.25 12:36:14'+time_offset*3600;
   aPriceClose[731] = 1.25088;

   // ========== 732 ===== 107 ==========
   aType[732] = OP_SELL;
   aSymbol[732] = "EURUSD";
   aLots[732] = 1.0;
   aDateOpen[732] = D'2012.05.28 03:00:43'+time_offset*3600;
   aPriceOpen[732] = 1.25898;
   aDateClose[732] = D'2012.05.28 08:08:20'+time_offset*3600;
   aPriceClose[732] = 1.25752;

   // ========== 733 ===== 108 ==========
   aType[733] = OP_SELL;
   aSymbol[733] = "EURUSD";
   aLots[733] = 1.0;
   aDateOpen[733] = D'2012.05.28 05:43:29'+time_offset*3600;
   aPriceOpen[733] = 1.2603;
   aDateClose[733] = D'2012.05.28 06:05:45'+time_offset*3600;
   aPriceClose[733] = 1.25967;

   // ========== 734 ===== 106 ==========
   aType[734] = OP_SELL;
   aSymbol[734] = "AUDUSD";
   aLots[734] = 1.0;
   aDateOpen[734] = D'2012.05.28 10:21:14'+time_offset*3600;
   aPriceOpen[734] = 0.9879;
   aDateClose[734] = D'2012.05.28 11:46:37'+time_offset*3600;
   aPriceClose[734] = 0.98737;

   // ========== 735 ===== 105 ==========
   aType[735] = OP_BUY;
   aSymbol[735] = "EURUSD";
   aLots[735] = 1.0;
   aDateOpen[735] = D'2012.05.29 07:05:08'+time_offset*3600;
   aPriceOpen[735] = 1.25619;
   aDateClose[735] = D'2012.05.29 09:14:52'+time_offset*3600;
   aPriceClose[735] = 1.25606;

   // ========== 736 ===== 104 ==========
   aType[736] = OP_SELL;
   aSymbol[736] = "EURUSD";
   aLots[736] = 1.0;
   aDateOpen[736] = D'2012.05.29 11:45:06'+time_offset*3600;
   aPriceOpen[736] = 1.25215;
   aDateClose[736] = D'2012.05.29 12:09:08'+time_offset*3600;
   aPriceClose[736] = 1.25212;

   // ========== 737 ===== 103 ==========
   aType[737] = OP_BUY;
   aSymbol[737] = "EURUSD";
   aLots[737] = 1.0;
   aDateOpen[737] = D'2012.05.30 01:38:54'+time_offset*3600;
   aPriceOpen[737] = 1.24657;
   aDateClose[737] = D'2012.05.30 06:31:35'+time_offset*3600;
   aPriceClose[737] = 1.24722;

   // ========== 738 ===== 97 ==========
   aType[738] = OP_BUY;
   aSymbol[738] = "EURUSD";
   aLots[738] = 1.0;
   aDateOpen[738] = D'2012.05.30 07:58:08'+time_offset*3600;
   aPriceOpen[738] = 1.24584;
   aDateClose[738] = D'2012.05.31 09:09:40'+time_offset*3600;
   aPriceClose[738] = 1.24203;

   // ========== 739 ===== 98 ==========
   aType[739] = OP_BUY;
   aSymbol[739] = "EURUSD";
   aLots[739] = 1.0;
   aDateOpen[739] = D'2012.05.30 09:12:22'+time_offset*3600;
   aPriceOpen[739] = 1.24416;
   aDateClose[739] = D'2012.05.31 08:41:47'+time_offset*3600;
   aPriceClose[739] = 1.24146;

   // ========== 740 ===== 101 ==========
   aType[740] = OP_SELL;
   aSymbol[740] = "GBPUSD";
   aLots[740] = 1.0;
   aDateOpen[740] = D'2012.05.30 14:21:00'+time_offset*3600;
   aPriceOpen[740] = 1.55345;
   aDateClose[740] = D'2012.05.30 14:48:21'+time_offset*3600;
   aPriceClose[740] = 1.55267;

   // ========== 741 ===== 102 ==========
   aType[741] = OP_SELL;
   aSymbol[741] = "GBPUSD";
   aLots[741] = 1.0;
   aDateOpen[741] = D'2012.05.30 14:30:50'+time_offset*3600;
   aPriceOpen[741] = 1.55498;
   aDateClose[741] = D'2012.05.30 14:37:40'+time_offset*3600;
   aPriceClose[741] = 1.55344;

   // ========== 742 ===== 100 ==========
   aType[742] = OP_BUY;
   aSymbol[742] = "EURUSD";
   aLots[742] = 1.0;
   aDateOpen[742] = D'2012.05.30 20:26:56'+time_offset*3600;
   aPriceOpen[742] = 1.23676;
   aDateClose[742] = D'2012.05.31 03:25:20'+time_offset*3600;
   aPriceClose[742] = 1.23741;

   // ========== 743 ===== 99 ==========
   aType[743] = OP_BUY;
   aSymbol[743] = "GBPUSD";
   aLots[743] = 1.0;
   aDateOpen[743] = D'2012.05.31 07:09:15'+time_offset*3600;
   aPriceOpen[743] = 1.54898;
   aDateClose[743] = D'2012.05.31 07:26:39'+time_offset*3600;
   aPriceClose[743] = 1.54974;

   // ========== 744 ===== 94 ==========
   aType[744] = OP_BUY;
   aSymbol[744] = "EURUSD";
   aLots[744] = 1.0;
   aDateOpen[744] = D'2012.06.01 00:56:46'+time_offset*3600;
   aPriceOpen[744] = 1.23448;
   aDateClose[744] = D'2012.06.01 13:28:27'+time_offset*3600;
   aPriceClose[744] = 1.24001;

   // ========== 745 ===== 96 ==========
   aType[745] = OP_BUY;
   aSymbol[745] = "GBPUSD";
   aLots[745] = 1.0;
   aDateOpen[745] = D'2012.06.01 08:28:02'+time_offset*3600;
   aPriceOpen[745] = 1.5305;
   aDateClose[745] = D'2012.06.01 13:10:51'+time_offset*3600;
   aPriceClose[745] = 1.53482;

   // ========== 746 ===== 93 ==========
   aType[746] = OP_BUY;
   aSymbol[746] = "EURUSD";
   aLots[746] = 1.0;
   aDateOpen[746] = D'2012.06.01 12:15:31'+time_offset*3600;
   aPriceOpen[746] = 1.23229;
   aDateClose[746] = D'2012.06.01 13:32:16'+time_offset*3600;
   aPriceClose[746] = 1.24112;

   // ========== 747 ===== 95 ==========
   aType[747] = OP_BUY;
   aSymbol[747] = "EURUSD";
   aLots[747] = 1.0;
   aDateOpen[747] = D'2012.06.01 12:31:23'+time_offset*3600;
   aPriceOpen[747] = 1.22984;
   aDateClose[747] = D'2012.06.01 13:27:29'+time_offset*3600;
   aPriceClose[747] = 1.23929;

   // ========== 748 ===== 91 ==========
   aType[748] = OP_BUY;
   aSymbol[748] = "EURUSD";
   aLots[748] = 1.0;
   aDateOpen[748] = D'2012.06.01 13:52:13'+time_offset*3600;
   aPriceOpen[748] = 1.241;
   aDateClose[748] = D'2012.06.01 14:10:18'+time_offset*3600;
   aPriceClose[748] = 1.24259;

   // ========== 749 ===== 92 ==========
   aType[749] = OP_BUY;
   aSymbol[749] = "EURUSD";
   aLots[749] = 1.0;
   aDateOpen[749] = D'2012.06.01 13:57:47'+time_offset*3600;
   aPriceOpen[749] = 1.23946;
   aDateClose[749] = D'2012.06.01 14:01:03'+time_offset*3600;
   aPriceClose[749] = 1.24158;

   // ========== 750 ===== 90 ==========
   aType[750] = OP_BUY;
   aSymbol[750] = "EURUSD";
   aLots[750] = 1.0;
   aDateOpen[750] = D'2012.06.01 14:59:27'+time_offset*3600;
   aPriceOpen[750] = 1.2365;
   aDateClose[750] = D'2012.06.01 15:38:57'+time_offset*3600;
   aPriceClose[750] = 1.23826;

   // ========== 751 ===== 89 ==========
   aType[751] = OP_SELL;
   aSymbol[751] = "EURUSD";
   aLots[751] = 1.0;
   aDateOpen[751] = D'2012.06.04 13:38:33'+time_offset*3600;
   aPriceOpen[751] = 1.24951;
   aDateClose[751] = D'2012.06.04 13:43:44'+time_offset*3600;
   aPriceClose[751] = 1.2487;

   // ========== 752 ===== 87 ==========
   aType[752] = OP_SELL;
   aSymbol[752] = "EURUSD";
   aLots[752] = 1.0;
   aDateOpen[752] = D'2012.06.04 14:07:54'+time_offset*3600;
   aPriceOpen[752] = 1.24906;
   aDateClose[752] = D'2012.06.05 06:49:41'+time_offset*3600;
   aPriceClose[752] = 1.24951;

   // ========== 753 ===== 88 ==========
   aType[753] = OP_SELL;
   aSymbol[753] = "EURUSD";
   aLots[753] = 1.0;
   aDateOpen[753] = D'2012.06.05 00:07:06'+time_offset*3600;
   aPriceOpen[753] = 1.25357;
   aDateClose[753] = D'2012.06.05 06:41:33'+time_offset*3600;
   aPriceClose[753] = 1.24994;

   // ========== 754 ===== 86 ==========
   aType[754] = OP_SELL;
   aSymbol[754] = "GBPUSD";
   aLots[754] = 1.0;
   aDateOpen[754] = D'2012.06.06 07:34:32'+time_offset*3600;
   aPriceOpen[754] = 1.54545;
   aDateClose[754] = D'2012.06.06 09:21:15'+time_offset*3600;
   aPriceClose[754] = 1.54485;

   // ========== 755 ===== 82 ==========
   aType[755] = OP_SELL;
   aSymbol[755] = "AUDUSD";
   aLots[755] = 1.0;
   aDateOpen[755] = D'2012.06.06 11:06:24'+time_offset*3600;
   aPriceOpen[755] = 0.98614;
   aDateClose[755] = D'2012.06.07 20:20:46'+time_offset*3600;
   aPriceClose[755] = 0.99003;

   // ========== 756 ===== 85 ==========
   aType[756] = OP_SELL;
   aSymbol[756] = "GBPUSD";
   aLots[756] = 1.0;
   aDateOpen[756] = D'2012.06.06 11:25:31'+time_offset*3600;
   aPriceOpen[756] = 1.5513;
   aDateClose[756] = D'2012.06.06 11:39:02'+time_offset*3600;
   aPriceClose[756] = 1.55063;

   // ========== 757 ===== 84 ==========
   aType[757] = OP_SELL;
   aSymbol[757] = "USDJPY";
   aLots[757] = 1.0;
   aDateOpen[757] = D'2012.06.07 05:40:38'+time_offset*3600;
   aPriceOpen[757] = 79.447;
   aDateClose[757] = D'2012.06.07 09:01:36'+time_offset*3600;
   aPriceClose[757] = 79.451;

   // ========== 758 ===== 83 ==========
   aType[758] = OP_SELL;
   aSymbol[758] = "EURUSD";
   aLots[758] = 1.0;
   aDateOpen[758] = D'2012.06.07 11:27:24'+time_offset*3600;
   aPriceOpen[758] = 1.25859;
   aDateClose[758] = D'2012.06.07 14:19:56'+time_offset*3600;
   aPriceClose[758] = 1.25629;

   // ========== 759 ===== 80 ==========
   aType[759] = OP_SELL;
   aSymbol[759] = "USDJPY";
   aLots[759] = 1.0;
   aDateOpen[759] = D'2012.06.07 14:30:38'+time_offset*3600;
   aPriceOpen[759] = 79.64;
   aDateClose[759] = D'2012.06.08 02:03:46'+time_offset*3600;
   aPriceClose[759] = 79.407;

   // ========== 760 ===== 81 ==========
   aType[760] = OP_SELL;
   aSymbol[760] = "USDJPY";
   aLots[760] = 1.0;
   aDateOpen[760] = D'2012.06.07 23:55:30'+time_offset*3600;
   aPriceOpen[760] = 79.742;
   aDateClose[760] = D'2012.06.08 00:33:50'+time_offset*3600;
   aPriceClose[760] = 79.592;

   // ========== 761 ===== 79 ==========
   aType[761] = OP_BUY;
   aSymbol[761] = "GBPUSD";
   aLots[761] = 1.0;
   aDateOpen[761] = D'2012.06.08 09:09:38'+time_offset*3600;
   aPriceOpen[761] = 1.5414;
   aDateClose[761] = D'2012.06.08 09:30:32'+time_offset*3600;
   aPriceClose[761] = 1.54154;

   // ========== 762 ===== 76 ==========
   aType[762] = OP_SELL;
   aSymbol[762] = "EURUSD";
   aLots[762] = 1.0;
   aDateOpen[762] = D'2012.06.10 21:39:35'+time_offset*3600;
   aPriceOpen[762] = 1.266;
   aDateClose[762] = D'2012.06.11 07:25:10'+time_offset*3600;
   aPriceClose[762] = 1.26194;

   // ========== 763 ===== 77 ==========
   aType[763] = OP_SELL;
   aSymbol[763] = "GBPUSD";
   aLots[763] = 1.0;
   aDateOpen[763] = D'2012.06.11 01:20:17'+time_offset*3600;
   aPriceOpen[763] = 1.55537;
   aDateClose[763] = D'2012.06.11 07:21:15'+time_offset*3600;
   aPriceClose[763] = 1.55426;

   // ========== 764 ===== 78 ==========
   aType[764] = OP_SELL;
   aSymbol[764] = "EURUSD";
   aLots[764] = 1.0;
   aDateOpen[764] = D'2012.06.11 05:37:38'+time_offset*3600;
   aPriceOpen[764] = 1.26445;
   aDateClose[764] = D'2012.06.11 06:16:35'+time_offset*3600;
   aPriceClose[764] = 1.26286;

   // ========== 765 ===== 74 ==========
   aType[765] = OP_BUY;
   aSymbol[765] = "EURUSD";
   aLots[765] = 1.0;
   aDateOpen[765] = D'2012.06.11 21:08:52'+time_offset*3600;
   aPriceOpen[765] = 1.24746;
   aDateClose[765] = D'2012.06.11 23:56:05'+time_offset*3600;
   aPriceClose[765] = 1.24765;

   // ========== 766 ===== 75 ==========
   aType[766] = OP_BUY;
   aSymbol[766] = "EURUSD";
   aLots[766] = 1.0;
   aDateOpen[766] = D'2012.06.11 22:10:31'+time_offset*3600;
   aPriceOpen[766] = 1.24644;
   aDateClose[766] = D'2012.06.11 22:40:17'+time_offset*3600;
   aPriceClose[766] = 1.24709;

   // ========== 767 ===== 73 ==========
   aType[767] = OP_SELL;
   aSymbol[767] = "EURUSD";
   aLots[767] = 1.0;
   aDateOpen[767] = D'2012.06.12 14:08:29'+time_offset*3600;
   aPriceOpen[767] = 1.24568;
   aDateClose[767] = D'2012.06.12 15:13:52'+time_offset*3600;
   aPriceClose[767] = 1.24784;

   // ========== 768 ===== 72 ==========
   aType[768] = OP_SELL;
   aSymbol[768] = "EURUSD";
   aLots[768] = 1.0;
   aDateOpen[768] = D'2012.06.13 11:50:20'+time_offset*3600;
   aPriceOpen[768] = 1.25363;
   aDateClose[768] = D'2012.06.13 13:41:03'+time_offset*3600;
   aPriceClose[768] = 1.25241;

   // ========== 769 ===== 71 ==========
   aType[769] = OP_SELL;
   aSymbol[769] = "EURUSD";
   aLots[769] = 1.0;
   aDateOpen[769] = D'2012.06.13 12:46:13'+time_offset*3600;
   aPriceOpen[769] = 1.25378;
   aDateClose[769] = D'2012.06.13 13:48:38'+time_offset*3600;
   aPriceClose[769] = 1.25278;

   // ========== 770 ===== 70 ==========
   aType[770] = OP_SELL;
   aSymbol[770] = "EURUSD";
   aLots[770] = 1.0;
   aDateOpen[770] = D'2012.06.13 15:37:00'+time_offset*3600;
   aPriceOpen[770] = 1.26009;
   aDateClose[770] = D'2012.06.13 15:51:49'+time_offset*3600;
   aPriceClose[770] = 1.25936;

   // ========== 771 ===== 69 ==========
   aType[771] = OP_SELL;
   aSymbol[771] = "GBPUSD";
   aLots[771] = 1.0;
   aDateOpen[771] = D'2012.06.14 06:21:36'+time_offset*3600;
   aPriceOpen[771] = 1.54928;
   aDateClose[771] = D'2012.06.14 06:49:25'+time_offset*3600;
   aPriceClose[771] = 1.5481;

   // ========== 772 ===== 68 ==========
   aType[772] = OP_SELL;
   aSymbol[772] = "EURUSD";
   aLots[772] = 1.0;
   aDateOpen[772] = D'2012.06.14 08:53:48'+time_offset*3600;
   aPriceOpen[772] = 1.2546;
   aDateClose[772] = D'2012.06.14 10:16:49'+time_offset*3600;
   aPriceClose[772] = 1.25653;

   // ========== 773 ===== 67 ==========
   aType[773] = OP_SELL;
   aSymbol[773] = "EURUSD";
   aLots[773] = 1.0;
   aDateOpen[773] = D'2012.06.14 21:38:46'+time_offset*3600;
   aPriceOpen[773] = 1.26284;
   aDateClose[773] = D'2012.06.15 00:49:11'+time_offset*3600;
   aPriceClose[773] = 1.26163;

   // ========== 774 ===== 66 ==========
   aType[774] = OP_SELL;
   aSymbol[774] = "EURUSD";
   aLots[774] = 1.0;
   aDateOpen[774] = D'2012.06.15 03:44:01'+time_offset*3600;
   aPriceOpen[774] = 1.2639;
   aDateClose[774] = D'2012.06.15 07:28:35'+time_offset*3600;
   aPriceClose[774] = 1.26256;

   // ========== 775 ===== 65 ==========
   aType[775] = OP_SELL;
   aSymbol[775] = "AUDUSD";
   aLots[775] = 1.0;
   aDateOpen[775] = D'2012.06.15 15:35:49'+time_offset*3600;
   aPriceOpen[775] = 1.00653;
   aDateClose[775] = D'2012.06.15 16:24:07'+time_offset*3600;
   aPriceClose[775] = 1.00547;

   // ========== 776 ===== 64 ==========
   aType[776] = OP_SELL;
   aSymbol[776] = "AUDUSD";
   aLots[776] = 1.0;
   aDateOpen[776] = D'2012.06.18 00:33:27'+time_offset*3600;
   aPriceOpen[776] = 1.01149;
   aDateClose[776] = D'2012.06.18 01:45:49'+time_offset*3600;
   aPriceClose[776] = 1.00929;

   // ========== 777 ===== 63 ==========
   aType[777] = OP_SELL;
   aSymbol[777] = "AUDUSD";
   aLots[777] = 1.0;
   aDateOpen[777] = D'2012.06.18 06:12:31'+time_offset*3600;
   aPriceOpen[777] = 1.01151;
   aDateClose[777] = D'2012.06.18 07:23:37'+time_offset*3600;
   aPriceClose[777] = 1.01023;

   // ========== 778 ===== 62 ==========
   aType[778] = OP_BUY;
   aSymbol[778] = "EURUSD";
   aLots[778] = 1.0;
   aDateOpen[778] = D'2012.06.18 12:38:43'+time_offset*3600;
   aPriceOpen[778] = 1.26066;
   aDateClose[778] = D'2012.06.18 14:23:10'+time_offset*3600;
   aPriceClose[778] = 1.26009;

   // ========== 779 ===== 59 ==========
   aType[779] = OP_SELL;
   aSymbol[779] = "AUDUSD";
   aLots[779] = 1.0;
   aDateOpen[779] = D'2012.06.19 14:09:45'+time_offset*3600;
   aPriceOpen[779] = 1.01744;
   aDateClose[779] = D'2012.06.20 16:32:15'+time_offset*3600;
   aPriceClose[779] = 1.017;

   // ========== 780 ===== 58 ==========
   aType[780] = OP_SELL;
   aSymbol[780] = "AUDUSD";
   aLots[780] = 1.0;
   aDateOpen[780] = D'2012.06.19 14:23:17'+time_offset*3600;
   aPriceOpen[780] = 1.01762;
   aDateClose[780] = D'2012.06.21 02:23:26'+time_offset*3600;
   aPriceClose[780] = 1.0172;

   // ========== 781 ===== 61 ==========
   aType[781] = OP_SELL;
   aSymbol[781] = "AUDUSD";
   aLots[781] = 1.0;
   aDateOpen[781] = D'2012.06.19 15:49:23'+time_offset*3600;
   aPriceOpen[781] = 1.01914;
   aDateClose[781] = D'2012.06.19 18:50:21'+time_offset*3600;
   aPriceClose[781] = 1.01771;

   // ========== 782 ===== 60 ==========
   aType[782] = OP_SELL;
   aSymbol[782] = "AUDUSD";
   aLots[782] = 1.0;
   aDateOpen[782] = D'2012.06.20 11:31:51'+time_offset*3600;
   aPriceOpen[782] = 1.0206;
   aDateClose[782] = D'2012.06.20 12:50:45'+time_offset*3600;
   aPriceClose[782] = 1.01942;

   // ========== 783 ===== 57 ==========
   aType[783] = OP_SELL;
   aSymbol[783] = "EURUSD";
   aLots[783] = 1.0;
   aDateOpen[783] = D'2012.06.21 18:07:48'+time_offset*3600;
   aPriceOpen[783] = 1.25646;
   aDateClose[783] = D'2012.06.21 18:16:12'+time_offset*3600;
   aPriceClose[783] = 1.25611;

   // ========== 784 ===== 56 ==========
   aType[784] = OP_SELL;
   aSymbol[784] = "EURUSD";
   aLots[784] = 1.0;
   aDateOpen[784] = D'2012.06.22 10:34:45'+time_offset*3600;
   aPriceOpen[784] = 1.25537;
   aDateClose[784] = D'2012.06.25 05:39:23'+time_offset*3600;
   aPriceClose[784] = 1.25267;

   // ========== 785 ===== 55 ==========
   aType[785] = OP_SELL;
   aSymbol[785] = "EURUSD";
   aLots[785] = 1.0;
   aDateOpen[785] = D'2012.06.25 06:37:55'+time_offset*3600;
   aPriceOpen[785] = 1.24993;
   aDateClose[785] = D'2012.06.25 09:21:34'+time_offset*3600;
   aPriceClose[785] = 1.2493;

   // ========== 786 ===== 54 ==========
   aType[786] = OP_SELL;
   aSymbol[786] = "EURUSD";
   aLots[786] = 1.0;
   aDateOpen[786] = D'2012.06.25 06:40:47'+time_offset*3600;
   aPriceOpen[786] = 1.25058;
   aDateClose[786] = D'2012.06.25 09:25:01'+time_offset*3600;
   aPriceClose[786] = 1.24917;

   // ========== 787 ===== 53 ==========
   aType[787] = OP_BUY;
   aSymbol[787] = "USDJPY";
   aLots[787] = 1.0;
   aDateOpen[787] = D'2012.06.25 12:28:26'+time_offset*3600;
   aPriceOpen[787] = 79.674;
   aDateClose[787] = D'2012.06.25 22:18:31'+time_offset*3600;
   aPriceClose[787] = 79.598;

   // ========== 788 ===== 52 ==========
   aType[788] = OP_SELL;
   aSymbol[788] = "EURUSD";
   aLots[788] = 1.0;
   aDateOpen[788] = D'2012.06.26 08:49:15'+time_offset*3600;
   aPriceOpen[788] = 1.2488;
   aDateClose[788] = D'2012.06.26 09:41:18'+time_offset*3600;
   aPriceClose[788] = 1.24981;

   // ========== 789 ===== 51 ==========
   aType[789] = OP_SELL;
   aSymbol[789] = "EURUSD";
   aLots[789] = 1.0;
   aDateOpen[789] = D'2012.06.26 12:18:26'+time_offset*3600;
   aPriceOpen[789] = 1.24614;
   aDateClose[789] = D'2012.06.26 12:53:23'+time_offset*3600;
   aPriceClose[789] = 1.24726;

   // ========== 790 ===== 48 ==========
   aType[790] = OP_SELL;
   aSymbol[790] = "EURUSD";
   aLots[790] = 1.0;
   aDateOpen[790] = D'2012.06.28 08:55:50'+time_offset*3600;
   aPriceOpen[790] = 1.24262;
   aDateClose[790] = D'2012.06.29 02:49:21'+time_offset*3600;
   aPriceClose[790] = 1.24704;

   // ========== 791 ===== 49 ==========
   aType[791] = OP_SELL;
   aSymbol[791] = "EURUSD";
   aLots[791] = 1.0;
   aDateOpen[791] = D'2012.06.28 09:07:06'+time_offset*3600;
   aPriceOpen[791] = 1.24323;
   aDateClose[791] = D'2012.06.29 02:49:17'+time_offset*3600;
   aPriceClose[791] = 1.24716;

   // ========== 792 ===== 50 ==========
   aType[792] = OP_SELL;
   aSymbol[792] = "EURUSD";
   aLots[792] = 1.0;
   aDateOpen[792] = D'2012.06.28 11:28:22'+time_offset*3600;
   aPriceOpen[792] = 1.24486;
   aDateClose[792] = D'2012.06.28 11:55:52'+time_offset*3600;
   aPriceClose[792] = 1.24314;

   // ========== 793 ===== 47 ==========
   aType[793] = OP_SELL;
   aSymbol[793] = "EURUSD";
   aLots[793] = 1.0;
   aDateOpen[793] = D'2012.06.29 03:02:51'+time_offset*3600;
   aPriceOpen[793] = 1.26047;
   aDateClose[793] = D'2012.06.29 03:03:40'+time_offset*3600;
   aPriceClose[793] = 1.2585;

   // ========== 794 ===== 46 ==========
   aType[794] = OP_BUY;
   aSymbol[794] = "EURUSD";
   aLots[794] = 1.0;
   aDateOpen[794] = D'2012.07.02 17:34:16'+time_offset*3600;
   aPriceOpen[794] = 1.25851;
   aDateClose[794] = D'2012.07.03 04:07:13'+time_offset*3600;
   aPriceClose[794] = 1.26018;

   // ========== 795 ===== 45 ==========
   aType[795] = OP_SELL;
   aSymbol[795] = "GBPUSD";
   aLots[795] = 1.0;
   aDateOpen[795] = D'2012.07.04 10:10:09'+time_offset*3600;
   aPriceOpen[795] = 1.56538;
   aDateClose[795] = D'2012.07.04 11:01:09'+time_offset*3600;
   aPriceClose[795] = 1.56443;

   // ========== 796 ===== 43 ==========
   aType[796] = OP_BUY;
   aSymbol[796] = "AUDUSD";
   aLots[796] = 1.0;
   aDateOpen[796] = D'2012.07.05 11:01:40'+time_offset*3600;
   aPriceOpen[796] = 1.03184;
   aDateClose[796] = D'2012.07.05 12:32:07'+time_offset*3600;
   aPriceClose[796] = 1.0281;

   // ========== 797 ===== 44 ==========
   aType[797] = OP_BUY;
   aSymbol[797] = "AUDUSD";
   aLots[797] = 1.0;
   aDateOpen[797] = D'2012.07.05 11:02:57'+time_offset*3600;
   aPriceOpen[797] = 1.03072;
   aDateClose[797] = D'2012.07.05 12:32:07'+time_offset*3600;
   aPriceClose[797] = 1.0281;

   // ========== 798 ===== 42 ==========
   aType[798] = OP_SELL;
   aSymbol[798] = "AUDUSD";
   aLots[798] = 1.0;
   aDateOpen[798] = D'2012.07.05 12:36:57'+time_offset*3600;
   aPriceOpen[798] = 1.02608;
   aDateClose[798] = D'2012.07.06 02:35:02'+time_offset*3600;
   aPriceClose[798] = 1.02589;

   // ========== 799 ===== 41 ==========
   aType[799] = OP_SELL;
   aSymbol[799] = "AUDUSD";
   aLots[799] = 1.0;
   aDateOpen[799] = D'2012.07.05 12:38:42'+time_offset*3600;
   aPriceOpen[799] = 1.0264;
   aDateClose[799] = D'2012.07.06 02:36:21'+time_offset*3600;
   aPriceClose[799] = 1.02583;

   // ========== 800 ===== 39 ==========
   aType[800] = OP_SELL;
   aSymbol[800] = "AUDUSD";
   aLots[800] = 1.0;
   aDateOpen[800] = D'2012.07.05 12:39:22'+time_offset*3600;
   aPriceOpen[800] = 1.02614;
   aDateClose[800] = D'2012.07.06 02:40:30'+time_offset*3600;
   aPriceClose[800] = 1.02553;

   // ========== 801 ===== 40 ==========
   aType[801] = OP_SELL;
   aSymbol[801] = "AUDUSD";
   aLots[801] = 1.0;
   aDateOpen[801] = D'2012.07.05 12:43:41'+time_offset*3600;
   aPriceOpen[801] = 1.02623;
   aDateClose[801] = D'2012.07.06 02:40:25'+time_offset*3600;
   aPriceClose[801] = 1.0255;

   // ========== 802 ===== 38 ==========
   aType[802] = OP_BUY;
   aSymbol[802] = "EURUSD";
   aLots[802] = 1.0;
   aDateOpen[802] = D'2012.07.06 07:02:45'+time_offset*3600;
   aPriceOpen[802] = 1.23711;
   aDateClose[802] = D'2012.07.06 08:00:08'+time_offset*3600;
   aPriceClose[802] = 1.2383;

   // ========== 803 ===== 36 ==========
   aType[803] = OP_BUY;
   aSymbol[803] = "EURUSD";
   aLots[803] = 1.0;
   aDateOpen[803] = D'2012.07.06 12:47:21'+time_offset*3600;
   aPriceOpen[803] = 1.23545;
   aDateClose[803] = D'2012.07.09 20:32:29'+time_offset*3600;
   aPriceClose[803] = 1.23193;

   // ========== 804 ===== 37 ==========
   aType[804] = OP_SELL;
   aSymbol[804] = "USDCHF";
   aLots[804] = 1.0;
   aDateOpen[804] = D'2012.07.06 14:28:38'+time_offset*3600;
   aPriceOpen[804] = 0.97526;
   aDateClose[804] = D'2012.07.09 12:50:43'+time_offset*3600;
   aPriceClose[804] = 0.97657;

   // ========== 805 ===== 35 ==========
   aType[805] = OP_SELL;
   aSymbol[805] = "EURUSD";
   aLots[805] = 1.0;
   aDateOpen[805] = D'2012.07.09 20:32:34'+time_offset*3600;
   aPriceOpen[805] = 1.23192;
   aDateClose[805] = D'2012.07.10 00:55:35'+time_offset*3600;
   aPriceClose[805] = 1.2299;

   // ========== 806 ===== 34 ==========
   aType[806] = OP_BUY;
   aSymbol[806] = "USDCHF";
   aLots[806] = 1.0;
   aDateOpen[806] = D'2012.07.10 12:55:16'+time_offset*3600;
   aPriceOpen[806] = 0.97804;
   aDateClose[806] = D'2012.07.10 13:25:08'+time_offset*3600;
   aPriceClose[806] = 0.9766;

   // ========== 807 ===== 32 ==========
   aType[807] = OP_SELL;
   aSymbol[807] = "GBPUSD";
   aLots[807] = 1.0;
   aDateOpen[807] = D'2012.07.11 08:58:31'+time_offset*3600;
   aPriceOpen[807] = 1.55571;
   aDateClose[807] = D'2012.07.11 15:12:28'+time_offset*3600;
   aPriceClose[807] = 1.55391;

   // ========== 808 ===== 33 ==========
   aType[808] = OP_SELL;
   aSymbol[808] = "GBPUSD";
   aLots[808] = 1.0;
   aDateOpen[808] = D'2012.07.11 11:24:16'+time_offset*3600;
   aPriceOpen[808] = 1.55754;
   aDateClose[808] = D'2012.07.11 12:36:05'+time_offset*3600;
   aPriceClose[808] = 1.55542;

   // ========== 809 ===== 30 ==========
   aType[809] = OP_BUY;
   aSymbol[809] = "EURUSD";
   aLots[809] = 1.0;
   aDateOpen[809] = D'2012.07.12 07:19:27'+time_offset*3600;
   aPriceOpen[809] = 1.22236;
   aDateClose[809] = D'2012.07.13 14:01:30'+time_offset*3600;
   aPriceClose[809] = 1.22336;

   // ========== 810 ===== 31 ==========
   aType[810] = OP_BUY;
   aSymbol[810] = "EURUSD";
   aLots[810] = 1.0;
   aDateOpen[810] = D'2012.07.12 10:18:38'+time_offset*3600;
   aPriceOpen[810] = 1.22008;
   aDateClose[810] = D'2012.07.13 03:32:35'+time_offset*3600;
   aPriceClose[810] = 1.22061;

   // ========== 811 ===== 29 ==========
   aType[811] = OP_SELL;
   aSymbol[811] = "GBPUSD";
   aLots[811] = 1.0;
   aDateOpen[811] = D'2012.07.15 22:48:56'+time_offset*3600;
   aPriceOpen[811] = 1.55897;
   aDateClose[811] = D'2012.07.16 00:04:11'+time_offset*3600;
   aPriceClose[811] = 1.55794;

   // ========== 812 ===== 28 ==========
   aType[812] = OP_SELL;
   aSymbol[812] = "EURUSD";
   aLots[812] = 1.0;
   aDateOpen[812] = D'2012.07.16 12:03:37'+time_offset*3600;
   aPriceOpen[812] = 1.2186;
   aDateClose[812] = D'2012.07.16 12:15:35'+time_offset*3600;
   aPriceClose[812] = 1.2179;

   // ========== 813 ===== 27 ==========
   aType[813] = OP_BUY;
   aSymbol[813] = "EURUSD";
   aLots[813] = 1.0;
   aDateOpen[813] = D'2012.07.17 14:33:18'+time_offset*3600;
   aPriceOpen[813] = 1.22127;
   aDateClose[813] = D'2012.07.17 15:04:11'+time_offset*3600;
   aPriceClose[813] = 1.22193;

   // ========== 814 ===== 26 ==========
   aType[814] = OP_SELL;
   aSymbol[814] = "EURUSD";
   aLots[814] = 1.0;
   aDateOpen[814] = D'2012.07.18 10:00:10'+time_offset*3600;
   aPriceOpen[814] = 1.22333;
   aDateClose[814] = D'2012.07.18 13:11:18'+time_offset*3600;
   aPriceClose[814] = 1.22222;

   // ========== 815 ===== 25 ==========
   aType[815] = OP_SELL;
   aSymbol[815] = "AUDUSD";
   aLots[815] = 1.0;
   aDateOpen[815] = D'2012.07.18 16:35:59'+time_offset*3600;
   aPriceOpen[815] = 1.03607;
   aDateClose[815] = D'2012.07.18 18:42:10'+time_offset*3600;
   aPriceClose[815] = 1.035;

   // ========== 816 ===== 20 ==========
   aType[816] = OP_SELL;
   aSymbol[816] = "AUDUSD";
   aLots[816] = 1.0;
   aDateOpen[816] = D'2012.07.19 00:26:51'+time_offset*3600;
   aPriceOpen[816] = 1.03729;
   aDateClose[816] = D'2012.07.20 12:27:13'+time_offset*3600;
   aPriceClose[816] = 1.03905;

   // ========== 817 ===== 21 ==========
   aType[817] = OP_SELL;
   aSymbol[817] = "AUDUSD";
   aLots[817] = 1.0;
   aDateOpen[817] = D'2012.07.19 03:56:39'+time_offset*3600;
   aPriceOpen[817] = 1.03929;
   aDateClose[817] = D'2012.07.20 12:25:21'+time_offset*3600;
   aPriceClose[817] = 1.03914;

   // ========== 818 ===== 23 ==========
   aType[818] = OP_SELL;
   aSymbol[818] = "AUDUSD";
   aLots[818] = 1.0;
   aDateOpen[818] = D'2012.07.19 07:33:30'+time_offset*3600;
   aPriceOpen[818] = 1.04095;
   aDateClose[818] = D'2012.07.20 04:45:10'+time_offset*3600;
   aPriceClose[818] = 1.04065;

   // ========== 819 ===== 24 ==========
   aType[819] = OP_SELL;
   aSymbol[819] = "AUDUSD";
   aLots[819] = 1.0;
   aDateOpen[819] = D'2012.07.19 10:00:08'+time_offset*3600;
   aPriceOpen[819] = 1.04172;
   aDateClose[819] = D'2012.07.20 04:45:05'+time_offset*3600;
   aPriceClose[819] = 1.04065;

   // ========== 820 ===== 22 ==========
   aType[820] = OP_SELL;
   aSymbol[820] = "AUDUSD";
   aLots[820] = 1.0;
   aDateOpen[820] = D'2012.07.20 09:06:39'+time_offset*3600;
   aPriceOpen[820] = 1.04238;
   aDateClose[820] = D'2012.07.20 09:56:25'+time_offset*3600;
   aPriceClose[820] = 1.04138;

   // ========== 821 ===== 19 ==========
   aType[821] = OP_SELL;
   aSymbol[821] = "AUDUSD";
   aLots[821] = 1.0;
   aDateOpen[821] = D'2012.07.25 12:25:31'+time_offset*3600;
   aPriceOpen[821] = 1.02933;
   aDateClose[821] = D'2012.07.25 14:12:49'+time_offset*3600;
   aPriceClose[821] = 1.02808;

   // ========== 822 ===== 18 ==========
   aType[822] = OP_SELL;
   aSymbol[822] = "AUDUSD";
   aLots[822] = 1.0;
   aDateOpen[822] = D'2012.07.29 21:45:28'+time_offset*3600;
   aPriceOpen[822] = 1.04802;
   aDateClose[822] = D'2012.07.29 22:22:07'+time_offset*3600;
   aPriceClose[822] = 1.04701;

   // ========== 823 ===== 17 ==========
   aType[823] = OP_SELL;
   aSymbol[823] = "AUDUSD";
   aLots[823] = 1.0;
   aDateOpen[823] = D'2012.07.30 12:05:58'+time_offset*3600;
   aPriceOpen[823] = 1.04936;
   aDateClose[823] = D'2012.07.30 12:50:07'+time_offset*3600;
   aPriceClose[823] = 1.04844;

   // ========== 824 ===== 16 ==========
   aType[824] = OP_SELL;
   aSymbol[824] = "AUDUSD";
   aLots[824] = 1.0;
   aDateOpen[824] = D'2012.07.30 13:46:42'+time_offset*3600;
   aPriceOpen[824] = 1.04959;
   aDateClose[824] = D'2012.07.30 16:21:40'+time_offset*3600;
   aPriceClose[824] = 1.04834;

   // ========== 825 ===== 15 ==========
   aType[825] = OP_SELL;
   aSymbol[825] = "AUDUSD";
   aLots[825] = 1.0;
   aDateOpen[825] = D'2012.07.31 05:18:51'+time_offset*3600;
   aPriceOpen[825] = 1.05309;
   aDateClose[825] = D'2012.07.31 06:14:02'+time_offset*3600;
   aPriceClose[825] = 1.05189;

   // ========== 826 ===== 14 ==========
   aType[826] = OP_BUY;
   aSymbol[826] = "EURUSD";
   aLots[826] = 1.0;
   aDateOpen[826] = D'2012.08.02 11:52:16'+time_offset*3600;
   aPriceOpen[826] = 1.22935;
   aDateClose[826] = D'2012.08.02 12:02:39'+time_offset*3600;
   aPriceClose[826] = 1.2312;

   // ========== 827 ===== 13 ==========
   aType[827] = OP_SELL;
   aSymbol[827] = "AUDUSD";
   aLots[827] = 1.0;
   aDateOpen[827] = D'2012.08.02 12:35:07'+time_offset*3600;
   aPriceOpen[827] = 1.05615;
   aDateClose[827] = D'2012.08.02 12:37:29'+time_offset*3600;
   aPriceClose[827] = 1.05423;

   // ========== 828 ===== 12 ==========
   aType[828] = OP_SELL;
   aSymbol[828] = "AUDUSD";
   aLots[828] = 1.0;
   aDateOpen[828] = D'2012.08.02 12:36:19'+time_offset*3600;
   aPriceOpen[828] = 1.0568;
   aDateClose[828] = D'2012.08.02 12:39:17'+time_offset*3600;
   aPriceClose[828] = 1.05369;

   // ========== 829 ===== 11 ==========
   aType[829] = OP_BUY;
   aSymbol[829] = "AUDUSD";
   aLots[829] = 1.0;
   aDateOpen[829] = D'2012.08.02 13:01:40'+time_offset*3600;
   aPriceOpen[829] = 1.04665;
   aDateClose[829] = D'2012.08.02 13:07:53'+time_offset*3600;
   aPriceClose[829] = 1.04686;

   // ========== 830 ===== 7 ==========
   aType[830] = OP_SELL;
   aSymbol[830] = "EURUSD";
   aLots[830] = 1.0;
   aDateOpen[830] = D'2012.08.02 18:27:57'+time_offset*3600;
   aPriceOpen[830] = 1.21686;
   aDateClose[830] = D'2012.08.03 12:08:59'+time_offset*3600;
   aPriceClose[830] = 1.22499;

   // ========== 831 ===== 8 ==========
   aType[831] = OP_SELL;
   aSymbol[831] = "EURUSD";
   aLots[831] = 1.0;
   aDateOpen[831] = D'2012.08.03 07:34:24'+time_offset*3600;
   aPriceOpen[831] = 1.22034;
   aDateClose[831] = D'2012.08.03 12:07:01'+time_offset*3600;
   aPriceClose[831] = 1.22524;

   // ========== 832 ===== 9 ==========
   aType[832] = OP_SELL;
   aSymbol[832] = "EURUSD";
   aLots[832] = 1.0;
   aDateOpen[832] = D'2012.08.03 09:25:37'+time_offset*3600;
   aPriceOpen[832] = 1.22205;
   aDateClose[832] = D'2012.08.03 12:06:44'+time_offset*3600;
   aPriceClose[832] = 1.22516;

   // ========== 833 ===== 10 ==========
   aType[833] = OP_SELL;
   aSymbol[833] = "EURUSD";
   aLots[833] = 1.0;
   aDateOpen[833] = D'2012.08.03 09:27:06'+time_offset*3600;
   aPriceOpen[833] = 1.22294;
   aDateClose[833] = D'2012.08.03 12:06:39'+time_offset*3600;
   aPriceClose[833] = 1.22532;

   // ========== 834 ===== 6 ==========
   aType[834] = OP_BUY;
   aSymbol[834] = "USDJPY";
   aLots[834] = 1.0;
   aDateOpen[834] = D'2012.08.03 13:18:30'+time_offset*3600;
   aPriceOpen[834] = 78.699;
   aDateClose[834] = D'2012.08.03 15:18:31'+time_offset*3600;
   aPriceClose[834] = 78.545;

   // ========== 835 ===== 2 ==========
   aType[835] = OP_SELL;
   aSymbol[835] = "EURUSD";
   aLots[835] = 1.0;
   aDateOpen[835] = D'2012.08.03 14:30:51'+time_offset*3600;
   aPriceOpen[835] = 1.23408;
   aDateClose[835] = D'2012.08.06 07:39:13'+time_offset*3600;
   aPriceClose[835] = 1.2356;

   // ========== 836 ===== 3 ==========
   aType[836] = OP_SELL;
   aSymbol[836] = "EURUSD";
   aLots[836] = 1.0;
   aDateOpen[836] = D'2012.08.03 15:06:12'+time_offset*3600;
   aPriceOpen[836] = 1.23447;
   aDateClose[836] = D'2012.08.06 07:22:13'+time_offset*3600;
   aPriceClose[836] = 1.23653;

   // ========== 837 ===== 4 ==========
   aType[837] = OP_SELL;
   aSymbol[837] = "EURUSD";
   aLots[837] = 1.0;
   aDateOpen[837] = D'2012.08.03 15:14:01'+time_offset*3600;
   aPriceOpen[837] = 1.23541;
   aDateClose[837] = D'2012.08.06 07:04:25'+time_offset*3600;
   aPriceClose[837] = 1.23689;

   // ========== 838 ===== 5 ==========
   aType[838] = OP_SELL;
   aSymbol[838] = "EURUSD";
   aLots[838] = 1.0;
   aDateOpen[838] = D'2012.08.03 15:19:08'+time_offset*3600;
   aPriceOpen[838] = 1.23645;
   aDateClose[838] = D'2012.08.06 07:04:21'+time_offset*3600;
   aPriceClose[838] = 1.23689;

   // ========== 839 ===== 1 ==========
   aType[839] = OP_SELL;
   aSymbol[839] = "GBPUSD";
   aLots[839] = 1.0;
   aDateOpen[839] = D'2012.08.16 06:12:32'+time_offset*3600;
   aPriceOpen[839] = 1.5636;
   aDateClose[839] = D'2012.08.16 08:30:01'+time_offset*3600;
   aPriceClose[839] = 1.5682;

   // ========== 840 ===== 0 ==========
   aType[840] = OP_BUY;
   aSymbol[840] = "USDCAD";
   aLots[840] = 1.0;
   aDateOpen[840] = D'2012.08.21 10:41:35'+time_offset*3600;
   aPriceOpen[840] = 0.98548;
   aDateClose[840] = D'2012.08.21 23:57:15'+time_offset*3600;
   aPriceClose[840] = 0.9897;
}
