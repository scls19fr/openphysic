//+------------------------------------------------------------------+
//|include/Trade_History_out_OpenClose0_EURUSD.mqh
//|                                 Copyright (c) 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

int NbOrdersInFile = 652;

int aPseudoTicket[652];
int aAction[652]; // 1=OPEN 0=CLOSE
int aType[652];  // OP_BUY or OP_SELL
string aSymbol[652];
double aLots[652];
datetime aDate[652];
double aPrice[652];

int aReturn[652];

int time_offset = 3;

void init_tab() {

   // ========== 0 ===== 836 ==========
   aPseudoTicket[0] = 0;
   aAction[0] = 1; // OPEN
   aReturn[0] = 0;
   aType[0] = OP_SELL; // SELL
   aTicket[0] = -1; // Ticket given by broker
   aSymbol[0] = "EURUSD";
   aLots[0] = 1.0;
   aDate[0] = D'2011.05.24 05:24:00'+time_offset*3600;
   aPrice[0] = 1.40736;

   // ========== 1 ===== 836 ==========
   aPseudoTicket[1] = 0;
   aAction[1] = 0; // CLOSE
   aType[1] = OP_SELL; // SELL
   aTicket[1] = -1; // Ticket given by broker
   aSymbol[1] = "EURUSD";
   aLots[1] = 1.0;
   aDate[1] = D'2011.05.25 06:30:32'+time_offset*3600;
   aPrice[1] = 1.40444;

   // ========== 2 ===== 831 ==========
   aPseudoTicket[2] = 1;
   aAction[2] = 1; // OPEN
   aReturn[1] = 2;
   aType[2] = OP_SELL; // SELL
   aTicket[2] = -1; // Ticket given by broker
   aSymbol[2] = "EURUSD";
   aLots[2] = 1.0;
   aDate[2] = D'2011.06.09 12:48:24'+time_offset*3600;
   aPrice[2] = 1.45446;

   // ========== 3 ===== 831 ==========
   aPseudoTicket[3] = 1;
   aAction[3] = 0; // CLOSE
   aType[3] = OP_SELL; // SELL
   aTicket[3] = -1; // Ticket given by broker
   aSymbol[3] = "EURUSD";
   aLots[3] = 1.0;
   aDate[3] = D'2011.06.09 13:19:05'+time_offset*3600;
   aPrice[3] = 1.45;

   // ========== 4 ===== 830 ==========
   aPseudoTicket[4] = 2;
   aAction[4] = 1; // OPEN
   aReturn[2] = 4;
   aType[4] = OP_SELL; // SELL
   aTicket[4] = -1; // Ticket given by broker
   aSymbol[4] = "EURUSD";
   aLots[4] = 1.0;
   aDate[4] = D'2011.06.10 01:05:56'+time_offset*3600;
   aPrice[4] = 1.45337;

   // ========== 5 ===== 830 ==========
   aPseudoTicket[5] = 2;
   aAction[5] = 0; // CLOSE
   aType[5] = OP_SELL; // SELL
   aTicket[5] = -1; // Ticket given by broker
   aSymbol[5] = "EURUSD";
   aLots[5] = 1.0;
   aDate[5] = D'2011.06.10 05:04:16'+time_offset*3600;
   aPrice[5] = 1.44906;

   // ========== 6 ===== 826 ==========
   aPseudoTicket[6] = 3;
   aAction[6] = 1; // OPEN
   aReturn[3] = 6;
   aType[6] = OP_SELL; // SELL
   aTicket[6] = -1; // Ticket given by broker
   aSymbol[6] = "EURUSD";
   aLots[6] = 1.0;
   aDate[6] = D'2011.06.14 05:50:57'+time_offset*3600;
   aPrice[6] = 1.44354;

   // ========== 7 ===== 826 ==========
   aPseudoTicket[7] = 3;
   aAction[7] = 0; // CLOSE
   aType[7] = OP_SELL; // SELL
   aTicket[7] = -1; // Ticket given by broker
   aSymbol[7] = "EURUSD";
   aLots[7] = 1.0;
   aDate[7] = D'2011.06.15 01:46:22'+time_offset*3600;
   aPrice[7] = 1.44148;

   // ========== 8 ===== 825 ==========
   aPseudoTicket[8] = 4;
   aAction[8] = 1; // OPEN
   aReturn[4] = 8;
   aType[8] = OP_SELL; // SELL
   aTicket[8] = -1; // Ticket given by broker
   aSymbol[8] = "EURUSD";
   aLots[8] = 1.0;
   aDate[8] = D'2011.06.16 22:24:17'+time_offset*3600;
   aPrice[8] = 1.42035;

   // ========== 9 ===== 825 ==========
   aPseudoTicket[9] = 4;
   aAction[9] = 0; // CLOSE
   aType[9] = OP_SELL; // SELL
   aTicket[9] = -1; // Ticket given by broker
   aSymbol[9] = "EURUSD";
   aLots[9] = 1.0;
   aDate[9] = D'2011.06.17 04:30:05'+time_offset*3600;
   aPrice[9] = 1.41487;

   // ========== 10 ===== 823 ==========
   aPseudoTicket[10] = 5;
   aAction[10] = 1; // OPEN
   aReturn[5] = 10;
   aType[10] = OP_BUY; // BUY
   aTicket[10] = -1; // Ticket given by broker
   aSymbol[10] = "EURUSD";
   aLots[10] = 1.0;
   aDate[10] = D'2011.06.20 05:41:36'+time_offset*3600;
   aPrice[10] = 1.42279;

   // ========== 11 ===== 823 ==========
   aPseudoTicket[11] = 5;
   aAction[11] = 0; // CLOSE
   aType[11] = OP_BUY; // BUY
   aTicket[11] = -1; // Ticket given by broker
   aSymbol[11] = "EURUSD";
   aLots[11] = 1.0;
   aDate[11] = D'2011.06.20 10:52:15'+time_offset*3600;
   aPrice[11] = 1.42331;

   // ========== 12 ===== 817 ==========
   aPseudoTicket[12] = 6;
   aAction[12] = 1; // OPEN
   aReturn[6] = 12;
   aType[12] = OP_BUY; // BUY
   aTicket[12] = -1; // Ticket given by broker
   aSymbol[12] = "EURUSD";
   aLots[12] = 1.0;
   aDate[12] = D'2011.06.23 09:36:16'+time_offset*3600;
   aPrice[12] = 1.42506;

   // ========== 13 ===== 816 ==========
   aPseudoTicket[13] = 7;
   aAction[13] = 1; // OPEN
   aReturn[7] = 13;
   aType[13] = OP_BUY; // BUY
   aTicket[13] = -1; // Ticket given by broker
   aSymbol[13] = "EURUSD";
   aLots[13] = 1.0;
   aDate[13] = D'2011.06.23 12:17:42'+time_offset*3600;
   aPrice[13] = 1.421;

   // ========== 14 ===== 818 ==========
   aPseudoTicket[14] = 8;
   aAction[14] = 1; // OPEN
   aReturn[8] = 14;
   aType[14] = OP_BUY; // BUY
   aTicket[14] = -1; // Ticket given by broker
   aSymbol[14] = "EURUSD";
   aLots[14] = 1.0;
   aDate[14] = D'2011.06.23 14:26:22'+time_offset*3600;
   aPrice[14] = 1.41495;

   // ========== 15 ===== 816 ==========
   aPseudoTicket[15] = 7;
   aAction[15] = 0; // CLOSE
   aType[15] = OP_BUY; // BUY
   aTicket[15] = -1; // Ticket given by broker
   aSymbol[15] = "EURUSD";
   aLots[15] = 1.0;
   aDate[15] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPrice[15] = 1.4182;

   // ========== 16 ===== 817 ==========
   aPseudoTicket[16] = 6;
   aAction[16] = 0; // CLOSE
   aType[16] = OP_BUY; // BUY
   aTicket[16] = -1; // Ticket given by broker
   aSymbol[16] = "EURUSD";
   aLots[16] = 1.0;
   aDate[16] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPrice[16] = 1.4182;

   // ========== 17 ===== 818 ==========
   aPseudoTicket[17] = 8;
   aAction[17] = 0; // CLOSE
   aType[17] = OP_BUY; // BUY
   aTicket[17] = -1; // Ticket given by broker
   aSymbol[17] = "EURUSD";
   aLots[17] = 1.0;
   aDate[17] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPrice[17] = 1.4182;

   // ========== 18 ===== 814 ==========
   aPseudoTicket[18] = 9;
   aAction[18] = 1; // OPEN
   aReturn[9] = 18;
   aType[18] = OP_SELL; // SELL
   aTicket[18] = -1; // Ticket given by broker
   aSymbol[18] = "EURUSD";
   aLots[18] = 1.0;
   aDate[18] = D'2011.06.23 19:02:08'+time_offset*3600;
   aPrice[18] = 1.4225;

   // ========== 19 ===== 814 ==========
   aPseudoTicket[19] = 9;
   aAction[19] = 0; // CLOSE
   aType[19] = OP_SELL; // SELL
   aTicket[19] = -1; // Ticket given by broker
   aSymbol[19] = "EURUSD";
   aLots[19] = 1.0;
   aDate[19] = D'2011.06.24 08:18:48'+time_offset*3600;
   aPrice[19] = 1.42449;

   // ========== 20 ===== 813 ==========
   aPseudoTicket[20] = 10;
   aAction[20] = 1; // OPEN
   aReturn[10] = 20;
   aType[20] = OP_SELL; // SELL
   aTicket[20] = -1; // Ticket given by broker
   aSymbol[20] = "EURUSD";
   aLots[20] = 1.0;
   aDate[20] = D'2011.06.24 10:19:42'+time_offset*3600;
   aPrice[20] = 1.42233;

   // ========== 21 ===== 813 ==========
   aPseudoTicket[21] = 10;
   aAction[21] = 0; // CLOSE
   aType[21] = OP_SELL; // SELL
   aTicket[21] = -1; // Ticket given by broker
   aSymbol[21] = "EURUSD";
   aLots[21] = 1.0;
   aDate[21] = D'2011.06.24 10:59:16'+time_offset*3600;
   aPrice[21] = 1.4203;

   // ========== 22 ===== 811 ==========
   aPseudoTicket[22] = 11;
   aAction[22] = 1; // OPEN
   aReturn[11] = 22;
   aType[22] = OP_SELL; // SELL
   aTicket[22] = -1; // Ticket given by broker
   aSymbol[22] = "EURUSD";
   aLots[22] = 1.0;
   aDate[22] = D'2011.06.27 22:38:34'+time_offset*3600;
   aPrice[22] = 1.42979;

   // ========== 23 ===== 811 ==========
   aPseudoTicket[23] = 11;
   aAction[23] = 0; // CLOSE
   aType[23] = OP_SELL; // SELL
   aTicket[23] = -1; // Ticket given by broker
   aSymbol[23] = "EURUSD";
   aLots[23] = 1.0;
   aDate[23] = D'2011.06.28 03:42:03'+time_offset*3600;
   aPrice[23] = 1.42979;

   // ========== 24 ===== 804 ==========
   aPseudoTicket[24] = 12;
   aAction[24] = 1; // OPEN
   aReturn[12] = 24;
   aType[24] = OP_BUY; // BUY
   aTicket[24] = -1; // Ticket given by broker
   aSymbol[24] = "EURUSD";
   aLots[24] = 1.0;
   aDate[24] = D'2011.07.06 10:50:36'+time_offset*3600;
   aPrice[24] = 1.43404;

   // ========== 25 ===== 804 ==========
   aPseudoTicket[25] = 12;
   aAction[25] = 0; // CLOSE
   aType[25] = OP_BUY; // BUY
   aTicket[25] = -1; // Ticket given by broker
   aSymbol[25] = "EURUSD";
   aLots[25] = 1.0;
   aDate[25] = D'2011.07.06 23:46:26'+time_offset*3600;
   aPrice[25] = 1.43262;

   // ========== 26 ===== 803 ==========
   aPseudoTicket[26] = 13;
   aAction[26] = 1; // OPEN
   aReturn[13] = 26;
   aType[26] = OP_SELL; // SELL
   aTicket[26] = -1; // Ticket given by broker
   aSymbol[26] = "EURUSD";
   aLots[26] = 1.0;
   aDate[26] = D'2011.07.07 06:50:26'+time_offset*3600;
   aPrice[26] = 1.43334;

   // ========== 27 ===== 803 ==========
   aPseudoTicket[27] = 13;
   aAction[27] = 0; // CLOSE
   aType[27] = OP_SELL; // SELL
   aTicket[27] = -1; // Ticket given by broker
   aSymbol[27] = "EURUSD";
   aLots[27] = 1.0;
   aDate[27] = D'2011.07.07 08:10:29'+time_offset*3600;
   aPrice[27] = 1.43022;

   // ========== 28 ===== 797 ==========
   aPseudoTicket[28] = 14;
   aAction[28] = 1; // OPEN
   aReturn[14] = 28;
   aType[28] = OP_SELL; // SELL
   aTicket[28] = -1; // Ticket given by broker
   aSymbol[28] = "EURUSD";
   aLots[28] = 1.0;
   aDate[28] = D'2011.07.12 18:11:30'+time_offset*3600;
   aPrice[28] = 1.4037;

   // ========== 29 ===== 797 ==========
   aPseudoTicket[29] = 14;
   aAction[29] = 0; // CLOSE
   aType[29] = OP_SELL; // SELL
   aTicket[29] = -1; // Ticket given by broker
   aSymbol[29] = "EURUSD";
   aLots[29] = 1.0;
   aDate[29] = D'2011.07.12 19:26:40'+time_offset*3600;
   aPrice[29] = 1.3987;

   // ========== 30 ===== 792 ==========
   aPseudoTicket[30] = 15;
   aAction[30] = 1; // OPEN
   aReturn[15] = 30;
   aType[30] = OP_SELL; // SELL
   aTicket[30] = -1; // Ticket given by broker
   aSymbol[30] = "EURUSD";
   aLots[30] = 1.0;
   aDate[30] = D'2011.07.13 09:35:48'+time_offset*3600;
   aPrice[30] = 1.40938;

   // ========== 31 ===== 795 ==========
   aPseudoTicket[31] = 16;
   aAction[31] = 1; // OPEN
   aReturn[16] = 31;
   aType[31] = OP_SELL; // SELL
   aTicket[31] = -1; // Ticket given by broker
   aSymbol[31] = "EURUSD";
   aLots[31] = 1.0;
   aDate[31] = D'2011.07.13 10:03:16'+time_offset*3600;
   aPrice[31] = 1.41012;

   // ========== 32 ===== 795 ==========
   aPseudoTicket[32] = 16;
   aAction[32] = 0; // CLOSE
   aType[32] = OP_SELL; // SELL
   aTicket[32] = -1; // Ticket given by broker
   aSymbol[32] = "EURUSD";
   aLots[32] = 1.0;
   aDate[32] = D'2011.07.13 11:29:13'+time_offset*3600;
   aPrice[32] = 1.40689;

   // ========== 33 ===== 789 ==========
   aPseudoTicket[33] = 17;
   aAction[33] = 1; // OPEN
   aReturn[17] = 33;
   aType[33] = OP_SELL; // SELL
   aTicket[33] = -1; // Ticket given by broker
   aSymbol[33] = "EURUSD";
   aLots[33] = 1.0;
   aDate[33] = D'2011.07.13 22:10:39'+time_offset*3600;
   aPrice[33] = 1.4222;

   // ========== 34 ===== 790 ==========
   aPseudoTicket[34] = 18;
   aAction[34] = 1; // OPEN
   aReturn[18] = 34;
   aType[34] = OP_SELL; // SELL
   aTicket[34] = -1; // Ticket given by broker
   aSymbol[34] = "EURUSD";
   aLots[34] = 1.0;
   aDate[34] = D'2011.07.13 23:43:09'+time_offset*3600;
   aPrice[34] = 1.42465;

   // ========== 35 ===== 791 ==========
   aPseudoTicket[35] = 19;
   aAction[35] = 1; // OPEN
   aReturn[19] = 35;
   aType[35] = OP_SELL; // SELL
   aTicket[35] = -1; // Ticket given by broker
   aSymbol[35] = "EURUSD";
   aLots[35] = 1.0;
   aDate[35] = D'2011.07.13 23:53:59'+time_offset*3600;
   aPrice[35] = 1.4272;

   // ========== 36 ===== 792 ==========
   aPseudoTicket[36] = 15;
   aAction[36] = 0; // CLOSE
   aType[36] = OP_SELL; // SELL
   aTicket[36] = -1; // Ticket given by broker
   aSymbol[36] = "EURUSD";
   aLots[36] = 1.0;
   aDate[36] = D'2011.07.14 03:23:03'+time_offset*3600;
   aPrice[36] = 1.42222;

   // ========== 37 ===== 791 ==========
   aPseudoTicket[37] = 19;
   aAction[37] = 0; // CLOSE
   aType[37] = OP_SELL; // SELL
   aTicket[37] = -1; // Ticket given by broker
   aSymbol[37] = "EURUSD";
   aLots[37] = 1.0;
   aDate[37] = D'2011.07.14 04:01:49'+time_offset*3600;
   aPrice[37] = 1.42134;

   // ========== 38 ===== 790 ==========
   aPseudoTicket[38] = 18;
   aAction[38] = 0; // CLOSE
   aType[38] = OP_SELL; // SELL
   aTicket[38] = -1; // Ticket given by broker
   aSymbol[38] = "EURUSD";
   aLots[38] = 1.0;
   aDate[38] = D'2011.07.14 05:58:14'+time_offset*3600;
   aPrice[38] = 1.41961;

   // ========== 39 ===== 789 ==========
   aPseudoTicket[39] = 17;
   aAction[39] = 0; // CLOSE
   aType[39] = OP_SELL; // SELL
   aTicket[39] = -1; // Ticket given by broker
   aSymbol[39] = "EURUSD";
   aLots[39] = 1.0;
   aDate[39] = D'2011.07.14 06:00:49'+time_offset*3600;
   aPrice[39] = 1.41805;

   // ========== 40 ===== 788 ==========
   aPseudoTicket[40] = 20;
   aAction[40] = 1; // OPEN
   aReturn[20] = 40;
   aType[40] = OP_BUY; // BUY
   aTicket[40] = -1; // Ticket given by broker
   aSymbol[40] = "EURUSD";
   aLots[40] = 1.0;
   aDate[40] = D'2011.07.14 06:06:40'+time_offset*3600;
   aPrice[40] = 1.41784;

   // ========== 41 ===== 788 ==========
   aPseudoTicket[41] = 20;
   aAction[41] = 0; // CLOSE
   aType[41] = OP_BUY; // BUY
   aTicket[41] = -1; // Ticket given by broker
   aSymbol[41] = "EURUSD";
   aLots[41] = 1.0;
   aDate[41] = D'2011.07.14 07:03:06'+time_offset*3600;
   aPrice[41] = 1.41847;

   // ========== 42 ===== 780 ==========
   aPseudoTicket[42] = 21;
   aAction[42] = 1; // OPEN
   aReturn[21] = 42;
   aType[42] = OP_BUY; // BUY
   aTicket[42] = -1; // Ticket given by broker
   aSymbol[42] = "EURUSD";
   aLots[42] = 1.0;
   aDate[42] = D'2011.07.19 07:20:59'+time_offset*3600;
   aPrice[42] = 1.41482;

   // ========== 43 ===== 779 ==========
   aPseudoTicket[43] = 22;
   aAction[43] = 1; // OPEN
   aReturn[22] = 43;
   aType[43] = OP_BUY; // BUY
   aTicket[43] = -1; // Ticket given by broker
   aSymbol[43] = "EURUSD";
   aLots[43] = 1.0;
   aDate[43] = D'2011.07.19 11:19:28'+time_offset*3600;
   aPrice[43] = 1.41682;

   // ========== 44 ===== 780 ==========
   aPseudoTicket[44] = 21;
   aAction[44] = 0; // CLOSE
   aType[44] = OP_BUY; // BUY
   aTicket[44] = -1; // Ticket given by broker
   aSymbol[44] = "EURUSD";
   aLots[44] = 1.0;
   aDate[44] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPrice[44] = 1.412;

   // ========== 45 ===== 779 ==========
   aPseudoTicket[45] = 22;
   aAction[45] = 0; // CLOSE
   aType[45] = OP_BUY; // BUY
   aTicket[45] = -1; // Ticket given by broker
   aSymbol[45] = "EURUSD";
   aLots[45] = 1.0;
   aDate[45] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPrice[45] = 1.412;

   // ========== 46 ===== 777 ==========
   aPseudoTicket[46] = 23;
   aAction[46] = 1; // OPEN
   aReturn[23] = 46;
   aType[46] = OP_BUY; // BUY
   aTicket[46] = -1; // Ticket given by broker
   aSymbol[46] = "EURUSD";
   aLots[46] = 1.0;
   aDate[46] = D'2011.07.20 06:35:58'+time_offset*3600;
   aPrice[46] = 1.41849;

   // ========== 47 ===== 777 ==========
   aPseudoTicket[47] = 23;
   aAction[47] = 0; // CLOSE
   aType[47] = OP_BUY; // BUY
   aTicket[47] = -1; // Ticket given by broker
   aSymbol[47] = "EURUSD";
   aLots[47] = 1.0;
   aDate[47] = D'2011.07.20 07:16:27'+time_offset*3600;
   aPrice[47] = 1.4164;

   // ========== 48 ===== 774 ==========
   aPseudoTicket[48] = 24;
   aAction[48] = 1; // OPEN
   aReturn[24] = 48;
   aType[48] = OP_BUY; // BUY
   aTicket[48] = -1; // Ticket given by broker
   aSymbol[48] = "EURUSD";
   aLots[48] = 1.0;
   aDate[48] = D'2011.07.21 09:06:48'+time_offset*3600;
   aPrice[48] = 1.4195;

   // ========== 49 ===== 774 ==========
   aPseudoTicket[49] = 24;
   aAction[49] = 0; // CLOSE
   aType[49] = OP_BUY; // BUY
   aTicket[49] = -1; // Ticket given by broker
   aSymbol[49] = "EURUSD";
   aLots[49] = 1.0;
   aDate[49] = D'2011.07.21 11:35:33'+time_offset*3600;
   aPrice[49] = 1.41811;

   // ========== 50 ===== 773 ==========
   aPseudoTicket[50] = 25;
   aAction[50] = 1; // OPEN
   aReturn[25] = 50;
   aType[50] = OP_SELL; // SELL
   aTicket[50] = -1; // Ticket given by broker
   aSymbol[50] = "EURUSD";
   aLots[50] = 1.0;
   aDate[50] = D'2011.07.21 11:39:01'+time_offset*3600;
   aPrice[50] = 1.41763;

   // ========== 51 ===== 773 ==========
   aPseudoTicket[51] = 25;
   aAction[51] = 0; // CLOSE
   aType[51] = OP_SELL; // SELL
   aTicket[51] = -1; // Ticket given by broker
   aSymbol[51] = "EURUSD";
   aLots[51] = 1.0;
   aDate[51] = D'2011.07.21 12:12:40'+time_offset*3600;
   aPrice[51] = 1.42214;

   // ========== 52 ===== 772 ==========
   aPseudoTicket[52] = 26;
   aAction[52] = 1; // OPEN
   aReturn[26] = 52;
   aType[52] = OP_BUY; // BUY
   aTicket[52] = -1; // Ticket given by broker
   aSymbol[52] = "EURUSD";
   aLots[52] = 1.0;
   aDate[52] = D'2011.07.21 13:24:41'+time_offset*3600;
   aPrice[52] = 1.43315;

   // ========== 53 ===== 772 ==========
   aPseudoTicket[53] = 26;
   aAction[53] = 0; // CLOSE
   aType[53] = OP_BUY; // BUY
   aTicket[53] = -1; // Ticket given by broker
   aSymbol[53] = "EURUSD";
   aLots[53] = 1.0;
   aDate[53] = D'2011.07.21 21:11:47'+time_offset*3600;
   aPrice[53] = 1.44305;

   // ========== 54 ===== 771 ==========
   aPseudoTicket[54] = 27;
   aAction[54] = 1; // OPEN
   aReturn[27] = 54;
   aType[54] = OP_BUY; // BUY
   aTicket[54] = -1; // Ticket given by broker
   aSymbol[54] = "EURUSD";
   aLots[54] = 1.0;
   aDate[54] = D'2011.07.22 02:26:05'+time_offset*3600;
   aPrice[54] = 1.43888;

   // ========== 55 ===== 771 ==========
   aPseudoTicket[55] = 27;
   aAction[55] = 0; // CLOSE
   aType[55] = OP_BUY; // BUY
   aTicket[55] = -1; // Ticket given by broker
   aSymbol[55] = "EURUSD";
   aLots[55] = 1.0;
   aDate[55] = D'2011.07.22 07:33:02'+time_offset*3600;
   aPrice[55] = 1.44238;

   // ========== 56 ===== 768 ==========
   aPseudoTicket[56] = 28;
   aAction[56] = 1; // OPEN
   aReturn[28] = 56;
   aType[56] = OP_BUY; // BUY
   aTicket[56] = -1; // Ticket given by broker
   aSymbol[56] = "EURUSD";
   aLots[56] = 1.0;
   aDate[56] = D'2011.07.22 11:56:02'+time_offset*3600;
   aPrice[56] = 1.4384;

   // ========== 57 ===== 769 ==========
   aPseudoTicket[57] = 29;
   aAction[57] = 1; // OPEN
   aReturn[29] = 57;
   aType[57] = OP_BUY; // BUY
   aTicket[57] = -1; // Ticket given by broker
   aSymbol[57] = "EURUSD";
   aLots[57] = 1.0;
   aDate[57] = D'2011.07.22 13:46:17'+time_offset*3600;
   aPrice[57] = 1.434;

   // ========== 58 ===== 769 ==========
   aPseudoTicket[58] = 29;
   aAction[58] = 0; // CLOSE
   aType[58] = OP_BUY; // BUY
   aTicket[58] = -1; // Ticket given by broker
   aSymbol[58] = "EURUSD";
   aLots[58] = 1.0;
   aDate[58] = D'2011.07.24 21:01:28'+time_offset*3600;
   aPrice[58] = 1.4386;

   // ========== 59 ===== 768 ==========
   aPseudoTicket[59] = 28;
   aAction[59] = 0; // CLOSE
   aType[59] = OP_BUY; // BUY
   aTicket[59] = -1; // Ticket given by broker
   aSymbol[59] = "EURUSD";
   aLots[59] = 1.0;
   aDate[59] = D'2011.07.24 21:05:26'+time_offset*3600;
   aPrice[59] = 1.4387;

   // ========== 60 ===== 766 ==========
   aPseudoTicket[60] = 30;
   aAction[60] = 1; // OPEN
   aReturn[30] = 60;
   aType[60] = OP_BUY; // BUY
   aTicket[60] = -1; // Ticket given by broker
   aSymbol[60] = "EURUSD";
   aLots[60] = 1.0;
   aDate[60] = D'2011.07.25 07:07:10'+time_offset*3600;
   aPrice[60] = 1.43508;

   // ========== 61 ===== 766 ==========
   aPseudoTicket[61] = 30;
   aAction[61] = 0; // CLOSE
   aType[61] = OP_BUY; // BUY
   aTicket[61] = -1; // Ticket given by broker
   aSymbol[61] = "EURUSD";
   aLots[61] = 1.0;
   aDate[61] = D'2011.07.26 06:50:21'+time_offset*3600;
   aPrice[61] = 1.45126;

   // ========== 62 ===== 765 ==========
   aPseudoTicket[62] = 31;
   aAction[62] = 1; // OPEN
   aReturn[31] = 62;
   aType[62] = OP_BUY; // BUY
   aTicket[62] = -1; // Ticket given by broker
   aSymbol[62] = "EURUSD";
   aLots[62] = 1.0;
   aDate[62] = D'2011.07.26 09:07:28'+time_offset*3600;
   aPrice[62] = 1.44751;

   // ========== 63 ===== 764 ==========
   aPseudoTicket[63] = 32;
   aAction[63] = 1; // OPEN
   aReturn[32] = 63;
   aType[63] = OP_BUY; // BUY
   aTicket[63] = -1; // Ticket given by broker
   aSymbol[63] = "EURUSD";
   aLots[63] = 1.0;
   aDate[63] = D'2011.07.26 12:07:54'+time_offset*3600;
   aPrice[63] = 1.44781;

   // ========== 64 ===== 765 ==========
   aPseudoTicket[64] = 31;
   aAction[64] = 0; // CLOSE
   aType[64] = OP_BUY; // BUY
   aTicket[64] = -1; // Ticket given by broker
   aSymbol[64] = "EURUSD";
   aLots[64] = 1.0;
   aDate[64] = D'2011.07.26 12:08:02'+time_offset*3600;
   aPrice[64] = 1.44765;

   // ========== 65 ===== 764 ==========
   aPseudoTicket[65] = 32;
   aAction[65] = 0; // CLOSE
   aType[65] = OP_BUY; // BUY
   aTicket[65] = -1; // Ticket given by broker
   aSymbol[65] = "EURUSD";
   aLots[65] = 1.0;
   aDate[65] = D'2011.07.26 12:08:46'+time_offset*3600;
   aPrice[65] = 1.44788;

   // ========== 66 ===== 763 ==========
   aPseudoTicket[66] = 33;
   aAction[66] = 1; // OPEN
   aReturn[33] = 66;
   aType[66] = OP_BUY; // BUY
   aTicket[66] = -1; // Ticket given by broker
   aSymbol[66] = "EURUSD";
   aLots[66] = 1.0;
   aDate[66] = D'2011.07.26 12:09:21'+time_offset*3600;
   aPrice[66] = 1.4479;

   // ========== 67 ===== 763 ==========
   aPseudoTicket[67] = 33;
   aAction[67] = 0; // CLOSE
   aType[67] = OP_BUY; // BUY
   aTicket[67] = -1; // Ticket given by broker
   aSymbol[67] = "EURUSD";
   aLots[67] = 1.0;
   aDate[67] = D'2011.07.26 12:09:49'+time_offset*3600;
   aPrice[67] = 1.44759;

   // ========== 68 ===== 762 ==========
   aPseudoTicket[68] = 34;
   aAction[68] = 1; // OPEN
   aReturn[34] = 68;
   aType[68] = OP_SELL; // SELL
   aTicket[68] = -1; // Ticket given by broker
   aSymbol[68] = "EURUSD";
   aLots[68] = 1.0;
   aDate[68] = D'2011.07.26 12:09:54'+time_offset*3600;
   aPrice[68] = 1.44753;

   // ========== 69 ===== 762 ==========
   aPseudoTicket[69] = 34;
   aAction[69] = 0; // CLOSE
   aType[69] = OP_SELL; // SELL
   aTicket[69] = -1; // Ticket given by broker
   aSymbol[69] = "EURUSD";
   aLots[69] = 1.0;
   aDate[69] = D'2011.07.26 12:10:12'+time_offset*3600;
   aPrice[69] = 1.44773;

   // ========== 70 ===== 761 ==========
   aPseudoTicket[70] = 35;
   aAction[70] = 1; // OPEN
   aReturn[35] = 70;
   aType[70] = OP_BUY; // BUY
   aTicket[70] = -1; // Ticket given by broker
   aSymbol[70] = "EURUSD";
   aLots[70] = 1.0;
   aDate[70] = D'2011.07.26 12:10:19'+time_offset*3600;
   aPrice[70] = 1.44774;

   // ========== 71 ===== 761 ==========
   aPseudoTicket[71] = 35;
   aAction[71] = 0; // CLOSE
   aType[71] = OP_BUY; // BUY
   aTicket[71] = -1; // Ticket given by broker
   aSymbol[71] = "EURUSD";
   aLots[71] = 1.0;
   aDate[71] = D'2011.07.26 12:10:29'+time_offset*3600;
   aPrice[71] = 1.44776;

   // ========== 72 ===== 760 ==========
   aPseudoTicket[72] = 36;
   aAction[72] = 1; // OPEN
   aReturn[36] = 72;
   aType[72] = OP_BUY; // BUY
   aTicket[72] = -1; // Ticket given by broker
   aSymbol[72] = "EURUSD";
   aLots[72] = 1.0;
   aDate[72] = D'2011.07.26 13:01:13'+time_offset*3600;
   aPrice[72] = 1.44681;

   // ========== 73 ===== 760 ==========
   aPseudoTicket[73] = 36;
   aAction[73] = 0; // CLOSE
   aType[73] = OP_BUY; // BUY
   aTicket[73] = -1; // Ticket given by broker
   aSymbol[73] = "EURUSD";
   aLots[73] = 1.0;
   aDate[73] = D'2011.07.26 18:44:45'+time_offset*3600;
   aPrice[73] = 1.45133;

   // ========== 74 ===== 759 ==========
   aPseudoTicket[74] = 37;
   aAction[74] = 1; // OPEN
   aReturn[37] = 74;
   aType[74] = OP_BUY; // BUY
   aTicket[74] = -1; // Ticket given by broker
   aSymbol[74] = "EURUSD";
   aLots[74] = 1.0;
   aDate[74] = D'2011.07.27 11:32:30'+time_offset*3600;
   aPrice[74] = 1.44602;

   // ========== 75 ===== 759 ==========
   aPseudoTicket[75] = 37;
   aAction[75] = 0; // CLOSE
   aType[75] = OP_BUY; // BUY
   aTicket[75] = -1; // Ticket given by broker
   aSymbol[75] = "EURUSD";
   aLots[75] = 1.0;
   aDate[75] = D'2011.07.27 15:10:41'+time_offset*3600;
   aPrice[75] = 1.436;

   // ========== 76 ===== 758 ==========
   aPseudoTicket[76] = 38;
   aAction[76] = 1; // OPEN
   aReturn[38] = 76;
   aType[76] = OP_BUY; // BUY
   aTicket[76] = -1; // Ticket given by broker
   aSymbol[76] = "EURUSD";
   aLots[76] = 1.0;
   aDate[76] = D'2011.07.27 16:09:51'+time_offset*3600;
   aPrice[76] = 1.434;

   // ========== 77 ===== 758 ==========
   aPseudoTicket[77] = 38;
   aAction[77] = 0; // CLOSE
   aType[77] = OP_BUY; // BUY
   aTicket[77] = -1; // Ticket given by broker
   aSymbol[77] = "EURUSD";
   aLots[77] = 1.0;
   aDate[77] = D'2011.07.28 04:34:21'+time_offset*3600;
   aPrice[77] = 1.43607;

   // ========== 78 ===== 756 ==========
   aPseudoTicket[78] = 39;
   aAction[78] = 1; // OPEN
   aReturn[39] = 78;
   aType[78] = OP_SELL; // SELL
   aTicket[78] = -1; // Ticket given by broker
   aSymbol[78] = "EURUSD";
   aLots[78] = 1.0;
   aDate[78] = D'2011.07.28 09:53:06'+time_offset*3600;
   aPrice[78] = 1.43234;

   // ========== 79 ===== 756 ==========
   aPseudoTicket[79] = 39;
   aAction[79] = 0; // CLOSE
   aType[79] = OP_SELL; // SELL
   aTicket[79] = -1; // Ticket given by broker
   aSymbol[79] = "EURUSD";
   aLots[79] = 1.0;
   aDate[79] = D'2011.07.29 02:31:19'+time_offset*3600;
   aPrice[79] = 1.429;

   // ========== 80 ===== 749 ==========
   aPseudoTicket[80] = 40;
   aAction[80] = 1; // OPEN
   aReturn[40] = 80;
   aType[80] = OP_SELL; // SELL
   aTicket[80] = -1; // Ticket given by broker
   aSymbol[80] = "EURUSD";
   aLots[80] = 1.0;
   aDate[80] = D'2011.08.01 09:33:28'+time_offset*3600;
   aPrice[80] = 1.443;

   // ========== 81 ===== 749 ==========
   aPseudoTicket[81] = 40;
   aAction[81] = 0; // CLOSE
   aType[81] = OP_SELL; // SELL
   aTicket[81] = -1; // Ticket given by broker
   aSymbol[81] = "EURUSD";
   aLots[81] = 1.0;
   aDate[81] = D'2011.08.01 14:05:37'+time_offset*3600;
   aPrice[81] = 1.42876;

   // ========== 82 ===== 747 ==========
   aPseudoTicket[82] = 41;
   aAction[82] = 1; // OPEN
   aReturn[41] = 82;
   aType[82] = OP_SELL; // SELL
   aTicket[82] = -1; // Ticket given by broker
   aSymbol[82] = "EURUSD";
   aLots[82] = 1.0;
   aDate[82] = D'2011.08.02 00:31:44'+time_offset*3600;
   aPrice[82] = 1.42684;

   // ========== 83 ===== 747 ==========
   aPseudoTicket[83] = 41;
   aAction[83] = 0; // CLOSE
   aType[83] = OP_SELL; // SELL
   aTicket[83] = -1; // Ticket given by broker
   aSymbol[83] = "EURUSD";
   aLots[83] = 1.0;
   aDate[83] = D'2011.08.02 06:29:43'+time_offset*3600;
   aPrice[83] = 1.42419;

   // ========== 84 ===== 746 ==========
   aPseudoTicket[84] = 42;
   aAction[84] = 1; // OPEN
   aReturn[42] = 84;
   aType[84] = OP_SELL; // SELL
   aTicket[84] = -1; // Ticket given by broker
   aSymbol[84] = "EURUSD";
   aLots[84] = 1.0;
   aDate[84] = D'2011.08.02 09:26:21'+time_offset*3600;
   aPrice[84] = 1.41713;

   // ========== 85 ===== 746 ==========
   aPseudoTicket[85] = 42;
   aAction[85] = 0; // CLOSE
   aType[85] = OP_SELL; // SELL
   aTicket[85] = -1; // Ticket given by broker
   aSymbol[85] = "EURUSD";
   aLots[85] = 1.0;
   aDate[85] = D'2011.08.02 12:32:15'+time_offset*3600;
   aPrice[85] = 1.41688;

   // ========== 86 ===== 734 ==========
   aPseudoTicket[86] = 43;
   aAction[86] = 1; // OPEN
   aReturn[43] = 86;
   aType[86] = OP_BUY; // BUY
   aTicket[86] = -1; // Ticket given by broker
   aSymbol[86] = "EURUSD";
   aLots[86] = 1.0;
   aDate[86] = D'2011.08.04 23:41:13'+time_offset*3600;
   aPrice[86] = 1.4073;

   // ========== 87 ===== 734 ==========
   aPseudoTicket[87] = 43;
   aAction[87] = 0; // CLOSE
   aType[87] = OP_BUY; // BUY
   aTicket[87] = -1; // Ticket given by broker
   aSymbol[87] = "EURUSD";
   aLots[87] = 1.0;
   aDate[87] = D'2011.08.05 02:01:11'+time_offset*3600;
   aPrice[87] = 1.41058;

   // ========== 88 ===== 732 ==========
   aPseudoTicket[88] = 44;
   aAction[88] = 1; // OPEN
   aReturn[44] = 88;
   aType[88] = OP_SELL; // SELL
   aTicket[88] = -1; // Ticket given by broker
   aSymbol[88] = "EURUSD";
   aLots[88] = 1.0;
   aDate[88] = D'2011.08.05 07:27:46'+time_offset*3600;
   aPrice[88] = 1.4155;

   // ========== 89 ===== 732 ==========
   aPseudoTicket[89] = 44;
   aAction[89] = 0; // CLOSE
   aType[89] = OP_SELL; // SELL
   aTicket[89] = -1; // Ticket given by broker
   aSymbol[89] = "EURUSD";
   aLots[89] = 1.0;
   aDate[89] = D'2011.08.05 07:41:04'+time_offset*3600;
   aPrice[89] = 1.41435;

   // ========== 90 ===== 730 ==========
   aPseudoTicket[90] = 45;
   aAction[90] = 1; // OPEN
   aReturn[45] = 90;
   aType[90] = OP_SELL; // SELL
   aTicket[90] = -1; // Ticket given by broker
   aSymbol[90] = "EURUSD";
   aLots[90] = 1.0;
   aDate[90] = D'2011.08.05 09:20:21'+time_offset*3600;
   aPrice[90] = 1.41623;

   // ========== 91 ===== 730 ==========
   aPseudoTicket[91] = 45;
   aAction[91] = 0; // CLOSE
   aType[91] = OP_SELL; // SELL
   aTicket[91] = -1; // Ticket given by broker
   aSymbol[91] = "EURUSD";
   aLots[91] = 1.0;
   aDate[91] = D'2011.08.05 10:03:22'+time_offset*3600;
   aPrice[91] = 1.41301;

   // ========== 92 ===== 729 ==========
   aPseudoTicket[92] = 46;
   aAction[92] = 1; // OPEN
   aReturn[46] = 92;
   aType[92] = OP_SELL; // SELL
   aTicket[92] = -1; // Ticket given by broker
   aSymbol[92] = "EURUSD";
   aLots[92] = 1.0;
   aDate[92] = D'2011.08.05 11:15:11'+time_offset*3600;
   aPrice[92] = 1.41649;

   // ========== 93 ===== 729 ==========
   aPseudoTicket[93] = 46;
   aAction[93] = 0; // CLOSE
   aType[93] = OP_SELL; // SELL
   aTicket[93] = -1; // Ticket given by broker
   aSymbol[93] = "EURUSD";
   aLots[93] = 1.0;
   aDate[93] = D'2011.08.05 13:20:52'+time_offset*3600;
   aPrice[93] = 1.42;

   // ========== 94 ===== 724 ==========
   aPseudoTicket[94] = 47;
   aAction[94] = 1; // OPEN
   aReturn[47] = 94;
   aType[94] = OP_BUY; // BUY
   aTicket[94] = -1; // Ticket given by broker
   aSymbol[94] = "EURUSD";
   aLots[94] = 1.0;
   aDate[94] = D'2011.08.05 16:39:23'+time_offset*3600;
   aPrice[94] = 1.42395;

   // ========== 95 ===== 724 ==========
   aPseudoTicket[95] = 47;
   aAction[95] = 0; // CLOSE
   aType[95] = OP_BUY; // BUY
   aTicket[95] = -1; // Ticket given by broker
   aSymbol[95] = "EURUSD";
   aLots[95] = 1.0;
   aDate[95] = D'2011.08.07 21:16:44'+time_offset*3600;
   aPrice[95] = 1.43911;

   // ========== 96 ===== 723 ==========
   aPseudoTicket[96] = 48;
   aAction[96] = 1; // OPEN
   aReturn[48] = 96;
   aType[96] = OP_BUY; // BUY
   aTicket[96] = -1; // Ticket given by broker
   aSymbol[96] = "EURUSD";
   aLots[96] = 1.0;
   aDate[96] = D'2011.08.07 22:58:42'+time_offset*3600;
   aPrice[96] = 1.43;

   // ========== 97 ===== 723 ==========
   aPseudoTicket[97] = 48;
   aAction[97] = 0; // CLOSE
   aType[97] = OP_BUY; // BUY
   aTicket[97] = -1; // Ticket given by broker
   aSymbol[97] = "EURUSD";
   aLots[97] = 1.0;
   aDate[97] = D'2011.08.08 01:12:04'+time_offset*3600;
   aPrice[97] = 1.4351;

   // ========== 98 ===== 715 ==========
   aPseudoTicket[98] = 49;
   aAction[98] = 1; // OPEN
   aReturn[49] = 98;
   aType[98] = OP_BUY; // BUY
   aTicket[98] = -1; // Ticket given by broker
   aSymbol[98] = "EURUSD";
   aLots[98] = 1.0;
   aDate[98] = D'2011.08.09 23:47:00'+time_offset*3600;
   aPrice[98] = 1.43699;

   // ========== 99 ===== 715 ==========
   aPseudoTicket[99] = 49;
   aAction[99] = 0; // CLOSE
   aType[99] = OP_BUY; // BUY
   aTicket[99] = -1; // Ticket given by broker
   aSymbol[99] = "EURUSD";
   aLots[99] = 1.0;
   aDate[99] = D'2011.08.10 09:40:03'+time_offset*3600;
   aPrice[99] = 1.4384;

   // ========== 100 ===== 712 ==========
   aPseudoTicket[100] = 50;
   aAction[100] = 1; // OPEN
   aReturn[50] = 100;
   aType[100] = OP_SELL; // SELL
   aTicket[100] = -1; // Ticket given by broker
   aSymbol[100] = "EURUSD";
   aLots[100] = 1.0;
   aDate[100] = D'2011.08.10 12:51:52'+time_offset*3600;
   aPrice[100] = 1.43023;

   // ========== 101 ===== 712 ==========
   aPseudoTicket[101] = 50;
   aAction[101] = 0; // CLOSE
   aType[101] = OP_SELL; // SELL
   aTicket[101] = -1; // Ticket given by broker
   aSymbol[101] = "EURUSD";
   aLots[101] = 1.0;
   aDate[101] = D'2011.08.10 22:20:12'+time_offset*3600;
   aPrice[101] = 1.4146;

   // ========== 102 ===== 709 ==========
   aPseudoTicket[102] = 51;
   aAction[102] = 1; // OPEN
   aReturn[51] = 102;
   aType[102] = OP_SELL; // SELL
   aTicket[102] = -1; // Ticket given by broker
   aSymbol[102] = "EURUSD";
   aLots[102] = 1.0;
   aDate[102] = D'2011.08.11 01:48:26'+time_offset*3600;
   aPrice[102] = 1.421;

   // ========== 103 ===== 709 ==========
   aPseudoTicket[103] = 51;
   aAction[103] = 0; // CLOSE
   aType[103] = OP_SELL; // SELL
   aTicket[103] = -1; // Ticket given by broker
   aSymbol[103] = "EURUSD";
   aLots[103] = 1.0;
   aDate[103] = D'2011.08.11 10:03:13'+time_offset*3600;
   aPrice[103] = 1.41711;

   // ========== 104 ===== 708 ==========
   aPseudoTicket[104] = 52;
   aAction[104] = 1; // OPEN
   aReturn[52] = 104;
   aType[104] = OP_SELL; // SELL
   aTicket[104] = -1; // Ticket given by broker
   aSymbol[104] = "EURUSD";
   aLots[104] = 1.0;
   aDate[104] = D'2011.08.11 11:42:13'+time_offset*3600;
   aPrice[104] = 1.41499;

   // ========== 105 ===== 708 ==========
   aPseudoTicket[105] = 52;
   aAction[105] = 0; // CLOSE
   aType[105] = OP_SELL; // SELL
   aTicket[105] = -1; // Ticket given by broker
   aSymbol[105] = "EURUSD";
   aLots[105] = 1.0;
   aDate[105] = D'2011.08.11 13:00:36'+time_offset*3600;
   aPrice[105] = 1.41671;

   // ========== 106 ===== 706 ==========
   aPseudoTicket[106] = 53;
   aAction[106] = 1; // OPEN
   aReturn[53] = 106;
   aType[106] = OP_SELL; // SELL
   aTicket[106] = -1; // Ticket given by broker
   aSymbol[106] = "EURUSD";
   aLots[106] = 1.0;
   aDate[106] = D'2011.08.12 07:11:56'+time_offset*3600;
   aPrice[106] = 1.41596;

   // ========== 107 ===== 706 ==========
   aPseudoTicket[107] = 53;
   aAction[107] = 0; // CLOSE
   aType[107] = OP_SELL; // SELL
   aTicket[107] = -1; // Ticket given by broker
   aSymbol[107] = "EURUSD";
   aLots[107] = 1.0;
   aDate[107] = D'2011.08.12 07:32:55'+time_offset*3600;
   aPrice[107] = 1.41792;

   // ========== 108 ===== 698 ==========
   aPseudoTicket[108] = 54;
   aAction[108] = 1; // OPEN
   aReturn[54] = 108;
   aType[108] = OP_BUY; // BUY
   aTicket[108] = -1; // Ticket given by broker
   aSymbol[108] = "EURUSD";
   aLots[108] = 1.0;
   aDate[108] = D'2011.08.15 12:55:01'+time_offset*3600;
   aPrice[108] = 1.43703;

   // ========== 109 ===== 700 ==========
   aPseudoTicket[109] = 55;
   aAction[109] = 1; // OPEN
   aReturn[55] = 109;
   aType[109] = OP_BUY; // BUY
   aTicket[109] = -1; // Ticket given by broker
   aSymbol[109] = "EURUSD";
   aLots[109] = 1.0;
   aDate[109] = D'2011.08.16 05:41:18'+time_offset*3600;
   aPrice[109] = 1.44165;

   // ========== 110 ===== 700 ==========
   aPseudoTicket[110] = 55;
   aAction[110] = 0; // CLOSE
   aType[110] = OP_BUY; // BUY
   aTicket[110] = -1; // Ticket given by broker
   aSymbol[110] = "EURUSD";
   aLots[110] = 1.0;
   aDate[110] = D'2011.08.16 13:53:55'+time_offset*3600;
   aPrice[110] = 1.4389;

   // ========== 111 ===== 698 ==========
   aPseudoTicket[111] = 54;
   aAction[111] = 0; // CLOSE
   aType[111] = OP_BUY; // BUY
   aTicket[111] = -1; // Ticket given by broker
   aSymbol[111] = "EURUSD";
   aLots[111] = 1.0;
   aDate[111] = D'2011.08.17 07:06:17'+time_offset*3600;
   aPrice[111] = 1.435;

   // ========== 112 ===== 697 ==========
   aPseudoTicket[112] = 56;
   aAction[112] = 1; // OPEN
   aReturn[56] = 112;
   aType[112] = OP_SELL; // SELL
   aTicket[112] = -1; // Ticket given by broker
   aSymbol[112] = "EURUSD";
   aLots[112] = 1.0;
   aDate[112] = D'2011.08.17 07:07:00'+time_offset*3600;
   aPrice[112] = 1.43362;

   // ========== 113 ===== 697 ==========
   aPseudoTicket[113] = 56;
   aAction[113] = 0; // CLOSE
   aType[113] = OP_SELL; // SELL
   aTicket[113] = -1; // Ticket given by broker
   aSymbol[113] = "EURUSD";
   aLots[113] = 1.0;
   aDate[113] = D'2011.08.17 07:27:32'+time_offset*3600;
   aPrice[113] = 1.438;

   // ========== 114 ===== 696 ==========
   aPseudoTicket[114] = 57;
   aAction[114] = 1; // OPEN
   aReturn[57] = 114;
   aType[114] = OP_BUY; // BUY
   aTicket[114] = -1; // Ticket given by broker
   aSymbol[114] = "EURUSD";
   aLots[114] = 1.0;
   aDate[114] = D'2011.08.17 08:06:25'+time_offset*3600;
   aPrice[114] = 1.44041;

   // ========== 115 ===== 696 ==========
   aPseudoTicket[115] = 57;
   aAction[115] = 0; // CLOSE
   aType[115] = OP_BUY; // BUY
   aTicket[115] = -1; // Ticket given by broker
   aSymbol[115] = "EURUSD";
   aLots[115] = 1.0;
   aDate[115] = D'2011.08.17 15:16:27'+time_offset*3600;
   aPrice[115] = 1.44327;

   // ========== 116 ===== 694 ==========
   aPseudoTicket[116] = 58;
   aAction[116] = 1; // OPEN
   aReturn[58] = 116;
   aType[116] = OP_BUY; // BUY
   aTicket[116] = -1; // Ticket given by broker
   aSymbol[116] = "EURUSD";
   aLots[116] = 1.0;
   aDate[116] = D'2011.08.17 15:36:51'+time_offset*3600;
   aPrice[116] = 1.44309;

   // ========== 117 ===== 693 ==========
   aPseudoTicket[117] = 59;
   aAction[117] = 1; // OPEN
   aReturn[59] = 117;
   aType[117] = OP_BUY; // BUY
   aTicket[117] = -1; // Ticket given by broker
   aSymbol[117] = "EURUSD";
   aLots[117] = 1.0;
   aDate[117] = D'2011.08.18 00:03:13'+time_offset*3600;
   aPrice[117] = 1.44142;

   // ========== 118 ===== 694 ==========
   aPseudoTicket[118] = 58;
   aAction[118] = 0; // CLOSE
   aType[118] = OP_BUY; // BUY
   aTicket[118] = -1; // Ticket given by broker
   aSymbol[118] = "EURUSD";
   aLots[118] = 1.0;
   aDate[118] = D'2011.08.18 01:16:14'+time_offset*3600;
   aPrice[118] = 1.44;

   // ========== 119 ===== 693 ==========
   aPseudoTicket[119] = 59;
   aAction[119] = 0; // CLOSE
   aType[119] = OP_BUY; // BUY
   aTicket[119] = -1; // Ticket given by broker
   aSymbol[119] = "EURUSD";
   aLots[119] = 1.0;
   aDate[119] = D'2011.08.18 06:07:35'+time_offset*3600;
   aPrice[119] = 1.439;

   // ========== 120 ===== 689 ==========
   aPseudoTicket[120] = 60;
   aAction[120] = 1; // OPEN
   aReturn[60] = 120;
   aType[120] = OP_SELL; // SELL
   aTicket[120] = -1; // Ticket given by broker
   aSymbol[120] = "EURUSD";
   aLots[120] = 1.0;
   aDate[120] = D'2011.08.18 14:50:48'+time_offset*3600;
   aPrice[120] = 1.43041;

   // ========== 121 ===== 689 ==========
   aPseudoTicket[121] = 60;
   aAction[121] = 0; // CLOSE
   aType[121] = OP_SELL; // SELL
   aTicket[121] = -1; // Ticket given by broker
   aSymbol[121] = "EURUSD";
   aLots[121] = 1.0;
   aDate[121] = D'2011.08.19 00:14:43'+time_offset*3600;
   aPrice[121] = 1.43028;

   // ========== 122 ===== 686 ==========
   aPseudoTicket[122] = 61;
   aAction[122] = 1; // OPEN
   aReturn[61] = 122;
   aType[122] = OP_SELL; // SELL
   aTicket[122] = -1; // Ticket given by broker
   aSymbol[122] = "EURUSD";
   aLots[122] = 1.0;
   aDate[122] = D'2011.08.19 02:02:11'+time_offset*3600;
   aPrice[122] = 1.4314;

   // ========== 123 ===== 687 ==========
   aPseudoTicket[123] = 62;
   aAction[123] = 1; // OPEN
   aReturn[62] = 123;
   aType[123] = OP_SELL; // SELL
   aTicket[123] = -1; // Ticket given by broker
   aSymbol[123] = "EURUSD";
   aLots[123] = 1.0;
   aDate[123] = D'2011.08.19 08:26:22'+time_offset*3600;
   aPrice[123] = 1.42904;

   // ========== 124 ===== 687 ==========
   aPseudoTicket[124] = 62;
   aAction[124] = 0; // CLOSE
   aType[124] = OP_SELL; // SELL
   aTicket[124] = -1; // Ticket given by broker
   aSymbol[124] = "EURUSD";
   aLots[124] = 1.0;
   aDate[124] = D'2011.08.19 08:27:31'+time_offset*3600;
   aPrice[124] = 1.42898;

   // ========== 125 ===== 686 ==========
   aPseudoTicket[125] = 61;
   aAction[125] = 0; // CLOSE
   aType[125] = OP_SELL; // SELL
   aTicket[125] = -1; // Ticket given by broker
   aSymbol[125] = "EURUSD";
   aLots[125] = 1.0;
   aDate[125] = D'2011.08.19 09:03:48'+time_offset*3600;
   aPrice[125] = 1.43324;

   // ========== 126 ===== 685 ==========
   aPseudoTicket[126] = 63;
   aAction[126] = 1; // OPEN
   aReturn[63] = 126;
   aType[126] = OP_SELL; // SELL
   aTicket[126] = -1; // Ticket given by broker
   aSymbol[126] = "EURUSD";
   aLots[126] = 1.0;
   aDate[126] = D'2011.08.19 11:08:12'+time_offset*3600;
   aPrice[126] = 1.43119;

   // ========== 127 ===== 685 ==========
   aPseudoTicket[127] = 63;
   aAction[127] = 0; // CLOSE
   aType[127] = OP_SELL; // SELL
   aTicket[127] = -1; // Ticket given by broker
   aSymbol[127] = "EURUSD";
   aLots[127] = 1.0;
   aDate[127] = D'2011.08.19 11:50:54'+time_offset*3600;
   aPrice[127] = 1.43572;

   // ========== 128 ===== 684 ==========
   aPseudoTicket[128] = 64;
   aAction[128] = 1; // OPEN
   aReturn[64] = 128;
   aType[128] = OP_BUY; // BUY
   aTicket[128] = -1; // Ticket given by broker
   aSymbol[128] = "EURUSD";
   aLots[128] = 1.0;
   aDate[128] = D'2011.08.19 12:07:17'+time_offset*3600;
   aPrice[128] = 1.43935;

   // ========== 129 ===== 684 ==========
   aPseudoTicket[129] = 64;
   aAction[129] = 0; // CLOSE
   aType[129] = OP_BUY; // BUY
   aTicket[129] = -1; // Ticket given by broker
   aSymbol[129] = "EURUSD";
   aLots[129] = 1.0;
   aDate[129] = D'2011.08.19 13:52:08'+time_offset*3600;
   aPrice[129] = 1.44157;

   // ========== 130 ===== 681 ==========
   aPseudoTicket[130] = 65;
   aAction[130] = 1; // OPEN
   aReturn[65] = 130;
   aType[130] = OP_BUY; // BUY
   aTicket[130] = -1; // Ticket given by broker
   aSymbol[130] = "EURUSD";
   aLots[130] = 1.0;
   aDate[130] = D'2011.08.22 06:33:47'+time_offset*3600;
   aPrice[130] = 1.4355;

   // ========== 131 ===== 681 ==========
   aPseudoTicket[131] = 65;
   aAction[131] = 0; // CLOSE
   aType[131] = OP_BUY; // BUY
   aTicket[131] = -1; // Ticket given by broker
   aSymbol[131] = "EURUSD";
   aLots[131] = 1.0;
   aDate[131] = D'2011.08.22 08:49:22'+time_offset*3600;
   aPrice[131] = 1.43987;

   // ========== 132 ===== 679 ==========
   aPseudoTicket[132] = 66;
   aAction[132] = 1; // OPEN
   aReturn[66] = 132;
   aType[132] = OP_BUY; // BUY
   aTicket[132] = -1; // Ticket given by broker
   aSymbol[132] = "EURUSD";
   aLots[132] = 1.0;
   aDate[132] = D'2011.08.23 07:30:05'+time_offset*3600;
   aPrice[132] = 1.44215;

   // ========== 133 ===== 678 ==========
   aPseudoTicket[133] = 67;
   aAction[133] = 1; // OPEN
   aReturn[67] = 133;
   aType[133] = OP_BUY; // BUY
   aTicket[133] = -1; // Ticket given by broker
   aSymbol[133] = "EURUSD";
   aLots[133] = 1.0;
   aDate[133] = D'2011.08.23 09:02:16'+time_offset*3600;
   aPrice[133] = 1.44455;

   // ========== 134 ===== 678 ==========
   aPseudoTicket[134] = 67;
   aAction[134] = 0; // CLOSE
   aType[134] = OP_BUY; // BUY
   aTicket[134] = -1; // Ticket given by broker
   aSymbol[134] = "EURUSD";
   aLots[134] = 1.0;
   aDate[134] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPrice[134] = 1.4394;

   // ========== 135 ===== 679 ==========
   aPseudoTicket[135] = 66;
   aAction[135] = 0; // CLOSE
   aType[135] = OP_BUY; // BUY
   aTicket[135] = -1; // Ticket given by broker
   aSymbol[135] = "EURUSD";
   aLots[135] = 1.0;
   aDate[135] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPrice[135] = 1.4394;

   // ========== 136 ===== 676 ==========
   aPseudoTicket[136] = 68;
   aAction[136] = 1; // OPEN
   aReturn[68] = 136;
   aType[136] = OP_BUY; // BUY
   aTicket[136] = -1; // Ticket given by broker
   aSymbol[136] = "EURUSD";
   aLots[136] = 1.0;
   aDate[136] = D'2011.08.24 08:28:39'+time_offset*3600;
   aPrice[136] = 1.44425;

   // ========== 137 ===== 676 ==========
   aPseudoTicket[137] = 68;
   aAction[137] = 0; // CLOSE
   aType[137] = OP_BUY; // BUY
   aTicket[137] = -1; // Ticket given by broker
   aSymbol[137] = "EURUSD";
   aLots[137] = 1.0;
   aDate[137] = D'2011.08.24 10:06:57'+time_offset*3600;
   aPrice[137] = 1.44681;

   // ========== 138 ===== 674 ==========
   aPseudoTicket[138] = 69;
   aAction[138] = 1; // OPEN
   aReturn[69] = 138;
   aType[138] = OP_BUY; // BUY
   aTicket[138] = -1; // Ticket given by broker
   aSymbol[138] = "EURUSD";
   aLots[138] = 1.0;
   aDate[138] = D'2011.08.24 12:33:06'+time_offset*3600;
   aPrice[138] = 1.44684;

   // ========== 139 ===== 674 ==========
   aPseudoTicket[139] = 69;
   aAction[139] = 0; // CLOSE
   aType[139] = OP_BUY; // BUY
   aTicket[139] = -1; // Ticket given by broker
   aSymbol[139] = "EURUSD";
   aLots[139] = 1.0;
   aDate[139] = D'2011.08.24 14:45:45'+time_offset*3600;
   aPrice[139] = 1.44347;

   // ========== 140 ===== 672 ==========
   aPseudoTicket[140] = 70;
   aAction[140] = 1; // OPEN
   aReturn[70] = 140;
   aType[140] = OP_BUY; // BUY
   aTicket[140] = -1; // Ticket given by broker
   aSymbol[140] = "EURUSD";
   aLots[140] = 1.0;
   aDate[140] = D'2011.08.25 07:08:39'+time_offset*3600;
   aPrice[140] = 1.4446;

   // ========== 141 ===== 672 ==========
   aPseudoTicket[141] = 70;
   aAction[141] = 0; // CLOSE
   aType[141] = OP_BUY; // BUY
   aTicket[141] = -1; // Ticket given by broker
   aSymbol[141] = "EURUSD";
   aLots[141] = 1.0;
   aDate[141] = D'2011.08.25 09:05:01'+time_offset*3600;
   aPrice[141] = 1.44329;

   // ========== 142 ===== 670 ==========
   aPseudoTicket[142] = 71;
   aAction[142] = 1; // OPEN
   aReturn[71] = 142;
   aType[142] = OP_BUY; // BUY
   aTicket[142] = -1; // Ticket given by broker
   aSymbol[142] = "EURUSD";
   aLots[142] = 1.0;
   aDate[142] = D'2011.08.25 13:16:46'+time_offset*3600;
   aPrice[142] = 1.44586;

   // ========== 143 ===== 670 ==========
   aPseudoTicket[143] = 71;
   aAction[143] = 0; // CLOSE
   aType[143] = OP_BUY; // BUY
   aTicket[143] = -1; // Ticket given by broker
   aSymbol[143] = "EURUSD";
   aLots[143] = 1.0;
   aDate[143] = D'2011.08.25 13:53:26'+time_offset*3600;
   aPrice[143] = 1.4418;

   // ========== 144 ===== 668 ==========
   aPseudoTicket[144] = 72;
   aAction[144] = 1; // OPEN
   aReturn[72] = 144;
   aType[144] = OP_SELL; // SELL
   aTicket[144] = -1; // Ticket given by broker
   aSymbol[144] = "EURUSD";
   aLots[144] = 1.0;
   aDate[144] = D'2011.08.25 22:49:05'+time_offset*3600;
   aPrice[144] = 1.4373;

   // ========== 145 ===== 668 ==========
   aPseudoTicket[145] = 72;
   aAction[145] = 0; // CLOSE
   aType[145] = OP_SELL; // SELL
   aTicket[145] = -1; // Ticket given by broker
   aSymbol[145] = "EURUSD";
   aLots[145] = 1.0;
   aDate[145] = D'2011.08.26 00:44:27'+time_offset*3600;
   aPrice[145] = 1.44;

   // ========== 146 ===== 667 ==========
   aPseudoTicket[146] = 73;
   aAction[146] = 1; // OPEN
   aReturn[73] = 146;
   aType[146] = OP_BUY; // BUY
   aTicket[146] = -1; // Ticket given by broker
   aSymbol[146] = "EURUSD";
   aLots[146] = 1.0;
   aDate[146] = D'2011.08.26 00:58:01'+time_offset*3600;
   aPrice[146] = 1.44164;

   // ========== 147 ===== 667 ==========
   aPseudoTicket[147] = 73;
   aAction[147] = 0; // CLOSE
   aType[147] = OP_BUY; // BUY
   aTicket[147] = -1; // Ticket given by broker
   aSymbol[147] = "EURUSD";
   aLots[147] = 1.0;
   aDate[147] = D'2011.08.26 03:35:22'+time_offset*3600;
   aPrice[147] = 1.44103;

   // ========== 148 ===== 666 ==========
   aPseudoTicket[148] = 74;
   aAction[148] = 1; // OPEN
   aReturn[74] = 148;
   aType[148] = OP_SELL; // SELL
   aTicket[148] = -1; // Ticket given by broker
   aSymbol[148] = "EURUSD";
   aLots[148] = 1.0;
   aDate[148] = D'2011.08.26 05:40:35'+time_offset*3600;
   aPrice[148] = 1.4426;

   // ========== 149 ===== 666 ==========
   aPseudoTicket[149] = 74;
   aAction[149] = 0; // CLOSE
   aType[149] = OP_SELL; // SELL
   aTicket[149] = -1; // Ticket given by broker
   aSymbol[149] = "EURUSD";
   aLots[149] = 1.0;
   aDate[149] = D'2011.08.26 08:31:22'+time_offset*3600;
   aPrice[149] = 1.44467;

   // ========== 150 ===== 664 ==========
   aPseudoTicket[150] = 75;
   aAction[150] = 1; // OPEN
   aReturn[75] = 150;
   aType[150] = OP_BUY; // BUY
   aTicket[150] = -1; // Ticket given by broker
   aSymbol[150] = "EURUSD";
   aLots[150] = 1.0;
   aDate[150] = D'2011.08.26 13:49:23'+time_offset*3600;
   aPrice[150] = 1.44411;

   // ========== 151 ===== 664 ==========
   aPseudoTicket[151] = 75;
   aAction[151] = 0; // CLOSE
   aType[151] = OP_BUY; // BUY
   aTicket[151] = -1; // Ticket given by broker
   aSymbol[151] = "EURUSD";
   aLots[151] = 1.0;
   aDate[151] = D'2011.08.26 14:02:34'+time_offset*3600;
   aPrice[151] = 1.43996;

   // ========== 152 ===== 662 ==========
   aPseudoTicket[152] = 76;
   aAction[152] = 1; // OPEN
   aReturn[76] = 152;
   aType[152] = OP_SELL; // SELL
   aTicket[152] = -1; // Ticket given by broker
   aSymbol[152] = "EURUSD";
   aLots[152] = 1.0;
   aDate[152] = D'2011.08.26 14:46:57'+time_offset*3600;
   aPrice[152] = 1.4353;

   // ========== 153 ===== 662 ==========
   aPseudoTicket[153] = 76;
   aAction[153] = 0; // CLOSE
   aType[153] = OP_SELL; // SELL
   aTicket[153] = -1; // Ticket given by broker
   aSymbol[153] = "EURUSD";
   aLots[153] = 1.0;
   aDate[153] = D'2011.08.26 15:45:37'+time_offset*3600;
   aPrice[153] = 1.44592;

   // ========== 154 ===== 659 ==========
   aPseudoTicket[154] = 77;
   aAction[154] = 1; // OPEN
   aReturn[77] = 154;
   aType[154] = OP_BUY; // BUY
   aTicket[154] = -1; // Ticket given by broker
   aSymbol[154] = "EURUSD";
   aLots[154] = 1.0;
   aDate[154] = D'2011.08.26 15:45:46'+time_offset*3600;
   aPrice[154] = 1.44709;

   // ========== 155 ===== 659 ==========
   aPseudoTicket[155] = 77;
   aAction[155] = 0; // CLOSE
   aType[155] = OP_BUY; // BUY
   aTicket[155] = -1; // Ticket given by broker
   aSymbol[155] = "EURUSD";
   aLots[155] = 1.0;
   aDate[155] = D'2011.08.30 06:09:04'+time_offset*3600;
   aPrice[155] = 1.45149;

   // ========== 156 ===== 658 ==========
   aPseudoTicket[156] = 78;
   aAction[156] = 1; // OPEN
   aReturn[78] = 156;
   aType[156] = OP_BUY; // BUY
   aTicket[156] = -1; // Ticket given by broker
   aSymbol[156] = "EURUSD";
   aLots[156] = 1.0;
   aDate[156] = D'2011.08.30 08:33:18'+time_offset*3600;
   aPrice[156] = 1.44406;

   // ========== 157 ===== 658 ==========
   aPseudoTicket[157] = 78;
   aAction[157] = 0; // CLOSE
   aType[157] = OP_BUY; // BUY
   aTicket[157] = -1; // Ticket given by broker
   aSymbol[157] = "EURUSD";
   aLots[157] = 1.0;
   aDate[157] = D'2011.08.30 09:46:08'+time_offset*3600;
   aPrice[157] = 1.44108;

   // ========== 158 ===== 656 ==========
   aPseudoTicket[158] = 79;
   aAction[158] = 1; // OPEN
   aReturn[79] = 158;
   aType[158] = OP_SELL; // SELL
   aTicket[158] = -1; // Ticket given by broker
   aSymbol[158] = "EURUSD";
   aLots[158] = 1.0;
   aDate[158] = D'2011.08.31 15:47:35'+time_offset*3600;
   aPrice[158] = 1.44093;

   // ========== 159 ===== 656 ==========
   aPseudoTicket[159] = 79;
   aAction[159] = 0; // CLOSE
   aType[159] = OP_SELL; // SELL
   aTicket[159] = -1; // Ticket given by broker
   aSymbol[159] = "EURUSD";
   aLots[159] = 1.0;
   aDate[159] = D'2011.08.31 19:03:53'+time_offset*3600;
   aPrice[159] = 1.43777;

   // ========== 160 ===== 654 ==========
   aPseudoTicket[160] = 80;
   aAction[160] = 1; // OPEN
   aReturn[80] = 160;
   aType[160] = OP_SELL; // SELL
   aTicket[160] = -1; // Ticket given by broker
   aSymbol[160] = "EURUSD";
   aLots[160] = 1.0;
   aDate[160] = D'2011.09.01 07:16:58'+time_offset*3600;
   aPrice[160] = 1.43236;

   // ========== 161 ===== 654 ==========
   aPseudoTicket[161] = 80;
   aAction[161] = 0; // CLOSE
   aType[161] = OP_SELL; // SELL
   aTicket[161] = -1; // Ticket given by broker
   aSymbol[161] = "EURUSD";
   aLots[161] = 1.0;
   aDate[161] = D'2011.09.01 22:39:28'+time_offset*3600;
   aPrice[161] = 1.42623;

   // ========== 162 ===== 649 ==========
   aPseudoTicket[162] = 81;
   aAction[162] = 1; // OPEN
   aReturn[81] = 162;
   aType[162] = OP_BUY; // BUY
   aTicket[162] = -1; // Ticket given by broker
   aSymbol[162] = "EURUSD";
   aLots[162] = 1.0;
   aDate[162] = D'2011.09.06 04:59:11'+time_offset*3600;
   aPrice[162] = 1.40595;

   // ========== 163 ===== 649 ==========
   aPseudoTicket[163] = 81;
   aAction[163] = 0; // CLOSE
   aType[163] = OP_BUY; // BUY
   aTicket[163] = -1; // Ticket given by broker
   aSymbol[163] = "EURUSD";
   aLots[163] = 1.0;
   aDate[163] = D'2011.09.06 08:02:11'+time_offset*3600;
   aPrice[163] = 1.413;

   // ========== 164 ===== 647 ==========
   aPseudoTicket[164] = 82;
   aAction[164] = 1; // OPEN
   aReturn[82] = 164;
   aType[164] = OP_SELL; // SELL
   aTicket[164] = -1; // Ticket given by broker
   aSymbol[164] = "EURUSD";
   aLots[164] = 1.0;
   aDate[164] = D'2011.09.06 08:02:27'+time_offset*3600;
   aPrice[164] = 1.4179;

   // ========== 165 ===== 647 ==========
   aPseudoTicket[165] = 82;
   aAction[165] = 0; // CLOSE
   aType[165] = OP_SELL; // SELL
   aTicket[165] = -1; // Ticket given by broker
   aSymbol[165] = "EURUSD";
   aLots[165] = 1.0;
   aDate[165] = D'2011.09.06 08:02:46'+time_offset*3600;
   aPrice[165] = 1.4279;

   // ========== 166 ===== 645 ==========
   aPseudoTicket[166] = 83;
   aAction[166] = 1; // OPEN
   aReturn[83] = 166;
   aType[166] = OP_SELL; // SELL
   aTicket[166] = -1; // Ticket given by broker
   aSymbol[166] = "EURUSD";
   aLots[166] = 1.0;
   aDate[166] = D'2011.09.06 09:32:54'+time_offset*3600;
   aPrice[166] = 1.4211;

   // ========== 167 ===== 645 ==========
   aPseudoTicket[167] = 83;
   aAction[167] = 0; // CLOSE
   aType[167] = OP_SELL; // SELL
   aTicket[167] = -1; // Ticket given by broker
   aSymbol[167] = "EURUSD";
   aLots[167] = 1.0;
   aDate[167] = D'2011.09.06 10:12:05'+time_offset*3600;
   aPrice[167] = 1.4175;

   // ========== 168 ===== 644 ==========
   aPseudoTicket[168] = 84;
   aAction[168] = 1; // OPEN
   aReturn[84] = 168;
   aType[168] = OP_BUY; // BUY
   aTicket[168] = -1; // Ticket given by broker
   aSymbol[168] = "EURUSD";
   aLots[168] = 1.0;
   aDate[168] = D'2011.09.06 11:49:25'+time_offset*3600;
   aPrice[168] = 1.41331;

   // ========== 169 ===== 644 ==========
   aPseudoTicket[169] = 84;
   aAction[169] = 0; // CLOSE
   aType[169] = OP_BUY; // BUY
   aTicket[169] = -1; // Ticket given by broker
   aSymbol[169] = "EURUSD";
   aLots[169] = 1.0;
   aDate[169] = D'2011.09.06 22:27:34'+time_offset*3600;
   aPrice[169] = 1.40011;

   // ========== 170 ===== 640 ==========
   aPseudoTicket[170] = 85;
   aAction[170] = 1; // OPEN
   aReturn[85] = 170;
   aType[170] = OP_SELL; // SELL
   aTicket[170] = -1; // Ticket given by broker
   aSymbol[170] = "EURUSD";
   aLots[170] = 1.0;
   aDate[170] = D'2011.09.07 06:04:52'+time_offset*3600;
   aPrice[170] = 1.40595;

   // ========== 171 ===== 641 ==========
   aPseudoTicket[171] = 86;
   aAction[171] = 1; // OPEN
   aReturn[86] = 171;
   aType[171] = OP_SELL; // SELL
   aTicket[171] = -1; // Ticket given by broker
   aSymbol[171] = "EURUSD";
   aLots[171] = 1.0;
   aDate[171] = D'2011.09.07 06:38:15'+time_offset*3600;
   aPrice[171] = 1.40716;

   // ========== 172 ===== 641 ==========
   aPseudoTicket[172] = 86;
   aAction[172] = 0; // CLOSE
   aType[172] = OP_SELL; // SELL
   aTicket[172] = -1; // Ticket given by broker
   aSymbol[172] = "EURUSD";
   aLots[172] = 1.0;
   aDate[172] = D'2011.09.07 08:49:17'+time_offset*3600;
   aPrice[172] = 1.4088;

   // ========== 173 ===== 640 ==========
   aPseudoTicket[173] = 85;
   aAction[173] = 0; // CLOSE
   aType[173] = OP_SELL; // SELL
   aTicket[173] = -1; // Ticket given by broker
   aSymbol[173] = "EURUSD";
   aLots[173] = 1.0;
   aDate[173] = D'2011.09.07 08:49:21'+time_offset*3600;
   aPrice[173] = 1.40888;

   // ========== 174 ===== 638 ==========
   aPseudoTicket[174] = 87;
   aAction[174] = 1; // OPEN
   aReturn[87] = 174;
   aType[174] = OP_SELL; // SELL
   aTicket[174] = -1; // Ticket given by broker
   aSymbol[174] = "EURUSD";
   aLots[174] = 1.0;
   aDate[174] = D'2011.09.07 09:08:53'+time_offset*3600;
   aPrice[174] = 1.41001;

   // ========== 175 ===== 638 ==========
   aPseudoTicket[175] = 87;
   aAction[175] = 0; // CLOSE
   aType[175] = OP_SELL; // SELL
   aTicket[175] = -1; // Ticket given by broker
   aSymbol[175] = "EURUSD";
   aLots[175] = 1.0;
   aDate[175] = D'2011.09.07 10:43:01'+time_offset*3600;
   aPrice[175] = 1.40444;

   // ========== 176 ===== 635 ==========
   aPseudoTicket[176] = 88;
   aAction[176] = 1; // OPEN
   aReturn[88] = 176;
   aType[176] = OP_SELL; // SELL
   aTicket[176] = -1; // Ticket given by broker
   aSymbol[176] = "EURUSD";
   aLots[176] = 1.0;
   aDate[176] = D'2011.09.08 12:35:08'+time_offset*3600;
   aPrice[176] = 1.40056;

   // ========== 177 ===== 635 ==========
   aPseudoTicket[177] = 88;
   aAction[177] = 0; // CLOSE
   aType[177] = OP_SELL; // SELL
   aTicket[177] = -1; // Ticket given by broker
   aSymbol[177] = "EURUSD";
   aLots[177] = 1.0;
   aDate[177] = D'2011.09.08 13:20:02'+time_offset*3600;
   aPrice[177] = 1.39956;

   // ========== 178 ===== 631 ==========
   aPseudoTicket[178] = 89;
   aAction[178] = 1; // OPEN
   aReturn[89] = 178;
   aType[178] = OP_BUY; // BUY
   aTicket[178] = -1; // Ticket given by broker
   aSymbol[178] = "EURUSD";
   aLots[178] = 1.0;
   aDate[178] = D'2011.09.12 02:19:19'+time_offset*3600;
   aPrice[178] = 1.35867;

   // ========== 179 ===== 631 ==========
   aPseudoTicket[179] = 89;
   aAction[179] = 0; // CLOSE
   aType[179] = OP_BUY; // BUY
   aTicket[179] = -1; // Ticket given by broker
   aSymbol[179] = "EURUSD";
   aLots[179] = 1.0;
   aDate[179] = D'2011.09.12 09:49:10'+time_offset*3600;
   aPrice[179] = 1.364;

   // ========== 180 ===== 625 ==========
   aPseudoTicket[180] = 90;
   aAction[180] = 1; // OPEN
   aReturn[90] = 180;
   aType[180] = OP_SELL; // SELL
   aTicket[180] = -1; // Ticket given by broker
   aSymbol[180] = "EURUSD";
   aLots[180] = 1.0;
   aDate[180] = D'2011.09.15 10:00:41'+time_offset*3600;
   aPrice[180] = 1.38097;

   // ========== 181 ===== 625 ==========
   aPseudoTicket[181] = 90;
   aAction[181] = 0; // CLOSE
   aType[181] = OP_SELL; // SELL
   aTicket[181] = -1; // Ticket given by broker
   aSymbol[181] = "EURUSD";
   aLots[181] = 1.0;
   aDate[181] = D'2011.09.15 12:37:45'+time_offset*3600;
   aPrice[181] = 1.37962;

   // ========== 182 ===== 623 ==========
   aPseudoTicket[182] = 91;
   aAction[182] = 1; // OPEN
   aReturn[91] = 182;
   aType[182] = OP_BUY; // BUY
   aTicket[182] = -1; // Ticket given by broker
   aSymbol[182] = "EURUSD";
   aLots[182] = 1.0;
   aDate[182] = D'2011.09.15 13:06:25'+time_offset*3600;
   aPrice[182] = 1.385;

   // ========== 183 ===== 623 ==========
   aPseudoTicket[183] = 91;
   aAction[183] = 0; // CLOSE
   aType[183] = OP_BUY; // BUY
   aTicket[183] = -1; // Ticket given by broker
   aSymbol[183] = "EURUSD";
   aLots[183] = 1.0;
   aDate[183] = D'2011.09.15 13:10:42'+time_offset*3600;
   aPrice[183] = 1.38595;

   // ========== 184 ===== 621 ==========
   aPseudoTicket[184] = 92;
   aAction[184] = 1; // OPEN
   aReturn[92] = 184;
   aType[184] = OP_SELL; // SELL
   aTicket[184] = -1; // Ticket given by broker
   aSymbol[184] = "EURUSD";
   aLots[184] = 1.0;
   aDate[184] = D'2011.09.15 13:30:17'+time_offset*3600;
   aPrice[184] = 1.38852;

   // ========== 185 ===== 621 ==========
   aPseudoTicket[185] = 92;
   aAction[185] = 0; // CLOSE
   aType[185] = OP_SELL; // SELL
   aTicket[185] = -1; // Ticket given by broker
   aSymbol[185] = "EURUSD";
   aLots[185] = 1.0;
   aDate[185] = D'2011.09.15 21:57:16'+time_offset*3600;
   aPrice[185] = 1.38838;

   // ========== 186 ===== 614 ==========
   aPseudoTicket[186] = 93;
   aAction[186] = 1; // OPEN
   aReturn[93] = 186;
   aType[186] = OP_SELL; // SELL
   aTicket[186] = -1; // Ticket given by broker
   aSymbol[186] = "EURUSD";
   aLots[186] = 1.0;
   aDate[186] = D'2011.09.22 17:34:59'+time_offset*3600;
   aPrice[186] = 1.34776;

   // ========== 187 ===== 614 ==========
   aPseudoTicket[187] = 93;
   aAction[187] = 0; // CLOSE
   aType[187] = OP_SELL; // SELL
   aTicket[187] = -1; // Ticket given by broker
   aSymbol[187] = "EURUSD";
   aLots[187] = 1.0;
   aDate[187] = D'2011.09.22 19:25:21'+time_offset*3600;
   aPrice[187] = 1.34401;

   // ========== 188 ===== 608 ==========
   aPseudoTicket[188] = 94;
   aAction[188] = 1; // OPEN
   aReturn[94] = 188;
   aType[188] = OP_SELL; // SELL
   aTicket[188] = -1; // Ticket given by broker
   aSymbol[188] = "EURUSD";
   aLots[188] = 1.0;
   aDate[188] = D'2011.09.26 08:55:30'+time_offset*3600;
   aPrice[188] = 1.34569;

   // ========== 189 ===== 608 ==========
   aPseudoTicket[189] = 94;
   aAction[189] = 0; // CLOSE
   aType[189] = OP_SELL; // SELL
   aTicket[189] = -1; // Ticket given by broker
   aSymbol[189] = "EURUSD";
   aLots[189] = 1.0;
   aDate[189] = D'2011.09.26 09:41:24'+time_offset*3600;
   aPrice[189] = 1.34551;

   // ========== 190 ===== 601 ==========
   aPseudoTicket[190] = 95;
   aAction[190] = 1; // OPEN
   aReturn[95] = 190;
   aType[190] = OP_SELL; // SELL
   aTicket[190] = -1; // Ticket given by broker
   aSymbol[190] = "EURUSD";
   aLots[190] = 1.0;
   aDate[190] = D'2011.09.30 07:10:04'+time_offset*3600;
   aPrice[190] = 1.34938;

   // ========== 191 ===== 601 ==========
   aPseudoTicket[191] = 95;
   aAction[191] = 0; // CLOSE
   aType[191] = OP_SELL; // SELL
   aTicket[191] = -1; // Ticket given by broker
   aSymbol[191] = "EURUSD";
   aLots[191] = 1.0;
   aDate[191] = D'2011.09.30 12:17:08'+time_offset*3600;
   aPrice[191] = 1.35036;

   // ========== 192 ===== 598 ==========
   aPseudoTicket[192] = 96;
   aAction[192] = 1; // OPEN
   aReturn[96] = 192;
   aType[192] = OP_SELL; // SELL
   aTicket[192] = -1; // Ticket given by broker
   aSymbol[192] = "EURUSD";
   aLots[192] = 1.0;
   aDate[192] = D'2011.10.03 18:18:53'+time_offset*3600;
   aPrice[192] = 1.32382;

   // ========== 193 ===== 598 ==========
   aPseudoTicket[193] = 96;
   aAction[193] = 0; // CLOSE
   aType[193] = OP_SELL; // SELL
   aTicket[193] = -1; // Ticket given by broker
   aSymbol[193] = "EURUSD";
   aLots[193] = 1.0;
   aDate[193] = D'2011.10.03 19:25:48'+time_offset*3600;
   aPrice[193] = 1.32075;

   // ========== 194 ===== 596 ==========
   aPseudoTicket[194] = 97;
   aAction[194] = 1; // OPEN
   aReturn[97] = 194;
   aType[194] = OP_SELL; // SELL
   aTicket[194] = -1; // Ticket given by broker
   aSymbol[194] = "EURUSD";
   aLots[194] = 1.0;
   aDate[194] = D'2011.10.04 16:09:28'+time_offset*3600;
   aPrice[194] = 1.33045;

   // ========== 195 ===== 596 ==========
   aPseudoTicket[195] = 97;
   aAction[195] = 0; // CLOSE
   aType[195] = OP_SELL; // SELL
   aTicket[195] = -1; // Ticket given by broker
   aSymbol[195] = "EURUSD";
   aLots[195] = 1.0;
   aDate[195] = D'2011.10.04 16:42:19'+time_offset*3600;
   aPrice[195] = 1.32918;

   // ========== 196 ===== 587 ==========
   aPseudoTicket[196] = 98;
   aAction[196] = 1; // OPEN
   aReturn[98] = 196;
   aType[196] = OP_BUY; // BUY
   aTicket[196] = -1; // Ticket given by broker
   aSymbol[196] = "EURUSD";
   aLots[196] = 1.0;
   aDate[196] = D'2011.10.07 07:22:54'+time_offset*3600;
   aPrice[196] = 1.34636;

   // ========== 197 ===== 587 ==========
   aPseudoTicket[197] = 98;
   aAction[197] = 0; // CLOSE
   aType[197] = OP_BUY; // BUY
   aTicket[197] = -1; // Ticket given by broker
   aSymbol[197] = "EURUSD";
   aLots[197] = 1.0;
   aDate[197] = D'2011.10.07 07:49:07'+time_offset*3600;
   aPrice[197] = 1.34405;

   // ========== 198 ===== 576 ==========
   aPseudoTicket[198] = 99;
   aAction[198] = 1; // OPEN
   aReturn[99] = 198;
   aType[198] = OP_SELL; // SELL
   aTicket[198] = -1; // Ticket given by broker
   aSymbol[198] = "EURUSD";
   aLots[198] = 1.0;
   aDate[198] = D'2011.10.10 01:37:33'+time_offset*3600;
   aPrice[198] = 1.3459;

   // ========== 199 ===== 577 ==========
   aPseudoTicket[199] = 100;
   aAction[199] = 1; // OPEN
   aReturn[100] = 199;
   aType[199] = OP_SELL; // SELL
   aTicket[199] = -1; // Ticket given by broker
   aSymbol[199] = "EURUSD";
   aLots[199] = 1.0;
   aDate[199] = D'2011.10.10 14:08:04'+time_offset*3600;
   aPrice[199] = 1.36553;

   // ========== 200 ===== 577 ==========
   aPseudoTicket[200] = 100;
   aAction[200] = 0; // CLOSE
   aType[200] = OP_SELL; // SELL
   aTicket[200] = -1; // Ticket given by broker
   aSymbol[200] = "EURUSD";
   aLots[200] = 1.0;
   aDate[200] = D'2011.10.10 22:42:15'+time_offset*3600;
   aPrice[200] = 1.36329;

   // ========== 201 ===== 576 ==========
   aPseudoTicket[201] = 99;
   aAction[201] = 0; // CLOSE
   aType[201] = OP_SELL; // SELL
   aTicket[201] = -1; // Ticket given by broker
   aSymbol[201] = "EURUSD";
   aLots[201] = 1.0;
   aDate[201] = D'2011.10.11 01:02:18'+time_offset*3600;
   aPrice[201] = 1.36277;

   // ========== 202 ===== 574 ==========
   aPseudoTicket[202] = 101;
   aAction[202] = 1; // OPEN
   aReturn[101] = 202;
   aType[202] = OP_BUY; // BUY
   aTicket[202] = -1; // Ticket given by broker
   aSymbol[202] = "EURUSD";
   aLots[202] = 1.0;
   aDate[202] = D'2011.10.11 08:56:08'+time_offset*3600;
   aPrice[202] = 1.35995;

   // ========== 203 ===== 574 ==========
   aPseudoTicket[203] = 101;
   aAction[203] = 0; // CLOSE
   aType[203] = OP_BUY; // BUY
   aTicket[203] = -1; // Ticket given by broker
   aSymbol[203] = "EURUSD";
   aLots[203] = 1.0;
   aDate[203] = D'2011.10.11 09:17:24'+time_offset*3600;
   aPrice[203] = 1.3599;

   // ========== 204 ===== 573 ==========
   aPseudoTicket[204] = 102;
   aAction[204] = 1; // OPEN
   aReturn[102] = 204;
   aType[204] = OP_BUY; // BUY
   aTicket[204] = -1; // Ticket given by broker
   aSymbol[204] = "EURUSD";
   aLots[204] = 1.0;
   aDate[204] = D'2011.10.11 10:28:46'+time_offset*3600;
   aPrice[204] = 1.35975;

   // ========== 205 ===== 573 ==========
   aPseudoTicket[205] = 102;
   aAction[205] = 0; // CLOSE
   aType[205] = OP_BUY; // BUY
   aTicket[205] = -1; // Ticket given by broker
   aSymbol[205] = "EURUSD";
   aLots[205] = 1.0;
   aDate[205] = D'2011.10.11 15:58:40'+time_offset*3600;
   aPrice[205] = 1.36585;

   // ========== 206 ===== 572 ==========
   aPseudoTicket[206] = 103;
   aAction[206] = 1; // OPEN
   aReturn[103] = 206;
   aType[206] = OP_BUY; // BUY
   aTicket[206] = -1; // Ticket given by broker
   aSymbol[206] = "EURUSD";
   aLots[206] = 1.0;
   aDate[206] = D'2011.10.12 08:15:59'+time_offset*3600;
   aPrice[206] = 1.37282;

   // ========== 207 ===== 572 ==========
   aPseudoTicket[207] = 103;
   aAction[207] = 0; // CLOSE
   aType[207] = OP_BUY; // BUY
   aTicket[207] = -1; // Ticket given by broker
   aSymbol[207] = "EURUSD";
   aLots[207] = 1.0;
   aDate[207] = D'2011.10.12 08:21:18'+time_offset*3600;
   aPrice[207] = 1.3738;

   // ========== 208 ===== 564 ==========
   aPseudoTicket[208] = 104;
   aAction[208] = 1; // OPEN
   aReturn[104] = 208;
   aType[208] = OP_BUY; // BUY
   aTicket[208] = -1; // Ticket given by broker
   aSymbol[208] = "EURUSD";
   aLots[208] = 1.0;
   aDate[208] = D'2011.10.13 07:27:46'+time_offset*3600;
   aPrice[208] = 1.38193;

   // ========== 209 ===== 564 ==========
   aPseudoTicket[209] = 104;
   aAction[209] = 0; // CLOSE
   aType[209] = OP_BUY; // BUY
   aTicket[209] = -1; // Ticket given by broker
   aSymbol[209] = "EURUSD";
   aLots[209] = 1.0;
   aDate[209] = D'2011.10.13 08:05:47'+time_offset*3600;
   aPrice[209] = 1.37923;

   // ========== 210 ===== 561 ==========
   aPseudoTicket[210] = 105;
   aAction[210] = 1; // OPEN
   aReturn[105] = 210;
   aType[210] = OP_SELL; // SELL
   aTicket[210] = -1; // Ticket given by broker
   aSymbol[210] = "EURUSD";
   aLots[210] = 1.0;
   aDate[210] = D'2011.10.13 09:34:00'+time_offset*3600;
   aPrice[210] = 1.37345;

   // ========== 211 ===== 561 ==========
   aPseudoTicket[211] = 105;
   aAction[211] = 0; // CLOSE
   aType[211] = OP_SELL; // SELL
   aTicket[211] = -1; // Ticket given by broker
   aSymbol[211] = "EURUSD";
   aLots[211] = 1.0;
   aDate[211] = D'2011.10.13 10:06:28'+time_offset*3600;
   aPrice[211] = 1.37211;

   // ========== 212 ===== 555 ==========
   aPseudoTicket[212] = 106;
   aAction[212] = 1; // OPEN
   aReturn[106] = 212;
   aType[212] = OP_SELL; // SELL
   aTicket[212] = -1; // Ticket given by broker
   aSymbol[212] = "EURUSD";
   aLots[212] = 1.0;
   aDate[212] = D'2011.10.14 05:57:31'+time_offset*3600;
   aPrice[212] = 1.3785;

   // ========== 213 ===== 555 ==========
   aPseudoTicket[213] = 106;
   aAction[213] = 0; // CLOSE
   aType[213] = OP_SELL; // SELL
   aTicket[213] = -1; // Ticket given by broker
   aSymbol[213] = "EURUSD";
   aLots[213] = 1.0;
   aDate[213] = D'2011.10.14 08:32:56'+time_offset*3600;
   aPrice[213] = 1.38082;

   // ========== 214 ===== 549 ==========
   aPseudoTicket[214] = 107;
   aAction[214] = 1; // OPEN
   aReturn[107] = 214;
   aType[214] = OP_BUY; // BUY
   aTicket[214] = -1; // Ticket given by broker
   aSymbol[214] = "EURUSD";
   aLots[214] = 1.0;
   aDate[214] = D'2011.10.14 13:15:06'+time_offset*3600;
   aPrice[214] = 1.38507;

   // ========== 215 ===== 549 ==========
   aPseudoTicket[215] = 107;
   aAction[215] = 0; // CLOSE
   aType[215] = OP_BUY; // BUY
   aTicket[215] = -1; // Ticket given by broker
   aSymbol[215] = "EURUSD";
   aLots[215] = 1.0;
   aDate[215] = D'2011.10.14 14:31:03'+time_offset*3600;
   aPrice[215] = 1.38727;

   // ========== 216 ===== 537 ==========
   aPseudoTicket[216] = 108;
   aAction[216] = 1; // OPEN
   aReturn[108] = 216;
   aType[216] = OP_SELL; // SELL
   aTicket[216] = -1; // Ticket given by broker
   aSymbol[216] = "EURUSD";
   aLots[216] = 1.0;
   aDate[216] = D'2011.10.25 12:03:39'+time_offset*3600;
   aPrice[216] = 1.3913;

   // ========== 217 ===== 537 ==========
   aPseudoTicket[217] = 108;
   aAction[217] = 0; // CLOSE
   aType[217] = OP_SELL; // SELL
   aTicket[217] = -1; // Ticket given by broker
   aSymbol[217] = "EURUSD";
   aLots[217] = 1.0;
   aDate[217] = D'2011.10.25 12:26:54'+time_offset*3600;
   aPrice[217] = 1.39159;

   // ========== 218 ===== 531 ==========
   aPseudoTicket[218] = 109;
   aAction[218] = 1; // OPEN
   aReturn[109] = 218;
   aType[218] = OP_BUY; // BUY
   aTicket[218] = -1; // Ticket given by broker
   aSymbol[218] = "EURUSD";
   aLots[218] = 1.0;
   aDate[218] = D'2011.10.27 03:00:14'+time_offset*3600;
   aPrice[218] = 1.39581;

   // ========== 219 ===== 531 ==========
   aPseudoTicket[219] = 109;
   aAction[219] = 0; // CLOSE
   aType[219] = OP_BUY; // BUY
   aTicket[219] = -1; // Ticket given by broker
   aSymbol[219] = "EURUSD";
   aLots[219] = 1.0;
   aDate[219] = D'2011.10.27 04:30:33'+time_offset*3600;
   aPrice[219] = 1.39681;

   // ========== 220 ===== 522 ==========
   aPseudoTicket[220] = 110;
   aAction[220] = 1; // OPEN
   aReturn[110] = 220;
   aType[220] = OP_BUY; // BUY
   aTicket[220] = -1; // Ticket given by broker
   aSymbol[220] = "EURUSD";
   aLots[220] = 1.0;
   aDate[220] = D'2011.10.28 07:42:16'+time_offset*3600;
   aPrice[220] = 1.41674;

   // ========== 221 ===== 522 ==========
   aPseudoTicket[221] = 110;
   aAction[221] = 0; // CLOSE
   aType[221] = OP_BUY; // BUY
   aTicket[221] = -1; // Ticket given by broker
   aSymbol[221] = "EURUSD";
   aLots[221] = 1.0;
   aDate[221] = D'2011.10.28 08:41:04'+time_offset*3600;
   aPrice[221] = 1.41822;

   // ========== 222 ===== 521 ==========
   aPseudoTicket[222] = 111;
   aAction[222] = 1; // OPEN
   aReturn[111] = 222;
   aType[222] = OP_BUY; // BUY
   aTicket[222] = -1; // Ticket given by broker
   aSymbol[222] = "EURUSD";
   aLots[222] = 1.0;
   aDate[222] = D'2011.10.28 10:26:26'+time_offset*3600;
   aPrice[222] = 1.41505;

   // ========== 223 ===== 521 ==========
   aPseudoTicket[223] = 111;
   aAction[223] = 0; // CLOSE
   aType[223] = OP_BUY; // BUY
   aTicket[223] = -1; // Ticket given by broker
   aSymbol[223] = "EURUSD";
   aLots[223] = 1.0;
   aDate[223] = D'2011.10.28 12:32:40'+time_offset*3600;
   aPrice[223] = 1.41679;

   // ========== 224 ===== 520 ==========
   aPseudoTicket[224] = 112;
   aAction[224] = 1; // OPEN
   aReturn[112] = 224;
   aType[224] = OP_BUY; // BUY
   aTicket[224] = -1; // Ticket given by broker
   aSymbol[224] = "EURUSD";
   aLots[224] = 1.0;
   aDate[224] = D'2011.10.30 23:43:13'+time_offset*3600;
   aPrice[224] = 1.41464;

   // ========== 225 ===== 520 ==========
   aPseudoTicket[225] = 112;
   aAction[225] = 0; // CLOSE
   aType[225] = OP_BUY; // BUY
   aTicket[225] = -1; // Ticket given by broker
   aSymbol[225] = "EURUSD";
   aLots[225] = 1.0;
   aDate[225] = D'2011.10.31 02:19:00'+time_offset*3600;
   aPrice[225] = 1.40792;

   // ========== 226 ===== 507 ==========
   aPseudoTicket[226] = 113;
   aAction[226] = 1; // OPEN
   aReturn[113] = 226;
   aType[226] = OP_BUY; // BUY
   aTicket[226] = -1; // Ticket given by broker
   aSymbol[226] = "EURUSD";
   aLots[226] = 1.0;
   aDate[226] = D'2011.11.01 12:40:36'+time_offset*3600;
   aPrice[226] = 1.36569;

   // ========== 227 ===== 508 ==========
   aPseudoTicket[227] = 114;
   aAction[227] = 1; // OPEN
   aReturn[114] = 227;
   aType[227] = OP_BUY; // BUY
   aTicket[227] = -1; // Ticket given by broker
   aSymbol[227] = "EURUSD";
   aLots[227] = 1.0;
   aDate[227] = D'2011.11.01 12:42:23'+time_offset*3600;
   aPrice[227] = 1.36491;

   // ========== 228 ===== 509 ==========
   aPseudoTicket[228] = 115;
   aAction[228] = 1; // OPEN
   aReturn[115] = 228;
   aType[228] = OP_BUY; // BUY
   aTicket[228] = -1; // Ticket given by broker
   aSymbol[228] = "EURUSD";
   aLots[228] = 1.0;
   aDate[228] = D'2011.11.01 13:14:55'+time_offset*3600;
   aPrice[228] = 1.36277;

   // ========== 229 ===== 509 ==========
   aPseudoTicket[229] = 115;
   aAction[229] = 0; // CLOSE
   aType[229] = OP_BUY; // BUY
   aTicket[229] = -1; // Ticket given by broker
   aSymbol[229] = "EURUSD";
   aLots[229] = 1.0;
   aDate[229] = D'2011.11.01 14:27:11'+time_offset*3600;
   aPrice[229] = 1.36749;

   // ========== 230 ===== 507 ==========
   aPseudoTicket[230] = 113;
   aAction[230] = 0; // CLOSE
   aType[230] = OP_BUY; // BUY
   aTicket[230] = -1; // Ticket given by broker
   aSymbol[230] = "EURUSD";
   aLots[230] = 1.0;
   aDate[230] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPrice[230] = 1.3681;

   // ========== 231 ===== 508 ==========
   aPseudoTicket[231] = 114;
   aAction[231] = 0; // CLOSE
   aType[231] = OP_BUY; // BUY
   aTicket[231] = -1; // Ticket given by broker
   aSymbol[231] = "EURUSD";
   aLots[231] = 1.0;
   aDate[231] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPrice[231] = 1.3681;

   // ========== 232 ===== 502 ==========
   aPseudoTicket[232] = 116;
   aAction[232] = 1; // OPEN
   aReturn[116] = 232;
   aType[232] = OP_BUY; // BUY
   aTicket[232] = -1; // Ticket given by broker
   aSymbol[232] = "EURUSD";
   aLots[232] = 1.0;
   aDate[232] = D'2011.11.02 13:35:53'+time_offset*3600;
   aPrice[232] = 1.38277;

   // ========== 233 ===== 502 ==========
   aPseudoTicket[233] = 116;
   aAction[233] = 0; // CLOSE
   aType[233] = OP_BUY; // BUY
   aTicket[233] = -1; // Ticket given by broker
   aSymbol[233] = "EURUSD";
   aLots[233] = 1.0;
   aDate[233] = D'2011.11.02 16:16:24'+time_offset*3600;
   aPrice[233] = 1.377;

   // ========== 234 ===== 496 ==========
   aPseudoTicket[234] = 117;
   aAction[234] = 1; // OPEN
   aReturn[117] = 234;
   aType[234] = OP_SELL; // SELL
   aTicket[234] = -1; // Ticket given by broker
   aSymbol[234] = "EURUSD";
   aLots[234] = 1.0;
   aDate[234] = D'2011.11.04 12:46:23'+time_offset*3600;
   aPrice[234] = 1.38212;

   // ========== 235 ===== 495 ==========
   aPseudoTicket[235] = 118;
   aAction[235] = 1; // OPEN
   aReturn[118] = 235;
   aType[235] = OP_SELL; // SELL
   aTicket[235] = -1; // Ticket given by broker
   aSymbol[235] = "EURUSD";
   aLots[235] = 1.0;
   aDate[235] = D'2011.11.04 14:10:35'+time_offset*3600;
   aPrice[235] = 1.37354;

   // ========== 236 ===== 496 ==========
   aPseudoTicket[236] = 117;
   aAction[236] = 0; // CLOSE
   aType[236] = OP_SELL; // SELL
   aTicket[236] = -1; // Ticket given by broker
   aSymbol[236] = "EURUSD";
   aLots[236] = 1.0;
   aDate[236] = D'2011.11.04 15:28:01'+time_offset*3600;
   aPrice[236] = 1.37404;

   // ========== 237 ===== 495 ==========
   aPseudoTicket[237] = 118;
   aAction[237] = 0; // CLOSE
   aType[237] = OP_SELL; // SELL
   aTicket[237] = -1; // Ticket given by broker
   aSymbol[237] = "EURUSD";
   aLots[237] = 1.0;
   aDate[237] = D'2011.11.04 15:46:51'+time_offset*3600;
   aPrice[237] = 1.37617;

   // ========== 238 ===== 490 ==========
   aPseudoTicket[238] = 119;
   aAction[238] = 1; // OPEN
   aReturn[119] = 238;
   aType[238] = OP_SELL; // SELL
   aTicket[238] = -1; // Ticket given by broker
   aSymbol[238] = "EURUSD";
   aLots[238] = 1.0;
   aDate[238] = D'2011.11.08 08:00:55'+time_offset*3600;
   aPrice[238] = 1.37262;

   // ========== 239 ===== 490 ==========
   aPseudoTicket[239] = 119;
   aAction[239] = 0; // CLOSE
   aType[239] = OP_SELL; // SELL
   aTicket[239] = -1; // Ticket given by broker
   aSymbol[239] = "EURUSD";
   aLots[239] = 1.0;
   aDate[239] = D'2011.11.08 08:09:08'+time_offset*3600;
   aPrice[239] = 1.37469;

   // ========== 240 ===== 485 ==========
   aPseudoTicket[240] = 120;
   aAction[240] = 1; // OPEN
   aReturn[120] = 240;
   aType[240] = OP_SELL; // SELL
   aTicket[240] = -1; // Ticket given by broker
   aSymbol[240] = "EURUSD";
   aLots[240] = 1.0;
   aDate[240] = D'2011.11.09 09:06:59'+time_offset*3600;
   aPrice[240] = 1.37676;

   // ========== 241 ===== 484 ==========
   aPseudoTicket[241] = 121;
   aAction[241] = 1; // OPEN
   aReturn[121] = 241;
   aType[241] = OP_SELL; // SELL
   aTicket[241] = -1; // Ticket given by broker
   aSymbol[241] = "EURUSD";
   aLots[241] = 1.0;
   aDate[241] = D'2011.11.09 09:10:56'+time_offset*3600;
   aPrice[241] = 1.37596;

   // ========== 242 ===== 483 ==========
   aPseudoTicket[242] = 122;
   aAction[242] = 1; // OPEN
   aReturn[122] = 242;
   aType[242] = OP_SELL; // SELL
   aTicket[242] = -1; // Ticket given by broker
   aSymbol[242] = "EURUSD";
   aLots[242] = 1.0;
   aDate[242] = D'2011.11.09 09:12:50'+time_offset*3600;
   aPrice[242] = 1.37571;

   // ========== 243 ===== 485 ==========
   aPseudoTicket[243] = 120;
   aAction[243] = 0; // CLOSE
   aType[243] = OP_SELL; // SELL
   aTicket[243] = -1; // Ticket given by broker
   aSymbol[243] = "EURUSD";
   aLots[243] = 1.0;
   aDate[243] = D'2011.11.09 09:45:18'+time_offset*3600;
   aPrice[243] = 1.37204;

   // ========== 244 ===== 484 ==========
   aPseudoTicket[244] = 121;
   aAction[244] = 0; // CLOSE
   aType[244] = OP_SELL; // SELL
   aTicket[244] = -1; // Ticket given by broker
   aSymbol[244] = "EURUSD";
   aLots[244] = 1.0;
   aDate[244] = D'2011.11.09 10:40:19'+time_offset*3600;
   aPrice[244] = 1.3667;

   // ========== 245 ===== 483 ==========
   aPseudoTicket[245] = 122;
   aAction[245] = 0; // CLOSE
   aType[245] = OP_SELL; // SELL
   aTicket[245] = -1; // Ticket given by broker
   aSymbol[245] = "EURUSD";
   aLots[245] = 1.0;
   aDate[245] = D'2011.11.09 12:02:00'+time_offset*3600;
   aPrice[245] = 1.36261;

   // ========== 246 ===== 482 ==========
   aPseudoTicket[246] = 123;
   aAction[246] = 1; // OPEN
   aReturn[123] = 246;
   aType[246] = OP_BUY; // BUY
   aTicket[246] = -1; // Ticket given by broker
   aSymbol[246] = "EURUSD";
   aLots[246] = 1.0;
   aDate[246] = D'2011.11.09 14:46:44'+time_offset*3600;
   aPrice[246] = 1.356;

   // ========== 247 ===== 482 ==========
   aPseudoTicket[247] = 123;
   aAction[247] = 0; // CLOSE
   aType[247] = OP_BUY; // BUY
   aTicket[247] = -1; // Ticket given by broker
   aSymbol[247] = "EURUSD";
   aLots[247] = 1.0;
   aDate[247] = D'2011.11.09 15:52:31'+time_offset*3600;
   aPrice[247] = 1.3593;

   // ========== 248 ===== 478 ==========
   aPseudoTicket[248] = 124;
   aAction[248] = 1; // OPEN
   aReturn[124] = 248;
   aType[248] = OP_BUY; // BUY
   aTicket[248] = -1; // Ticket given by broker
   aSymbol[248] = "EURUSD";
   aLots[248] = 1.0;
   aDate[248] = D'2011.11.09 22:03:43'+time_offset*3600;
   aPrice[248] = 1.35422;

   // ========== 249 ===== 479 ==========
   aPseudoTicket[249] = 125;
   aAction[249] = 1; // OPEN
   aReturn[125] = 249;
   aType[249] = OP_BUY; // BUY
   aTicket[249] = -1; // Ticket given by broker
   aSymbol[249] = "EURUSD";
   aLots[249] = 1.0;
   aDate[249] = D'2011.11.10 00:29:30'+time_offset*3600;
   aPrice[249] = 1.35208;

   // ========== 250 ===== 479 ==========
   aPseudoTicket[250] = 125;
   aAction[250] = 0; // CLOSE
   aType[250] = OP_BUY; // BUY
   aTicket[250] = -1; // Ticket given by broker
   aSymbol[250] = "EURUSD";
   aLots[250] = 1.0;
   aDate[250] = D'2011.11.10 01:48:48'+time_offset*3600;
   aPrice[250] = 1.35395;

   // ========== 251 ===== 478 ==========
   aPseudoTicket[251] = 124;
   aAction[251] = 0; // CLOSE
   aType[251] = OP_BUY; // BUY
   aTicket[251] = -1; // Ticket given by broker
   aSymbol[251] = "EURUSD";
   aLots[251] = 1.0;
   aDate[251] = D'2011.11.10 01:51:04'+time_offset*3600;
   aPrice[251] = 1.35434;

   // ========== 252 ===== 475 ==========
   aPseudoTicket[252] = 126;
   aAction[252] = 1; // OPEN
   aReturn[126] = 252;
   aType[252] = OP_SELL; // SELL
   aTicket[252] = -1; // Ticket given by broker
   aSymbol[252] = "EURUSD";
   aLots[252] = 1.0;
   aDate[252] = D'2011.11.10 09:49:43'+time_offset*3600;
   aPrice[252] = 1.361;

   // ========== 253 ===== 475 ==========
   aPseudoTicket[253] = 126;
   aAction[253] = 0; // CLOSE
   aType[253] = OP_SELL; // SELL
   aTicket[253] = -1; // Ticket given by broker
   aSymbol[253] = "EURUSD";
   aLots[253] = 1.0;
   aDate[253] = D'2011.11.10 10:41:24'+time_offset*3600;
   aPrice[253] = 1.357;

   // ========== 254 ===== 469 ==========
   aPseudoTicket[254] = 127;
   aAction[254] = 1; // OPEN
   aReturn[127] = 254;
   aType[254] = OP_SELL; // SELL
   aTicket[254] = -1; // Ticket given by broker
   aSymbol[254] = "EURUSD";
   aLots[254] = 1.0;
   aDate[254] = D'2011.11.11 11:38:12'+time_offset*3600;
   aPrice[254] = 1.36421;

   // ========== 255 ===== 470 ==========
   aPseudoTicket[255] = 128;
   aAction[255] = 1; // OPEN
   aReturn[128] = 255;
   aType[255] = OP_SELL; // SELL
   aTicket[255] = -1; // Ticket given by broker
   aSymbol[255] = "EURUSD";
   aLots[255] = 1.0;
   aDate[255] = D'2011.11.11 14:12:13'+time_offset*3600;
   aPrice[255] = 1.36784;

   // ========== 256 ===== 470 ==========
   aPseudoTicket[256] = 128;
   aAction[256] = 0; // CLOSE
   aType[256] = OP_SELL; // SELL
   aTicket[256] = -1; // Ticket given by broker
   aSymbol[256] = "EURUSD";
   aLots[256] = 1.0;
   aDate[256] = D'2011.11.11 15:35:37'+time_offset*3600;
   aPrice[256] = 1.37195;

   // ========== 257 ===== 469 ==========
   aPseudoTicket[257] = 127;
   aAction[257] = 0; // CLOSE
   aType[257] = OP_SELL; // SELL
   aTicket[257] = -1; // Ticket given by broker
   aSymbol[257] = "EURUSD";
   aLots[257] = 1.0;
   aDate[257] = D'2011.11.11 15:35:41'+time_offset*3600;
   aPrice[257] = 1.37173;

   // ========== 258 ===== 465 ==========
   aPseudoTicket[258] = 129;
   aAction[258] = 1; // OPEN
   aReturn[129] = 258;
   aType[258] = OP_SELL; // SELL
   aTicket[258] = -1; // Ticket given by broker
   aSymbol[258] = "EURUSD";
   aLots[258] = 1.0;
   aDate[258] = D'2011.11.14 09:23:58'+time_offset*3600;
   aPrice[258] = 1.36908;

   // ========== 259 ===== 465 ==========
   aPseudoTicket[259] = 129;
   aAction[259] = 0; // CLOSE
   aType[259] = OP_SELL; // SELL
   aTicket[259] = -1; // Ticket given by broker
   aSymbol[259] = "EURUSD";
   aLots[259] = 1.0;
   aDate[259] = D'2011.11.14 09:55:59'+time_offset*3600;
   aPrice[259] = 1.36962;

   // ========== 260 ===== 464 ==========
   aPseudoTicket[260] = 130;
   aAction[260] = 1; // OPEN
   aReturn[130] = 260;
   aType[260] = OP_BUY; // BUY
   aTicket[260] = -1; // Ticket given by broker
   aSymbol[260] = "EURUSD";
   aLots[260] = 1.0;
   aDate[260] = D'2011.11.14 10:06:42'+time_offset*3600;
   aPrice[260] = 1.36847;

   // ========== 261 ===== 464 ==========
   aPseudoTicket[261] = 130;
   aAction[261] = 0; // CLOSE
   aType[261] = OP_BUY; // BUY
   aTicket[261] = -1; // Ticket given by broker
   aSymbol[261] = "EURUSD";
   aLots[261] = 1.0;
   aDate[261] = D'2011.11.14 10:59:52'+time_offset*3600;
   aPrice[261] = 1.36967;

   // ========== 262 ===== 460 ==========
   aPseudoTicket[262] = 131;
   aAction[262] = 1; // OPEN
   aReturn[131] = 262;
   aType[262] = OP_BUY; // BUY
   aTicket[262] = -1; // Ticket given by broker
   aSymbol[262] = "EURUSD";
   aLots[262] = 1.0;
   aDate[262] = D'2011.11.14 14:17:03'+time_offset*3600;
   aPrice[262] = 1.36374;

   // ========== 263 ===== 461 ==========
   aPseudoTicket[263] = 132;
   aAction[263] = 1; // OPEN
   aReturn[132] = 263;
   aType[263] = OP_BUY; // BUY
   aTicket[263] = -1; // Ticket given by broker
   aSymbol[263] = "EURUSD";
   aLots[263] = 1.0;
   aDate[263] = D'2011.11.14 15:25:38'+time_offset*3600;
   aPrice[263] = 1.3623;

   // ========== 264 ===== 461 ==========
   aPseudoTicket[264] = 132;
   aAction[264] = 0; // CLOSE
   aType[264] = OP_BUY; // BUY
   aTicket[264] = -1; // Ticket given by broker
   aSymbol[264] = "EURUSD";
   aLots[264] = 1.0;
   aDate[264] = D'2011.11.14 15:51:51'+time_offset*3600;
   aPrice[264] = 1.36345;

   // ========== 265 ===== 460 ==========
   aPseudoTicket[265] = 131;
   aAction[265] = 0; // CLOSE
   aType[265] = OP_BUY; // BUY
   aTicket[265] = -1; // Ticket given by broker
   aSymbol[265] = "EURUSD";
   aLots[265] = 1.0;
   aDate[265] = D'2011.11.14 16:09:51'+time_offset*3600;
   aPrice[265] = 1.36408;

   // ========== 266 ===== 459 ==========
   aPseudoTicket[266] = 133;
   aAction[266] = 1; // OPEN
   aReturn[133] = 266;
   aType[266] = OP_SELL; // SELL
   aTicket[266] = -1; // Ticket given by broker
   aSymbol[266] = "EURUSD";
   aLots[266] = 1.0;
   aDate[266] = D'2011.11.15 08:49:03'+time_offset*3600;
   aPrice[266] = 1.35709;

   // ========== 267 ===== 459 ==========
   aPseudoTicket[267] = 133;
   aAction[267] = 0; // CLOSE
   aType[267] = OP_SELL; // SELL
   aTicket[267] = -1; // Ticket given by broker
   aSymbol[267] = "EURUSD";
   aLots[267] = 1.0;
   aDate[267] = D'2011.11.15 08:52:40'+time_offset*3600;
   aPrice[267] = 1.35877;

   // ========== 268 ===== 453 ==========
   aPseudoTicket[268] = 134;
   aAction[268] = 1; // OPEN
   aReturn[134] = 268;
   aType[268] = OP_BUY; // BUY
   aTicket[268] = -1; // Ticket given by broker
   aSymbol[268] = "EURUSD";
   aLots[268] = 1.0;
   aDate[268] = D'2011.11.16 02:04:30'+time_offset*3600;
   aPrice[268] = 1.3475;

   // ========== 269 ===== 453 ==========
   aPseudoTicket[269] = 134;
   aAction[269] = 0; // CLOSE
   aType[269] = OP_BUY; // BUY
   aTicket[269] = -1; // Ticket given by broker
   aSymbol[269] = "EURUSD";
   aLots[269] = 1.0;
   aDate[269] = D'2011.11.16 08:21:45'+time_offset*3600;
   aPrice[269] = 1.349;

   // ========== 270 ===== 452 ==========
   aPseudoTicket[270] = 135;
   aAction[270] = 1; // OPEN
   aReturn[135] = 270;
   aType[270] = OP_SELL; // SELL
   aTicket[270] = -1; // Ticket given by broker
   aSymbol[270] = "EURUSD";
   aLots[270] = 1.0;
   aDate[270] = D'2011.11.16 08:46:10'+time_offset*3600;
   aPrice[270] = 1.35318;

   // ========== 271 ===== 452 ==========
   aPseudoTicket[271] = 135;
   aAction[271] = 0; // CLOSE
   aType[271] = OP_SELL; // SELL
   aTicket[271] = -1; // Ticket given by broker
   aSymbol[271] = "EURUSD";
   aLots[271] = 1.0;
   aDate[271] = D'2011.11.16 08:51:01'+time_offset*3600;
   aPrice[271] = 1.35303;

   // ========== 272 ===== 451 ==========
   aPseudoTicket[272] = 136;
   aAction[272] = 1; // OPEN
   aReturn[136] = 272;
   aType[272] = OP_SELL; // SELL
   aTicket[272] = -1; // Ticket given by broker
   aSymbol[272] = "EURUSD";
   aLots[272] = 1.0;
   aDate[272] = D'2011.11.16 09:12:18'+time_offset*3600;
   aPrice[272] = 1.3541;

   // ========== 273 ===== 451 ==========
   aPseudoTicket[273] = 136;
   aAction[273] = 0; // CLOSE
   aType[273] = OP_SELL; // SELL
   aTicket[273] = -1; // Ticket given by broker
   aSymbol[273] = "EURUSD";
   aLots[273] = 1.0;
   aDate[273] = D'2011.11.16 09:14:03'+time_offset*3600;
   aPrice[273] = 1.35364;

   // ========== 274 ===== 443 ==========
   aPseudoTicket[274] = 137;
   aAction[274] = 1; // OPEN
   aReturn[137] = 274;
   aType[274] = OP_BUY; // BUY
   aTicket[274] = -1; // Ticket given by broker
   aSymbol[274] = "EURUSD";
   aLots[274] = 1.0;
   aDate[274] = D'2011.11.18 02:23:13'+time_offset*3600;
   aPrice[274] = 1.34828;

   // ========== 275 ===== 443 ==========
   aPseudoTicket[275] = 137;
   aAction[275] = 0; // CLOSE
   aType[275] = OP_BUY; // BUY
   aTicket[275] = -1; // Ticket given by broker
   aSymbol[275] = "EURUSD";
   aLots[275] = 1.0;
   aDate[275] = D'2011.11.18 02:27:41'+time_offset*3600;
   aPrice[275] = 1.34827;

   // ========== 276 ===== 442 ==========
   aPseudoTicket[276] = 138;
   aAction[276] = 1; // OPEN
   aReturn[138] = 276;
   aType[276] = OP_SELL; // SELL
   aTicket[276] = -1; // Ticket given by broker
   aSymbol[276] = "EURUSD";
   aLots[276] = 1.0;
   aDate[276] = D'2011.11.18 05:16:35'+time_offset*3600;
   aPrice[276] = 1.34695;

   // ========== 277 ===== 442 ==========
   aPseudoTicket[277] = 138;
   aAction[277] = 0; // CLOSE
   aType[277] = OP_SELL; // SELL
   aTicket[277] = -1; // Ticket given by broker
   aSymbol[277] = "EURUSD";
   aLots[277] = 1.0;
   aDate[277] = D'2011.11.18 07:27:18'+time_offset*3600;
   aPrice[277] = 1.35143;

   // ========== 278 ===== 438 ==========
   aPseudoTicket[278] = 139;
   aAction[278] = 1; // OPEN
   aReturn[139] = 278;
   aType[278] = OP_SELL; // SELL
   aTicket[278] = -1; // Ticket given by broker
   aSymbol[278] = "EURUSD";
   aLots[278] = 1.0;
   aDate[278] = D'2011.11.21 07:50:04'+time_offset*3600;
   aPrice[278] = 1.34893;

   // ========== 279 ===== 439 ==========
   aPseudoTicket[279] = 140;
   aAction[279] = 1; // OPEN
   aReturn[140] = 279;
   aType[279] = OP_SELL; // SELL
   aTicket[279] = -1; // Ticket given by broker
   aSymbol[279] = "EURUSD";
   aLots[279] = 1.0;
   aDate[279] = D'2011.11.21 07:51:27'+time_offset*3600;
   aPrice[279] = 1.34925;

   // ========== 280 ===== 439 ==========
   aPseudoTicket[280] = 140;
   aAction[280] = 0; // CLOSE
   aType[280] = OP_SELL; // SELL
   aTicket[280] = -1; // Ticket given by broker
   aSymbol[280] = "EURUSD";
   aLots[280] = 1.0;
   aDate[280] = D'2011.11.21 08:02:14'+time_offset*3600;
   aPrice[280] = 1.34769;

   // ========== 281 ===== 438 ==========
   aPseudoTicket[281] = 139;
   aAction[281] = 0; // CLOSE
   aType[281] = OP_SELL; // SELL
   aTicket[281] = -1; // Ticket given by broker
   aSymbol[281] = "EURUSD";
   aLots[281] = 1.0;
   aDate[281] = D'2011.11.21 08:02:18'+time_offset*3600;
   aPrice[281] = 1.34774;

   // ========== 282 ===== 436 ==========
   aPseudoTicket[282] = 141;
   aAction[282] = 1; // OPEN
   aReturn[141] = 282;
   aType[282] = OP_SELL; // SELL
   aTicket[282] = -1; // Ticket given by broker
   aSymbol[282] = "EURUSD";
   aLots[282] = 1.0;
   aDate[282] = D'2011.11.22 10:39:01'+time_offset*3600;
   aPrice[282] = 1.35382;

   // ========== 283 ===== 436 ==========
   aPseudoTicket[283] = 141;
   aAction[283] = 0; // CLOSE
   aType[283] = OP_SELL; // SELL
   aTicket[283] = -1; // Ticket given by broker
   aSymbol[283] = "EURUSD";
   aLots[283] = 1.0;
   aDate[283] = D'2011.11.22 10:55:57'+time_offset*3600;
   aPrice[283] = 1.35359;

   // ========== 284 ===== 435 ==========
   aPseudoTicket[284] = 142;
   aAction[284] = 1; // OPEN
   aReturn[142] = 284;
   aType[284] = OP_SELL; // SELL
   aTicket[284] = -1; // Ticket given by broker
   aSymbol[284] = "EURUSD";
   aLots[284] = 1.0;
   aDate[284] = D'2011.11.22 11:02:19'+time_offset*3600;
   aPrice[284] = 1.35398;

   // ========== 285 ===== 435 ==========
   aPseudoTicket[285] = 142;
   aAction[285] = 0; // CLOSE
   aType[285] = OP_SELL; // SELL
   aTicket[285] = -1; // Ticket given by broker
   aSymbol[285] = "EURUSD";
   aLots[285] = 1.0;
   aDate[285] = D'2011.11.22 13:28:30'+time_offset*3600;
   aPrice[285] = 1.35325;

   // ========== 286 ===== 429 ==========
   aPseudoTicket[286] = 143;
   aAction[286] = 1; // OPEN
   aReturn[143] = 286;
   aType[286] = OP_SELL; // SELL
   aTicket[286] = -1; // Ticket given by broker
   aSymbol[286] = "EURUSD";
   aLots[286] = 1.0;
   aDate[286] = D'2011.11.23 10:12:15'+time_offset*3600;
   aPrice[286] = 1.3421;

   // ========== 287 ===== 429 ==========
   aPseudoTicket[287] = 143;
   aAction[287] = 0; // CLOSE
   aType[287] = OP_SELL; // SELL
   aTicket[287] = -1; // Ticket given by broker
   aSymbol[287] = "EURUSD";
   aLots[287] = 1.0;
   aDate[287] = D'2011.11.23 10:16:04'+time_offset*3600;
   aPrice[287] = 1.33978;

   // ========== 288 ===== 426 ==========
   aPseudoTicket[288] = 144;
   aAction[288] = 1; // OPEN
   aReturn[144] = 288;
   aType[288] = OP_SELL; // SELL
   aTicket[288] = -1; // Ticket given by broker
   aSymbol[288] = "EURUSD";
   aLots[288] = 1.0;
   aDate[288] = D'2011.11.23 10:19:28'+time_offset*3600;
   aPrice[288] = 1.33951;

   // ========== 289 ===== 427 ==========
   aPseudoTicket[289] = 145;
   aAction[289] = 1; // OPEN
   aReturn[145] = 289;
   aType[289] = OP_SELL; // SELL
   aTicket[289] = -1; // Ticket given by broker
   aSymbol[289] = "EURUSD";
   aLots[289] = 1.0;
   aDate[289] = D'2011.11.23 10:20:55'+time_offset*3600;
   aPrice[289] = 1.33982;

   // ========== 290 ===== 428 ==========
   aPseudoTicket[290] = 146;
   aAction[290] = 1; // OPEN
   aReturn[146] = 290;
   aType[290] = OP_SELL; // SELL
   aTicket[290] = -1; // Ticket given by broker
   aSymbol[290] = "EURUSD";
   aLots[290] = 1.0;
   aDate[290] = D'2011.11.23 12:16:42'+time_offset*3600;
   aPrice[290] = 1.33942;

   // ========== 291 ===== 428 ==========
   aPseudoTicket[291] = 146;
   aAction[291] = 0; // CLOSE
   aType[291] = OP_SELL; // SELL
   aTicket[291] = -1; // Ticket given by broker
   aSymbol[291] = "EURUSD";
   aLots[291] = 1.0;
   aDate[291] = D'2011.11.23 15:02:43'+time_offset*3600;
   aPrice[291] = 1.33689;

   // ========== 292 ===== 427 ==========
   aPseudoTicket[292] = 145;
   aAction[292] = 0; // CLOSE
   aType[292] = OP_SELL; // SELL
   aTicket[292] = -1; // Ticket given by broker
   aSymbol[292] = "EURUSD";
   aLots[292] = 1.0;
   aDate[292] = D'2011.11.23 15:03:35'+time_offset*3600;
   aPrice[292] = 1.33664;

   // ========== 293 ===== 426 ==========
   aPseudoTicket[293] = 144;
   aAction[293] = 0; // CLOSE
   aType[293] = OP_SELL; // SELL
   aTicket[293] = -1; // Ticket given by broker
   aSymbol[293] = "EURUSD";
   aLots[293] = 1.0;
   aDate[293] = D'2011.11.23 15:45:17'+time_offset*3600;
   aPrice[293] = 1.33589;

   // ========== 294 ===== 425 ==========
   aPseudoTicket[294] = 147;
   aAction[294] = 1; // OPEN
   aReturn[147] = 294;
   aType[294] = OP_BUY; // BUY
   aTicket[294] = -1; // Ticket given by broker
   aSymbol[294] = "EURUSD";
   aLots[294] = 1.0;
   aDate[294] = D'2011.11.24 11:39:03'+time_offset*3600;
   aPrice[294] = 1.33824;

   // ========== 295 ===== 425 ==========
   aPseudoTicket[295] = 147;
   aAction[295] = 0; // CLOSE
   aType[295] = OP_BUY; // BUY
   aTicket[295] = -1; // Ticket given by broker
   aSymbol[295] = "EURUSD";
   aLots[295] = 1.0;
   aDate[295] = D'2011.11.24 11:47:31'+time_offset*3600;
   aPrice[295] = 1.33842;

   // ========== 296 ===== 419 ==========
   aPseudoTicket[296] = 148;
   aAction[296] = 1; // OPEN
   aReturn[148] = 296;
   aType[296] = OP_SELL; // SELL
   aTicket[296] = -1; // Ticket given by broker
   aSymbol[296] = "EURUSD";
   aLots[296] = 1.0;
   aDate[296] = D'2011.11.25 09:04:41'+time_offset*3600;
   aPrice[296] = 1.32688;

   // ========== 297 ===== 419 ==========
   aPseudoTicket[297] = 148;
   aAction[297] = 0; // CLOSE
   aType[297] = OP_SELL; // SELL
   aTicket[297] = -1; // Ticket given by broker
   aSymbol[297] = "EURUSD";
   aLots[297] = 1.0;
   aDate[297] = D'2011.11.25 09:10:17'+time_offset*3600;
   aPrice[297] = 1.32611;

   // ========== 298 ===== 415 ==========
   aPseudoTicket[298] = 149;
   aAction[298] = 1; // OPEN
   aReturn[149] = 298;
   aType[298] = OP_SELL; // SELL
   aTicket[298] = -1; // Ticket given by broker
   aSymbol[298] = "EURUSD";
   aLots[298] = 1.0;
   aDate[298] = D'2011.11.27 23:28:55'+time_offset*3600;
   aPrice[298] = 1.33176;

   // ========== 299 ===== 416 ==========
   aPseudoTicket[299] = 150;
   aAction[299] = 1; // OPEN
   aReturn[150] = 299;
   aType[299] = OP_SELL; // SELL
   aTicket[299] = -1; // Ticket given by broker
   aSymbol[299] = "EURUSD";
   aLots[299] = 1.0;
   aDate[299] = D'2011.11.27 23:32:53'+time_offset*3600;
   aPrice[299] = 1.33222;

   // ========== 300 ===== 416 ==========
   aPseudoTicket[300] = 150;
   aAction[300] = 0; // CLOSE
   aType[300] = OP_SELL; // SELL
   aTicket[300] = -1; // Ticket given by broker
   aSymbol[300] = "EURUSD";
   aLots[300] = 1.0;
   aDate[300] = D'2011.11.28 01:06:55'+time_offset*3600;
   aPrice[300] = 1.33096;

   // ========== 301 ===== 415 ==========
   aPseudoTicket[301] = 149;
   aAction[301] = 0; // CLOSE
   aType[301] = OP_SELL; // SELL
   aTicket[301] = -1; // Ticket given by broker
   aSymbol[301] = "EURUSD";
   aLots[301] = 1.0;
   aDate[301] = D'2011.11.28 01:20:07'+time_offset*3600;
   aPrice[301] = 1.33168;

   // ========== 302 ===== 414 ==========
   aPseudoTicket[302] = 151;
   aAction[302] = 1; // OPEN
   aReturn[151] = 302;
   aType[302] = OP_SELL; // SELL
   aTicket[302] = -1; // Ticket given by broker
   aSymbol[302] = "EURUSD";
   aLots[302] = 1.0;
   aDate[302] = D'2011.11.28 02:01:19'+time_offset*3600;
   aPrice[302] = 1.33159;

   // ========== 303 ===== 414 ==========
   aPseudoTicket[303] = 151;
   aAction[303] = 0; // CLOSE
   aType[303] = OP_SELL; // SELL
   aTicket[303] = -1; // Ticket given by broker
   aSymbol[303] = "EURUSD";
   aLots[303] = 1.0;
   aDate[303] = D'2011.11.28 03:20:34'+time_offset*3600;
   aPrice[303] = 1.33097;

   // ========== 304 ===== 412 ==========
   aPseudoTicket[304] = 152;
   aAction[304] = 1; // OPEN
   aReturn[152] = 304;
   aType[304] = OP_SELL; // SELL
   aTicket[304] = -1; // Ticket given by broker
   aSymbol[304] = "EURUSD";
   aLots[304] = 1.0;
   aDate[304] = D'2011.11.28 04:15:44'+time_offset*3600;
   aPrice[304] = 1.3278;

   // ========== 305 ===== 412 ==========
   aPseudoTicket[305] = 152;
   aAction[305] = 0; // CLOSE
   aType[305] = OP_SELL; // SELL
   aTicket[305] = -1; // Ticket given by broker
   aSymbol[305] = "EURUSD";
   aLots[305] = 1.0;
   aDate[305] = D'2011.11.28 05:53:47'+time_offset*3600;
   aPrice[305] = 1.33028;

   // ========== 306 ===== 400 ==========
   aPseudoTicket[306] = 153;
   aAction[306] = 1; // OPEN
   aReturn[153] = 306;
   aType[306] = OP_SELL; // SELL
   aTicket[306] = -1; // Ticket given by broker
   aSymbol[306] = "EURUSD";
   aLots[306] = 1.0;
   aDate[306] = D'2011.11.29 08:02:11'+time_offset*3600;
   aPrice[306] = 1.33325;

   // ========== 307 ===== 400 ==========
   aPseudoTicket[307] = 153;
   aAction[307] = 0; // CLOSE
   aType[307] = OP_SELL; // SELL
   aTicket[307] = -1; // Ticket given by broker
   aSymbol[307] = "EURUSD";
   aLots[307] = 1.0;
   aDate[307] = D'2011.11.29 08:17:05'+time_offset*3600;
   aPrice[307] = 1.33303;

   // ========== 308 ===== 399 ==========
   aPseudoTicket[308] = 154;
   aAction[308] = 1; // OPEN
   aReturn[154] = 308;
   aType[308] = OP_SELL; // SELL
   aTicket[308] = -1; // Ticket given by broker
   aSymbol[308] = "EURUSD";
   aLots[308] = 1.0;
   aDate[308] = D'2011.11.29 08:40:51'+time_offset*3600;
   aPrice[308] = 1.33246;

   // ========== 309 ===== 399 ==========
   aPseudoTicket[309] = 154;
   aAction[309] = 0; // CLOSE
   aType[309] = OP_SELL; // SELL
   aTicket[309] = -1; // Ticket given by broker
   aSymbol[309] = "EURUSD";
   aLots[309] = 1.0;
   aDate[309] = D'2011.11.29 08:51:19'+time_offset*3600;
   aPrice[309] = 1.33227;

   // ========== 310 ===== 398 ==========
   aPseudoTicket[310] = 155;
   aAction[310] = 1; // OPEN
   aReturn[155] = 310;
   aType[310] = OP_BUY; // BUY
   aTicket[310] = -1; // Ticket given by broker
   aSymbol[310] = "EURUSD";
   aLots[310] = 1.0;
   aDate[310] = D'2011.11.29 10:14:21'+time_offset*3600;
   aPrice[310] = 1.33866;

   // ========== 311 ===== 398 ==========
   aPseudoTicket[311] = 155;
   aAction[311] = 0; // CLOSE
   aType[311] = OP_BUY; // BUY
   aTicket[311] = -1; // Ticket given by broker
   aSymbol[311] = "EURUSD";
   aLots[311] = 1.0;
   aDate[311] = D'2011.11.29 10:15:43'+time_offset*3600;
   aPrice[311] = 1.33976;

   // ========== 312 ===== 397 ==========
   aPseudoTicket[312] = 156;
   aAction[312] = 1; // OPEN
   aReturn[156] = 312;
   aType[312] = OP_BUY; // BUY
   aTicket[312] = -1; // Ticket given by broker
   aSymbol[312] = "EURUSD";
   aLots[312] = 1.0;
   aDate[312] = D'2011.11.29 11:23:59'+time_offset*3600;
   aPrice[312] = 1.34017;

   // ========== 313 ===== 397 ==========
   aPseudoTicket[313] = 156;
   aAction[313] = 0; // CLOSE
   aType[313] = OP_BUY; // BUY
   aTicket[313] = -1; // Ticket given by broker
   aSymbol[313] = "EURUSD";
   aLots[313] = 1.0;
   aDate[313] = D'2011.11.29 11:43:32'+time_offset*3600;
   aPrice[313] = 1.33882;

   // ========== 314 ===== 396 ==========
   aPseudoTicket[314] = 157;
   aAction[314] = 1; // OPEN
   aReturn[157] = 314;
   aType[314] = OP_SELL; // SELL
   aTicket[314] = -1; // Ticket given by broker
   aSymbol[314] = "EURUSD";
   aLots[314] = 1.0;
   aDate[314] = D'2011.11.30 06:57:02'+time_offset*3600;
   aPrice[314] = 1.33015;

   // ========== 315 ===== 396 ==========
   aPseudoTicket[315] = 157;
   aAction[315] = 0; // CLOSE
   aType[315] = OP_SELL; // SELL
   aTicket[315] = -1; // Ticket given by broker
   aSymbol[315] = "EURUSD";
   aLots[315] = 1.0;
   aDate[315] = D'2011.11.30 07:04:56'+time_offset*3600;
   aPrice[315] = 1.32952;

   // ========== 316 ===== 395 ==========
   aPseudoTicket[316] = 158;
   aAction[316] = 1; // OPEN
   aReturn[158] = 316;
   aType[316] = OP_SELL; // SELL
   aTicket[316] = -1; // Ticket given by broker
   aSymbol[316] = "EURUSD";
   aLots[316] = 1.0;
   aDate[316] = D'2011.11.30 07:16:09'+time_offset*3600;
   aPrice[316] = 1.32662;

   // ========== 317 ===== 394 ==========
   aPseudoTicket[317] = 159;
   aAction[317] = 1; // OPEN
   aReturn[159] = 317;
   aType[317] = OP_SELL; // SELL
   aTicket[317] = -1; // Ticket given by broker
   aSymbol[317] = "EURUSD";
   aLots[317] = 1.0;
   aDate[317] = D'2011.11.30 07:17:31'+time_offset*3600;
   aPrice[317] = 1.32669;

   // ========== 318 ===== 393 ==========
   aPseudoTicket[318] = 160;
   aAction[318] = 1; // OPEN
   aReturn[160] = 318;
   aType[318] = OP_SELL; // SELL
   aTicket[318] = -1; // Ticket given by broker
   aSymbol[318] = "EURUSD";
   aLots[318] = 1.0;
   aDate[318] = D'2011.11.30 07:18:22'+time_offset*3600;
   aPrice[318] = 1.32632;

   // ========== 319 ===== 392 ==========
   aPseudoTicket[319] = 161;
   aAction[319] = 1; // OPEN
   aReturn[161] = 319;
   aType[319] = OP_SELL; // SELL
   aTicket[319] = -1; // Ticket given by broker
   aSymbol[319] = "EURUSD";
   aLots[319] = 1.0;
   aDate[319] = D'2011.11.30 07:20:09'+time_offset*3600;
   aPrice[319] = 1.32623;

   // ========== 320 ===== 395 ==========
   aPseudoTicket[320] = 158;
   aAction[320] = 0; // CLOSE
   aType[320] = OP_SELL; // SELL
   aTicket[320] = -1; // Ticket given by broker
   aSymbol[320] = "EURUSD";
   aLots[320] = 1.0;
   aDate[320] = D'2011.11.30 09:08:19'+time_offset*3600;
   aPrice[320] = 1.32906;

   // ========== 321 ===== 394 ==========
   aPseudoTicket[321] = 159;
   aAction[321] = 0; // CLOSE
   aType[321] = OP_SELL; // SELL
   aTicket[321] = -1; // Ticket given by broker
   aSymbol[321] = "EURUSD";
   aLots[321] = 1.0;
   aDate[321] = D'2011.11.30 09:08:23'+time_offset*3600;
   aPrice[321] = 1.32908;

   // ========== 322 ===== 393 ==========
   aPseudoTicket[322] = 160;
   aAction[322] = 0; // CLOSE
   aType[322] = OP_SELL; // SELL
   aTicket[322] = -1; // Ticket given by broker
   aSymbol[322] = "EURUSD";
   aLots[322] = 1.0;
   aDate[322] = D'2011.11.30 09:08:27'+time_offset*3600;
   aPrice[322] = 1.32906;

   // ========== 323 ===== 392 ==========
   aPseudoTicket[323] = 161;
   aAction[323] = 0; // CLOSE
   aType[323] = OP_SELL; // SELL
   aTicket[323] = -1; // Ticket given by broker
   aSymbol[323] = "EURUSD";
   aLots[323] = 1.0;
   aDate[323] = D'2011.11.30 09:08:30'+time_offset*3600;
   aPrice[323] = 1.32915;

   // ========== 324 ===== 389 ==========
   aPseudoTicket[324] = 162;
   aAction[324] = 1; // OPEN
   aReturn[162] = 324;
   aType[324] = OP_BUY; // BUY
   aTicket[324] = -1; // Ticket given by broker
   aSymbol[324] = "EURUSD";
   aLots[324] = 1.0;
   aDate[324] = D'2011.11.30 13:12:16'+time_offset*3600;
   aPrice[324] = 1.34301;

   // ========== 325 ===== 388 ==========
   aPseudoTicket[325] = 163;
   aAction[325] = 1; // OPEN
   aReturn[163] = 325;
   aType[325] = OP_BUY; // BUY
   aTicket[325] = -1; // Ticket given by broker
   aSymbol[325] = "EURUSD";
   aLots[325] = 1.0;
   aDate[325] = D'2011.11.30 13:23:20'+time_offset*3600;
   aPrice[325] = 1.34261;

   // ========== 326 ===== 391 ==========
   aPseudoTicket[326] = 164;
   aAction[326] = 1; // OPEN
   aReturn[164] = 326;
   aType[326] = OP_BUY; // BUY
   aTicket[326] = -1; // Ticket given by broker
   aSymbol[326] = "EURUSD";
   aLots[326] = 1.0;
   aDate[326] = D'2011.11.30 14:03:12'+time_offset*3600;
   aPrice[326] = 1.35103;

   // ========== 327 ===== 391 ==========
   aPseudoTicket[327] = 164;
   aAction[327] = 0; // CLOSE
   aType[327] = OP_BUY; // BUY
   aTicket[327] = -1; // Ticket given by broker
   aSymbol[327] = "EURUSD";
   aLots[327] = 1.0;
   aDate[327] = D'2011.11.30 14:06:48'+time_offset*3600;
   aPrice[327] = 1.35127;

   // ========== 328 ===== 390 ==========
   aPseudoTicket[328] = 165;
   aAction[328] = 1; // OPEN
   aReturn[165] = 328;
   aType[328] = OP_BUY; // BUY
   aTicket[328] = -1; // Ticket given by broker
   aSymbol[328] = "EURUSD";
   aLots[328] = 1.0;
   aDate[328] = D'2011.11.30 14:10:09'+time_offset*3600;
   aPrice[328] = 1.34987;

   // ========== 329 ===== 390 ==========
   aPseudoTicket[329] = 165;
   aAction[329] = 0; // CLOSE
   aType[329] = OP_BUY; // BUY
   aTicket[329] = -1; // Ticket given by broker
   aSymbol[329] = "EURUSD";
   aLots[329] = 1.0;
   aDate[329] = D'2011.11.30 14:16:43'+time_offset*3600;
   aPrice[329] = 1.35062;

   // ========== 330 ===== 383 ==========
   aPseudoTicket[330] = 166;
   aAction[330] = 1; // OPEN
   aReturn[166] = 330;
   aType[330] = OP_BUY; // BUY
   aTicket[330] = -1; // Ticket given by broker
   aSymbol[330] = "EURUSD";
   aLots[330] = 1.0;
   aDate[330] = D'2011.11.30 14:23:38'+time_offset*3600;
   aPrice[330] = 1.34938;

   // ========== 331 ===== 384 ==========
   aPseudoTicket[331] = 167;
   aAction[331] = 1; // OPEN
   aReturn[167] = 331;
   aType[331] = OP_BUY; // BUY
   aTicket[331] = -1; // Ticket given by broker
   aSymbol[331] = "EURUSD";
   aLots[331] = 1.0;
   aDate[331] = D'2011.11.30 14:32:49'+time_offset*3600;
   aPrice[331] = 1.3481;

   // ========== 332 ===== 389 ==========
   aPseudoTicket[332] = 162;
   aAction[332] = 0; // CLOSE
   aType[332] = OP_BUY; // BUY
   aTicket[332] = -1; // Ticket given by broker
   aSymbol[332] = "EURUSD";
   aLots[332] = 1.0;
   aDate[332] = D'2011.12.01 02:39:25'+time_offset*3600;
   aPrice[332] = 1.34357;

   // ========== 333 ===== 388 ==========
   aPseudoTicket[333] = 163;
   aAction[333] = 0; // CLOSE
   aType[333] = OP_BUY; // BUY
   aTicket[333] = -1; // Ticket given by broker
   aSymbol[333] = "EURUSD";
   aLots[333] = 1.0;
   aDate[333] = D'2011.12.01 02:39:33'+time_offset*3600;
   aPrice[333] = 1.34365;

   // ========== 334 ===== 385 ==========
   aPseudoTicket[334] = 168;
   aAction[334] = 1; // OPEN
   aReturn[168] = 334;
   aType[334] = OP_BUY; // BUY
   aTicket[334] = -1; // Ticket given by broker
   aSymbol[334] = "EURUSD";
   aLots[334] = 1.0;
   aDate[334] = D'2011.12.01 09:31:02'+time_offset*3600;
   aPrice[334] = 1.3471;

   // ========== 335 ===== 385 ==========
   aPseudoTicket[335] = 168;
   aAction[335] = 0; // CLOSE
   aType[335] = OP_BUY; // BUY
   aTicket[335] = -1; // Ticket given by broker
   aSymbol[335] = "EURUSD";
   aLots[335] = 1.0;
   aDate[335] = D'2011.12.01 09:38:17'+time_offset*3600;
   aPrice[335] = 1.3471;

   // ========== 336 ===== 384 ==========
   aPseudoTicket[336] = 167;
   aAction[336] = 0; // CLOSE
   aType[336] = OP_BUY; // BUY
   aTicket[336] = -1; // Ticket given by broker
   aSymbol[336] = "EURUSD";
   aLots[336] = 1.0;
   aDate[336] = D'2011.12.01 09:41:38'+time_offset*3600;
   aPrice[336] = 1.34705;

   // ========== 337 ===== 383 ==========
   aPseudoTicket[337] = 166;
   aAction[337] = 0; // CLOSE
   aType[337] = OP_BUY; // BUY
   aTicket[337] = -1; // Ticket given by broker
   aSymbol[337] = "EURUSD";
   aLots[337] = 1.0;
   aDate[337] = D'2011.12.01 09:49:46'+time_offset*3600;
   aPrice[337] = 1.34855;

   // ========== 338 ===== 382 ==========
   aPseudoTicket[338] = 169;
   aAction[338] = 1; // OPEN
   aReturn[169] = 338;
   aType[338] = OP_BUY; // BUY
   aTicket[338] = -1; // Ticket given by broker
   aSymbol[338] = "EURUSD";
   aLots[338] = 1.0;
   aDate[338] = D'2011.12.01 13:18:40'+time_offset*3600;
   aPrice[338] = 1.35094;

   // ========== 339 ===== 382 ==========
   aPseudoTicket[339] = 169;
   aAction[339] = 0; // CLOSE
   aType[339] = OP_BUY; // BUY
   aTicket[339] = -1; // Ticket given by broker
   aSymbol[339] = "EURUSD";
   aLots[339] = 1.0;
   aDate[339] = D'2011.12.01 13:22:30'+time_offset*3600;
   aPrice[339] = 1.35146;

   // ========== 340 ===== 381 ==========
   aPseudoTicket[340] = 170;
   aAction[340] = 1; // OPEN
   aReturn[170] = 340;
   aType[340] = OP_SELL; // SELL
   aTicket[340] = -1; // Ticket given by broker
   aSymbol[340] = "EURUSD";
   aLots[340] = 1.0;
   aDate[340] = D'2011.12.01 15:33:46'+time_offset*3600;
   aPrice[340] = 1.34851;

   // ========== 341 ===== 381 ==========
   aPseudoTicket[341] = 170;
   aAction[341] = 0; // CLOSE
   aType[341] = OP_SELL; // SELL
   aTicket[341] = -1; // Ticket given by broker
   aSymbol[341] = "EURUSD";
   aLots[341] = 1.0;
   aDate[341] = D'2011.12.01 15:35:56'+time_offset*3600;
   aPrice[341] = 1.34745;

   // ========== 342 ===== 380 ==========
   aPseudoTicket[342] = 171;
   aAction[342] = 1; // OPEN
   aReturn[171] = 342;
   aType[342] = OP_SELL; // SELL
   aTicket[342] = -1; // Ticket given by broker
   aSymbol[342] = "EURUSD";
   aLots[342] = 1.0;
   aDate[342] = D'2011.12.01 16:08:07'+time_offset*3600;
   aPrice[342] = 1.34753;

   // ========== 343 ===== 380 ==========
   aPseudoTicket[343] = 171;
   aAction[343] = 0; // CLOSE
   aType[343] = OP_SELL; // SELL
   aTicket[343] = -1; // Ticket given by broker
   aSymbol[343] = "EURUSD";
   aLots[343] = 1.0;
   aDate[343] = D'2011.12.01 16:18:11'+time_offset*3600;
   aPrice[343] = 1.34672;

   // ========== 344 ===== 379 ==========
   aPseudoTicket[344] = 172;
   aAction[344] = 1; // OPEN
   aReturn[172] = 344;
   aType[344] = OP_BUY; // BUY
   aTicket[344] = -1; // Ticket given by broker
   aSymbol[344] = "EURUSD";
   aLots[344] = 1.0;
   aDate[344] = D'2011.12.02 08:00:36'+time_offset*3600;
   aPrice[344] = 1.34842;

   // ========== 345 ===== 379 ==========
   aPseudoTicket[345] = 172;
   aAction[345] = 0; // CLOSE
   aType[345] = OP_BUY; // BUY
   aTicket[345] = -1; // Ticket given by broker
   aSymbol[345] = "EURUSD";
   aLots[345] = 1.0;
   aDate[345] = D'2011.12.02 08:06:07'+time_offset*3600;
   aPrice[345] = 1.34857;

   // ========== 346 ===== 376 ==========
   aPseudoTicket[346] = 173;
   aAction[346] = 1; // OPEN
   aReturn[173] = 346;
   aType[346] = OP_BUY; // BUY
   aTicket[346] = -1; // Ticket given by broker
   aSymbol[346] = "EURUSD";
   aLots[346] = 1.0;
   aDate[346] = D'2011.12.02 09:18:30'+time_offset*3600;
   aPrice[346] = 1.34918;

   // ========== 347 ===== 376 ==========
   aPseudoTicket[347] = 173;
   aAction[347] = 0; // CLOSE
   aType[347] = OP_BUY; // BUY
   aTicket[347] = -1; // Ticket given by broker
   aSymbol[347] = "EURUSD";
   aLots[347] = 1.0;
   aDate[347] = D'2011.12.02 09:35:11'+time_offset*3600;
   aPrice[347] = 1.34793;

   // ========== 348 ===== 368 ==========
   aPseudoTicket[348] = 174;
   aAction[348] = 1; // OPEN
   aReturn[174] = 348;
   aType[348] = OP_BUY; // BUY
   aTicket[348] = -1; // Ticket given by broker
   aSymbol[348] = "EURUSD";
   aLots[348] = 1.0;
   aDate[348] = D'2011.12.02 12:38:55'+time_offset*3600;
   aPrice[348] = 1.35351;

   // ========== 349 ===== 369 ==========
   aPseudoTicket[349] = 175;
   aAction[349] = 1; // OPEN
   aReturn[175] = 349;
   aType[349] = OP_BUY; // BUY
   aTicket[349] = -1; // Ticket given by broker
   aSymbol[349] = "EURUSD";
   aLots[349] = 1.0;
   aDate[349] = D'2011.12.02 12:39:37'+time_offset*3600;
   aPrice[349] = 1.35317;

   // ========== 350 ===== 370 ==========
   aPseudoTicket[350] = 176;
   aAction[350] = 1; // OPEN
   aReturn[176] = 350;
   aType[350] = OP_BUY; // BUY
   aTicket[350] = -1; // Ticket given by broker
   aSymbol[350] = "EURUSD";
   aLots[350] = 1.0;
   aDate[350] = D'2011.12.02 13:19:59'+time_offset*3600;
   aPrice[350] = 1.35219;

   // ========== 351 ===== 371 ==========
   aPseudoTicket[351] = 177;
   aAction[351] = 1; // OPEN
   aReturn[177] = 351;
   aType[351] = OP_BUY; // BUY
   aTicket[351] = -1; // Ticket given by broker
   aSymbol[351] = "EURUSD";
   aLots[351] = 1.0;
   aDate[351] = D'2011.12.02 13:20:23'+time_offset*3600;
   aPrice[351] = 1.35242;

   // ========== 352 ===== 371 ==========
   aPseudoTicket[352] = 177;
   aAction[352] = 0; // CLOSE
   aType[352] = OP_BUY; // BUY
   aTicket[352] = -1; // Ticket given by broker
   aSymbol[352] = "EURUSD";
   aLots[352] = 1.0;
   aDate[352] = D'2011.12.02 13:36:26'+time_offset*3600;
   aPrice[352] = 1.34994;

   // ========== 353 ===== 370 ==========
   aPseudoTicket[353] = 176;
   aAction[353] = 0; // CLOSE
   aType[353] = OP_BUY; // BUY
   aTicket[353] = -1; // Ticket given by broker
   aSymbol[353] = "EURUSD";
   aLots[353] = 1.0;
   aDate[353] = D'2011.12.02 13:36:31'+time_offset*3600;
   aPrice[353] = 1.34991;

   // ========== 354 ===== 369 ==========
   aPseudoTicket[354] = 175;
   aAction[354] = 0; // CLOSE
   aType[354] = OP_BUY; // BUY
   aTicket[354] = -1; // Ticket given by broker
   aSymbol[354] = "EURUSD";
   aLots[354] = 1.0;
   aDate[354] = D'2011.12.02 13:36:43'+time_offset*3600;
   aPrice[354] = 1.34998;

   // ========== 355 ===== 368 ==========
   aPseudoTicket[355] = 174;
   aAction[355] = 0; // CLOSE
   aType[355] = OP_BUY; // BUY
   aTicket[355] = -1; // Ticket given by broker
   aSymbol[355] = "EURUSD";
   aLots[355] = 1.0;
   aDate[355] = D'2011.12.02 13:36:47'+time_offset*3600;
   aPrice[355] = 1.34997;

   // ========== 356 ===== 362 ==========
   aPseudoTicket[356] = 178;
   aAction[356] = 1; // OPEN
   aReturn[178] = 356;
   aType[356] = OP_SELL; // SELL
   aTicket[356] = -1; // Ticket given by broker
   aSymbol[356] = "EURUSD";
   aLots[356] = 1.0;
   aDate[356] = D'2011.12.06 07:14:26'+time_offset*3600;
   aPrice[356] = 1.3354;

   // ========== 357 ===== 363 ==========
   aPseudoTicket[357] = 179;
   aAction[357] = 1; // OPEN
   aReturn[179] = 357;
   aType[357] = OP_SELL; // SELL
   aTicket[357] = -1; // Ticket given by broker
   aSymbol[357] = "EURUSD";
   aLots[357] = 1.0;
   aDate[357] = D'2011.12.06 07:15:03'+time_offset*3600;
   aPrice[357] = 1.33581;

   // ========== 358 ===== 363 ==========
   aPseudoTicket[358] = 179;
   aAction[358] = 0; // CLOSE
   aType[358] = OP_SELL; // SELL
   aTicket[358] = -1; // Ticket given by broker
   aSymbol[358] = "EURUSD";
   aLots[358] = 1.0;
   aDate[358] = D'2011.12.06 07:24:29'+time_offset*3600;
   aPrice[358] = 1.33534;

   // ========== 359 ===== 362 ==========
   aPseudoTicket[359] = 178;
   aAction[359] = 0; // CLOSE
   aType[359] = OP_SELL; // SELL
   aTicket[359] = -1; // Ticket given by broker
   aSymbol[359] = "EURUSD";
   aLots[359] = 1.0;
   aDate[359] = D'2011.12.06 07:24:34'+time_offset*3600;
   aPrice[359] = 1.33527;

   // ========== 360 ===== 360 ==========
   aPseudoTicket[360] = 180;
   aAction[360] = 1; // OPEN
   aReturn[180] = 360;
   aType[360] = OP_SELL; // SELL
   aTicket[360] = -1; // Ticket given by broker
   aSymbol[360] = "EURUSD";
   aLots[360] = 1.0;
   aDate[360] = D'2011.12.06 07:34:11'+time_offset*3600;
   aPrice[360] = 1.3342;

   // ========== 361 ===== 361 ==========
   aPseudoTicket[361] = 181;
   aAction[361] = 1; // OPEN
   aReturn[181] = 361;
   aType[361] = OP_SELL; // SELL
   aTicket[361] = -1; // Ticket given by broker
   aSymbol[361] = "EURUSD";
   aLots[361] = 1.0;
   aDate[361] = D'2011.12.06 07:40:41'+time_offset*3600;
   aPrice[361] = 1.33471;

   // ========== 362 ===== 361 ==========
   aPseudoTicket[362] = 181;
   aAction[362] = 0; // CLOSE
   aType[362] = OP_SELL; // SELL
   aTicket[362] = -1; // Ticket given by broker
   aSymbol[362] = "EURUSD";
   aLots[362] = 1.0;
   aDate[362] = D'2011.12.06 08:09:53'+time_offset*3600;
   aPrice[362] = 1.33426;

   // ========== 363 ===== 360 ==========
   aPseudoTicket[363] = 180;
   aAction[363] = 0; // CLOSE
   aType[363] = OP_SELL; // SELL
   aTicket[363] = -1; // Ticket given by broker
   aSymbol[363] = "EURUSD";
   aLots[363] = 1.0;
   aDate[363] = D'2011.12.06 08:19:40'+time_offset*3600;
   aPrice[363] = 1.33549;

   // ========== 364 ===== 350 ==========
   aPseudoTicket[364] = 182;
   aAction[364] = 1; // OPEN
   aReturn[182] = 364;
   aType[364] = OP_BUY; // BUY
   aTicket[364] = -1; // Ticket given by broker
   aSymbol[364] = "EURUSD";
   aLots[364] = 1.0;
   aDate[364] = D'2011.12.08 12:59:21'+time_offset*3600;
   aPrice[364] = 1.34195;

   // ========== 365 ===== 350 ==========
   aPseudoTicket[365] = 182;
   aAction[365] = 0; // CLOSE
   aType[365] = OP_BUY; // BUY
   aTicket[365] = -1; // Ticket given by broker
   aSymbol[365] = "EURUSD";
   aLots[365] = 1.0;
   aDate[365] = D'2011.12.08 13:58:08'+time_offset*3600;
   aPrice[365] = 1.338;

   // ========== 366 ===== 336 ==========
   aPseudoTicket[366] = 183;
   aAction[366] = 1; // OPEN
   aReturn[183] = 366;
   aType[366] = OP_BUY; // BUY
   aTicket[366] = -1; // Ticket given by broker
   aSymbol[366] = "EURUSD";
   aLots[366] = 1.0;
   aDate[366] = D'2011.12.14 12:15:11'+time_offset*3600;
   aPrice[366] = 1.30042;

   // ========== 367 ===== 336 ==========
   aPseudoTicket[367] = 183;
   aAction[367] = 0; // CLOSE
   aType[367] = OP_BUY; // BUY
   aTicket[367] = -1; // Ticket given by broker
   aSymbol[367] = "EURUSD";
   aLots[367] = 1.0;
   aDate[367] = D'2011.12.15 06:48:12'+time_offset*3600;
   aPrice[367] = 1.29885;

   // ========== 368 ===== 320 ==========
   aPseudoTicket[368] = 184;
   aAction[368] = 1; // OPEN
   aReturn[184] = 368;
   aType[368] = OP_SELL; // SELL
   aTicket[368] = -1; // Ticket given by broker
   aSymbol[368] = "EURUSD";
   aLots[368] = 1.0;
   aDate[368] = D'2011.12.23 13:15:33'+time_offset*3600;
   aPrice[368] = 1.30568;

   // ========== 369 ===== 320 ==========
   aPseudoTicket[369] = 184;
   aAction[369] = 0; // CLOSE
   aType[369] = OP_SELL; // SELL
   aTicket[369] = -1; // Ticket given by broker
   aSymbol[369] = "EURUSD";
   aLots[369] = 1.0;
   aDate[369] = D'2011.12.23 14:11:34'+time_offset*3600;
   aPrice[369] = 1.30483;

   // ========== 370 ===== 316 ==========
   aPseudoTicket[370] = 185;
   aAction[370] = 1; // OPEN
   aReturn[185] = 370;
   aType[370] = OP_SELL; // SELL
   aTicket[370] = -1; // Ticket given by broker
   aSymbol[370] = "EURUSD";
   aLots[370] = 1.0;
   aDate[370] = D'2011.12.29 17:03:13'+time_offset*3600;
   aPrice[370] = 1.2955;

   // ========== 371 ===== 317 ==========
   aPseudoTicket[371] = 186;
   aAction[371] = 1; // OPEN
   aReturn[186] = 371;
   aType[371] = OP_SELL; // SELL
   aTicket[371] = -1; // Ticket given by broker
   aSymbol[371] = "EURUSD";
   aLots[371] = 1.0;
   aDate[371] = D'2011.12.29 17:03:43'+time_offset*3600;
   aPrice[371] = 1.29541;

   // ========== 372 ===== 318 ==========
   aPseudoTicket[372] = 187;
   aAction[372] = 1; // OPEN
   aReturn[187] = 372;
   aType[372] = OP_SELL; // SELL
   aTicket[372] = -1; // Ticket given by broker
   aSymbol[372] = "EURUSD";
   aLots[372] = 1.0;
   aDate[372] = D'2011.12.29 21:16:01'+time_offset*3600;
   aPrice[372] = 1.29602;

   // ========== 373 ===== 319 ==========
   aPseudoTicket[373] = 188;
   aAction[373] = 1; // OPEN
   aReturn[188] = 373;
   aType[373] = OP_SELL; // SELL
   aTicket[373] = -1; // Ticket given by broker
   aSymbol[373] = "EURUSD";
   aLots[373] = 1.0;
   aDate[373] = D'2011.12.29 22:10:50'+time_offset*3600;
   aPrice[373] = 1.2959;

   // ========== 374 ===== 319 ==========
   aPseudoTicket[374] = 188;
   aAction[374] = 0; // CLOSE
   aType[374] = OP_SELL; // SELL
   aTicket[374] = -1; // Ticket given by broker
   aSymbol[374] = "EURUSD";
   aLots[374] = 1.0;
   aDate[374] = D'2011.12.29 23:15:17'+time_offset*3600;
   aPrice[374] = 1.29543;

   // ========== 375 ===== 318 ==========
   aPseudoTicket[375] = 187;
   aAction[375] = 0; // CLOSE
   aType[375] = OP_SELL; // SELL
   aTicket[375] = -1; // Ticket given by broker
   aSymbol[375] = "EURUSD";
   aLots[375] = 1.0;
   aDate[375] = D'2011.12.29 23:15:20'+time_offset*3600;
   aPrice[375] = 1.29543;

   // ========== 376 ===== 314 ==========
   aPseudoTicket[376] = 189;
   aAction[376] = 1; // OPEN
   aReturn[189] = 376;
   aType[376] = OP_SELL; // SELL
   aTicket[376] = -1; // Ticket given by broker
   aSymbol[376] = "EURUSD";
   aLots[376] = 1.0;
   aDate[376] = D'2011.12.30 00:05:32'+time_offset*3600;
   aPrice[376] = 1.29517;

   // ========== 377 ===== 315 ==========
   aPseudoTicket[377] = 190;
   aAction[377] = 1; // OPEN
   aReturn[190] = 377;
   aType[377] = OP_SELL; // SELL
   aTicket[377] = -1; // Ticket given by broker
   aSymbol[377] = "EURUSD";
   aLots[377] = 1.0;
   aDate[377] = D'2011.12.30 00:50:58'+time_offset*3600;
   aPrice[377] = 1.29537;

   // ========== 378 ===== 316 ==========
   aPseudoTicket[378] = 185;
   aAction[378] = 0; // CLOSE
   aType[378] = OP_SELL; // SELL
   aTicket[378] = -1; // Ticket given by broker
   aSymbol[378] = "EURUSD";
   aLots[378] = 1.0;
   aDate[378] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPrice[378] = 1.2905;

   // ========== 379 ===== 317 ==========
   aPseudoTicket[379] = 186;
   aAction[379] = 0; // CLOSE
   aType[379] = OP_SELL; // SELL
   aTicket[379] = -1; // Ticket given by broker
   aSymbol[379] = "EURUSD";
   aLots[379] = 1.0;
   aDate[379] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPrice[379] = 1.2905;

   // ========== 380 ===== 315 ==========
   aPseudoTicket[380] = 190;
   aAction[380] = 0; // CLOSE
   aType[380] = OP_SELL; // SELL
   aTicket[380] = -1; // Ticket given by broker
   aSymbol[380] = "EURUSD";
   aLots[380] = 1.0;
   aDate[380] = D'2011.12.30 11:44:43'+time_offset*3600;
   aPrice[380] = 1.2927;

   // ========== 381 ===== 314 ==========
   aPseudoTicket[381] = 189;
   aAction[381] = 0; // CLOSE
   aType[381] = OP_SELL; // SELL
   aTicket[381] = -1; // Ticket given by broker
   aSymbol[381] = "EURUSD";
   aLots[381] = 1.0;
   aDate[381] = D'2011.12.30 11:50:41'+time_offset*3600;
   aPrice[381] = 1.2933;

   // ========== 382 ===== 297 ==========
   aPseudoTicket[382] = 191;
   aAction[382] = 1; // OPEN
   aReturn[191] = 382;
   aType[382] = OP_BUY; // BUY
   aTicket[382] = -1; // Ticket given by broker
   aSymbol[382] = "EURUSD";
   aLots[382] = 1.0;
   aDate[382] = D'2012.01.04 08:09:40'+time_offset*3600;
   aPrice[382] = 1.30631;

   // ========== 383 ===== 298 ==========
   aPseudoTicket[383] = 192;
   aAction[383] = 1; // OPEN
   aReturn[192] = 383;
   aType[383] = OP_BUY; // BUY
   aTicket[383] = -1; // Ticket given by broker
   aSymbol[383] = "EURUSD";
   aLots[383] = 1.0;
   aDate[383] = D'2012.01.04 08:12:40'+time_offset*3600;
   aPrice[383] = 1.3064;

   // ========== 384 ===== 299 ==========
   aPseudoTicket[384] = 193;
   aAction[384] = 1; // OPEN
   aReturn[193] = 384;
   aType[384] = OP_BUY; // BUY
   aTicket[384] = -1; // Ticket given by broker
   aSymbol[384] = "EURUSD";
   aLots[384] = 1.0;
   aDate[384] = D'2012.01.04 08:25:34'+time_offset*3600;
   aPrice[384] = 1.30623;

   // ========== 385 ===== 300 ==========
   aPseudoTicket[385] = 194;
   aAction[385] = 1; // OPEN
   aReturn[194] = 385;
   aType[385] = OP_BUY; // BUY
   aTicket[385] = -1; // Ticket given by broker
   aSymbol[385] = "EURUSD";
   aLots[385] = 1.0;
   aDate[385] = D'2012.01.04 08:26:52'+time_offset*3600;
   aPrice[385] = 1.30614;

   // ========== 386 ===== 300 ==========
   aPseudoTicket[386] = 194;
   aAction[386] = 0; // CLOSE
   aType[386] = OP_BUY; // BUY
   aTicket[386] = -1; // Ticket given by broker
   aSymbol[386] = "EURUSD";
   aLots[386] = 1.0;
   aDate[386] = D'2012.01.04 08:55:49'+time_offset*3600;
   aPrice[386] = 1.30353;

   // ========== 387 ===== 299 ==========
   aPseudoTicket[387] = 193;
   aAction[387] = 0; // CLOSE
   aType[387] = OP_BUY; // BUY
   aTicket[387] = -1; // Ticket given by broker
   aSymbol[387] = "EURUSD";
   aLots[387] = 1.0;
   aDate[387] = D'2012.01.04 08:55:52'+time_offset*3600;
   aPrice[387] = 1.30351;

   // ========== 388 ===== 298 ==========
   aPseudoTicket[388] = 192;
   aAction[388] = 0; // CLOSE
   aType[388] = OP_BUY; // BUY
   aTicket[388] = -1; // Ticket given by broker
   aSymbol[388] = "EURUSD";
   aLots[388] = 1.0;
   aDate[388] = D'2012.01.04 08:55:56'+time_offset*3600;
   aPrice[388] = 1.30352;

   // ========== 389 ===== 297 ==========
   aPseudoTicket[389] = 191;
   aAction[389] = 0; // CLOSE
   aType[389] = OP_BUY; // BUY
   aTicket[389] = -1; // Ticket given by broker
   aSymbol[389] = "EURUSD";
   aLots[389] = 1.0;
   aDate[389] = D'2012.01.04 08:55:59'+time_offset*3600;
   aPrice[389] = 1.30357;

   // ========== 390 ===== 288 ==========
   aPseudoTicket[390] = 195;
   aAction[390] = 1; // OPEN
   aReturn[195] = 390;
   aType[390] = OP_SELL; // SELL
   aTicket[390] = -1; // Ticket given by broker
   aSymbol[390] = "EURUSD";
   aLots[390] = 1.0;
   aDate[390] = D'2012.01.09 08:35:37'+time_offset*3600;
   aPrice[390] = 1.2764;

   // ========== 391 ===== 289 ==========
   aPseudoTicket[391] = 196;
   aAction[391] = 1; // OPEN
   aReturn[196] = 391;
   aType[391] = OP_SELL; // SELL
   aTicket[391] = -1; // Ticket given by broker
   aSymbol[391] = "EURUSD";
   aLots[391] = 1.0;
   aDate[391] = D'2012.01.09 08:36:19'+time_offset*3600;
   aPrice[391] = 1.2767;

   // ========== 392 ===== 290 ==========
   aPseudoTicket[392] = 197;
   aAction[392] = 1; // OPEN
   aReturn[197] = 392;
   aType[392] = OP_SELL; // SELL
   aTicket[392] = -1; // Ticket given by broker
   aSymbol[392] = "EURUSD";
   aLots[392] = 1.0;
   aDate[392] = D'2012.01.09 08:37:06'+time_offset*3600;
   aPrice[392] = 1.2769;

   // ========== 393 ===== 291 ==========
   aPseudoTicket[393] = 198;
   aAction[393] = 1; // OPEN
   aReturn[198] = 393;
   aType[393] = OP_SELL; // SELL
   aTicket[393] = -1; // Ticket given by broker
   aSymbol[393] = "EURUSD";
   aLots[393] = 1.0;
   aDate[393] = D'2012.01.09 08:37:56'+time_offset*3600;
   aPrice[393] = 1.27655;

   // ========== 394 ===== 291 ==========
   aPseudoTicket[394] = 198;
   aAction[394] = 0; // CLOSE
   aType[394] = OP_SELL; // SELL
   aTicket[394] = -1; // Ticket given by broker
   aSymbol[394] = "EURUSD";
   aLots[394] = 1.0;
   aDate[394] = D'2012.01.11 04:57:44'+time_offset*3600;
   aPrice[394] = 1.27445;

   // ========== 395 ===== 290 ==========
   aPseudoTicket[395] = 197;
   aAction[395] = 0; // CLOSE
   aType[395] = OP_SELL; // SELL
   aTicket[395] = -1; // Ticket given by broker
   aSymbol[395] = "EURUSD";
   aLots[395] = 1.0;
   aDate[395] = D'2012.01.11 04:57:48'+time_offset*3600;
   aPrice[395] = 1.27442;

   // ========== 396 ===== 289 ==========
   aPseudoTicket[396] = 196;
   aAction[396] = 0; // CLOSE
   aType[396] = OP_SELL; // SELL
   aTicket[396] = -1; // Ticket given by broker
   aSymbol[396] = "EURUSD";
   aLots[396] = 1.0;
   aDate[396] = D'2012.01.11 10:31:57'+time_offset*3600;
   aPrice[396] = 1.27544;

   // ========== 397 ===== 288 ==========
   aPseudoTicket[397] = 195;
   aAction[397] = 0; // CLOSE
   aType[397] = OP_SELL; // SELL
   aTicket[397] = -1; // Ticket given by broker
   aSymbol[397] = "EURUSD";
   aLots[397] = 1.0;
   aDate[397] = D'2012.01.11 10:32:41'+time_offset*3600;
   aPrice[397] = 1.27542;

   // ========== 398 ===== 283 ==========
   aPseudoTicket[398] = 199;
   aAction[398] = 1; // OPEN
   aReturn[199] = 398;
   aType[398] = OP_SELL; // SELL
   aTicket[398] = -1; // Ticket given by broker
   aSymbol[398] = "EURUSD";
   aLots[398] = 1.0;
   aDate[398] = D'2012.01.13 08:21:43'+time_offset*3600;
   aPrice[398] = 1.28644;

   // ========== 399 ===== 283 ==========
   aPseudoTicket[399] = 199;
   aAction[399] = 0; // CLOSE
   aType[399] = OP_SELL; // SELL
   aTicket[399] = -1; // Ticket given by broker
   aSymbol[399] = "EURUSD";
   aLots[399] = 1.0;
   aDate[399] = D'2012.01.13 09:24:49'+time_offset*3600;
   aPrice[399] = 1.28388;

   // ========== 400 ===== 279 ==========
   aPseudoTicket[400] = 200;
   aAction[400] = 1; // OPEN
   aReturn[200] = 400;
   aType[400] = OP_BUY; // BUY
   aTicket[400] = -1; // Ticket given by broker
   aSymbol[400] = "EURUSD";
   aLots[400] = 1.0;
   aDate[400] = D'2012.01.13 14:09:03'+time_offset*3600;
   aPrice[400] = 1.27199;

   // ========== 401 ===== 281 ==========
   aPseudoTicket[401] = 201;
   aAction[401] = 1; // OPEN
   aReturn[201] = 401;
   aType[401] = OP_BUY; // BUY
   aTicket[401] = -1; // Ticket given by broker
   aSymbol[401] = "EURUSD";
   aLots[401] = 1.0;
   aDate[401] = D'2012.01.13 14:10:42'+time_offset*3600;
   aPrice[401] = 1.27127;

   // ========== 402 ===== 282 ==========
   aPseudoTicket[402] = 202;
   aAction[402] = 1; // OPEN
   aReturn[202] = 402;
   aType[402] = OP_BUY; // BUY
   aTicket[402] = -1; // Ticket given by broker
   aSymbol[402] = "EURUSD";
   aLots[402] = 1.0;
   aDate[402] = D'2012.01.13 14:11:50'+time_offset*3600;
   aPrice[402] = 1.27047;

   // ========== 403 ===== 280 ==========
   aPseudoTicket[403] = 203;
   aAction[403] = 1; // OPEN
   aReturn[203] = 403;
   aType[403] = OP_BUY; // BUY
   aTicket[403] = -1; // Ticket given by broker
   aSymbol[403] = "EURUSD";
   aLots[403] = 1.0;
   aDate[403] = D'2012.01.13 14:51:43'+time_offset*3600;
   aPrice[403] = 1.2683;

   // ========== 404 ===== 282 ==========
   aPseudoTicket[404] = 202;
   aAction[404] = 0; // CLOSE
   aType[404] = OP_BUY; // BUY
   aTicket[404] = -1; // Ticket given by broker
   aSymbol[404] = "EURUSD";
   aLots[404] = 1.0;
   aDate[404] = D'2012.01.13 20:35:04'+time_offset*3600;
   aPrice[404] = 1.26769;

   // ========== 405 ===== 281 ==========
   aPseudoTicket[405] = 201;
   aAction[405] = 0; // CLOSE
   aType[405] = OP_BUY; // BUY
   aTicket[405] = -1; // Ticket given by broker
   aSymbol[405] = "EURUSD";
   aLots[405] = 1.0;
   aDate[405] = D'2012.01.13 20:35:10'+time_offset*3600;
   aPrice[405] = 1.26769;

   // ========== 406 ===== 280 ==========
   aPseudoTicket[406] = 203;
   aAction[406] = 0; // CLOSE
   aType[406] = OP_BUY; // BUY
   aTicket[406] = -1; // Ticket given by broker
   aSymbol[406] = "EURUSD";
   aLots[406] = 1.0;
   aDate[406] = D'2012.01.13 20:36:12'+time_offset*3600;
   aPrice[406] = 1.26769;

   // ========== 407 ===== 279 ==========
   aPseudoTicket[407] = 200;
   aAction[407] = 0; // CLOSE
   aType[407] = OP_BUY; // BUY
   aTicket[407] = -1; // Ticket given by broker
   aSymbol[407] = "EURUSD";
   aLots[407] = 1.0;
   aDate[407] = D'2012.01.13 20:36:21'+time_offset*3600;
   aPrice[407] = 1.26764;

   // ========== 408 ===== 278 ==========
   aPseudoTicket[408] = 204;
   aAction[408] = 1; // OPEN
   aReturn[204] = 408;
   aType[408] = OP_SELL; // SELL
   aTicket[408] = -1; // Ticket given by broker
   aSymbol[408] = "EURUSD";
   aLots[408] = 1.0;
   aDate[408] = D'2012.01.17 02:49:50'+time_offset*3600;
   aPrice[408] = 1.2725;

   // ========== 409 ===== 277 ==========
   aPseudoTicket[409] = 205;
   aAction[409] = 1; // OPEN
   aReturn[205] = 409;
   aType[409] = OP_SELL; // SELL
   aTicket[409] = -1; // Ticket given by broker
   aSymbol[409] = "EURUSD";
   aLots[409] = 1.0;
   aDate[409] = D'2012.01.17 02:52:42'+time_offset*3600;
   aPrice[409] = 1.27297;

   // ========== 410 ===== 275 ==========
   aPseudoTicket[410] = 206;
   aAction[410] = 1; // OPEN
   aReturn[206] = 410;
   aType[410] = OP_SELL; // SELL
   aTicket[410] = -1; // Ticket given by broker
   aSymbol[410] = "EURUSD";
   aLots[410] = 1.0;
   aDate[410] = D'2012.01.17 03:05:47'+time_offset*3600;
   aPrice[410] = 1.27285;

   // ========== 411 ===== 276 ==========
   aPseudoTicket[411] = 207;
   aAction[411] = 1; // OPEN
   aReturn[207] = 411;
   aType[411] = OP_SELL; // SELL
   aTicket[411] = -1; // Ticket given by broker
   aSymbol[411] = "EURUSD";
   aLots[411] = 1.0;
   aDate[411] = D'2012.01.17 03:10:56'+time_offset*3600;
   aPrice[411] = 1.27314;

   // ========== 412 ===== 278 ==========
   aPseudoTicket[412] = 204;
   aAction[412] = 0; // CLOSE
   aType[412] = OP_SELL; // SELL
   aTicket[412] = -1; // Ticket given by broker
   aSymbol[412] = "EURUSD";
   aLots[412] = 1.0;
   aDate[412] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPrice[412] = 1.272;

   // ========== 413 ===== 277 ==========
   aPseudoTicket[413] = 205;
   aAction[413] = 0; // CLOSE
   aType[413] = OP_SELL; // SELL
   aTicket[413] = -1; // Ticket given by broker
   aSymbol[413] = "EURUSD";
   aLots[413] = 1.0;
   aDate[413] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPrice[413] = 1.272;

   // ========== 414 ===== 276 ==========
   aPseudoTicket[414] = 207;
   aAction[414] = 0; // CLOSE
   aType[414] = OP_SELL; // SELL
   aTicket[414] = -1; // Ticket given by broker
   aSymbol[414] = "EURUSD";
   aLots[414] = 1.0;
   aDate[414] = D'2012.01.17 14:41:49'+time_offset*3600;
   aPrice[414] = 1.27189;

   // ========== 415 ===== 275 ==========
   aPseudoTicket[415] = 206;
   aAction[415] = 0; // CLOSE
   aType[415] = OP_SELL; // SELL
   aTicket[415] = -1; // Ticket given by broker
   aSymbol[415] = "EURUSD";
   aLots[415] = 1.0;
   aDate[415] = D'2012.01.17 14:41:53'+time_offset*3600;
   aPrice[415] = 1.27187;

   // ========== 416 ===== 271 ==========
   aPseudoTicket[416] = 208;
   aAction[416] = 1; // OPEN
   aReturn[208] = 416;
   aType[416] = OP_SELL; // SELL
   aTicket[416] = -1; // Ticket given by broker
   aSymbol[416] = "EURUSD";
   aLots[416] = 1.0;
   aDate[416] = D'2012.01.18 22:53:44'+time_offset*3600;
   aPrice[416] = 1.2852;

   // ========== 417 ===== 272 ==========
   aPseudoTicket[417] = 209;
   aAction[417] = 1; // OPEN
   aReturn[209] = 417;
   aType[417] = OP_SELL; // SELL
   aTicket[417] = -1; // Ticket given by broker
   aSymbol[417] = "EURUSD";
   aLots[417] = 1.0;
   aDate[417] = D'2012.01.19 03:29:19'+time_offset*3600;
   aPrice[417] = 1.28729;

   // ========== 418 ===== 273 ==========
   aPseudoTicket[418] = 210;
   aAction[418] = 1; // OPEN
   aReturn[210] = 418;
   aType[418] = OP_SELL; // SELL
   aTicket[418] = -1; // Ticket given by broker
   aSymbol[418] = "EURUSD";
   aLots[418] = 1.0;
   aDate[418] = D'2012.01.19 12:38:47'+time_offset*3600;
   aPrice[418] = 1.29076;

   // ========== 419 ===== 274 ==========
   aPseudoTicket[419] = 211;
   aAction[419] = 1; // OPEN
   aReturn[211] = 419;
   aType[419] = OP_SELL; // SELL
   aTicket[419] = -1; // Ticket given by broker
   aSymbol[419] = "EURUSD";
   aLots[419] = 1.0;
   aDate[419] = D'2012.01.19 12:53:16'+time_offset*3600;
   aPrice[419] = 1.2925;

   // ========== 420 ===== 274 ==========
   aPseudoTicket[420] = 211;
   aAction[420] = 0; // CLOSE
   aType[420] = OP_SELL; // SELL
   aTicket[420] = -1; // Ticket given by broker
   aSymbol[420] = "EURUSD";
   aLots[420] = 1.0;
   aDate[420] = D'2012.01.20 14:12:35'+time_offset*3600;
   aPrice[420] = 1.29178;

   // ========== 421 ===== 273 ==========
   aPseudoTicket[421] = 210;
   aAction[421] = 0; // CLOSE
   aType[421] = OP_SELL; // SELL
   aTicket[421] = -1; // Ticket given by broker
   aSymbol[421] = "EURUSD";
   aLots[421] = 1.0;
   aDate[421] = D'2012.01.20 14:12:39'+time_offset*3600;
   aPrice[421] = 1.29181;

   // ========== 422 ===== 272 ==========
   aPseudoTicket[422] = 209;
   aAction[422] = 0; // CLOSE
   aType[422] = OP_SELL; // SELL
   aTicket[422] = -1; // Ticket given by broker
   aSymbol[422] = "EURUSD";
   aLots[422] = 1.0;
   aDate[422] = D'2012.01.20 14:15:58'+time_offset*3600;
   aPrice[422] = 1.29239;

   // ========== 423 ===== 271 ==========
   aPseudoTicket[423] = 208;
   aAction[423] = 0; // CLOSE
   aType[423] = OP_SELL; // SELL
   aTicket[423] = -1; // Ticket given by broker
   aSymbol[423] = "EURUSD";
   aLots[423] = 1.0;
   aDate[423] = D'2012.01.20 14:16:02'+time_offset*3600;
   aPrice[423] = 1.2924;

   // ========== 424 ===== 267 ==========
   aPseudoTicket[424] = 212;
   aAction[424] = 1; // OPEN
   aReturn[212] = 424;
   aType[424] = OP_SELL; // SELL
   aTicket[424] = -1; // Ticket given by broker
   aSymbol[424] = "EURUSD";
   aLots[424] = 1.0;
   aDate[424] = D'2012.01.23 10:56:31'+time_offset*3600;
   aPrice[424] = 1.29703;

   // ========== 425 ===== 268 ==========
   aPseudoTicket[425] = 213;
   aAction[425] = 1; // OPEN
   aReturn[213] = 425;
   aType[425] = OP_SELL; // SELL
   aTicket[425] = -1; // Ticket given by broker
   aSymbol[425] = "EURUSD";
   aLots[425] = 1.0;
   aDate[425] = D'2012.01.23 10:58:12'+time_offset*3600;
   aPrice[425] = 1.29716;

   // ========== 426 ===== 269 ==========
   aPseudoTicket[426] = 214;
   aAction[426] = 1; // OPEN
   aReturn[214] = 426;
   aType[426] = OP_SELL; // SELL
   aTicket[426] = -1; // Ticket given by broker
   aSymbol[426] = "EURUSD";
   aLots[426] = 1.0;
   aDate[426] = D'2012.01.23 10:59:32'+time_offset*3600;
   aPrice[426] = 1.29754;

   // ========== 427 ===== 270 ==========
   aPseudoTicket[427] = 215;
   aAction[427] = 1; // OPEN
   aReturn[215] = 427;
   aType[427] = OP_SELL; // SELL
   aTicket[427] = -1; // Ticket given by broker
   aSymbol[427] = "EURUSD";
   aLots[427] = 1.0;
   aDate[427] = D'2012.01.23 11:00:35'+time_offset*3600;
   aPrice[427] = 1.2977;

   // ========== 428 ===== 270 ==========
   aPseudoTicket[428] = 215;
   aAction[428] = 0; // CLOSE
   aType[428] = OP_SELL; // SELL
   aTicket[428] = -1; // Ticket given by broker
   aSymbol[428] = "EURUSD";
   aLots[428] = 1.0;
   aDate[428] = D'2012.01.24 09:09:20'+time_offset*3600;
   aPrice[428] = 1.30472;

   // ========== 429 ===== 269 ==========
   aPseudoTicket[429] = 214;
   aAction[429] = 0; // CLOSE
   aType[429] = OP_SELL; // SELL
   aTicket[429] = -1; // Ticket given by broker
   aSymbol[429] = "EURUSD";
   aLots[429] = 1.0;
   aDate[429] = D'2012.01.24 09:09:24'+time_offset*3600;
   aPrice[429] = 1.30468;

   // ========== 430 ===== 268 ==========
   aPseudoTicket[430] = 213;
   aAction[430] = 0; // CLOSE
   aType[430] = OP_SELL; // SELL
   aTicket[430] = -1; // Ticket given by broker
   aSymbol[430] = "EURUSD";
   aLots[430] = 1.0;
   aDate[430] = D'2012.01.24 09:09:35'+time_offset*3600;
   aPrice[430] = 1.30428;

   // ========== 431 ===== 267 ==========
   aPseudoTicket[431] = 212;
   aAction[431] = 0; // CLOSE
   aType[431] = OP_SELL; // SELL
   aTicket[431] = -1; // Ticket given by broker
   aSymbol[431] = "EURUSD";
   aLots[431] = 1.0;
   aDate[431] = D'2012.01.24 09:09:38'+time_offset*3600;
   aPrice[431] = 1.30424;

   // ========== 432 ===== 255 ==========
   aPseudoTicket[432] = 216;
   aAction[432] = 1; // OPEN
   aReturn[216] = 432;
   aType[432] = OP_BUY; // BUY
   aTicket[432] = -1; // Ticket given by broker
   aSymbol[432] = "EURUSD";
   aLots[432] = 1.0;
   aDate[432] = D'2012.01.27 00:16:31'+time_offset*3600;
   aPrice[432] = 1.30887;

   // ========== 433 ===== 257 ==========
   aPseudoTicket[433] = 217;
   aAction[433] = 1; // OPEN
   aReturn[217] = 433;
   aType[433] = OP_BUY; // BUY
   aTicket[433] = -1; // Ticket given by broker
   aSymbol[433] = "EURUSD";
   aLots[433] = 1.0;
   aDate[433] = D'2012.01.27 00:25:37'+time_offset*3600;
   aPrice[433] = 1.30859;

   // ========== 434 ===== 256 ==========
   aPseudoTicket[434] = 218;
   aAction[434] = 1; // OPEN
   aReturn[218] = 434;
   aType[434] = OP_BUY; // BUY
   aTicket[434] = -1; // Ticket given by broker
   aSymbol[434] = "EURUSD";
   aLots[434] = 1.0;
   aDate[434] = D'2012.01.27 00:26:14'+time_offset*3600;
   aPrice[434] = 1.3083;

   // ========== 435 ===== 258 ==========
   aPseudoTicket[435] = 219;
   aAction[435] = 1; // OPEN
   aReturn[219] = 435;
   aType[435] = OP_BUY; // BUY
   aTicket[435] = -1; // Ticket given by broker
   aSymbol[435] = "EURUSD";
   aLots[435] = 1.0;
   aDate[435] = D'2012.01.27 00:27:36'+time_offset*3600;
   aPrice[435] = 1.30836;

   // ========== 436 ===== 258 ==========
   aPseudoTicket[436] = 219;
   aAction[436] = 0; // CLOSE
   aType[436] = OP_BUY; // BUY
   aTicket[436] = -1; // Ticket given by broker
   aSymbol[436] = "EURUSD";
   aLots[436] = 1.0;
   aDate[436] = D'2012.01.27 07:01:01'+time_offset*3600;
   aPrice[436] = 1.3109;

   // ========== 437 ===== 257 ==========
   aPseudoTicket[437] = 217;
   aAction[437] = 0; // CLOSE
   aType[437] = OP_BUY; // BUY
   aTicket[437] = -1; // Ticket given by broker
   aSymbol[437] = "EURUSD";
   aLots[437] = 1.0;
   aDate[437] = D'2012.01.27 07:01:49'+time_offset*3600;
   aPrice[437] = 1.31081;

   // ========== 438 ===== 256 ==========
   aPseudoTicket[438] = 218;
   aAction[438] = 0; // CLOSE
   aType[438] = OP_BUY; // BUY
   aTicket[438] = -1; // Ticket given by broker
   aSymbol[438] = "EURUSD";
   aLots[438] = 1.0;
   aDate[438] = D'2012.01.27 09:57:03'+time_offset*3600;
   aPrice[438] = 1.31266;

   // ========== 439 ===== 255 ==========
   aPseudoTicket[439] = 216;
   aAction[439] = 0; // CLOSE
   aType[439] = OP_BUY; // BUY
   aTicket[439] = -1; // Ticket given by broker
   aSymbol[439] = "EURUSD";
   aLots[439] = 1.0;
   aDate[439] = D'2012.01.27 10:05:37'+time_offset*3600;
   aPrice[439] = 1.314;

   // ========== 440 ===== 251 ==========
   aPseudoTicket[440] = 220;
   aAction[440] = 1; // OPEN
   aReturn[220] = 440;
   aType[440] = OP_SELL; // SELL
   aTicket[440] = -1; // Ticket given by broker
   aSymbol[440] = "EURUSD";
   aLots[440] = 1.0;
   aDate[440] = D'2012.01.31 10:25:28'+time_offset*3600;
   aPrice[440] = 1.31826;

   // ========== 441 ===== 251 ==========
   aPseudoTicket[441] = 220;
   aAction[441] = 0; // CLOSE
   aType[441] = OP_SELL; // SELL
   aTicket[441] = -1; // Ticket given by broker
   aSymbol[441] = "EURUSD";
   aLots[441] = 1.0;
   aDate[441] = D'2012.01.31 13:09:27'+time_offset*3600;
   aPrice[441] = 1.31756;

   // ========== 442 ===== 245 ==========
   aPseudoTicket[442] = 221;
   aAction[442] = 1; // OPEN
   aReturn[221] = 442;
   aType[442] = OP_BUY; // BUY
   aTicket[442] = -1; // Ticket given by broker
   aSymbol[442] = "EURUSD";
   aLots[442] = 1.0;
   aDate[442] = D'2012.02.09 13:16:59'+time_offset*3600;
   aPrice[442] = 1.32964;

   // ========== 443 ===== 245 ==========
   aPseudoTicket[443] = 221;
   aAction[443] = 0; // CLOSE
   aType[443] = OP_BUY; // BUY
   aTicket[443] = -1; // Ticket given by broker
   aSymbol[443] = "EURUSD";
   aLots[443] = 1.0;
   aDate[443] = D'2012.02.09 13:40:09'+time_offset*3600;
   aPrice[443] = 1.32588;

   // ========== 444 ===== 236 ==========
   aPseudoTicket[444] = 222;
   aAction[444] = 1; // OPEN
   aReturn[222] = 444;
   aType[444] = OP_BUY; // BUY
   aTicket[444] = -1; // Ticket given by broker
   aSymbol[444] = "EURUSD";
   aLots[444] = 1.0;
   aDate[444] = D'2012.02.16 07:01:48'+time_offset*3600;
   aPrice[444] = 1.29987;

   // ========== 445 ===== 236 ==========
   aPseudoTicket[445] = 222;
   aAction[445] = 0; // CLOSE
   aType[445] = OP_BUY; // BUY
   aTicket[445] = -1; // Ticket given by broker
   aSymbol[445] = "EURUSD";
   aLots[445] = 1.0;
   aDate[445] = D'2012.02.16 15:05:31'+time_offset*3600;
   aPrice[445] = 1.30392;

   // ========== 446 ===== 235 ==========
   aPseudoTicket[446] = 223;
   aAction[446] = 1; // OPEN
   aReturn[223] = 446;
   aType[446] = OP_SELL; // SELL
   aTicket[446] = -1; // Ticket given by broker
   aSymbol[446] = "EURUSD";
   aLots[446] = 1.0;
   aDate[446] = D'2012.02.17 13:39:16'+time_offset*3600;
   aPrice[446] = 1.31728;

   // ========== 447 ===== 235 ==========
   aPseudoTicket[447] = 223;
   aAction[447] = 0; // CLOSE
   aType[447] = OP_SELL; // SELL
   aTicket[447] = -1; // Ticket given by broker
   aSymbol[447] = "EURUSD";
   aLots[447] = 1.0;
   aDate[447] = D'2012.02.17 17:54:00'+time_offset*3600;
   aPrice[447] = 1.31541;

   // ========== 448 ===== 232 ==========
   aPseudoTicket[448] = 224;
   aAction[448] = 1; // OPEN
   aReturn[224] = 448;
   aType[448] = OP_SELL; // SELL
   aTicket[448] = -1; // Ticket given by broker
   aSymbol[448] = "EURUSD";
   aLots[448] = 1.0;
   aDate[448] = D'2012.02.19 22:00:08'+time_offset*3600;
   aPrice[448] = 1.31771;

   // ========== 449 ===== 233 ==========
   aPseudoTicket[449] = 225;
   aAction[449] = 1; // OPEN
   aReturn[225] = 449;
   aType[449] = OP_SELL; // SELL
   aTicket[449] = -1; // Ticket given by broker
   aSymbol[449] = "EURUSD";
   aLots[449] = 1.0;
   aDate[449] = D'2012.02.20 11:53:56'+time_offset*3600;
   aPrice[449] = 1.32682;

   // ========== 450 ===== 234 ==========
   aPseudoTicket[450] = 226;
   aAction[450] = 1; // OPEN
   aReturn[226] = 450;
   aType[450] = OP_SELL; // SELL
   aTicket[450] = -1; // Ticket given by broker
   aSymbol[450] = "EURUSD";
   aLots[450] = 1.0;
   aDate[450] = D'2012.02.20 11:54:53'+time_offset*3600;
   aPrice[450] = 1.3268;

   // ========== 451 ===== 234 ==========
   aPseudoTicket[451] = 226;
   aAction[451] = 0; // CLOSE
   aType[451] = OP_SELL; // SELL
   aTicket[451] = -1; // Ticket given by broker
   aSymbol[451] = "EURUSD";
   aLots[451] = 1.0;
   aDate[451] = D'2012.02.20 23:59:27'+time_offset*3600;
   aPrice[451] = 1.32067;

   // ========== 452 ===== 233 ==========
   aPseudoTicket[452] = 225;
   aAction[452] = 0; // CLOSE
   aType[452] = OP_SELL; // SELL
   aTicket[452] = -1; // Ticket given by broker
   aSymbol[452] = "EURUSD";
   aLots[452] = 1.0;
   aDate[452] = D'2012.02.21 02:51:08'+time_offset*3600;
   aPrice[452] = 1.32473;

   // ========== 453 ===== 232 ==========
   aPseudoTicket[453] = 224;
   aAction[453] = 0; // CLOSE
   aType[453] = OP_SELL; // SELL
   aTicket[453] = -1; // Ticket given by broker
   aSymbol[453] = "EURUSD";
   aLots[453] = 1.0;
   aDate[453] = D'2012.02.21 02:51:59'+time_offset*3600;
   aPrice[453] = 1.32536;

   // ========== 454 ===== 230 ==========
   aPseudoTicket[454] = 227;
   aAction[454] = 1; // OPEN
   aReturn[227] = 454;
   aType[454] = OP_BUY; // BUY
   aTicket[454] = -1; // Ticket given by broker
   aSymbol[454] = "EURUSD";
   aLots[454] = 1.0;
   aDate[454] = D'2012.02.21 03:12:35'+time_offset*3600;
   aPrice[454] = 1.32911;

   // ========== 455 ===== 230 ==========
   aPseudoTicket[455] = 227;
   aAction[455] = 0; // CLOSE
   aType[455] = OP_BUY; // BUY
   aTicket[455] = -1; // Ticket given by broker
   aSymbol[455] = "EURUSD";
   aLots[455] = 1.0;
   aDate[455] = D'2012.02.21 07:23:00'+time_offset*3600;
   aPrice[455] = 1.32525;

   // ========== 456 ===== 225 ==========
   aPseudoTicket[456] = 228;
   aAction[456] = 1; // OPEN
   aReturn[228] = 456;
   aType[456] = OP_SELL; // SELL
   aTicket[456] = -1; // Ticket given by broker
   aSymbol[456] = "EURUSD";
   aLots[456] = 1.0;
   aDate[456] = D'2012.02.24 12:00:46'+time_offset*3600;
   aPrice[456] = 1.34119;

   // ========== 457 ===== 226 ==========
   aPseudoTicket[457] = 229;
   aAction[457] = 1; // OPEN
   aReturn[229] = 457;
   aType[457] = OP_SELL; // SELL
   aTicket[457] = -1; // Ticket given by broker
   aSymbol[457] = "EURUSD";
   aLots[457] = 1.0;
   aDate[457] = D'2012.02.24 18:49:15'+time_offset*3600;
   aPrice[457] = 1.34649;

   // ========== 458 ===== 226 ==========
   aPseudoTicket[458] = 229;
   aAction[458] = 0; // CLOSE
   aType[458] = OP_SELL; // SELL
   aTicket[458] = -1; // Ticket given by broker
   aSymbol[458] = "EURUSD";
   aLots[458] = 1.0;
   aDate[458] = D'2012.02.27 10:21:19'+time_offset*3600;
   aPrice[458] = 1.34194;

   // ========== 459 ===== 225 ==========
   aPseudoTicket[459] = 228;
   aAction[459] = 0; // CLOSE
   aType[459] = OP_SELL; // SELL
   aTicket[459] = -1; // Ticket given by broker
   aSymbol[459] = "EURUSD";
   aLots[459] = 1.0;
   aDate[459] = D'2012.02.27 10:25:26'+time_offset*3600;
   aPrice[459] = 1.34146;

   // ========== 460 ===== 224 ==========
   aPseudoTicket[460] = 230;
   aAction[460] = 1; // OPEN
   aReturn[230] = 460;
   aType[460] = OP_BUY; // BUY
   aTicket[460] = -1; // Ticket given by broker
   aSymbol[460] = "EURUSD";
   aLots[460] = 1.0;
   aDate[460] = D'2012.02.27 12:30:14'+time_offset*3600;
   aPrice[460] = 1.33922;

   // ========== 461 ===== 224 ==========
   aPseudoTicket[461] = 230;
   aAction[461] = 0; // CLOSE
   aType[461] = OP_BUY; // BUY
   aTicket[461] = -1; // Ticket given by broker
   aSymbol[461] = "EURUSD";
   aLots[461] = 1.0;
   aDate[461] = D'2012.02.27 15:45:05'+time_offset*3600;
   aPrice[461] = 1.3413;

   // ========== 462 ===== 220 ==========
   aPseudoTicket[462] = 231;
   aAction[462] = 1; // OPEN
   aReturn[231] = 462;
   aType[462] = OP_BUY; // BUY
   aTicket[462] = -1; // Ticket given by broker
   aSymbol[462] = "EURUSD";
   aLots[462] = 1.0;
   aDate[462] = D'2012.03.01 14:00:11'+time_offset*3600;
   aPrice[462] = 1.32927;

   // ========== 463 ===== 220 ==========
   aPseudoTicket[463] = 231;
   aAction[463] = 0; // CLOSE
   aType[463] = OP_BUY; // BUY
   aTicket[463] = -1; // Ticket given by broker
   aSymbol[463] = "EURUSD";
   aLots[463] = 1.0;
   aDate[463] = D'2012.03.01 20:17:22'+time_offset*3600;
   aPrice[463] = 1.33134;

   // ========== 464 ===== 216 ==========
   aPseudoTicket[464] = 232;
   aAction[464] = 1; // OPEN
   aReturn[232] = 464;
   aType[464] = OP_BUY; // BUY
   aTicket[464] = -1; // Ticket given by broker
   aSymbol[464] = "EURUSD";
   aLots[464] = 1.0;
   aDate[464] = D'2012.03.02 15:04:10'+time_offset*3600;
   aPrice[464] = 1.319;

   // ========== 465 ===== 216 ==========
   aPseudoTicket[465] = 232;
   aAction[465] = 0; // CLOSE
   aType[465] = OP_BUY; // BUY
   aTicket[465] = -1; // Ticket given by broker
   aSymbol[465] = "EURUSD";
   aLots[465] = 1.0;
   aDate[465] = D'2012.03.05 07:08:44'+time_offset*3600;
   aPrice[465] = 1.32026;

   // ========== 466 ===== 213 ==========
   aPseudoTicket[466] = 233;
   aAction[466] = 1; // OPEN
   aReturn[233] = 466;
   aType[466] = OP_BUY; // BUY
   aTicket[466] = -1; // Ticket given by broker
   aSymbol[466] = "EURUSD";
   aLots[466] = 1.0;
   aDate[466] = D'2012.03.05 09:09:03'+time_offset*3600;
   aPrice[466] = 1.31746;

   // ========== 467 ===== 213 ==========
   aPseudoTicket[467] = 233;
   aAction[467] = 0; // CLOSE
   aType[467] = OP_BUY; // BUY
   aTicket[467] = -1; // Ticket given by broker
   aSymbol[467] = "EURUSD";
   aLots[467] = 1.0;
   aDate[467] = D'2012.03.05 12:31:54'+time_offset*3600;
   aPrice[467] = 1.32024;

   // ========== 468 ===== 208 ==========
   aPseudoTicket[468] = 234;
   aAction[468] = 1; // OPEN
   aReturn[234] = 468;
   aType[468] = OP_SELL; // SELL
   aTicket[468] = -1; // Ticket given by broker
   aSymbol[468] = "EURUSD";
   aLots[468] = 1.0;
   aDate[468] = D'2012.03.08 09:33:01'+time_offset*3600;
   aPrice[468] = 1.32003;

   // ========== 469 ===== 209 ==========
   aPseudoTicket[469] = 235;
   aAction[469] = 1; // OPEN
   aReturn[235] = 469;
   aType[469] = OP_SELL; // SELL
   aTicket[469] = -1; // Ticket given by broker
   aSymbol[469] = "EURUSD";
   aLots[469] = 1.0;
   aDate[469] = D'2012.03.08 11:50:14'+time_offset*3600;
   aPrice[469] = 1.32362;

   // ========== 470 ===== 210 ==========
   aPseudoTicket[470] = 236;
   aAction[470] = 1; // OPEN
   aReturn[236] = 470;
   aType[470] = OP_SELL; // SELL
   aTicket[470] = -1; // Ticket given by broker
   aSymbol[470] = "EURUSD";
   aLots[470] = 1.0;
   aDate[470] = D'2012.03.08 12:16:30'+time_offset*3600;
   aPrice[470] = 1.32441;

   // ========== 471 ===== 210 ==========
   aPseudoTicket[471] = 236;
   aAction[471] = 0; // CLOSE
   aType[471] = OP_SELL; // SELL
   aTicket[471] = -1; // Ticket given by broker
   aSymbol[471] = "EURUSD";
   aLots[471] = 1.0;
   aDate[471] = D'2012.03.09 06:29:10'+time_offset*3600;
   aPrice[471] = 1.32354;

   // ========== 472 ===== 209 ==========
   aPseudoTicket[472] = 235;
   aAction[472] = 0; // CLOSE
   aType[472] = OP_SELL; // SELL
   aTicket[472] = -1; // Ticket given by broker
   aSymbol[472] = "EURUSD";
   aLots[472] = 1.0;
   aDate[472] = D'2012.03.09 07:53:29'+time_offset*3600;
   aPrice[472] = 1.32237;

   // ========== 473 ===== 208 ==========
   aPseudoTicket[473] = 234;
   aAction[473] = 0; // CLOSE
   aType[473] = OP_SELL; // SELL
   aTicket[473] = -1; // Ticket given by broker
   aSymbol[473] = "EURUSD";
   aLots[473] = 1.0;
   aDate[473] = D'2012.03.09 08:01:28'+time_offset*3600;
   aPrice[473] = 1.32198;

   // ========== 474 ===== 206 ==========
   aPseudoTicket[474] = 237;
   aAction[474] = 1; // OPEN
   aReturn[237] = 474;
   aType[474] = OP_BUY; // BUY
   aTicket[474] = -1; // Ticket given by broker
   aSymbol[474] = "EURUSD";
   aLots[474] = 1.0;
   aDate[474] = D'2012.03.09 13:51:54'+time_offset*3600;
   aPrice[474] = 1.31397;

   // ========== 475 ===== 206 ==========
   aPseudoTicket[475] = 237;
   aAction[475] = 0; // CLOSE
   aType[475] = OP_BUY; // BUY
   aTicket[475] = -1; // Ticket given by broker
   aSymbol[475] = "EURUSD";
   aLots[475] = 1.0;
   aDate[475] = D'2012.03.12 01:27:28'+time_offset*3600;
   aPrice[475] = 1.30869;

   // ========== 476 ===== 204 ==========
   aPseudoTicket[476] = 238;
   aAction[476] = 1; // OPEN
   aReturn[238] = 476;
   aType[476] = OP_SELL; // SELL
   aTicket[476] = -1; // Ticket given by broker
   aSymbol[476] = "EURUSD";
   aLots[476] = 1.0;
   aDate[476] = D'2012.03.14 05:49:42'+time_offset*3600;
   aPrice[476] = 1.30523;

   // ========== 477 ===== 204 ==========
   aPseudoTicket[477] = 238;
   aAction[477] = 0; // CLOSE
   aType[477] = OP_SELL; // SELL
   aTicket[477] = -1; // Ticket given by broker
   aSymbol[477] = "EURUSD";
   aLots[477] = 1.0;
   aDate[477] = D'2012.03.14 11:01:29'+time_offset*3600;
   aPrice[477] = 1.308;

   // ========== 478 ===== 199 ==========
   aPseudoTicket[478] = 239;
   aAction[478] = 1; // OPEN
   aReturn[239] = 478;
   aType[478] = OP_BUY; // BUY
   aTicket[478] = -1; // Ticket given by broker
   aSymbol[478] = "EURUSD";
   aLots[478] = 1.0;
   aDate[478] = D'2012.03.16 10:53:03'+time_offset*3600;
   aPrice[478] = 1.30557;

   // ========== 479 ===== 199 ==========
   aPseudoTicket[479] = 239;
   aAction[479] = 0; // CLOSE
   aType[479] = OP_BUY; // BUY
   aTicket[479] = -1; // Ticket given by broker
   aSymbol[479] = "EURUSD";
   aLots[479] = 1.0;
   aDate[479] = D'2012.03.16 11:07:08'+time_offset*3600;
   aPrice[479] = 1.30668;

   // ========== 480 ===== 197 ==========
   aPseudoTicket[480] = 240;
   aAction[480] = 1; // OPEN
   aReturn[240] = 480;
   aType[480] = OP_SELL; // SELL
   aTicket[480] = -1; // Ticket given by broker
   aSymbol[480] = "EURUSD";
   aLots[480] = 1.0;
   aDate[480] = D'2012.03.21 15:05:20'+time_offset*3600;
   aPrice[480] = 1.31889;

   // ========== 481 ===== 197 ==========
   aPseudoTicket[481] = 240;
   aAction[481] = 0; // CLOSE
   aType[481] = OP_SELL; // SELL
   aTicket[481] = -1; // Ticket given by broker
   aSymbol[481] = "EURUSD";
   aLots[481] = 1.0;
   aDate[481] = D'2012.03.21 16:09:44'+time_offset*3600;
   aPrice[481] = 1.32019;

   // ========== 482 ===== 196 ==========
   aPseudoTicket[482] = 241;
   aAction[482] = 1; // OPEN
   aReturn[241] = 482;
   aType[482] = OP_SELL; // SELL
   aTicket[482] = -1; // Ticket given by broker
   aSymbol[482] = "EURUSD";
   aLots[482] = 1.0;
   aDate[482] = D'2012.03.22 08:31:49'+time_offset*3600;
   aPrice[482] = 1.31624;

   // ========== 483 ===== 196 ==========
   aPseudoTicket[483] = 241;
   aAction[483] = 0; // CLOSE
   aType[483] = OP_SELL; // SELL
   aTicket[483] = -1; // Ticket given by broker
   aSymbol[483] = "EURUSD";
   aLots[483] = 1.0;
   aDate[483] = D'2012.03.22 16:01:45'+time_offset*3600;
   aPrice[483] = 1.32;

   // ========== 484 ===== 195 ==========
   aPseudoTicket[484] = 242;
   aAction[484] = 1; // OPEN
   aReturn[242] = 484;
   aType[484] = OP_BUY; // BUY
   aTicket[484] = -1; // Ticket given by broker
   aSymbol[484] = "EURUSD";
   aLots[484] = 1.0;
   aDate[484] = D'2012.03.23 09:23:51'+time_offset*3600;
   aPrice[484] = 1.32677;

   // ========== 485 ===== 195 ==========
   aPseudoTicket[485] = 242;
   aAction[485] = 0; // CLOSE
   aType[485] = OP_BUY; // BUY
   aTicket[485] = -1; // Ticket given by broker
   aSymbol[485] = "EURUSD";
   aLots[485] = 1.0;
   aDate[485] = D'2012.03.26 06:29:41'+time_offset*3600;
   aPrice[485] = 1.32538;

   // ========== 486 ===== 193 ==========
   aPseudoTicket[486] = 243;
   aAction[486] = 1; // OPEN
   aReturn[243] = 486;
   aType[486] = OP_SELL; // SELL
   aTicket[486] = -1; // Ticket given by broker
   aSymbol[486] = "EURUSD";
   aLots[486] = 1.0;
   aDate[486] = D'2012.03.26 08:42:33'+time_offset*3600;
   aPrice[486] = 1.32075;

   // ========== 487 ===== 193 ==========
   aPseudoTicket[487] = 243;
   aAction[487] = 0; // CLOSE
   aType[487] = OP_SELL; // SELL
   aTicket[487] = -1; // Ticket given by broker
   aSymbol[487] = "EURUSD";
   aLots[487] = 1.0;
   aDate[487] = D'2012.03.26 11:08:16'+time_offset*3600;
   aPrice[487] = 1.3247;

   // ========== 488 ===== 189 ==========
   aPseudoTicket[488] = 244;
   aAction[488] = 1; // OPEN
   aReturn[244] = 488;
   aType[488] = OP_BUY; // BUY
   aTicket[488] = -1; // Ticket given by broker
   aSymbol[488] = "EURUSD";
   aLots[488] = 1.0;
   aDate[488] = D'2012.03.30 00:45:25'+time_offset*3600;
   aPrice[488] = 1.33334;

   // ========== 489 ===== 189 ==========
   aPseudoTicket[489] = 244;
   aAction[489] = 0; // CLOSE
   aType[489] = OP_BUY; // BUY
   aTicket[489] = -1; // Ticket given by broker
   aSymbol[489] = "EURUSD";
   aLots[489] = 1.0;
   aDate[489] = D'2012.03.30 13:00:53'+time_offset*3600;
   aPrice[489] = 1.33386;

   // ========== 490 ===== 188 ==========
   aPseudoTicket[490] = 245;
   aAction[490] = 1; // OPEN
   aReturn[245] = 490;
   aType[490] = OP_BUY; // BUY
   aTicket[490] = -1; // Ticket given by broker
   aSymbol[490] = "EURUSD";
   aLots[490] = 1.0;
   aDate[490] = D'2012.04.02 07:40:06'+time_offset*3600;
   aPrice[490] = 1.33683;

   // ========== 491 ===== 188 ==========
   aPseudoTicket[491] = 245;
   aAction[491] = 0; // CLOSE
   aType[491] = OP_BUY; // BUY
   aTicket[491] = -1; // Ticket given by broker
   aSymbol[491] = "EURUSD";
   aLots[491] = 1.0;
   aDate[491] = D'2012.04.02 12:07:35'+time_offset*3600;
   aPrice[491] = 1.332;

   // ========== 492 ===== 186 ==========
   aPseudoTicket[492] = 246;
   aAction[492] = 1; // OPEN
   aReturn[246] = 492;
   aType[492] = OP_SELL; // SELL
   aTicket[492] = -1; // Ticket given by broker
   aSymbol[492] = "EURUSD";
   aLots[492] = 1.0;
   aDate[492] = D'2012.04.03 22:49:35'+time_offset*3600;
   aPrice[492] = 1.32233;

   // ========== 493 ===== 186 ==========
   aPseudoTicket[493] = 246;
   aAction[493] = 0; // CLOSE
   aType[493] = OP_SELL; // SELL
   aTicket[493] = -1; // Ticket given by broker
   aSymbol[493] = "EURUSD";
   aLots[493] = 1.0;
   aDate[493] = D'2012.04.04 11:12:18'+time_offset*3600;
   aPrice[493] = 1.31589;

   // ========== 494 ===== 184 ==========
   aPseudoTicket[494] = 247;
   aAction[494] = 1; // OPEN
   aReturn[247] = 494;
   aType[494] = OP_BUY; // BUY
   aTicket[494] = -1; // Ticket given by broker
   aSymbol[494] = "EURUSD";
   aLots[494] = 1.0;
   aDate[494] = D'2012.04.05 09:32:41'+time_offset*3600;
   aPrice[494] = 1.3091;

   // ========== 495 ===== 185 ==========
   aPseudoTicket[495] = 248;
   aAction[495] = 1; // OPEN
   aReturn[248] = 495;
   aType[495] = OP_BUY; // BUY
   aTicket[495] = -1; // Ticket given by broker
   aSymbol[495] = "EURUSD";
   aLots[495] = 1.0;
   aDate[495] = D'2012.04.05 10:06:50'+time_offset*3600;
   aPrice[495] = 1.30621;

   // ========== 496 ===== 185 ==========
   aPseudoTicket[496] = 248;
   aAction[496] = 0; // CLOSE
   aType[496] = OP_BUY; // BUY
   aTicket[496] = -1; // Ticket given by broker
   aSymbol[496] = "EURUSD";
   aLots[496] = 1.0;
   aDate[496] = D'2012.04.06 06:11:25'+time_offset*3600;
   aPrice[496] = 1.30726;

   // ========== 497 ===== 184 ==========
   aPseudoTicket[497] = 247;
   aAction[497] = 0; // CLOSE
   aType[497] = OP_BUY; // BUY
   aTicket[497] = -1; // Ticket given by broker
   aSymbol[497] = "EURUSD";
   aLots[497] = 1.0;
   aDate[497] = D'2012.04.06 12:32:21'+time_offset*3600;
   aPrice[497] = 1.31;

   // ========== 498 ===== 175 ==========
   aPseudoTicket[498] = 249;
   aAction[498] = 1; // OPEN
   aReturn[249] = 498;
   aType[498] = OP_SELL; // SELL
   aTicket[498] = -1; // Ticket given by broker
   aSymbol[498] = "EURUSD";
   aLots[498] = 1.0;
   aDate[498] = D'2012.04.16 20:49:47'+time_offset*3600;
   aPrice[498] = 1.31418;

   // ========== 499 ===== 175 ==========
   aPseudoTicket[499] = 249;
   aAction[499] = 0; // CLOSE
   aType[499] = OP_SELL; // SELL
   aTicket[499] = -1; // Ticket given by broker
   aSymbol[499] = "EURUSD";
   aLots[499] = 1.0;
   aDate[499] = D'2012.04.17 06:31:58'+time_offset*3600;
   aPrice[499] = 1.30987;

   // ========== 500 ===== 171 ==========
   aPseudoTicket[500] = 250;
   aAction[500] = 1; // OPEN
   aReturn[250] = 500;
   aType[500] = OP_BUY; // BUY
   aTicket[500] = -1; // Ticket given by broker
   aSymbol[500] = "EURUSD";
   aLots[500] = 1.0;
   aDate[500] = D'2012.04.20 05:48:38'+time_offset*3600;
   aPrice[500] = 1.31651;

   // ========== 501 ===== 171 ==========
   aPseudoTicket[501] = 250;
   aAction[501] = 0; // CLOSE
   aType[501] = OP_BUY; // BUY
   aTicket[501] = -1; // Ticket given by broker
   aSymbol[501] = "EURUSD";
   aLots[501] = 1.0;
   aDate[501] = D'2012.04.20 06:44:47'+time_offset*3600;
   aPrice[501] = 1.31456;

   // ========== 502 ===== 169 ==========
   aPseudoTicket[502] = 251;
   aAction[502] = 1; // OPEN
   aReturn[251] = 502;
   aType[502] = OP_BUY; // BUY
   aTicket[502] = -1; // Ticket given by broker
   aSymbol[502] = "EURUSD";
   aLots[502] = 1.0;
   aDate[502] = D'2012.04.20 08:01:17'+time_offset*3600;
   aPrice[502] = 1.31763;

   // ========== 503 ===== 170 ==========
   aPseudoTicket[503] = 252;
   aAction[503] = 1; // OPEN
   aReturn[252] = 503;
   aType[503] = OP_BUY; // BUY
   aTicket[503] = -1; // Ticket given by broker
   aSymbol[503] = "EURUSD";
   aLots[503] = 1.0;
   aDate[503] = D'2012.04.20 08:04:07'+time_offset*3600;
   aPrice[503] = 1.31673;

   // ========== 504 ===== 170 ==========
   aPseudoTicket[504] = 252;
   aAction[504] = 0; // CLOSE
   aType[504] = OP_BUY; // BUY
   aTicket[504] = -1; // Ticket given by broker
   aSymbol[504] = "EURUSD";
   aLots[504] = 1.0;
   aDate[504] = D'2012.04.20 09:05:50'+time_offset*3600;
   aPrice[504] = 1.31525;

   // ========== 505 ===== 169 ==========
   aPseudoTicket[505] = 251;
   aAction[505] = 0; // CLOSE
   aType[505] = OP_BUY; // BUY
   aTicket[505] = -1; // Ticket given by broker
   aSymbol[505] = "EURUSD";
   aLots[505] = 1.0;
   aDate[505] = D'2012.04.20 09:23:02'+time_offset*3600;
   aPrice[505] = 1.31566;

   // ========== 506 ===== 164 ==========
   aPseudoTicket[506] = 253;
   aAction[506] = 1; // OPEN
   aReturn[253] = 506;
   aType[506] = OP_SELL; // SELL
   aTicket[506] = -1; // Ticket given by broker
   aSymbol[506] = "EURUSD";
   aLots[506] = 1.0;
   aDate[506] = D'2012.04.25 11:33:31'+time_offset*3600;
   aPrice[506] = 1.32038;

   // ========== 507 ===== 164 ==========
   aPseudoTicket[507] = 253;
   aAction[507] = 0; // CLOSE
   aType[507] = OP_SELL; // SELL
   aTicket[507] = -1; // Ticket given by broker
   aSymbol[507] = "EURUSD";
   aLots[507] = 1.0;
   aDate[507] = D'2012.04.25 16:33:07'+time_offset*3600;
   aPrice[507] = 1.31997;

   // ========== 508 ===== 156 ==========
   aPseudoTicket[508] = 254;
   aAction[508] = 1; // OPEN
   aReturn[254] = 508;
   aType[508] = OP_SELL; // SELL
   aTicket[508] = -1; // Ticket given by broker
   aSymbol[508] = "EURUSD";
   aLots[508] = 1.0;
   aDate[508] = D'2012.05.02 07:43:22'+time_offset*3600;
   aPrice[508] = 1.32039;

   // ========== 509 ===== 154 ==========
   aPseudoTicket[509] = 255;
   aAction[509] = 1; // OPEN
   aReturn[255] = 509;
   aType[509] = OP_SELL; // SELL
   aTicket[509] = -1; // Ticket given by broker
   aSymbol[509] = "EURUSD";
   aLots[509] = 1.0;
   aDate[509] = D'2012.05.02 07:45:13'+time_offset*3600;
   aPrice[509] = 1.31933;

   // ========== 510 ===== 156 ==========
   aPseudoTicket[510] = 254;
   aAction[510] = 0; // CLOSE
   aType[510] = OP_SELL; // SELL
   aTicket[510] = -1; // Ticket given by broker
   aSymbol[510] = "EURUSD";
   aLots[510] = 1.0;
   aDate[510] = D'2012.05.02 09:26:39'+time_offset*3600;
   aPrice[510] = 1.3143;

   // ========== 511 ===== 155 ==========
   aPseudoTicket[511] = 256;
   aAction[511] = 1; // OPEN
   aReturn[256] = 511;
   aType[511] = OP_SELL; // SELL
   aTicket[511] = -1; // Ticket given by broker
   aSymbol[511] = "EURUSD";
   aLots[511] = 1.0;
   aDate[511] = D'2012.05.02 14:20:35'+time_offset*3600;
   aPrice[511] = 1.31526;

   // ========== 512 ===== 155 ==========
   aPseudoTicket[512] = 256;
   aAction[512] = 0; // CLOSE
   aType[512] = OP_SELL; // SELL
   aTicket[512] = -1; // Ticket given by broker
   aSymbol[512] = "EURUSD";
   aLots[512] = 1.0;
   aDate[512] = D'2012.05.03 02:10:23'+time_offset*3600;
   aPrice[512] = 1.31391;

   // ========== 513 ===== 154 ==========
   aPseudoTicket[513] = 255;
   aAction[513] = 0; // CLOSE
   aType[513] = OP_SELL; // SELL
   aTicket[513] = -1; // Ticket given by broker
   aSymbol[513] = "EURUSD";
   aLots[513] = 1.0;
   aDate[513] = D'2012.05.03 05:18:01'+time_offset*3600;
   aPrice[513] = 1.31469;

   // ========== 514 ===== 153 ==========
   aPseudoTicket[514] = 257;
   aAction[514] = 1; // OPEN
   aReturn[257] = 514;
   aType[514] = OP_SELL; // SELL
   aTicket[514] = -1; // Ticket given by broker
   aSymbol[514] = "EURUSD";
   aLots[514] = 1.0;
   aDate[514] = D'2012.05.04 15:23:57'+time_offset*3600;
   aPrice[514] = 1.31025;

   // ========== 515 ===== 153 ==========
   aPseudoTicket[515] = 257;
   aAction[515] = 0; // CLOSE
   aType[515] = OP_SELL; // SELL
   aTicket[515] = -1; // Ticket given by broker
   aSymbol[515] = "EURUSD";
   aLots[515] = 1.0;
   aDate[515] = D'2012.05.04 15:45:56'+time_offset*3600;
   aPrice[515] = 1.30894;

   // ========== 516 ===== 147 ==========
   aPseudoTicket[516] = 258;
   aAction[516] = 1; // OPEN
   aReturn[258] = 516;
   aType[516] = OP_SELL; // SELL
   aTicket[516] = -1; // Ticket given by broker
   aSymbol[516] = "EURUSD";
   aLots[516] = 1.0;
   aDate[516] = D'2012.05.07 13:20:18'+time_offset*3600;
   aPrice[516] = 1.30453;

   // ========== 517 ===== 149 ==========
   aPseudoTicket[517] = 259;
   aAction[517] = 1; // OPEN
   aReturn[259] = 517;
   aType[517] = OP_SELL; // SELL
   aTicket[517] = -1; // Ticket given by broker
   aSymbol[517] = "EURUSD";
   aLots[517] = 1.0;
   aDate[517] = D'2012.05.07 13:27:55'+time_offset*3600;
   aPrice[517] = 1.3054;

   // ========== 518 ===== 149 ==========
   aPseudoTicket[518] = 259;
   aAction[518] = 0; // CLOSE
   aType[518] = OP_SELL; // SELL
   aTicket[518] = -1; // Ticket given by broker
   aSymbol[518] = "EURUSD";
   aLots[518] = 1.0;
   aDate[518] = D'2012.05.07 13:55:57'+time_offset*3600;
   aPrice[518] = 1.30445;

   // ========== 519 ===== 147 ==========
   aPseudoTicket[519] = 258;
   aAction[519] = 0; // CLOSE
   aType[519] = OP_SELL; // SELL
   aTicket[519] = -1; // Ticket given by broker
   aSymbol[519] = "EURUSD";
   aLots[519] = 1.0;
   aDate[519] = D'2012.05.08 03:20:06'+time_offset*3600;
   aPrice[519] = 1.30314;

   // ========== 520 ===== 118 ==========
   aPseudoTicket[520] = 260;
   aAction[520] = 1; // OPEN
   aReturn[260] = 520;
   aType[520] = OP_SELL; // SELL
   aTicket[520] = -1; // Ticket given by broker
   aSymbol[520] = "EURUSD";
   aLots[520] = 1.0;
   aDate[520] = D'2012.05.20 21:02:19'+time_offset*3600;
   aPrice[520] = 1.27653;

   // ========== 521 ===== 119 ==========
   aPseudoTicket[521] = 261;
   aAction[521] = 1; // OPEN
   aReturn[261] = 521;
   aType[521] = OP_SELL; // SELL
   aTicket[521] = -1; // Ticket given by broker
   aSymbol[521] = "EURUSD";
   aLots[521] = 1.0;
   aDate[521] = D'2012.05.21 01:36:59'+time_offset*3600;
   aPrice[521] = 1.28085;

   // ========== 522 ===== 119 ==========
   aPseudoTicket[522] = 261;
   aAction[522] = 0; // CLOSE
   aType[522] = OP_SELL; // SELL
   aTicket[522] = -1; // Ticket given by broker
   aSymbol[522] = "EURUSD";
   aLots[522] = 1.0;
   aDate[522] = D'2012.05.21 03:40:47'+time_offset*3600;
   aPrice[522] = 1.27951;

   // ========== 523 ===== 118 ==========
   aPseudoTicket[523] = 260;
   aAction[523] = 0; // CLOSE
   aType[523] = OP_SELL; // SELL
   aTicket[523] = -1; // Ticket given by broker
   aSymbol[523] = "EURUSD";
   aLots[523] = 1.0;
   aDate[523] = D'2012.05.21 11:44:32'+time_offset*3600;
   aPrice[523] = 1.2765;

   // ========== 524 ===== 116 ==========
   aPseudoTicket[524] = 262;
   aAction[524] = 1; // OPEN
   aReturn[262] = 524;
   aType[524] = OP_SELL; // SELL
   aTicket[524] = -1; // Ticket given by broker
   aSymbol[524] = "EURUSD";
   aLots[524] = 1.0;
   aDate[524] = D'2012.05.22 09:05:51'+time_offset*3600;
   aPrice[524] = 1.27602;

   // ========== 525 ===== 116 ==========
   aPseudoTicket[525] = 262;
   aAction[525] = 0; // CLOSE
   aType[525] = OP_SELL; // SELL
   aTicket[525] = -1; // Ticket given by broker
   aSymbol[525] = "EURUSD";
   aLots[525] = 1.0;
   aDate[525] = D'2012.05.22 09:39:51'+time_offset*3600;
   aPrice[525] = 1.27579;

   // ========== 526 ===== 113 ==========
   aPseudoTicket[526] = 263;
   aAction[526] = 1; // OPEN
   aReturn[263] = 526;
   aType[526] = OP_BUY; // BUY
   aTicket[526] = -1; // Ticket given by broker
   aSymbol[526] = "EURUSD";
   aLots[526] = 1.0;
   aDate[526] = D'2012.05.22 21:31:35'+time_offset*3600;
   aPrice[526] = 1.26777;

   // ========== 527 ===== 114 ==========
   aPseudoTicket[527] = 264;
   aAction[527] = 1; // OPEN
   aReturn[264] = 527;
   aType[527] = OP_BUY; // BUY
   aTicket[527] = -1; // Ticket given by broker
   aSymbol[527] = "EURUSD";
   aLots[527] = 1.0;
   aDate[527] = D'2012.05.23 00:23:25'+time_offset*3600;
   aPrice[527] = 1.26611;

   // ========== 528 ===== 114 ==========
   aPseudoTicket[528] = 264;
   aAction[528] = 0; // CLOSE
   aType[528] = OP_BUY; // BUY
   aTicket[528] = -1; // Ticket given by broker
   aSymbol[528] = "EURUSD";
   aLots[528] = 1.0;
   aDate[528] = D'2012.05.23 12:34:22'+time_offset*3600;
   aPrice[528] = 1.26574;

   // ========== 529 ===== 113 ==========
   aPseudoTicket[529] = 263;
   aAction[529] = 0; // CLOSE
   aType[529] = OP_BUY; // BUY
   aTicket[529] = -1; // Ticket given by broker
   aSymbol[529] = "EURUSD";
   aLots[529] = 1.0;
   aDate[529] = D'2012.05.23 12:36:08'+time_offset*3600;
   aPrice[529] = 1.2654;

   // ========== 530 ===== 112 ==========
   aPseudoTicket[530] = 265;
   aAction[530] = 1; // OPEN
   aReturn[265] = 530;
   aType[530] = OP_SELL; // SELL
   aTicket[530] = -1; // Ticket given by broker
   aSymbol[530] = "EURUSD";
   aLots[530] = 1.0;
   aDate[530] = D'2012.05.24 07:44:54'+time_offset*3600;
   aPrice[530] = 1.25449;

   // ========== 531 ===== 112 ==========
   aPseudoTicket[531] = 265;
   aAction[531] = 0; // CLOSE
   aType[531] = OP_SELL; // SELL
   aTicket[531] = -1; // Ticket given by broker
   aSymbol[531] = "EURUSD";
   aLots[531] = 1.0;
   aDate[531] = D'2012.05.24 07:57:48'+time_offset*3600;
   aPrice[531] = 1.25419;

   // ========== 532 ===== 110 ==========
   aPseudoTicket[532] = 266;
   aAction[532] = 1; // OPEN
   aReturn[266] = 532;
   aType[532] = OP_BUY; // BUY
   aTicket[532] = -1; // Ticket given by broker
   aSymbol[532] = "EURUSD";
   aLots[532] = 1.0;
   aDate[532] = D'2012.05.24 19:15:40'+time_offset*3600;
   aPrice[532] = 1.25256;

   // ========== 533 ===== 110 ==========
   aPseudoTicket[533] = 266;
   aAction[533] = 0; // CLOSE
   aType[533] = OP_BUY; // BUY
   aTicket[533] = -1; // Ticket given by broker
   aSymbol[533] = "EURUSD";
   aLots[533] = 1.0;
   aDate[533] = D'2012.05.24 19:31:19'+time_offset*3600;
   aPrice[533] = 1.25412;

   // ========== 534 ===== 109 ==========
   aPseudoTicket[534] = 267;
   aAction[534] = 1; // OPEN
   aReturn[267] = 534;
   aType[534] = OP_SELL; // SELL
   aTicket[534] = -1; // Ticket given by broker
   aSymbol[534] = "EURUSD";
   aLots[534] = 1.0;
   aDate[534] = D'2012.05.25 12:29:41'+time_offset*3600;
   aPrice[534] = 1.25233;

   // ========== 535 ===== 109 ==========
   aPseudoTicket[535] = 267;
   aAction[535] = 0; // CLOSE
   aType[535] = OP_SELL; // SELL
   aTicket[535] = -1; // Ticket given by broker
   aSymbol[535] = "EURUSD";
   aLots[535] = 1.0;
   aDate[535] = D'2012.05.25 12:36:14'+time_offset*3600;
   aPrice[535] = 1.25088;

   // ========== 536 ===== 107 ==========
   aPseudoTicket[536] = 268;
   aAction[536] = 1; // OPEN
   aReturn[268] = 536;
   aType[536] = OP_SELL; // SELL
   aTicket[536] = -1; // Ticket given by broker
   aSymbol[536] = "EURUSD";
   aLots[536] = 1.0;
   aDate[536] = D'2012.05.28 03:00:43'+time_offset*3600;
   aPrice[536] = 1.25898;

   // ========== 537 ===== 108 ==========
   aPseudoTicket[537] = 269;
   aAction[537] = 1; // OPEN
   aReturn[269] = 537;
   aType[537] = OP_SELL; // SELL
   aTicket[537] = -1; // Ticket given by broker
   aSymbol[537] = "EURUSD";
   aLots[537] = 1.0;
   aDate[537] = D'2012.05.28 05:43:29'+time_offset*3600;
   aPrice[537] = 1.2603;

   // ========== 538 ===== 108 ==========
   aPseudoTicket[538] = 269;
   aAction[538] = 0; // CLOSE
   aType[538] = OP_SELL; // SELL
   aTicket[538] = -1; // Ticket given by broker
   aSymbol[538] = "EURUSD";
   aLots[538] = 1.0;
   aDate[538] = D'2012.05.28 06:05:45'+time_offset*3600;
   aPrice[538] = 1.25967;

   // ========== 539 ===== 107 ==========
   aPseudoTicket[539] = 268;
   aAction[539] = 0; // CLOSE
   aType[539] = OP_SELL; // SELL
   aTicket[539] = -1; // Ticket given by broker
   aSymbol[539] = "EURUSD";
   aLots[539] = 1.0;
   aDate[539] = D'2012.05.28 08:08:20'+time_offset*3600;
   aPrice[539] = 1.25752;

   // ========== 540 ===== 105 ==========
   aPseudoTicket[540] = 270;
   aAction[540] = 1; // OPEN
   aReturn[270] = 540;
   aType[540] = OP_BUY; // BUY
   aTicket[540] = -1; // Ticket given by broker
   aSymbol[540] = "EURUSD";
   aLots[540] = 1.0;
   aDate[540] = D'2012.05.29 07:05:08'+time_offset*3600;
   aPrice[540] = 1.25619;

   // ========== 541 ===== 105 ==========
   aPseudoTicket[541] = 270;
   aAction[541] = 0; // CLOSE
   aType[541] = OP_BUY; // BUY
   aTicket[541] = -1; // Ticket given by broker
   aSymbol[541] = "EURUSD";
   aLots[541] = 1.0;
   aDate[541] = D'2012.05.29 09:14:52'+time_offset*3600;
   aPrice[541] = 1.25606;

   // ========== 542 ===== 104 ==========
   aPseudoTicket[542] = 271;
   aAction[542] = 1; // OPEN
   aReturn[271] = 542;
   aType[542] = OP_SELL; // SELL
   aTicket[542] = -1; // Ticket given by broker
   aSymbol[542] = "EURUSD";
   aLots[542] = 1.0;
   aDate[542] = D'2012.05.29 11:45:06'+time_offset*3600;
   aPrice[542] = 1.25215;

   // ========== 543 ===== 104 ==========
   aPseudoTicket[543] = 271;
   aAction[543] = 0; // CLOSE
   aType[543] = OP_SELL; // SELL
   aTicket[543] = -1; // Ticket given by broker
   aSymbol[543] = "EURUSD";
   aLots[543] = 1.0;
   aDate[543] = D'2012.05.29 12:09:08'+time_offset*3600;
   aPrice[543] = 1.25212;

   // ========== 544 ===== 103 ==========
   aPseudoTicket[544] = 272;
   aAction[544] = 1; // OPEN
   aReturn[272] = 544;
   aType[544] = OP_BUY; // BUY
   aTicket[544] = -1; // Ticket given by broker
   aSymbol[544] = "EURUSD";
   aLots[544] = 1.0;
   aDate[544] = D'2012.05.30 01:38:54'+time_offset*3600;
   aPrice[544] = 1.24657;

   // ========== 545 ===== 103 ==========
   aPseudoTicket[545] = 272;
   aAction[545] = 0; // CLOSE
   aType[545] = OP_BUY; // BUY
   aTicket[545] = -1; // Ticket given by broker
   aSymbol[545] = "EURUSD";
   aLots[545] = 1.0;
   aDate[545] = D'2012.05.30 06:31:35'+time_offset*3600;
   aPrice[545] = 1.24722;

   // ========== 546 ===== 97 ==========
   aPseudoTicket[546] = 273;
   aAction[546] = 1; // OPEN
   aReturn[273] = 546;
   aType[546] = OP_BUY; // BUY
   aTicket[546] = -1; // Ticket given by broker
   aSymbol[546] = "EURUSD";
   aLots[546] = 1.0;
   aDate[546] = D'2012.05.30 07:58:08'+time_offset*3600;
   aPrice[546] = 1.24584;

   // ========== 547 ===== 98 ==========
   aPseudoTicket[547] = 274;
   aAction[547] = 1; // OPEN
   aReturn[274] = 547;
   aType[547] = OP_BUY; // BUY
   aTicket[547] = -1; // Ticket given by broker
   aSymbol[547] = "EURUSD";
   aLots[547] = 1.0;
   aDate[547] = D'2012.05.30 09:12:22'+time_offset*3600;
   aPrice[547] = 1.24416;

   // ========== 548 ===== 100 ==========
   aPseudoTicket[548] = 275;
   aAction[548] = 1; // OPEN
   aReturn[275] = 548;
   aType[548] = OP_BUY; // BUY
   aTicket[548] = -1; // Ticket given by broker
   aSymbol[548] = "EURUSD";
   aLots[548] = 1.0;
   aDate[548] = D'2012.05.30 20:26:56'+time_offset*3600;
   aPrice[548] = 1.23676;

   // ========== 549 ===== 100 ==========
   aPseudoTicket[549] = 275;
   aAction[549] = 0; // CLOSE
   aType[549] = OP_BUY; // BUY
   aTicket[549] = -1; // Ticket given by broker
   aSymbol[549] = "EURUSD";
   aLots[549] = 1.0;
   aDate[549] = D'2012.05.31 03:25:20'+time_offset*3600;
   aPrice[549] = 1.23741;

   // ========== 550 ===== 98 ==========
   aPseudoTicket[550] = 274;
   aAction[550] = 0; // CLOSE
   aType[550] = OP_BUY; // BUY
   aTicket[550] = -1; // Ticket given by broker
   aSymbol[550] = "EURUSD";
   aLots[550] = 1.0;
   aDate[550] = D'2012.05.31 08:41:47'+time_offset*3600;
   aPrice[550] = 1.24146;

   // ========== 551 ===== 97 ==========
   aPseudoTicket[551] = 273;
   aAction[551] = 0; // CLOSE
   aType[551] = OP_BUY; // BUY
   aTicket[551] = -1; // Ticket given by broker
   aSymbol[551] = "EURUSD";
   aLots[551] = 1.0;
   aDate[551] = D'2012.05.31 09:09:40'+time_offset*3600;
   aPrice[551] = 1.24203;

   // ========== 552 ===== 94 ==========
   aPseudoTicket[552] = 276;
   aAction[552] = 1; // OPEN
   aReturn[276] = 552;
   aType[552] = OP_BUY; // BUY
   aTicket[552] = -1; // Ticket given by broker
   aSymbol[552] = "EURUSD";
   aLots[552] = 1.0;
   aDate[552] = D'2012.06.01 00:56:46'+time_offset*3600;
   aPrice[552] = 1.23448;

   // ========== 553 ===== 93 ==========
   aPseudoTicket[553] = 277;
   aAction[553] = 1; // OPEN
   aReturn[277] = 553;
   aType[553] = OP_BUY; // BUY
   aTicket[553] = -1; // Ticket given by broker
   aSymbol[553] = "EURUSD";
   aLots[553] = 1.0;
   aDate[553] = D'2012.06.01 12:15:31'+time_offset*3600;
   aPrice[553] = 1.23229;

   // ========== 554 ===== 95 ==========
   aPseudoTicket[554] = 278;
   aAction[554] = 1; // OPEN
   aReturn[278] = 554;
   aType[554] = OP_BUY; // BUY
   aTicket[554] = -1; // Ticket given by broker
   aSymbol[554] = "EURUSD";
   aLots[554] = 1.0;
   aDate[554] = D'2012.06.01 12:31:23'+time_offset*3600;
   aPrice[554] = 1.22984;

   // ========== 555 ===== 95 ==========
   aPseudoTicket[555] = 278;
   aAction[555] = 0; // CLOSE
   aType[555] = OP_BUY; // BUY
   aTicket[555] = -1; // Ticket given by broker
   aSymbol[555] = "EURUSD";
   aLots[555] = 1.0;
   aDate[555] = D'2012.06.01 13:27:29'+time_offset*3600;
   aPrice[555] = 1.23929;

   // ========== 556 ===== 94 ==========
   aPseudoTicket[556] = 276;
   aAction[556] = 0; // CLOSE
   aType[556] = OP_BUY; // BUY
   aTicket[556] = -1; // Ticket given by broker
   aSymbol[556] = "EURUSD";
   aLots[556] = 1.0;
   aDate[556] = D'2012.06.01 13:28:27'+time_offset*3600;
   aPrice[556] = 1.24001;

   // ========== 557 ===== 93 ==========
   aPseudoTicket[557] = 277;
   aAction[557] = 0; // CLOSE
   aType[557] = OP_BUY; // BUY
   aTicket[557] = -1; // Ticket given by broker
   aSymbol[557] = "EURUSD";
   aLots[557] = 1.0;
   aDate[557] = D'2012.06.01 13:32:16'+time_offset*3600;
   aPrice[557] = 1.24112;

   // ========== 558 ===== 91 ==========
   aPseudoTicket[558] = 279;
   aAction[558] = 1; // OPEN
   aReturn[279] = 558;
   aType[558] = OP_BUY; // BUY
   aTicket[558] = -1; // Ticket given by broker
   aSymbol[558] = "EURUSD";
   aLots[558] = 1.0;
   aDate[558] = D'2012.06.01 13:52:13'+time_offset*3600;
   aPrice[558] = 1.241;

   // ========== 559 ===== 92 ==========
   aPseudoTicket[559] = 280;
   aAction[559] = 1; // OPEN
   aReturn[280] = 559;
   aType[559] = OP_BUY; // BUY
   aTicket[559] = -1; // Ticket given by broker
   aSymbol[559] = "EURUSD";
   aLots[559] = 1.0;
   aDate[559] = D'2012.06.01 13:57:47'+time_offset*3600;
   aPrice[559] = 1.23946;

   // ========== 560 ===== 92 ==========
   aPseudoTicket[560] = 280;
   aAction[560] = 0; // CLOSE
   aType[560] = OP_BUY; // BUY
   aTicket[560] = -1; // Ticket given by broker
   aSymbol[560] = "EURUSD";
   aLots[560] = 1.0;
   aDate[560] = D'2012.06.01 14:01:03'+time_offset*3600;
   aPrice[560] = 1.24158;

   // ========== 561 ===== 91 ==========
   aPseudoTicket[561] = 279;
   aAction[561] = 0; // CLOSE
   aType[561] = OP_BUY; // BUY
   aTicket[561] = -1; // Ticket given by broker
   aSymbol[561] = "EURUSD";
   aLots[561] = 1.0;
   aDate[561] = D'2012.06.01 14:10:18'+time_offset*3600;
   aPrice[561] = 1.24259;

   // ========== 562 ===== 90 ==========
   aPseudoTicket[562] = 281;
   aAction[562] = 1; // OPEN
   aReturn[281] = 562;
   aType[562] = OP_BUY; // BUY
   aTicket[562] = -1; // Ticket given by broker
   aSymbol[562] = "EURUSD";
   aLots[562] = 1.0;
   aDate[562] = D'2012.06.01 14:59:27'+time_offset*3600;
   aPrice[562] = 1.2365;

   // ========== 563 ===== 90 ==========
   aPseudoTicket[563] = 281;
   aAction[563] = 0; // CLOSE
   aType[563] = OP_BUY; // BUY
   aTicket[563] = -1; // Ticket given by broker
   aSymbol[563] = "EURUSD";
   aLots[563] = 1.0;
   aDate[563] = D'2012.06.01 15:38:57'+time_offset*3600;
   aPrice[563] = 1.23826;

   // ========== 564 ===== 89 ==========
   aPseudoTicket[564] = 282;
   aAction[564] = 1; // OPEN
   aReturn[282] = 564;
   aType[564] = OP_SELL; // SELL
   aTicket[564] = -1; // Ticket given by broker
   aSymbol[564] = "EURUSD";
   aLots[564] = 1.0;
   aDate[564] = D'2012.06.04 13:38:33'+time_offset*3600;
   aPrice[564] = 1.24951;

   // ========== 565 ===== 89 ==========
   aPseudoTicket[565] = 282;
   aAction[565] = 0; // CLOSE
   aType[565] = OP_SELL; // SELL
   aTicket[565] = -1; // Ticket given by broker
   aSymbol[565] = "EURUSD";
   aLots[565] = 1.0;
   aDate[565] = D'2012.06.04 13:43:44'+time_offset*3600;
   aPrice[565] = 1.2487;

   // ========== 566 ===== 87 ==========
   aPseudoTicket[566] = 283;
   aAction[566] = 1; // OPEN
   aReturn[283] = 566;
   aType[566] = OP_SELL; // SELL
   aTicket[566] = -1; // Ticket given by broker
   aSymbol[566] = "EURUSD";
   aLots[566] = 1.0;
   aDate[566] = D'2012.06.04 14:07:54'+time_offset*3600;
   aPrice[566] = 1.24906;

   // ========== 567 ===== 88 ==========
   aPseudoTicket[567] = 284;
   aAction[567] = 1; // OPEN
   aReturn[284] = 567;
   aType[567] = OP_SELL; // SELL
   aTicket[567] = -1; // Ticket given by broker
   aSymbol[567] = "EURUSD";
   aLots[567] = 1.0;
   aDate[567] = D'2012.06.05 00:07:06'+time_offset*3600;
   aPrice[567] = 1.25357;

   // ========== 568 ===== 88 ==========
   aPseudoTicket[568] = 284;
   aAction[568] = 0; // CLOSE
   aType[568] = OP_SELL; // SELL
   aTicket[568] = -1; // Ticket given by broker
   aSymbol[568] = "EURUSD";
   aLots[568] = 1.0;
   aDate[568] = D'2012.06.05 06:41:33'+time_offset*3600;
   aPrice[568] = 1.24994;

   // ========== 569 ===== 87 ==========
   aPseudoTicket[569] = 283;
   aAction[569] = 0; // CLOSE
   aType[569] = OP_SELL; // SELL
   aTicket[569] = -1; // Ticket given by broker
   aSymbol[569] = "EURUSD";
   aLots[569] = 1.0;
   aDate[569] = D'2012.06.05 06:49:41'+time_offset*3600;
   aPrice[569] = 1.24951;

   // ========== 570 ===== 83 ==========
   aPseudoTicket[570] = 285;
   aAction[570] = 1; // OPEN
   aReturn[285] = 570;
   aType[570] = OP_SELL; // SELL
   aTicket[570] = -1; // Ticket given by broker
   aSymbol[570] = "EURUSD";
   aLots[570] = 1.0;
   aDate[570] = D'2012.06.07 11:27:24'+time_offset*3600;
   aPrice[570] = 1.25859;

   // ========== 571 ===== 83 ==========
   aPseudoTicket[571] = 285;
   aAction[571] = 0; // CLOSE
   aType[571] = OP_SELL; // SELL
   aTicket[571] = -1; // Ticket given by broker
   aSymbol[571] = "EURUSD";
   aLots[571] = 1.0;
   aDate[571] = D'2012.06.07 14:19:56'+time_offset*3600;
   aPrice[571] = 1.25629;

   // ========== 572 ===== 76 ==========
   aPseudoTicket[572] = 286;
   aAction[572] = 1; // OPEN
   aReturn[286] = 572;
   aType[572] = OP_SELL; // SELL
   aTicket[572] = -1; // Ticket given by broker
   aSymbol[572] = "EURUSD";
   aLots[572] = 1.0;
   aDate[572] = D'2012.06.10 21:39:35'+time_offset*3600;
   aPrice[572] = 1.266;

   // ========== 573 ===== 78 ==========
   aPseudoTicket[573] = 287;
   aAction[573] = 1; // OPEN
   aReturn[287] = 573;
   aType[573] = OP_SELL; // SELL
   aTicket[573] = -1; // Ticket given by broker
   aSymbol[573] = "EURUSD";
   aLots[573] = 1.0;
   aDate[573] = D'2012.06.11 05:37:38'+time_offset*3600;
   aPrice[573] = 1.26445;

   // ========== 574 ===== 78 ==========
   aPseudoTicket[574] = 287;
   aAction[574] = 0; // CLOSE
   aType[574] = OP_SELL; // SELL
   aTicket[574] = -1; // Ticket given by broker
   aSymbol[574] = "EURUSD";
   aLots[574] = 1.0;
   aDate[574] = D'2012.06.11 06:16:35'+time_offset*3600;
   aPrice[574] = 1.26286;

   // ========== 575 ===== 76 ==========
   aPseudoTicket[575] = 286;
   aAction[575] = 0; // CLOSE
   aType[575] = OP_SELL; // SELL
   aTicket[575] = -1; // Ticket given by broker
   aSymbol[575] = "EURUSD";
   aLots[575] = 1.0;
   aDate[575] = D'2012.06.11 07:25:10'+time_offset*3600;
   aPrice[575] = 1.26194;

   // ========== 576 ===== 74 ==========
   aPseudoTicket[576] = 288;
   aAction[576] = 1; // OPEN
   aReturn[288] = 576;
   aType[576] = OP_BUY; // BUY
   aTicket[576] = -1; // Ticket given by broker
   aSymbol[576] = "EURUSD";
   aLots[576] = 1.0;
   aDate[576] = D'2012.06.11 21:08:52'+time_offset*3600;
   aPrice[576] = 1.24746;

   // ========== 577 ===== 75 ==========
   aPseudoTicket[577] = 289;
   aAction[577] = 1; // OPEN
   aReturn[289] = 577;
   aType[577] = OP_BUY; // BUY
   aTicket[577] = -1; // Ticket given by broker
   aSymbol[577] = "EURUSD";
   aLots[577] = 1.0;
   aDate[577] = D'2012.06.11 22:10:31'+time_offset*3600;
   aPrice[577] = 1.24644;

   // ========== 578 ===== 75 ==========
   aPseudoTicket[578] = 289;
   aAction[578] = 0; // CLOSE
   aType[578] = OP_BUY; // BUY
   aTicket[578] = -1; // Ticket given by broker
   aSymbol[578] = "EURUSD";
   aLots[578] = 1.0;
   aDate[578] = D'2012.06.11 22:40:17'+time_offset*3600;
   aPrice[578] = 1.24709;

   // ========== 579 ===== 74 ==========
   aPseudoTicket[579] = 288;
   aAction[579] = 0; // CLOSE
   aType[579] = OP_BUY; // BUY
   aTicket[579] = -1; // Ticket given by broker
   aSymbol[579] = "EURUSD";
   aLots[579] = 1.0;
   aDate[579] = D'2012.06.11 23:56:05'+time_offset*3600;
   aPrice[579] = 1.24765;

   // ========== 580 ===== 73 ==========
   aPseudoTicket[580] = 290;
   aAction[580] = 1; // OPEN
   aReturn[290] = 580;
   aType[580] = OP_SELL; // SELL
   aTicket[580] = -1; // Ticket given by broker
   aSymbol[580] = "EURUSD";
   aLots[580] = 1.0;
   aDate[580] = D'2012.06.12 14:08:29'+time_offset*3600;
   aPrice[580] = 1.24568;

   // ========== 581 ===== 73 ==========
   aPseudoTicket[581] = 290;
   aAction[581] = 0; // CLOSE
   aType[581] = OP_SELL; // SELL
   aTicket[581] = -1; // Ticket given by broker
   aSymbol[581] = "EURUSD";
   aLots[581] = 1.0;
   aDate[581] = D'2012.06.12 15:13:52'+time_offset*3600;
   aPrice[581] = 1.24784;

   // ========== 582 ===== 72 ==========
   aPseudoTicket[582] = 291;
   aAction[582] = 1; // OPEN
   aReturn[291] = 582;
   aType[582] = OP_SELL; // SELL
   aTicket[582] = -1; // Ticket given by broker
   aSymbol[582] = "EURUSD";
   aLots[582] = 1.0;
   aDate[582] = D'2012.06.13 11:50:20'+time_offset*3600;
   aPrice[582] = 1.25363;

   // ========== 583 ===== 71 ==========
   aPseudoTicket[583] = 292;
   aAction[583] = 1; // OPEN
   aReturn[292] = 583;
   aType[583] = OP_SELL; // SELL
   aTicket[583] = -1; // Ticket given by broker
   aSymbol[583] = "EURUSD";
   aLots[583] = 1.0;
   aDate[583] = D'2012.06.13 12:46:13'+time_offset*3600;
   aPrice[583] = 1.25378;

   // ========== 584 ===== 72 ==========
   aPseudoTicket[584] = 291;
   aAction[584] = 0; // CLOSE
   aType[584] = OP_SELL; // SELL
   aTicket[584] = -1; // Ticket given by broker
   aSymbol[584] = "EURUSD";
   aLots[584] = 1.0;
   aDate[584] = D'2012.06.13 13:41:03'+time_offset*3600;
   aPrice[584] = 1.25241;

   // ========== 585 ===== 71 ==========
   aPseudoTicket[585] = 292;
   aAction[585] = 0; // CLOSE
   aType[585] = OP_SELL; // SELL
   aTicket[585] = -1; // Ticket given by broker
   aSymbol[585] = "EURUSD";
   aLots[585] = 1.0;
   aDate[585] = D'2012.06.13 13:48:38'+time_offset*3600;
   aPrice[585] = 1.25278;

   // ========== 586 ===== 70 ==========
   aPseudoTicket[586] = 293;
   aAction[586] = 1; // OPEN
   aReturn[293] = 586;
   aType[586] = OP_SELL; // SELL
   aTicket[586] = -1; // Ticket given by broker
   aSymbol[586] = "EURUSD";
   aLots[586] = 1.0;
   aDate[586] = D'2012.06.13 15:37:00'+time_offset*3600;
   aPrice[586] = 1.26009;

   // ========== 587 ===== 70 ==========
   aPseudoTicket[587] = 293;
   aAction[587] = 0; // CLOSE
   aType[587] = OP_SELL; // SELL
   aTicket[587] = -1; // Ticket given by broker
   aSymbol[587] = "EURUSD";
   aLots[587] = 1.0;
   aDate[587] = D'2012.06.13 15:51:49'+time_offset*3600;
   aPrice[587] = 1.25936;

   // ========== 588 ===== 68 ==========
   aPseudoTicket[588] = 294;
   aAction[588] = 1; // OPEN
   aReturn[294] = 588;
   aType[588] = OP_SELL; // SELL
   aTicket[588] = -1; // Ticket given by broker
   aSymbol[588] = "EURUSD";
   aLots[588] = 1.0;
   aDate[588] = D'2012.06.14 08:53:48'+time_offset*3600;
   aPrice[588] = 1.2546;

   // ========== 589 ===== 68 ==========
   aPseudoTicket[589] = 294;
   aAction[589] = 0; // CLOSE
   aType[589] = OP_SELL; // SELL
   aTicket[589] = -1; // Ticket given by broker
   aSymbol[589] = "EURUSD";
   aLots[589] = 1.0;
   aDate[589] = D'2012.06.14 10:16:49'+time_offset*3600;
   aPrice[589] = 1.25653;

   // ========== 590 ===== 67 ==========
   aPseudoTicket[590] = 295;
   aAction[590] = 1; // OPEN
   aReturn[295] = 590;
   aType[590] = OP_SELL; // SELL
   aTicket[590] = -1; // Ticket given by broker
   aSymbol[590] = "EURUSD";
   aLots[590] = 1.0;
   aDate[590] = D'2012.06.14 21:38:46'+time_offset*3600;
   aPrice[590] = 1.26284;

   // ========== 591 ===== 67 ==========
   aPseudoTicket[591] = 295;
   aAction[591] = 0; // CLOSE
   aType[591] = OP_SELL; // SELL
   aTicket[591] = -1; // Ticket given by broker
   aSymbol[591] = "EURUSD";
   aLots[591] = 1.0;
   aDate[591] = D'2012.06.15 00:49:11'+time_offset*3600;
   aPrice[591] = 1.26163;

   // ========== 592 ===== 66 ==========
   aPseudoTicket[592] = 296;
   aAction[592] = 1; // OPEN
   aReturn[296] = 592;
   aType[592] = OP_SELL; // SELL
   aTicket[592] = -1; // Ticket given by broker
   aSymbol[592] = "EURUSD";
   aLots[592] = 1.0;
   aDate[592] = D'2012.06.15 03:44:01'+time_offset*3600;
   aPrice[592] = 1.2639;

   // ========== 593 ===== 66 ==========
   aPseudoTicket[593] = 296;
   aAction[593] = 0; // CLOSE
   aType[593] = OP_SELL; // SELL
   aTicket[593] = -1; // Ticket given by broker
   aSymbol[593] = "EURUSD";
   aLots[593] = 1.0;
   aDate[593] = D'2012.06.15 07:28:35'+time_offset*3600;
   aPrice[593] = 1.26256;

   // ========== 594 ===== 62 ==========
   aPseudoTicket[594] = 297;
   aAction[594] = 1; // OPEN
   aReturn[297] = 594;
   aType[594] = OP_BUY; // BUY
   aTicket[594] = -1; // Ticket given by broker
   aSymbol[594] = "EURUSD";
   aLots[594] = 1.0;
   aDate[594] = D'2012.06.18 12:38:43'+time_offset*3600;
   aPrice[594] = 1.26066;

   // ========== 595 ===== 62 ==========
   aPseudoTicket[595] = 297;
   aAction[595] = 0; // CLOSE
   aType[595] = OP_BUY; // BUY
   aTicket[595] = -1; // Ticket given by broker
   aSymbol[595] = "EURUSD";
   aLots[595] = 1.0;
   aDate[595] = D'2012.06.18 14:23:10'+time_offset*3600;
   aPrice[595] = 1.26009;

   // ========== 596 ===== 57 ==========
   aPseudoTicket[596] = 298;
   aAction[596] = 1; // OPEN
   aReturn[298] = 596;
   aType[596] = OP_SELL; // SELL
   aTicket[596] = -1; // Ticket given by broker
   aSymbol[596] = "EURUSD";
   aLots[596] = 1.0;
   aDate[596] = D'2012.06.21 18:07:48'+time_offset*3600;
   aPrice[596] = 1.25646;

   // ========== 597 ===== 57 ==========
   aPseudoTicket[597] = 298;
   aAction[597] = 0; // CLOSE
   aType[597] = OP_SELL; // SELL
   aTicket[597] = -1; // Ticket given by broker
   aSymbol[597] = "EURUSD";
   aLots[597] = 1.0;
   aDate[597] = D'2012.06.21 18:16:12'+time_offset*3600;
   aPrice[597] = 1.25611;

   // ========== 598 ===== 56 ==========
   aPseudoTicket[598] = 299;
   aAction[598] = 1; // OPEN
   aReturn[299] = 598;
   aType[598] = OP_SELL; // SELL
   aTicket[598] = -1; // Ticket given by broker
   aSymbol[598] = "EURUSD";
   aLots[598] = 1.0;
   aDate[598] = D'2012.06.22 10:34:45'+time_offset*3600;
   aPrice[598] = 1.25537;

   // ========== 599 ===== 56 ==========
   aPseudoTicket[599] = 299;
   aAction[599] = 0; // CLOSE
   aType[599] = OP_SELL; // SELL
   aTicket[599] = -1; // Ticket given by broker
   aSymbol[599] = "EURUSD";
   aLots[599] = 1.0;
   aDate[599] = D'2012.06.25 05:39:23'+time_offset*3600;
   aPrice[599] = 1.25267;

   // ========== 600 ===== 55 ==========
   aPseudoTicket[600] = 300;
   aAction[600] = 1; // OPEN
   aReturn[300] = 600;
   aType[600] = OP_SELL; // SELL
   aTicket[600] = -1; // Ticket given by broker
   aSymbol[600] = "EURUSD";
   aLots[600] = 1.0;
   aDate[600] = D'2012.06.25 06:37:55'+time_offset*3600;
   aPrice[600] = 1.24993;

   // ========== 601 ===== 54 ==========
   aPseudoTicket[601] = 301;
   aAction[601] = 1; // OPEN
   aReturn[301] = 601;
   aType[601] = OP_SELL; // SELL
   aTicket[601] = -1; // Ticket given by broker
   aSymbol[601] = "EURUSD";
   aLots[601] = 1.0;
   aDate[601] = D'2012.06.25 06:40:47'+time_offset*3600;
   aPrice[601] = 1.25058;

   // ========== 602 ===== 55 ==========
   aPseudoTicket[602] = 300;
   aAction[602] = 0; // CLOSE
   aType[602] = OP_SELL; // SELL
   aTicket[602] = -1; // Ticket given by broker
   aSymbol[602] = "EURUSD";
   aLots[602] = 1.0;
   aDate[602] = D'2012.06.25 09:21:34'+time_offset*3600;
   aPrice[602] = 1.2493;

   // ========== 603 ===== 54 ==========
   aPseudoTicket[603] = 301;
   aAction[603] = 0; // CLOSE
   aType[603] = OP_SELL; // SELL
   aTicket[603] = -1; // Ticket given by broker
   aSymbol[603] = "EURUSD";
   aLots[603] = 1.0;
   aDate[603] = D'2012.06.25 09:25:01'+time_offset*3600;
   aPrice[603] = 1.24917;

   // ========== 604 ===== 52 ==========
   aPseudoTicket[604] = 302;
   aAction[604] = 1; // OPEN
   aReturn[302] = 604;
   aType[604] = OP_SELL; // SELL
   aTicket[604] = -1; // Ticket given by broker
   aSymbol[604] = "EURUSD";
   aLots[604] = 1.0;
   aDate[604] = D'2012.06.26 08:49:15'+time_offset*3600;
   aPrice[604] = 1.2488;

   // ========== 605 ===== 52 ==========
   aPseudoTicket[605] = 302;
   aAction[605] = 0; // CLOSE
   aType[605] = OP_SELL; // SELL
   aTicket[605] = -1; // Ticket given by broker
   aSymbol[605] = "EURUSD";
   aLots[605] = 1.0;
   aDate[605] = D'2012.06.26 09:41:18'+time_offset*3600;
   aPrice[605] = 1.24981;

   // ========== 606 ===== 51 ==========
   aPseudoTicket[606] = 303;
   aAction[606] = 1; // OPEN
   aReturn[303] = 606;
   aType[606] = OP_SELL; // SELL
   aTicket[606] = -1; // Ticket given by broker
   aSymbol[606] = "EURUSD";
   aLots[606] = 1.0;
   aDate[606] = D'2012.06.26 12:18:26'+time_offset*3600;
   aPrice[606] = 1.24614;

   // ========== 607 ===== 51 ==========
   aPseudoTicket[607] = 303;
   aAction[607] = 0; // CLOSE
   aType[607] = OP_SELL; // SELL
   aTicket[607] = -1; // Ticket given by broker
   aSymbol[607] = "EURUSD";
   aLots[607] = 1.0;
   aDate[607] = D'2012.06.26 12:53:23'+time_offset*3600;
   aPrice[607] = 1.24726;

   // ========== 608 ===== 48 ==========
   aPseudoTicket[608] = 304;
   aAction[608] = 1; // OPEN
   aReturn[304] = 608;
   aType[608] = OP_SELL; // SELL
   aTicket[608] = -1; // Ticket given by broker
   aSymbol[608] = "EURUSD";
   aLots[608] = 1.0;
   aDate[608] = D'2012.06.28 08:55:50'+time_offset*3600;
   aPrice[608] = 1.24262;

   // ========== 609 ===== 49 ==========
   aPseudoTicket[609] = 305;
   aAction[609] = 1; // OPEN
   aReturn[305] = 609;
   aType[609] = OP_SELL; // SELL
   aTicket[609] = -1; // Ticket given by broker
   aSymbol[609] = "EURUSD";
   aLots[609] = 1.0;
   aDate[609] = D'2012.06.28 09:07:06'+time_offset*3600;
   aPrice[609] = 1.24323;

   // ========== 610 ===== 50 ==========
   aPseudoTicket[610] = 306;
   aAction[610] = 1; // OPEN
   aReturn[306] = 610;
   aType[610] = OP_SELL; // SELL
   aTicket[610] = -1; // Ticket given by broker
   aSymbol[610] = "EURUSD";
   aLots[610] = 1.0;
   aDate[610] = D'2012.06.28 11:28:22'+time_offset*3600;
   aPrice[610] = 1.24486;

   // ========== 611 ===== 50 ==========
   aPseudoTicket[611] = 306;
   aAction[611] = 0; // CLOSE
   aType[611] = OP_SELL; // SELL
   aTicket[611] = -1; // Ticket given by broker
   aSymbol[611] = "EURUSD";
   aLots[611] = 1.0;
   aDate[611] = D'2012.06.28 11:55:52'+time_offset*3600;
   aPrice[611] = 1.24314;

   // ========== 612 ===== 49 ==========
   aPseudoTicket[612] = 305;
   aAction[612] = 0; // CLOSE
   aType[612] = OP_SELL; // SELL
   aTicket[612] = -1; // Ticket given by broker
   aSymbol[612] = "EURUSD";
   aLots[612] = 1.0;
   aDate[612] = D'2012.06.29 02:49:17'+time_offset*3600;
   aPrice[612] = 1.24716;

   // ========== 613 ===== 48 ==========
   aPseudoTicket[613] = 304;
   aAction[613] = 0; // CLOSE
   aType[613] = OP_SELL; // SELL
   aTicket[613] = -1; // Ticket given by broker
   aSymbol[613] = "EURUSD";
   aLots[613] = 1.0;
   aDate[613] = D'2012.06.29 02:49:21'+time_offset*3600;
   aPrice[613] = 1.24704;

   // ========== 614 ===== 47 ==========
   aPseudoTicket[614] = 307;
   aAction[614] = 1; // OPEN
   aReturn[307] = 614;
   aType[614] = OP_SELL; // SELL
   aTicket[614] = -1; // Ticket given by broker
   aSymbol[614] = "EURUSD";
   aLots[614] = 1.0;
   aDate[614] = D'2012.06.29 03:02:51'+time_offset*3600;
   aPrice[614] = 1.26047;

   // ========== 615 ===== 47 ==========
   aPseudoTicket[615] = 307;
   aAction[615] = 0; // CLOSE
   aType[615] = OP_SELL; // SELL
   aTicket[615] = -1; // Ticket given by broker
   aSymbol[615] = "EURUSD";
   aLots[615] = 1.0;
   aDate[615] = D'2012.06.29 03:03:40'+time_offset*3600;
   aPrice[615] = 1.2585;

   // ========== 616 ===== 46 ==========
   aPseudoTicket[616] = 308;
   aAction[616] = 1; // OPEN
   aReturn[308] = 616;
   aType[616] = OP_BUY; // BUY
   aTicket[616] = -1; // Ticket given by broker
   aSymbol[616] = "EURUSD";
   aLots[616] = 1.0;
   aDate[616] = D'2012.07.02 17:34:16'+time_offset*3600;
   aPrice[616] = 1.25851;

   // ========== 617 ===== 46 ==========
   aPseudoTicket[617] = 308;
   aAction[617] = 0; // CLOSE
   aType[617] = OP_BUY; // BUY
   aTicket[617] = -1; // Ticket given by broker
   aSymbol[617] = "EURUSD";
   aLots[617] = 1.0;
   aDate[617] = D'2012.07.03 04:07:13'+time_offset*3600;
   aPrice[617] = 1.26018;

   // ========== 618 ===== 38 ==========
   aPseudoTicket[618] = 309;
   aAction[618] = 1; // OPEN
   aReturn[309] = 618;
   aType[618] = OP_BUY; // BUY
   aTicket[618] = -1; // Ticket given by broker
   aSymbol[618] = "EURUSD";
   aLots[618] = 1.0;
   aDate[618] = D'2012.07.06 07:02:45'+time_offset*3600;
   aPrice[618] = 1.23711;

   // ========== 619 ===== 38 ==========
   aPseudoTicket[619] = 309;
   aAction[619] = 0; // CLOSE
   aType[619] = OP_BUY; // BUY
   aTicket[619] = -1; // Ticket given by broker
   aSymbol[619] = "EURUSD";
   aLots[619] = 1.0;
   aDate[619] = D'2012.07.06 08:00:08'+time_offset*3600;
   aPrice[619] = 1.2383;

   // ========== 620 ===== 36 ==========
   aPseudoTicket[620] = 310;
   aAction[620] = 1; // OPEN
   aReturn[310] = 620;
   aType[620] = OP_BUY; // BUY
   aTicket[620] = -1; // Ticket given by broker
   aSymbol[620] = "EURUSD";
   aLots[620] = 1.0;
   aDate[620] = D'2012.07.06 12:47:21'+time_offset*3600;
   aPrice[620] = 1.23545;

   // ========== 621 ===== 36 ==========
   aPseudoTicket[621] = 310;
   aAction[621] = 0; // CLOSE
   aType[621] = OP_BUY; // BUY
   aTicket[621] = -1; // Ticket given by broker
   aSymbol[621] = "EURUSD";
   aLots[621] = 1.0;
   aDate[621] = D'2012.07.09 20:32:29'+time_offset*3600;
   aPrice[621] = 1.23193;

   // ========== 622 ===== 35 ==========
   aPseudoTicket[622] = 311;
   aAction[622] = 1; // OPEN
   aReturn[311] = 622;
   aType[622] = OP_SELL; // SELL
   aTicket[622] = -1; // Ticket given by broker
   aSymbol[622] = "EURUSD";
   aLots[622] = 1.0;
   aDate[622] = D'2012.07.09 20:32:34'+time_offset*3600;
   aPrice[622] = 1.23192;

   // ========== 623 ===== 35 ==========
   aPseudoTicket[623] = 311;
   aAction[623] = 0; // CLOSE
   aType[623] = OP_SELL; // SELL
   aTicket[623] = -1; // Ticket given by broker
   aSymbol[623] = "EURUSD";
   aLots[623] = 1.0;
   aDate[623] = D'2012.07.10 00:55:35'+time_offset*3600;
   aPrice[623] = 1.2299;

   // ========== 624 ===== 30 ==========
   aPseudoTicket[624] = 312;
   aAction[624] = 1; // OPEN
   aReturn[312] = 624;
   aType[624] = OP_BUY; // BUY
   aTicket[624] = -1; // Ticket given by broker
   aSymbol[624] = "EURUSD";
   aLots[624] = 1.0;
   aDate[624] = D'2012.07.12 07:19:27'+time_offset*3600;
   aPrice[624] = 1.22236;

   // ========== 625 ===== 31 ==========
   aPseudoTicket[625] = 313;
   aAction[625] = 1; // OPEN
   aReturn[313] = 625;
   aType[625] = OP_BUY; // BUY
   aTicket[625] = -1; // Ticket given by broker
   aSymbol[625] = "EURUSD";
   aLots[625] = 1.0;
   aDate[625] = D'2012.07.12 10:18:38'+time_offset*3600;
   aPrice[625] = 1.22008;

   // ========== 626 ===== 31 ==========
   aPseudoTicket[626] = 313;
   aAction[626] = 0; // CLOSE
   aType[626] = OP_BUY; // BUY
   aTicket[626] = -1; // Ticket given by broker
   aSymbol[626] = "EURUSD";
   aLots[626] = 1.0;
   aDate[626] = D'2012.07.13 03:32:35'+time_offset*3600;
   aPrice[626] = 1.22061;

   // ========== 627 ===== 30 ==========
   aPseudoTicket[627] = 312;
   aAction[627] = 0; // CLOSE
   aType[627] = OP_BUY; // BUY
   aTicket[627] = -1; // Ticket given by broker
   aSymbol[627] = "EURUSD";
   aLots[627] = 1.0;
   aDate[627] = D'2012.07.13 14:01:30'+time_offset*3600;
   aPrice[627] = 1.22336;

   // ========== 628 ===== 28 ==========
   aPseudoTicket[628] = 314;
   aAction[628] = 1; // OPEN
   aReturn[314] = 628;
   aType[628] = OP_SELL; // SELL
   aTicket[628] = -1; // Ticket given by broker
   aSymbol[628] = "EURUSD";
   aLots[628] = 1.0;
   aDate[628] = D'2012.07.16 12:03:37'+time_offset*3600;
   aPrice[628] = 1.2186;

   // ========== 629 ===== 28 ==========
   aPseudoTicket[629] = 314;
   aAction[629] = 0; // CLOSE
   aType[629] = OP_SELL; // SELL
   aTicket[629] = -1; // Ticket given by broker
   aSymbol[629] = "EURUSD";
   aLots[629] = 1.0;
   aDate[629] = D'2012.07.16 12:15:35'+time_offset*3600;
   aPrice[629] = 1.2179;

   // ========== 630 ===== 27 ==========
   aPseudoTicket[630] = 315;
   aAction[630] = 1; // OPEN
   aReturn[315] = 630;
   aType[630] = OP_BUY; // BUY
   aTicket[630] = -1; // Ticket given by broker
   aSymbol[630] = "EURUSD";
   aLots[630] = 1.0;
   aDate[630] = D'2012.07.17 14:33:18'+time_offset*3600;
   aPrice[630] = 1.22127;

   // ========== 631 ===== 27 ==========
   aPseudoTicket[631] = 315;
   aAction[631] = 0; // CLOSE
   aType[631] = OP_BUY; // BUY
   aTicket[631] = -1; // Ticket given by broker
   aSymbol[631] = "EURUSD";
   aLots[631] = 1.0;
   aDate[631] = D'2012.07.17 15:04:11'+time_offset*3600;
   aPrice[631] = 1.22193;

   // ========== 632 ===== 26 ==========
   aPseudoTicket[632] = 316;
   aAction[632] = 1; // OPEN
   aReturn[316] = 632;
   aType[632] = OP_SELL; // SELL
   aTicket[632] = -1; // Ticket given by broker
   aSymbol[632] = "EURUSD";
   aLots[632] = 1.0;
   aDate[632] = D'2012.07.18 10:00:10'+time_offset*3600;
   aPrice[632] = 1.22333;

   // ========== 633 ===== 26 ==========
   aPseudoTicket[633] = 316;
   aAction[633] = 0; // CLOSE
   aType[633] = OP_SELL; // SELL
   aTicket[633] = -1; // Ticket given by broker
   aSymbol[633] = "EURUSD";
   aLots[633] = 1.0;
   aDate[633] = D'2012.07.18 13:11:18'+time_offset*3600;
   aPrice[633] = 1.22222;

   // ========== 634 ===== 14 ==========
   aPseudoTicket[634] = 317;
   aAction[634] = 1; // OPEN
   aReturn[317] = 634;
   aType[634] = OP_BUY; // BUY
   aTicket[634] = -1; // Ticket given by broker
   aSymbol[634] = "EURUSD";
   aLots[634] = 1.0;
   aDate[634] = D'2012.08.02 11:52:16'+time_offset*3600;
   aPrice[634] = 1.22935;

   // ========== 635 ===== 14 ==========
   aPseudoTicket[635] = 317;
   aAction[635] = 0; // CLOSE
   aType[635] = OP_BUY; // BUY
   aTicket[635] = -1; // Ticket given by broker
   aSymbol[635] = "EURUSD";
   aLots[635] = 1.0;
   aDate[635] = D'2012.08.02 12:02:39'+time_offset*3600;
   aPrice[635] = 1.2312;

   // ========== 636 ===== 7 ==========
   aPseudoTicket[636] = 318;
   aAction[636] = 1; // OPEN
   aReturn[318] = 636;
   aType[636] = OP_SELL; // SELL
   aTicket[636] = -1; // Ticket given by broker
   aSymbol[636] = "EURUSD";
   aLots[636] = 1.0;
   aDate[636] = D'2012.08.02 18:27:57'+time_offset*3600;
   aPrice[636] = 1.21686;

   // ========== 637 ===== 8 ==========
   aPseudoTicket[637] = 319;
   aAction[637] = 1; // OPEN
   aReturn[319] = 637;
   aType[637] = OP_SELL; // SELL
   aTicket[637] = -1; // Ticket given by broker
   aSymbol[637] = "EURUSD";
   aLots[637] = 1.0;
   aDate[637] = D'2012.08.03 07:34:24'+time_offset*3600;
   aPrice[637] = 1.22034;

   // ========== 638 ===== 9 ==========
   aPseudoTicket[638] = 320;
   aAction[638] = 1; // OPEN
   aReturn[320] = 638;
   aType[638] = OP_SELL; // SELL
   aTicket[638] = -1; // Ticket given by broker
   aSymbol[638] = "EURUSD";
   aLots[638] = 1.0;
   aDate[638] = D'2012.08.03 09:25:37'+time_offset*3600;
   aPrice[638] = 1.22205;

   // ========== 639 ===== 10 ==========
   aPseudoTicket[639] = 321;
   aAction[639] = 1; // OPEN
   aReturn[321] = 639;
   aType[639] = OP_SELL; // SELL
   aTicket[639] = -1; // Ticket given by broker
   aSymbol[639] = "EURUSD";
   aLots[639] = 1.0;
   aDate[639] = D'2012.08.03 09:27:06'+time_offset*3600;
   aPrice[639] = 1.22294;

   // ========== 640 ===== 10 ==========
   aPseudoTicket[640] = 321;
   aAction[640] = 0; // CLOSE
   aType[640] = OP_SELL; // SELL
   aTicket[640] = -1; // Ticket given by broker
   aSymbol[640] = "EURUSD";
   aLots[640] = 1.0;
   aDate[640] = D'2012.08.03 12:06:39'+time_offset*3600;
   aPrice[640] = 1.22532;

   // ========== 641 ===== 9 ==========
   aPseudoTicket[641] = 320;
   aAction[641] = 0; // CLOSE
   aType[641] = OP_SELL; // SELL
   aTicket[641] = -1; // Ticket given by broker
   aSymbol[641] = "EURUSD";
   aLots[641] = 1.0;
   aDate[641] = D'2012.08.03 12:06:44'+time_offset*3600;
   aPrice[641] = 1.22516;

   // ========== 642 ===== 8 ==========
   aPseudoTicket[642] = 319;
   aAction[642] = 0; // CLOSE
   aType[642] = OP_SELL; // SELL
   aTicket[642] = -1; // Ticket given by broker
   aSymbol[642] = "EURUSD";
   aLots[642] = 1.0;
   aDate[642] = D'2012.08.03 12:07:01'+time_offset*3600;
   aPrice[642] = 1.22524;

   // ========== 643 ===== 7 ==========
   aPseudoTicket[643] = 318;
   aAction[643] = 0; // CLOSE
   aType[643] = OP_SELL; // SELL
   aTicket[643] = -1; // Ticket given by broker
   aSymbol[643] = "EURUSD";
   aLots[643] = 1.0;
   aDate[643] = D'2012.08.03 12:08:59'+time_offset*3600;
   aPrice[643] = 1.22499;

   // ========== 644 ===== 2 ==========
   aPseudoTicket[644] = 322;
   aAction[644] = 1; // OPEN
   aReturn[322] = 644;
   aType[644] = OP_SELL; // SELL
   aTicket[644] = -1; // Ticket given by broker
   aSymbol[644] = "EURUSD";
   aLots[644] = 1.0;
   aDate[644] = D'2012.08.03 14:30:51'+time_offset*3600;
   aPrice[644] = 1.23408;

   // ========== 645 ===== 3 ==========
   aPseudoTicket[645] = 323;
   aAction[645] = 1; // OPEN
   aReturn[323] = 645;
   aType[645] = OP_SELL; // SELL
   aTicket[645] = -1; // Ticket given by broker
   aSymbol[645] = "EURUSD";
   aLots[645] = 1.0;
   aDate[645] = D'2012.08.03 15:06:12'+time_offset*3600;
   aPrice[645] = 1.23447;

   // ========== 646 ===== 4 ==========
   aPseudoTicket[646] = 324;
   aAction[646] = 1; // OPEN
   aReturn[324] = 646;
   aType[646] = OP_SELL; // SELL
   aTicket[646] = -1; // Ticket given by broker
   aSymbol[646] = "EURUSD";
   aLots[646] = 1.0;
   aDate[646] = D'2012.08.03 15:14:01'+time_offset*3600;
   aPrice[646] = 1.23541;

   // ========== 647 ===== 5 ==========
   aPseudoTicket[647] = 325;
   aAction[647] = 1; // OPEN
   aReturn[325] = 647;
   aType[647] = OP_SELL; // SELL
   aTicket[647] = -1; // Ticket given by broker
   aSymbol[647] = "EURUSD";
   aLots[647] = 1.0;
   aDate[647] = D'2012.08.03 15:19:08'+time_offset*3600;
   aPrice[647] = 1.23645;

   // ========== 648 ===== 5 ==========
   aPseudoTicket[648] = 325;
   aAction[648] = 0; // CLOSE
   aType[648] = OP_SELL; // SELL
   aTicket[648] = -1; // Ticket given by broker
   aSymbol[648] = "EURUSD";
   aLots[648] = 1.0;
   aDate[648] = D'2012.08.06 07:04:21'+time_offset*3600;
   aPrice[648] = 1.23689;

   // ========== 649 ===== 4 ==========
   aPseudoTicket[649] = 324;
   aAction[649] = 0; // CLOSE
   aType[649] = OP_SELL; // SELL
   aTicket[649] = -1; // Ticket given by broker
   aSymbol[649] = "EURUSD";
   aLots[649] = 1.0;
   aDate[649] = D'2012.08.06 07:04:25'+time_offset*3600;
   aPrice[649] = 1.23689;

   // ========== 650 ===== 3 ==========
   aPseudoTicket[650] = 323;
   aAction[650] = 0; // CLOSE
   aType[650] = OP_SELL; // SELL
   aTicket[650] = -1; // Ticket given by broker
   aSymbol[650] = "EURUSD";
   aLots[650] = 1.0;
   aDate[650] = D'2012.08.06 07:22:13'+time_offset*3600;
   aPrice[650] = 1.23653;

   // ========== 651 ===== 2 ==========
   aPseudoTicket[651] = 322;
   aAction[651] = 0; // CLOSE
   aType[651] = OP_SELL; // SELL
   aTicket[651] = -1; // Ticket given by broker
   aSymbol[651] = "EURUSD";
   aLots[651] = 1.0;
   aDate[651] = D'2012.08.06 07:39:13'+time_offset*3600;
   aPrice[651] = 1.2356;
}
