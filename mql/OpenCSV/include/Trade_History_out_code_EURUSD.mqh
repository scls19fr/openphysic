//+------------------------------------------------------------------+
//|include/Trade_History_out_code_EURUSD.mqh
//|                                 Copyright (c) 2012, Femto Trader |
//|                        http://sites.google.com/site/femtotrader/ |
//+------------------------------------------------------------------+
#property copyright "Copyright (c) 2012, Femto Trader"
#property link      "http://sites.google.com/site/femtotrader/"

int NbOrdersInFile = 326;

int aType[326];
string aSymbol[326];
double aLots[326];
datetime aDateOpen[326];
double aPriceOpen[326];
datetime aDateClose[326];
double aPriceClose[326];

int time_offset = 3;

void init_tab() {

   // ========== 0 ===== 836 ==========
   aType[0] = OP_SELL;
   aSymbol[0] = "EURUSD";
   aLots[0] = 1.0;
   aDateOpen[0] = D'2011.05.24 05:24:00'+time_offset*3600;
   aPriceOpen[0] = 1.40736;
   aDateClose[0] = D'2011.05.25 06:30:32'+time_offset*3600;
   aPriceClose[0] = 1.40444;

   // ========== 1 ===== 831 ==========
   aType[1] = OP_SELL;
   aSymbol[1] = "EURUSD";
   aLots[1] = 1.0;
   aDateOpen[1] = D'2011.06.09 12:48:24'+time_offset*3600;
   aPriceOpen[1] = 1.45446;
   aDateClose[1] = D'2011.06.09 13:19:05'+time_offset*3600;
   aPriceClose[1] = 1.45;

   // ========== 2 ===== 830 ==========
   aType[2] = OP_SELL;
   aSymbol[2] = "EURUSD";
   aLots[2] = 1.0;
   aDateOpen[2] = D'2011.06.10 01:05:56'+time_offset*3600;
   aPriceOpen[2] = 1.45337;
   aDateClose[2] = D'2011.06.10 05:04:16'+time_offset*3600;
   aPriceClose[2] = 1.44906;

   // ========== 3 ===== 826 ==========
   aType[3] = OP_SELL;
   aSymbol[3] = "EURUSD";
   aLots[3] = 1.0;
   aDateOpen[3] = D'2011.06.14 05:50:57'+time_offset*3600;
   aPriceOpen[3] = 1.44354;
   aDateClose[3] = D'2011.06.15 01:46:22'+time_offset*3600;
   aPriceClose[3] = 1.44148;

   // ========== 4 ===== 825 ==========
   aType[4] = OP_SELL;
   aSymbol[4] = "EURUSD";
   aLots[4] = 1.0;
   aDateOpen[4] = D'2011.06.16 22:24:17'+time_offset*3600;
   aPriceOpen[4] = 1.42035;
   aDateClose[4] = D'2011.06.17 04:30:05'+time_offset*3600;
   aPriceClose[4] = 1.41487;

   // ========== 5 ===== 823 ==========
   aType[5] = OP_BUY;
   aSymbol[5] = "EURUSD";
   aLots[5] = 1.0;
   aDateOpen[5] = D'2011.06.20 05:41:36'+time_offset*3600;
   aPriceOpen[5] = 1.42279;
   aDateClose[5] = D'2011.06.20 10:52:15'+time_offset*3600;
   aPriceClose[5] = 1.42331;

   // ========== 6 ===== 817 ==========
   aType[6] = OP_BUY;
   aSymbol[6] = "EURUSD";
   aLots[6] = 1.0;
   aDateOpen[6] = D'2011.06.23 09:36:16'+time_offset*3600;
   aPriceOpen[6] = 1.42506;
   aDateClose[6] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPriceClose[6] = 1.4182;

   // ========== 7 ===== 816 ==========
   aType[7] = OP_BUY;
   aSymbol[7] = "EURUSD";
   aLots[7] = 1.0;
   aDateOpen[7] = D'2011.06.23 12:17:42'+time_offset*3600;
   aPriceOpen[7] = 1.421;
   aDateClose[7] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPriceClose[7] = 1.4182;

   // ========== 8 ===== 818 ==========
   aType[8] = OP_BUY;
   aSymbol[8] = "EURUSD";
   aLots[8] = 1.0;
   aDateOpen[8] = D'2011.06.23 14:26:22'+time_offset*3600;
   aPriceOpen[8] = 1.41495;
   aDateClose[8] = D'2011.06.23 16:57:54'+time_offset*3600;
   aPriceClose[8] = 1.4182;

   // ========== 9 ===== 814 ==========
   aType[9] = OP_SELL;
   aSymbol[9] = "EURUSD";
   aLots[9] = 1.0;
   aDateOpen[9] = D'2011.06.23 19:02:08'+time_offset*3600;
   aPriceOpen[9] = 1.4225;
   aDateClose[9] = D'2011.06.24 08:18:48'+time_offset*3600;
   aPriceClose[9] = 1.42449;

   // ========== 10 ===== 813 ==========
   aType[10] = OP_SELL;
   aSymbol[10] = "EURUSD";
   aLots[10] = 1.0;
   aDateOpen[10] = D'2011.06.24 10:19:42'+time_offset*3600;
   aPriceOpen[10] = 1.42233;
   aDateClose[10] = D'2011.06.24 10:59:16'+time_offset*3600;
   aPriceClose[10] = 1.4203;

   // ========== 11 ===== 811 ==========
   aType[11] = OP_SELL;
   aSymbol[11] = "EURUSD";
   aLots[11] = 1.0;
   aDateOpen[11] = D'2011.06.27 22:38:34'+time_offset*3600;
   aPriceOpen[11] = 1.42979;
   aDateClose[11] = D'2011.06.28 03:42:03'+time_offset*3600;
   aPriceClose[11] = 1.42979;

   // ========== 12 ===== 804 ==========
   aType[12] = OP_BUY;
   aSymbol[12] = "EURUSD";
   aLots[12] = 1.0;
   aDateOpen[12] = D'2011.07.06 10:50:36'+time_offset*3600;
   aPriceOpen[12] = 1.43404;
   aDateClose[12] = D'2011.07.06 23:46:26'+time_offset*3600;
   aPriceClose[12] = 1.43262;

   // ========== 13 ===== 803 ==========
   aType[13] = OP_SELL;
   aSymbol[13] = "EURUSD";
   aLots[13] = 1.0;
   aDateOpen[13] = D'2011.07.07 06:50:26'+time_offset*3600;
   aPriceOpen[13] = 1.43334;
   aDateClose[13] = D'2011.07.07 08:10:29'+time_offset*3600;
   aPriceClose[13] = 1.43022;

   // ========== 14 ===== 797 ==========
   aType[14] = OP_SELL;
   aSymbol[14] = "EURUSD";
   aLots[14] = 1.0;
   aDateOpen[14] = D'2011.07.12 18:11:30'+time_offset*3600;
   aPriceOpen[14] = 1.4037;
   aDateClose[14] = D'2011.07.12 19:26:40'+time_offset*3600;
   aPriceClose[14] = 1.3987;

   // ========== 15 ===== 792 ==========
   aType[15] = OP_SELL;
   aSymbol[15] = "EURUSD";
   aLots[15] = 1.0;
   aDateOpen[15] = D'2011.07.13 09:35:48'+time_offset*3600;
   aPriceOpen[15] = 1.40938;
   aDateClose[15] = D'2011.07.14 03:23:03'+time_offset*3600;
   aPriceClose[15] = 1.42222;

   // ========== 16 ===== 795 ==========
   aType[16] = OP_SELL;
   aSymbol[16] = "EURUSD";
   aLots[16] = 1.0;
   aDateOpen[16] = D'2011.07.13 10:03:16'+time_offset*3600;
   aPriceOpen[16] = 1.41012;
   aDateClose[16] = D'2011.07.13 11:29:13'+time_offset*3600;
   aPriceClose[16] = 1.40689;

   // ========== 17 ===== 789 ==========
   aType[17] = OP_SELL;
   aSymbol[17] = "EURUSD";
   aLots[17] = 1.0;
   aDateOpen[17] = D'2011.07.13 22:10:39'+time_offset*3600;
   aPriceOpen[17] = 1.4222;
   aDateClose[17] = D'2011.07.14 06:00:49'+time_offset*3600;
   aPriceClose[17] = 1.41805;

   // ========== 18 ===== 790 ==========
   aType[18] = OP_SELL;
   aSymbol[18] = "EURUSD";
   aLots[18] = 1.0;
   aDateOpen[18] = D'2011.07.13 23:43:09'+time_offset*3600;
   aPriceOpen[18] = 1.42465;
   aDateClose[18] = D'2011.07.14 05:58:14'+time_offset*3600;
   aPriceClose[18] = 1.41961;

   // ========== 19 ===== 791 ==========
   aType[19] = OP_SELL;
   aSymbol[19] = "EURUSD";
   aLots[19] = 1.0;
   aDateOpen[19] = D'2011.07.13 23:53:59'+time_offset*3600;
   aPriceOpen[19] = 1.4272;
   aDateClose[19] = D'2011.07.14 04:01:49'+time_offset*3600;
   aPriceClose[19] = 1.42134;

   // ========== 20 ===== 788 ==========
   aType[20] = OP_BUY;
   aSymbol[20] = "EURUSD";
   aLots[20] = 1.0;
   aDateOpen[20] = D'2011.07.14 06:06:40'+time_offset*3600;
   aPriceOpen[20] = 1.41784;
   aDateClose[20] = D'2011.07.14 07:03:06'+time_offset*3600;
   aPriceClose[20] = 1.41847;

   // ========== 21 ===== 780 ==========
   aType[21] = OP_BUY;
   aSymbol[21] = "EURUSD";
   aLots[21] = 1.0;
   aDateOpen[21] = D'2011.07.19 07:20:59'+time_offset*3600;
   aPriceOpen[21] = 1.41482;
   aDateClose[21] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPriceClose[21] = 1.412;

   // ========== 22 ===== 779 ==========
   aType[22] = OP_BUY;
   aSymbol[22] = "EURUSD";
   aLots[22] = 1.0;
   aDateOpen[22] = D'2011.07.19 11:19:28'+time_offset*3600;
   aPriceOpen[22] = 1.41682;
   aDateClose[22] = D'2011.07.19 18:18:10'+time_offset*3600;
   aPriceClose[22] = 1.412;

   // ========== 23 ===== 777 ==========
   aType[23] = OP_BUY;
   aSymbol[23] = "EURUSD";
   aLots[23] = 1.0;
   aDateOpen[23] = D'2011.07.20 06:35:58'+time_offset*3600;
   aPriceOpen[23] = 1.41849;
   aDateClose[23] = D'2011.07.20 07:16:27'+time_offset*3600;
   aPriceClose[23] = 1.4164;

   // ========== 24 ===== 774 ==========
   aType[24] = OP_BUY;
   aSymbol[24] = "EURUSD";
   aLots[24] = 1.0;
   aDateOpen[24] = D'2011.07.21 09:06:48'+time_offset*3600;
   aPriceOpen[24] = 1.4195;
   aDateClose[24] = D'2011.07.21 11:35:33'+time_offset*3600;
   aPriceClose[24] = 1.41811;

   // ========== 25 ===== 773 ==========
   aType[25] = OP_SELL;
   aSymbol[25] = "EURUSD";
   aLots[25] = 1.0;
   aDateOpen[25] = D'2011.07.21 11:39:01'+time_offset*3600;
   aPriceOpen[25] = 1.41763;
   aDateClose[25] = D'2011.07.21 12:12:40'+time_offset*3600;
   aPriceClose[25] = 1.42214;

   // ========== 26 ===== 772 ==========
   aType[26] = OP_BUY;
   aSymbol[26] = "EURUSD";
   aLots[26] = 1.0;
   aDateOpen[26] = D'2011.07.21 13:24:41'+time_offset*3600;
   aPriceOpen[26] = 1.43315;
   aDateClose[26] = D'2011.07.21 21:11:47'+time_offset*3600;
   aPriceClose[26] = 1.44305;

   // ========== 27 ===== 771 ==========
   aType[27] = OP_BUY;
   aSymbol[27] = "EURUSD";
   aLots[27] = 1.0;
   aDateOpen[27] = D'2011.07.22 02:26:05'+time_offset*3600;
   aPriceOpen[27] = 1.43888;
   aDateClose[27] = D'2011.07.22 07:33:02'+time_offset*3600;
   aPriceClose[27] = 1.44238;

   // ========== 28 ===== 768 ==========
   aType[28] = OP_BUY;
   aSymbol[28] = "EURUSD";
   aLots[28] = 1.0;
   aDateOpen[28] = D'2011.07.22 11:56:02'+time_offset*3600;
   aPriceOpen[28] = 1.4384;
   aDateClose[28] = D'2011.07.24 21:05:26'+time_offset*3600;
   aPriceClose[28] = 1.4387;

   // ========== 29 ===== 769 ==========
   aType[29] = OP_BUY;
   aSymbol[29] = "EURUSD";
   aLots[29] = 1.0;
   aDateOpen[29] = D'2011.07.22 13:46:17'+time_offset*3600;
   aPriceOpen[29] = 1.434;
   aDateClose[29] = D'2011.07.24 21:01:28'+time_offset*3600;
   aPriceClose[29] = 1.4386;

   // ========== 30 ===== 766 ==========
   aType[30] = OP_BUY;
   aSymbol[30] = "EURUSD";
   aLots[30] = 1.0;
   aDateOpen[30] = D'2011.07.25 07:07:10'+time_offset*3600;
   aPriceOpen[30] = 1.43508;
   aDateClose[30] = D'2011.07.26 06:50:21'+time_offset*3600;
   aPriceClose[30] = 1.45126;

   // ========== 31 ===== 765 ==========
   aType[31] = OP_BUY;
   aSymbol[31] = "EURUSD";
   aLots[31] = 1.0;
   aDateOpen[31] = D'2011.07.26 09:07:28'+time_offset*3600;
   aPriceOpen[31] = 1.44751;
   aDateClose[31] = D'2011.07.26 12:08:02'+time_offset*3600;
   aPriceClose[31] = 1.44765;

   // ========== 32 ===== 764 ==========
   aType[32] = OP_BUY;
   aSymbol[32] = "EURUSD";
   aLots[32] = 1.0;
   aDateOpen[32] = D'2011.07.26 12:07:54'+time_offset*3600;
   aPriceOpen[32] = 1.44781;
   aDateClose[32] = D'2011.07.26 12:08:46'+time_offset*3600;
   aPriceClose[32] = 1.44788;

   // ========== 33 ===== 763 ==========
   aType[33] = OP_BUY;
   aSymbol[33] = "EURUSD";
   aLots[33] = 1.0;
   aDateOpen[33] = D'2011.07.26 12:09:21'+time_offset*3600;
   aPriceOpen[33] = 1.4479;
   aDateClose[33] = D'2011.07.26 12:09:49'+time_offset*3600;
   aPriceClose[33] = 1.44759;

   // ========== 34 ===== 762 ==========
   aType[34] = OP_SELL;
   aSymbol[34] = "EURUSD";
   aLots[34] = 1.0;
   aDateOpen[34] = D'2011.07.26 12:09:54'+time_offset*3600;
   aPriceOpen[34] = 1.44753;
   aDateClose[34] = D'2011.07.26 12:10:12'+time_offset*3600;
   aPriceClose[34] = 1.44773;

   // ========== 35 ===== 761 ==========
   aType[35] = OP_BUY;
   aSymbol[35] = "EURUSD";
   aLots[35] = 1.0;
   aDateOpen[35] = D'2011.07.26 12:10:19'+time_offset*3600;
   aPriceOpen[35] = 1.44774;
   aDateClose[35] = D'2011.07.26 12:10:29'+time_offset*3600;
   aPriceClose[35] = 1.44776;

   // ========== 36 ===== 760 ==========
   aType[36] = OP_BUY;
   aSymbol[36] = "EURUSD";
   aLots[36] = 1.0;
   aDateOpen[36] = D'2011.07.26 13:01:13'+time_offset*3600;
   aPriceOpen[36] = 1.44681;
   aDateClose[36] = D'2011.07.26 18:44:45'+time_offset*3600;
   aPriceClose[36] = 1.45133;

   // ========== 37 ===== 759 ==========
   aType[37] = OP_BUY;
   aSymbol[37] = "EURUSD";
   aLots[37] = 1.0;
   aDateOpen[37] = D'2011.07.27 11:32:30'+time_offset*3600;
   aPriceOpen[37] = 1.44602;
   aDateClose[37] = D'2011.07.27 15:10:41'+time_offset*3600;
   aPriceClose[37] = 1.436;

   // ========== 38 ===== 758 ==========
   aType[38] = OP_BUY;
   aSymbol[38] = "EURUSD";
   aLots[38] = 1.0;
   aDateOpen[38] = D'2011.07.27 16:09:51'+time_offset*3600;
   aPriceOpen[38] = 1.434;
   aDateClose[38] = D'2011.07.28 04:34:21'+time_offset*3600;
   aPriceClose[38] = 1.43607;

   // ========== 39 ===== 756 ==========
   aType[39] = OP_SELL;
   aSymbol[39] = "EURUSD";
   aLots[39] = 1.0;
   aDateOpen[39] = D'2011.07.28 09:53:06'+time_offset*3600;
   aPriceOpen[39] = 1.43234;
   aDateClose[39] = D'2011.07.29 02:31:19'+time_offset*3600;
   aPriceClose[39] = 1.429;

   // ========== 40 ===== 749 ==========
   aType[40] = OP_SELL;
   aSymbol[40] = "EURUSD";
   aLots[40] = 1.0;
   aDateOpen[40] = D'2011.08.01 09:33:28'+time_offset*3600;
   aPriceOpen[40] = 1.443;
   aDateClose[40] = D'2011.08.01 14:05:37'+time_offset*3600;
   aPriceClose[40] = 1.42876;

   // ========== 41 ===== 747 ==========
   aType[41] = OP_SELL;
   aSymbol[41] = "EURUSD";
   aLots[41] = 1.0;
   aDateOpen[41] = D'2011.08.02 00:31:44'+time_offset*3600;
   aPriceOpen[41] = 1.42684;
   aDateClose[41] = D'2011.08.02 06:29:43'+time_offset*3600;
   aPriceClose[41] = 1.42419;

   // ========== 42 ===== 746 ==========
   aType[42] = OP_SELL;
   aSymbol[42] = "EURUSD";
   aLots[42] = 1.0;
   aDateOpen[42] = D'2011.08.02 09:26:21'+time_offset*3600;
   aPriceOpen[42] = 1.41713;
   aDateClose[42] = D'2011.08.02 12:32:15'+time_offset*3600;
   aPriceClose[42] = 1.41688;

   // ========== 43 ===== 734 ==========
   aType[43] = OP_BUY;
   aSymbol[43] = "EURUSD";
   aLots[43] = 1.0;
   aDateOpen[43] = D'2011.08.04 23:41:13'+time_offset*3600;
   aPriceOpen[43] = 1.4073;
   aDateClose[43] = D'2011.08.05 02:01:11'+time_offset*3600;
   aPriceClose[43] = 1.41058;

   // ========== 44 ===== 732 ==========
   aType[44] = OP_SELL;
   aSymbol[44] = "EURUSD";
   aLots[44] = 1.0;
   aDateOpen[44] = D'2011.08.05 07:27:46'+time_offset*3600;
   aPriceOpen[44] = 1.4155;
   aDateClose[44] = D'2011.08.05 07:41:04'+time_offset*3600;
   aPriceClose[44] = 1.41435;

   // ========== 45 ===== 730 ==========
   aType[45] = OP_SELL;
   aSymbol[45] = "EURUSD";
   aLots[45] = 1.0;
   aDateOpen[45] = D'2011.08.05 09:20:21'+time_offset*3600;
   aPriceOpen[45] = 1.41623;
   aDateClose[45] = D'2011.08.05 10:03:22'+time_offset*3600;
   aPriceClose[45] = 1.41301;

   // ========== 46 ===== 729 ==========
   aType[46] = OP_SELL;
   aSymbol[46] = "EURUSD";
   aLots[46] = 1.0;
   aDateOpen[46] = D'2011.08.05 11:15:11'+time_offset*3600;
   aPriceOpen[46] = 1.41649;
   aDateClose[46] = D'2011.08.05 13:20:52'+time_offset*3600;
   aPriceClose[46] = 1.42;

   // ========== 47 ===== 724 ==========
   aType[47] = OP_BUY;
   aSymbol[47] = "EURUSD";
   aLots[47] = 1.0;
   aDateOpen[47] = D'2011.08.05 16:39:23'+time_offset*3600;
   aPriceOpen[47] = 1.42395;
   aDateClose[47] = D'2011.08.07 21:16:44'+time_offset*3600;
   aPriceClose[47] = 1.43911;

   // ========== 48 ===== 723 ==========
   aType[48] = OP_BUY;
   aSymbol[48] = "EURUSD";
   aLots[48] = 1.0;
   aDateOpen[48] = D'2011.08.07 22:58:42'+time_offset*3600;
   aPriceOpen[48] = 1.43;
   aDateClose[48] = D'2011.08.08 01:12:04'+time_offset*3600;
   aPriceClose[48] = 1.4351;

   // ========== 49 ===== 715 ==========
   aType[49] = OP_BUY;
   aSymbol[49] = "EURUSD";
   aLots[49] = 1.0;
   aDateOpen[49] = D'2011.08.09 23:47:00'+time_offset*3600;
   aPriceOpen[49] = 1.43699;
   aDateClose[49] = D'2011.08.10 09:40:03'+time_offset*3600;
   aPriceClose[49] = 1.4384;

   // ========== 50 ===== 712 ==========
   aType[50] = OP_SELL;
   aSymbol[50] = "EURUSD";
   aLots[50] = 1.0;
   aDateOpen[50] = D'2011.08.10 12:51:52'+time_offset*3600;
   aPriceOpen[50] = 1.43023;
   aDateClose[50] = D'2011.08.10 22:20:12'+time_offset*3600;
   aPriceClose[50] = 1.4146;

   // ========== 51 ===== 709 ==========
   aType[51] = OP_SELL;
   aSymbol[51] = "EURUSD";
   aLots[51] = 1.0;
   aDateOpen[51] = D'2011.08.11 01:48:26'+time_offset*3600;
   aPriceOpen[51] = 1.421;
   aDateClose[51] = D'2011.08.11 10:03:13'+time_offset*3600;
   aPriceClose[51] = 1.41711;

   // ========== 52 ===== 708 ==========
   aType[52] = OP_SELL;
   aSymbol[52] = "EURUSD";
   aLots[52] = 1.0;
   aDateOpen[52] = D'2011.08.11 11:42:13'+time_offset*3600;
   aPriceOpen[52] = 1.41499;
   aDateClose[52] = D'2011.08.11 13:00:36'+time_offset*3600;
   aPriceClose[52] = 1.41671;

   // ========== 53 ===== 706 ==========
   aType[53] = OP_SELL;
   aSymbol[53] = "EURUSD";
   aLots[53] = 1.0;
   aDateOpen[53] = D'2011.08.12 07:11:56'+time_offset*3600;
   aPriceOpen[53] = 1.41596;
   aDateClose[53] = D'2011.08.12 07:32:55'+time_offset*3600;
   aPriceClose[53] = 1.41792;

   // ========== 54 ===== 698 ==========
   aType[54] = OP_BUY;
   aSymbol[54] = "EURUSD";
   aLots[54] = 1.0;
   aDateOpen[54] = D'2011.08.15 12:55:01'+time_offset*3600;
   aPriceOpen[54] = 1.43703;
   aDateClose[54] = D'2011.08.17 07:06:17'+time_offset*3600;
   aPriceClose[54] = 1.435;

   // ========== 55 ===== 700 ==========
   aType[55] = OP_BUY;
   aSymbol[55] = "EURUSD";
   aLots[55] = 1.0;
   aDateOpen[55] = D'2011.08.16 05:41:18'+time_offset*3600;
   aPriceOpen[55] = 1.44165;
   aDateClose[55] = D'2011.08.16 13:53:55'+time_offset*3600;
   aPriceClose[55] = 1.4389;

   // ========== 56 ===== 697 ==========
   aType[56] = OP_SELL;
   aSymbol[56] = "EURUSD";
   aLots[56] = 1.0;
   aDateOpen[56] = D'2011.08.17 07:07:00'+time_offset*3600;
   aPriceOpen[56] = 1.43362;
   aDateClose[56] = D'2011.08.17 07:27:32'+time_offset*3600;
   aPriceClose[56] = 1.438;

   // ========== 57 ===== 696 ==========
   aType[57] = OP_BUY;
   aSymbol[57] = "EURUSD";
   aLots[57] = 1.0;
   aDateOpen[57] = D'2011.08.17 08:06:25'+time_offset*3600;
   aPriceOpen[57] = 1.44041;
   aDateClose[57] = D'2011.08.17 15:16:27'+time_offset*3600;
   aPriceClose[57] = 1.44327;

   // ========== 58 ===== 694 ==========
   aType[58] = OP_BUY;
   aSymbol[58] = "EURUSD";
   aLots[58] = 1.0;
   aDateOpen[58] = D'2011.08.17 15:36:51'+time_offset*3600;
   aPriceOpen[58] = 1.44309;
   aDateClose[58] = D'2011.08.18 01:16:14'+time_offset*3600;
   aPriceClose[58] = 1.44;

   // ========== 59 ===== 693 ==========
   aType[59] = OP_BUY;
   aSymbol[59] = "EURUSD";
   aLots[59] = 1.0;
   aDateOpen[59] = D'2011.08.18 00:03:13'+time_offset*3600;
   aPriceOpen[59] = 1.44142;
   aDateClose[59] = D'2011.08.18 06:07:35'+time_offset*3600;
   aPriceClose[59] = 1.439;

   // ========== 60 ===== 689 ==========
   aType[60] = OP_SELL;
   aSymbol[60] = "EURUSD";
   aLots[60] = 1.0;
   aDateOpen[60] = D'2011.08.18 14:50:48'+time_offset*3600;
   aPriceOpen[60] = 1.43041;
   aDateClose[60] = D'2011.08.19 00:14:43'+time_offset*3600;
   aPriceClose[60] = 1.43028;

   // ========== 61 ===== 686 ==========
   aType[61] = OP_SELL;
   aSymbol[61] = "EURUSD";
   aLots[61] = 1.0;
   aDateOpen[61] = D'2011.08.19 02:02:11'+time_offset*3600;
   aPriceOpen[61] = 1.4314;
   aDateClose[61] = D'2011.08.19 09:03:48'+time_offset*3600;
   aPriceClose[61] = 1.43324;

   // ========== 62 ===== 687 ==========
   aType[62] = OP_SELL;
   aSymbol[62] = "EURUSD";
   aLots[62] = 1.0;
   aDateOpen[62] = D'2011.08.19 08:26:22'+time_offset*3600;
   aPriceOpen[62] = 1.42904;
   aDateClose[62] = D'2011.08.19 08:27:31'+time_offset*3600;
   aPriceClose[62] = 1.42898;

   // ========== 63 ===== 685 ==========
   aType[63] = OP_SELL;
   aSymbol[63] = "EURUSD";
   aLots[63] = 1.0;
   aDateOpen[63] = D'2011.08.19 11:08:12'+time_offset*3600;
   aPriceOpen[63] = 1.43119;
   aDateClose[63] = D'2011.08.19 11:50:54'+time_offset*3600;
   aPriceClose[63] = 1.43572;

   // ========== 64 ===== 684 ==========
   aType[64] = OP_BUY;
   aSymbol[64] = "EURUSD";
   aLots[64] = 1.0;
   aDateOpen[64] = D'2011.08.19 12:07:17'+time_offset*3600;
   aPriceOpen[64] = 1.43935;
   aDateClose[64] = D'2011.08.19 13:52:08'+time_offset*3600;
   aPriceClose[64] = 1.44157;

   // ========== 65 ===== 681 ==========
   aType[65] = OP_BUY;
   aSymbol[65] = "EURUSD";
   aLots[65] = 1.0;
   aDateOpen[65] = D'2011.08.22 06:33:47'+time_offset*3600;
   aPriceOpen[65] = 1.4355;
   aDateClose[65] = D'2011.08.22 08:49:22'+time_offset*3600;
   aPriceClose[65] = 1.43987;

   // ========== 66 ===== 679 ==========
   aType[66] = OP_BUY;
   aSymbol[66] = "EURUSD";
   aLots[66] = 1.0;
   aDateOpen[66] = D'2011.08.23 07:30:05'+time_offset*3600;
   aPriceOpen[66] = 1.44215;
   aDateClose[66] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPriceClose[66] = 1.4394;

   // ========== 67 ===== 678 ==========
   aType[67] = OP_BUY;
   aSymbol[67] = "EURUSD";
   aLots[67] = 1.0;
   aDateOpen[67] = D'2011.08.23 09:02:16'+time_offset*3600;
   aPriceOpen[67] = 1.44455;
   aDateClose[67] = D'2011.08.23 13:44:04'+time_offset*3600;
   aPriceClose[67] = 1.4394;

   // ========== 68 ===== 676 ==========
   aType[68] = OP_BUY;
   aSymbol[68] = "EURUSD";
   aLots[68] = 1.0;
   aDateOpen[68] = D'2011.08.24 08:28:39'+time_offset*3600;
   aPriceOpen[68] = 1.44425;
   aDateClose[68] = D'2011.08.24 10:06:57'+time_offset*3600;
   aPriceClose[68] = 1.44681;

   // ========== 69 ===== 674 ==========
   aType[69] = OP_BUY;
   aSymbol[69] = "EURUSD";
   aLots[69] = 1.0;
   aDateOpen[69] = D'2011.08.24 12:33:06'+time_offset*3600;
   aPriceOpen[69] = 1.44684;
   aDateClose[69] = D'2011.08.24 14:45:45'+time_offset*3600;
   aPriceClose[69] = 1.44347;

   // ========== 70 ===== 672 ==========
   aType[70] = OP_BUY;
   aSymbol[70] = "EURUSD";
   aLots[70] = 1.0;
   aDateOpen[70] = D'2011.08.25 07:08:39'+time_offset*3600;
   aPriceOpen[70] = 1.4446;
   aDateClose[70] = D'2011.08.25 09:05:01'+time_offset*3600;
   aPriceClose[70] = 1.44329;

   // ========== 71 ===== 670 ==========
   aType[71] = OP_BUY;
   aSymbol[71] = "EURUSD";
   aLots[71] = 1.0;
   aDateOpen[71] = D'2011.08.25 13:16:46'+time_offset*3600;
   aPriceOpen[71] = 1.44586;
   aDateClose[71] = D'2011.08.25 13:53:26'+time_offset*3600;
   aPriceClose[71] = 1.4418;

   // ========== 72 ===== 668 ==========
   aType[72] = OP_SELL;
   aSymbol[72] = "EURUSD";
   aLots[72] = 1.0;
   aDateOpen[72] = D'2011.08.25 22:49:05'+time_offset*3600;
   aPriceOpen[72] = 1.4373;
   aDateClose[72] = D'2011.08.26 00:44:27'+time_offset*3600;
   aPriceClose[72] = 1.44;

   // ========== 73 ===== 667 ==========
   aType[73] = OP_BUY;
   aSymbol[73] = "EURUSD";
   aLots[73] = 1.0;
   aDateOpen[73] = D'2011.08.26 00:58:01'+time_offset*3600;
   aPriceOpen[73] = 1.44164;
   aDateClose[73] = D'2011.08.26 03:35:22'+time_offset*3600;
   aPriceClose[73] = 1.44103;

   // ========== 74 ===== 666 ==========
   aType[74] = OP_SELL;
   aSymbol[74] = "EURUSD";
   aLots[74] = 1.0;
   aDateOpen[74] = D'2011.08.26 05:40:35'+time_offset*3600;
   aPriceOpen[74] = 1.4426;
   aDateClose[74] = D'2011.08.26 08:31:22'+time_offset*3600;
   aPriceClose[74] = 1.44467;

   // ========== 75 ===== 664 ==========
   aType[75] = OP_BUY;
   aSymbol[75] = "EURUSD";
   aLots[75] = 1.0;
   aDateOpen[75] = D'2011.08.26 13:49:23'+time_offset*3600;
   aPriceOpen[75] = 1.44411;
   aDateClose[75] = D'2011.08.26 14:02:34'+time_offset*3600;
   aPriceClose[75] = 1.43996;

   // ========== 76 ===== 662 ==========
   aType[76] = OP_SELL;
   aSymbol[76] = "EURUSD";
   aLots[76] = 1.0;
   aDateOpen[76] = D'2011.08.26 14:46:57'+time_offset*3600;
   aPriceOpen[76] = 1.4353;
   aDateClose[76] = D'2011.08.26 15:45:37'+time_offset*3600;
   aPriceClose[76] = 1.44592;

   // ========== 77 ===== 659 ==========
   aType[77] = OP_BUY;
   aSymbol[77] = "EURUSD";
   aLots[77] = 1.0;
   aDateOpen[77] = D'2011.08.26 15:45:46'+time_offset*3600;
   aPriceOpen[77] = 1.44709;
   aDateClose[77] = D'2011.08.30 06:09:04'+time_offset*3600;
   aPriceClose[77] = 1.45149;

   // ========== 78 ===== 658 ==========
   aType[78] = OP_BUY;
   aSymbol[78] = "EURUSD";
   aLots[78] = 1.0;
   aDateOpen[78] = D'2011.08.30 08:33:18'+time_offset*3600;
   aPriceOpen[78] = 1.44406;
   aDateClose[78] = D'2011.08.30 09:46:08'+time_offset*3600;
   aPriceClose[78] = 1.44108;

   // ========== 79 ===== 656 ==========
   aType[79] = OP_SELL;
   aSymbol[79] = "EURUSD";
   aLots[79] = 1.0;
   aDateOpen[79] = D'2011.08.31 15:47:35'+time_offset*3600;
   aPriceOpen[79] = 1.44093;
   aDateClose[79] = D'2011.08.31 19:03:53'+time_offset*3600;
   aPriceClose[79] = 1.43777;

   // ========== 80 ===== 654 ==========
   aType[80] = OP_SELL;
   aSymbol[80] = "EURUSD";
   aLots[80] = 1.0;
   aDateOpen[80] = D'2011.09.01 07:16:58'+time_offset*3600;
   aPriceOpen[80] = 1.43236;
   aDateClose[80] = D'2011.09.01 22:39:28'+time_offset*3600;
   aPriceClose[80] = 1.42623;

   // ========== 81 ===== 649 ==========
   aType[81] = OP_BUY;
   aSymbol[81] = "EURUSD";
   aLots[81] = 1.0;
   aDateOpen[81] = D'2011.09.06 04:59:11'+time_offset*3600;
   aPriceOpen[81] = 1.40595;
   aDateClose[81] = D'2011.09.06 08:02:11'+time_offset*3600;
   aPriceClose[81] = 1.413;

   // ========== 82 ===== 647 ==========
   aType[82] = OP_SELL;
   aSymbol[82] = "EURUSD";
   aLots[82] = 1.0;
   aDateOpen[82] = D'2011.09.06 08:02:27'+time_offset*3600;
   aPriceOpen[82] = 1.4179;
   aDateClose[82] = D'2011.09.06 08:02:46'+time_offset*3600;
   aPriceClose[82] = 1.4279;

   // ========== 83 ===== 645 ==========
   aType[83] = OP_SELL;
   aSymbol[83] = "EURUSD";
   aLots[83] = 1.0;
   aDateOpen[83] = D'2011.09.06 09:32:54'+time_offset*3600;
   aPriceOpen[83] = 1.4211;
   aDateClose[83] = D'2011.09.06 10:12:05'+time_offset*3600;
   aPriceClose[83] = 1.4175;

   // ========== 84 ===== 644 ==========
   aType[84] = OP_BUY;
   aSymbol[84] = "EURUSD";
   aLots[84] = 1.0;
   aDateOpen[84] = D'2011.09.06 11:49:25'+time_offset*3600;
   aPriceOpen[84] = 1.41331;
   aDateClose[84] = D'2011.09.06 22:27:34'+time_offset*3600;
   aPriceClose[84] = 1.40011;

   // ========== 85 ===== 640 ==========
   aType[85] = OP_SELL;
   aSymbol[85] = "EURUSD";
   aLots[85] = 1.0;
   aDateOpen[85] = D'2011.09.07 06:04:52'+time_offset*3600;
   aPriceOpen[85] = 1.40595;
   aDateClose[85] = D'2011.09.07 08:49:21'+time_offset*3600;
   aPriceClose[85] = 1.40888;

   // ========== 86 ===== 641 ==========
   aType[86] = OP_SELL;
   aSymbol[86] = "EURUSD";
   aLots[86] = 1.0;
   aDateOpen[86] = D'2011.09.07 06:38:15'+time_offset*3600;
   aPriceOpen[86] = 1.40716;
   aDateClose[86] = D'2011.09.07 08:49:17'+time_offset*3600;
   aPriceClose[86] = 1.4088;

   // ========== 87 ===== 638 ==========
   aType[87] = OP_SELL;
   aSymbol[87] = "EURUSD";
   aLots[87] = 1.0;
   aDateOpen[87] = D'2011.09.07 09:08:53'+time_offset*3600;
   aPriceOpen[87] = 1.41001;
   aDateClose[87] = D'2011.09.07 10:43:01'+time_offset*3600;
   aPriceClose[87] = 1.40444;

   // ========== 88 ===== 635 ==========
   aType[88] = OP_SELL;
   aSymbol[88] = "EURUSD";
   aLots[88] = 1.0;
   aDateOpen[88] = D'2011.09.08 12:35:08'+time_offset*3600;
   aPriceOpen[88] = 1.40056;
   aDateClose[88] = D'2011.09.08 13:20:02'+time_offset*3600;
   aPriceClose[88] = 1.39956;

   // ========== 89 ===== 631 ==========
   aType[89] = OP_BUY;
   aSymbol[89] = "EURUSD";
   aLots[89] = 1.0;
   aDateOpen[89] = D'2011.09.12 02:19:19'+time_offset*3600;
   aPriceOpen[89] = 1.35867;
   aDateClose[89] = D'2011.09.12 09:49:10'+time_offset*3600;
   aPriceClose[89] = 1.364;

   // ========== 90 ===== 625 ==========
   aType[90] = OP_SELL;
   aSymbol[90] = "EURUSD";
   aLots[90] = 1.0;
   aDateOpen[90] = D'2011.09.15 10:00:41'+time_offset*3600;
   aPriceOpen[90] = 1.38097;
   aDateClose[90] = D'2011.09.15 12:37:45'+time_offset*3600;
   aPriceClose[90] = 1.37962;

   // ========== 91 ===== 623 ==========
   aType[91] = OP_BUY;
   aSymbol[91] = "EURUSD";
   aLots[91] = 1.0;
   aDateOpen[91] = D'2011.09.15 13:06:25'+time_offset*3600;
   aPriceOpen[91] = 1.385;
   aDateClose[91] = D'2011.09.15 13:10:42'+time_offset*3600;
   aPriceClose[91] = 1.38595;

   // ========== 92 ===== 621 ==========
   aType[92] = OP_SELL;
   aSymbol[92] = "EURUSD";
   aLots[92] = 1.0;
   aDateOpen[92] = D'2011.09.15 13:30:17'+time_offset*3600;
   aPriceOpen[92] = 1.38852;
   aDateClose[92] = D'2011.09.15 21:57:16'+time_offset*3600;
   aPriceClose[92] = 1.38838;

   // ========== 93 ===== 614 ==========
   aType[93] = OP_SELL;
   aSymbol[93] = "EURUSD";
   aLots[93] = 1.0;
   aDateOpen[93] = D'2011.09.22 17:34:59'+time_offset*3600;
   aPriceOpen[93] = 1.34776;
   aDateClose[93] = D'2011.09.22 19:25:21'+time_offset*3600;
   aPriceClose[93] = 1.34401;

   // ========== 94 ===== 608 ==========
   aType[94] = OP_SELL;
   aSymbol[94] = "EURUSD";
   aLots[94] = 1.0;
   aDateOpen[94] = D'2011.09.26 08:55:30'+time_offset*3600;
   aPriceOpen[94] = 1.34569;
   aDateClose[94] = D'2011.09.26 09:41:24'+time_offset*3600;
   aPriceClose[94] = 1.34551;

   // ========== 95 ===== 601 ==========
   aType[95] = OP_SELL;
   aSymbol[95] = "EURUSD";
   aLots[95] = 1.0;
   aDateOpen[95] = D'2011.09.30 07:10:04'+time_offset*3600;
   aPriceOpen[95] = 1.34938;
   aDateClose[95] = D'2011.09.30 12:17:08'+time_offset*3600;
   aPriceClose[95] = 1.35036;

   // ========== 96 ===== 598 ==========
   aType[96] = OP_SELL;
   aSymbol[96] = "EURUSD";
   aLots[96] = 1.0;
   aDateOpen[96] = D'2011.10.03 18:18:53'+time_offset*3600;
   aPriceOpen[96] = 1.32382;
   aDateClose[96] = D'2011.10.03 19:25:48'+time_offset*3600;
   aPriceClose[96] = 1.32075;

   // ========== 97 ===== 596 ==========
   aType[97] = OP_SELL;
   aSymbol[97] = "EURUSD";
   aLots[97] = 1.0;
   aDateOpen[97] = D'2011.10.04 16:09:28'+time_offset*3600;
   aPriceOpen[97] = 1.33045;
   aDateClose[97] = D'2011.10.04 16:42:19'+time_offset*3600;
   aPriceClose[97] = 1.32918;

   // ========== 98 ===== 587 ==========
   aType[98] = OP_BUY;
   aSymbol[98] = "EURUSD";
   aLots[98] = 1.0;
   aDateOpen[98] = D'2011.10.07 07:22:54'+time_offset*3600;
   aPriceOpen[98] = 1.34636;
   aDateClose[98] = D'2011.10.07 07:49:07'+time_offset*3600;
   aPriceClose[98] = 1.34405;

   // ========== 99 ===== 576 ==========
   aType[99] = OP_SELL;
   aSymbol[99] = "EURUSD";
   aLots[99] = 1.0;
   aDateOpen[99] = D'2011.10.10 01:37:33'+time_offset*3600;
   aPriceOpen[99] = 1.3459;
   aDateClose[99] = D'2011.10.11 01:02:18'+time_offset*3600;
   aPriceClose[99] = 1.36277;

   // ========== 100 ===== 577 ==========
   aType[100] = OP_SELL;
   aSymbol[100] = "EURUSD";
   aLots[100] = 1.0;
   aDateOpen[100] = D'2011.10.10 14:08:04'+time_offset*3600;
   aPriceOpen[100] = 1.36553;
   aDateClose[100] = D'2011.10.10 22:42:15'+time_offset*3600;
   aPriceClose[100] = 1.36329;

   // ========== 101 ===== 574 ==========
   aType[101] = OP_BUY;
   aSymbol[101] = "EURUSD";
   aLots[101] = 1.0;
   aDateOpen[101] = D'2011.10.11 08:56:08'+time_offset*3600;
   aPriceOpen[101] = 1.35995;
   aDateClose[101] = D'2011.10.11 09:17:24'+time_offset*3600;
   aPriceClose[101] = 1.3599;

   // ========== 102 ===== 573 ==========
   aType[102] = OP_BUY;
   aSymbol[102] = "EURUSD";
   aLots[102] = 1.0;
   aDateOpen[102] = D'2011.10.11 10:28:46'+time_offset*3600;
   aPriceOpen[102] = 1.35975;
   aDateClose[102] = D'2011.10.11 15:58:40'+time_offset*3600;
   aPriceClose[102] = 1.36585;

   // ========== 103 ===== 572 ==========
   aType[103] = OP_BUY;
   aSymbol[103] = "EURUSD";
   aLots[103] = 1.0;
   aDateOpen[103] = D'2011.10.12 08:15:59'+time_offset*3600;
   aPriceOpen[103] = 1.37282;
   aDateClose[103] = D'2011.10.12 08:21:18'+time_offset*3600;
   aPriceClose[103] = 1.3738;

   // ========== 104 ===== 564 ==========
   aType[104] = OP_BUY;
   aSymbol[104] = "EURUSD";
   aLots[104] = 1.0;
   aDateOpen[104] = D'2011.10.13 07:27:46'+time_offset*3600;
   aPriceOpen[104] = 1.38193;
   aDateClose[104] = D'2011.10.13 08:05:47'+time_offset*3600;
   aPriceClose[104] = 1.37923;

   // ========== 105 ===== 561 ==========
   aType[105] = OP_SELL;
   aSymbol[105] = "EURUSD";
   aLots[105] = 1.0;
   aDateOpen[105] = D'2011.10.13 09:34:00'+time_offset*3600;
   aPriceOpen[105] = 1.37345;
   aDateClose[105] = D'2011.10.13 10:06:28'+time_offset*3600;
   aPriceClose[105] = 1.37211;

   // ========== 106 ===== 555 ==========
   aType[106] = OP_SELL;
   aSymbol[106] = "EURUSD";
   aLots[106] = 1.0;
   aDateOpen[106] = D'2011.10.14 05:57:31'+time_offset*3600;
   aPriceOpen[106] = 1.3785;
   aDateClose[106] = D'2011.10.14 08:32:56'+time_offset*3600;
   aPriceClose[106] = 1.38082;

   // ========== 107 ===== 549 ==========
   aType[107] = OP_BUY;
   aSymbol[107] = "EURUSD";
   aLots[107] = 1.0;
   aDateOpen[107] = D'2011.10.14 13:15:06'+time_offset*3600;
   aPriceOpen[107] = 1.38507;
   aDateClose[107] = D'2011.10.14 14:31:03'+time_offset*3600;
   aPriceClose[107] = 1.38727;

   // ========== 108 ===== 537 ==========
   aType[108] = OP_SELL;
   aSymbol[108] = "EURUSD";
   aLots[108] = 1.0;
   aDateOpen[108] = D'2011.10.25 12:03:39'+time_offset*3600;
   aPriceOpen[108] = 1.3913;
   aDateClose[108] = D'2011.10.25 12:26:54'+time_offset*3600;
   aPriceClose[108] = 1.39159;

   // ========== 109 ===== 531 ==========
   aType[109] = OP_BUY;
   aSymbol[109] = "EURUSD";
   aLots[109] = 1.0;
   aDateOpen[109] = D'2011.10.27 03:00:14'+time_offset*3600;
   aPriceOpen[109] = 1.39581;
   aDateClose[109] = D'2011.10.27 04:30:33'+time_offset*3600;
   aPriceClose[109] = 1.39681;

   // ========== 110 ===== 522 ==========
   aType[110] = OP_BUY;
   aSymbol[110] = "EURUSD";
   aLots[110] = 1.0;
   aDateOpen[110] = D'2011.10.28 07:42:16'+time_offset*3600;
   aPriceOpen[110] = 1.41674;
   aDateClose[110] = D'2011.10.28 08:41:04'+time_offset*3600;
   aPriceClose[110] = 1.41822;

   // ========== 111 ===== 521 ==========
   aType[111] = OP_BUY;
   aSymbol[111] = "EURUSD";
   aLots[111] = 1.0;
   aDateOpen[111] = D'2011.10.28 10:26:26'+time_offset*3600;
   aPriceOpen[111] = 1.41505;
   aDateClose[111] = D'2011.10.28 12:32:40'+time_offset*3600;
   aPriceClose[111] = 1.41679;

   // ========== 112 ===== 520 ==========
   aType[112] = OP_BUY;
   aSymbol[112] = "EURUSD";
   aLots[112] = 1.0;
   aDateOpen[112] = D'2011.10.30 23:43:13'+time_offset*3600;
   aPriceOpen[112] = 1.41464;
   aDateClose[112] = D'2011.10.31 02:19:00'+time_offset*3600;
   aPriceClose[112] = 1.40792;

   // ========== 113 ===== 507 ==========
   aType[113] = OP_BUY;
   aSymbol[113] = "EURUSD";
   aLots[113] = 1.0;
   aDateOpen[113] = D'2011.11.01 12:40:36'+time_offset*3600;
   aPriceOpen[113] = 1.36569;
   aDateClose[113] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPriceClose[113] = 1.3681;

   // ========== 114 ===== 508 ==========
   aType[114] = OP_BUY;
   aSymbol[114] = "EURUSD";
   aLots[114] = 1.0;
   aDateOpen[114] = D'2011.11.01 12:42:23'+time_offset*3600;
   aPriceOpen[114] = 1.36491;
   aDateClose[114] = D'2011.11.01 14:28:52'+time_offset*3600;
   aPriceClose[114] = 1.3681;

   // ========== 115 ===== 509 ==========
   aType[115] = OP_BUY;
   aSymbol[115] = "EURUSD";
   aLots[115] = 1.0;
   aDateOpen[115] = D'2011.11.01 13:14:55'+time_offset*3600;
   aPriceOpen[115] = 1.36277;
   aDateClose[115] = D'2011.11.01 14:27:11'+time_offset*3600;
   aPriceClose[115] = 1.36749;

   // ========== 116 ===== 502 ==========
   aType[116] = OP_BUY;
   aSymbol[116] = "EURUSD";
   aLots[116] = 1.0;
   aDateOpen[116] = D'2011.11.02 13:35:53'+time_offset*3600;
   aPriceOpen[116] = 1.38277;
   aDateClose[116] = D'2011.11.02 16:16:24'+time_offset*3600;
   aPriceClose[116] = 1.377;

   // ========== 117 ===== 496 ==========
   aType[117] = OP_SELL;
   aSymbol[117] = "EURUSD";
   aLots[117] = 1.0;
   aDateOpen[117] = D'2011.11.04 12:46:23'+time_offset*3600;
   aPriceOpen[117] = 1.38212;
   aDateClose[117] = D'2011.11.04 15:28:01'+time_offset*3600;
   aPriceClose[117] = 1.37404;

   // ========== 118 ===== 495 ==========
   aType[118] = OP_SELL;
   aSymbol[118] = "EURUSD";
   aLots[118] = 1.0;
   aDateOpen[118] = D'2011.11.04 14:10:35'+time_offset*3600;
   aPriceOpen[118] = 1.37354;
   aDateClose[118] = D'2011.11.04 15:46:51'+time_offset*3600;
   aPriceClose[118] = 1.37617;

   // ========== 119 ===== 490 ==========
   aType[119] = OP_SELL;
   aSymbol[119] = "EURUSD";
   aLots[119] = 1.0;
   aDateOpen[119] = D'2011.11.08 08:00:55'+time_offset*3600;
   aPriceOpen[119] = 1.37262;
   aDateClose[119] = D'2011.11.08 08:09:08'+time_offset*3600;
   aPriceClose[119] = 1.37469;

   // ========== 120 ===== 485 ==========
   aType[120] = OP_SELL;
   aSymbol[120] = "EURUSD";
   aLots[120] = 1.0;
   aDateOpen[120] = D'2011.11.09 09:06:59'+time_offset*3600;
   aPriceOpen[120] = 1.37676;
   aDateClose[120] = D'2011.11.09 09:45:18'+time_offset*3600;
   aPriceClose[120] = 1.37204;

   // ========== 121 ===== 484 ==========
   aType[121] = OP_SELL;
   aSymbol[121] = "EURUSD";
   aLots[121] = 1.0;
   aDateOpen[121] = D'2011.11.09 09:10:56'+time_offset*3600;
   aPriceOpen[121] = 1.37596;
   aDateClose[121] = D'2011.11.09 10:40:19'+time_offset*3600;
   aPriceClose[121] = 1.3667;

   // ========== 122 ===== 483 ==========
   aType[122] = OP_SELL;
   aSymbol[122] = "EURUSD";
   aLots[122] = 1.0;
   aDateOpen[122] = D'2011.11.09 09:12:50'+time_offset*3600;
   aPriceOpen[122] = 1.37571;
   aDateClose[122] = D'2011.11.09 12:02:00'+time_offset*3600;
   aPriceClose[122] = 1.36261;

   // ========== 123 ===== 482 ==========
   aType[123] = OP_BUY;
   aSymbol[123] = "EURUSD";
   aLots[123] = 1.0;
   aDateOpen[123] = D'2011.11.09 14:46:44'+time_offset*3600;
   aPriceOpen[123] = 1.356;
   aDateClose[123] = D'2011.11.09 15:52:31'+time_offset*3600;
   aPriceClose[123] = 1.3593;

   // ========== 124 ===== 478 ==========
   aType[124] = OP_BUY;
   aSymbol[124] = "EURUSD";
   aLots[124] = 1.0;
   aDateOpen[124] = D'2011.11.09 22:03:43'+time_offset*3600;
   aPriceOpen[124] = 1.35422;
   aDateClose[124] = D'2011.11.10 01:51:04'+time_offset*3600;
   aPriceClose[124] = 1.35434;

   // ========== 125 ===== 479 ==========
   aType[125] = OP_BUY;
   aSymbol[125] = "EURUSD";
   aLots[125] = 1.0;
   aDateOpen[125] = D'2011.11.10 00:29:30'+time_offset*3600;
   aPriceOpen[125] = 1.35208;
   aDateClose[125] = D'2011.11.10 01:48:48'+time_offset*3600;
   aPriceClose[125] = 1.35395;

   // ========== 126 ===== 475 ==========
   aType[126] = OP_SELL;
   aSymbol[126] = "EURUSD";
   aLots[126] = 1.0;
   aDateOpen[126] = D'2011.11.10 09:49:43'+time_offset*3600;
   aPriceOpen[126] = 1.361;
   aDateClose[126] = D'2011.11.10 10:41:24'+time_offset*3600;
   aPriceClose[126] = 1.357;

   // ========== 127 ===== 469 ==========
   aType[127] = OP_SELL;
   aSymbol[127] = "EURUSD";
   aLots[127] = 1.0;
   aDateOpen[127] = D'2011.11.11 11:38:12'+time_offset*3600;
   aPriceOpen[127] = 1.36421;
   aDateClose[127] = D'2011.11.11 15:35:41'+time_offset*3600;
   aPriceClose[127] = 1.37173;

   // ========== 128 ===== 470 ==========
   aType[128] = OP_SELL;
   aSymbol[128] = "EURUSD";
   aLots[128] = 1.0;
   aDateOpen[128] = D'2011.11.11 14:12:13'+time_offset*3600;
   aPriceOpen[128] = 1.36784;
   aDateClose[128] = D'2011.11.11 15:35:37'+time_offset*3600;
   aPriceClose[128] = 1.37195;

   // ========== 129 ===== 465 ==========
   aType[129] = OP_SELL;
   aSymbol[129] = "EURUSD";
   aLots[129] = 1.0;
   aDateOpen[129] = D'2011.11.14 09:23:58'+time_offset*3600;
   aPriceOpen[129] = 1.36908;
   aDateClose[129] = D'2011.11.14 09:55:59'+time_offset*3600;
   aPriceClose[129] = 1.36962;

   // ========== 130 ===== 464 ==========
   aType[130] = OP_BUY;
   aSymbol[130] = "EURUSD";
   aLots[130] = 1.0;
   aDateOpen[130] = D'2011.11.14 10:06:42'+time_offset*3600;
   aPriceOpen[130] = 1.36847;
   aDateClose[130] = D'2011.11.14 10:59:52'+time_offset*3600;
   aPriceClose[130] = 1.36967;

   // ========== 131 ===== 460 ==========
   aType[131] = OP_BUY;
   aSymbol[131] = "EURUSD";
   aLots[131] = 1.0;
   aDateOpen[131] = D'2011.11.14 14:17:03'+time_offset*3600;
   aPriceOpen[131] = 1.36374;
   aDateClose[131] = D'2011.11.14 16:09:51'+time_offset*3600;
   aPriceClose[131] = 1.36408;

   // ========== 132 ===== 461 ==========
   aType[132] = OP_BUY;
   aSymbol[132] = "EURUSD";
   aLots[132] = 1.0;
   aDateOpen[132] = D'2011.11.14 15:25:38'+time_offset*3600;
   aPriceOpen[132] = 1.3623;
   aDateClose[132] = D'2011.11.14 15:51:51'+time_offset*3600;
   aPriceClose[132] = 1.36345;

   // ========== 133 ===== 459 ==========
   aType[133] = OP_SELL;
   aSymbol[133] = "EURUSD";
   aLots[133] = 1.0;
   aDateOpen[133] = D'2011.11.15 08:49:03'+time_offset*3600;
   aPriceOpen[133] = 1.35709;
   aDateClose[133] = D'2011.11.15 08:52:40'+time_offset*3600;
   aPriceClose[133] = 1.35877;

   // ========== 134 ===== 453 ==========
   aType[134] = OP_BUY;
   aSymbol[134] = "EURUSD";
   aLots[134] = 1.0;
   aDateOpen[134] = D'2011.11.16 02:04:30'+time_offset*3600;
   aPriceOpen[134] = 1.3475;
   aDateClose[134] = D'2011.11.16 08:21:45'+time_offset*3600;
   aPriceClose[134] = 1.349;

   // ========== 135 ===== 452 ==========
   aType[135] = OP_SELL;
   aSymbol[135] = "EURUSD";
   aLots[135] = 1.0;
   aDateOpen[135] = D'2011.11.16 08:46:10'+time_offset*3600;
   aPriceOpen[135] = 1.35318;
   aDateClose[135] = D'2011.11.16 08:51:01'+time_offset*3600;
   aPriceClose[135] = 1.35303;

   // ========== 136 ===== 451 ==========
   aType[136] = OP_SELL;
   aSymbol[136] = "EURUSD";
   aLots[136] = 1.0;
   aDateOpen[136] = D'2011.11.16 09:12:18'+time_offset*3600;
   aPriceOpen[136] = 1.3541;
   aDateClose[136] = D'2011.11.16 09:14:03'+time_offset*3600;
   aPriceClose[136] = 1.35364;

   // ========== 137 ===== 443 ==========
   aType[137] = OP_BUY;
   aSymbol[137] = "EURUSD";
   aLots[137] = 1.0;
   aDateOpen[137] = D'2011.11.18 02:23:13'+time_offset*3600;
   aPriceOpen[137] = 1.34828;
   aDateClose[137] = D'2011.11.18 02:27:41'+time_offset*3600;
   aPriceClose[137] = 1.34827;

   // ========== 138 ===== 442 ==========
   aType[138] = OP_SELL;
   aSymbol[138] = "EURUSD";
   aLots[138] = 1.0;
   aDateOpen[138] = D'2011.11.18 05:16:35'+time_offset*3600;
   aPriceOpen[138] = 1.34695;
   aDateClose[138] = D'2011.11.18 07:27:18'+time_offset*3600;
   aPriceClose[138] = 1.35143;

   // ========== 139 ===== 438 ==========
   aType[139] = OP_SELL;
   aSymbol[139] = "EURUSD";
   aLots[139] = 1.0;
   aDateOpen[139] = D'2011.11.21 07:50:04'+time_offset*3600;
   aPriceOpen[139] = 1.34893;
   aDateClose[139] = D'2011.11.21 08:02:18'+time_offset*3600;
   aPriceClose[139] = 1.34774;

   // ========== 140 ===== 439 ==========
   aType[140] = OP_SELL;
   aSymbol[140] = "EURUSD";
   aLots[140] = 1.0;
   aDateOpen[140] = D'2011.11.21 07:51:27'+time_offset*3600;
   aPriceOpen[140] = 1.34925;
   aDateClose[140] = D'2011.11.21 08:02:14'+time_offset*3600;
   aPriceClose[140] = 1.34769;

   // ========== 141 ===== 436 ==========
   aType[141] = OP_SELL;
   aSymbol[141] = "EURUSD";
   aLots[141] = 1.0;
   aDateOpen[141] = D'2011.11.22 10:39:01'+time_offset*3600;
   aPriceOpen[141] = 1.35382;
   aDateClose[141] = D'2011.11.22 10:55:57'+time_offset*3600;
   aPriceClose[141] = 1.35359;

   // ========== 142 ===== 435 ==========
   aType[142] = OP_SELL;
   aSymbol[142] = "EURUSD";
   aLots[142] = 1.0;
   aDateOpen[142] = D'2011.11.22 11:02:19'+time_offset*3600;
   aPriceOpen[142] = 1.35398;
   aDateClose[142] = D'2011.11.22 13:28:30'+time_offset*3600;
   aPriceClose[142] = 1.35325;

   // ========== 143 ===== 429 ==========
   aType[143] = OP_SELL;
   aSymbol[143] = "EURUSD";
   aLots[143] = 1.0;
   aDateOpen[143] = D'2011.11.23 10:12:15'+time_offset*3600;
   aPriceOpen[143] = 1.3421;
   aDateClose[143] = D'2011.11.23 10:16:04'+time_offset*3600;
   aPriceClose[143] = 1.33978;

   // ========== 144 ===== 426 ==========
   aType[144] = OP_SELL;
   aSymbol[144] = "EURUSD";
   aLots[144] = 1.0;
   aDateOpen[144] = D'2011.11.23 10:19:28'+time_offset*3600;
   aPriceOpen[144] = 1.33951;
   aDateClose[144] = D'2011.11.23 15:45:17'+time_offset*3600;
   aPriceClose[144] = 1.33589;

   // ========== 145 ===== 427 ==========
   aType[145] = OP_SELL;
   aSymbol[145] = "EURUSD";
   aLots[145] = 1.0;
   aDateOpen[145] = D'2011.11.23 10:20:55'+time_offset*3600;
   aPriceOpen[145] = 1.33982;
   aDateClose[145] = D'2011.11.23 15:03:35'+time_offset*3600;
   aPriceClose[145] = 1.33664;

   // ========== 146 ===== 428 ==========
   aType[146] = OP_SELL;
   aSymbol[146] = "EURUSD";
   aLots[146] = 1.0;
   aDateOpen[146] = D'2011.11.23 12:16:42'+time_offset*3600;
   aPriceOpen[146] = 1.33942;
   aDateClose[146] = D'2011.11.23 15:02:43'+time_offset*3600;
   aPriceClose[146] = 1.33689;

   // ========== 147 ===== 425 ==========
   aType[147] = OP_BUY;
   aSymbol[147] = "EURUSD";
   aLots[147] = 1.0;
   aDateOpen[147] = D'2011.11.24 11:39:03'+time_offset*3600;
   aPriceOpen[147] = 1.33824;
   aDateClose[147] = D'2011.11.24 11:47:31'+time_offset*3600;
   aPriceClose[147] = 1.33842;

   // ========== 148 ===== 419 ==========
   aType[148] = OP_SELL;
   aSymbol[148] = "EURUSD";
   aLots[148] = 1.0;
   aDateOpen[148] = D'2011.11.25 09:04:41'+time_offset*3600;
   aPriceOpen[148] = 1.32688;
   aDateClose[148] = D'2011.11.25 09:10:17'+time_offset*3600;
   aPriceClose[148] = 1.32611;

   // ========== 149 ===== 415 ==========
   aType[149] = OP_SELL;
   aSymbol[149] = "EURUSD";
   aLots[149] = 1.0;
   aDateOpen[149] = D'2011.11.27 23:28:55'+time_offset*3600;
   aPriceOpen[149] = 1.33176;
   aDateClose[149] = D'2011.11.28 01:20:07'+time_offset*3600;
   aPriceClose[149] = 1.33168;

   // ========== 150 ===== 416 ==========
   aType[150] = OP_SELL;
   aSymbol[150] = "EURUSD";
   aLots[150] = 1.0;
   aDateOpen[150] = D'2011.11.27 23:32:53'+time_offset*3600;
   aPriceOpen[150] = 1.33222;
   aDateClose[150] = D'2011.11.28 01:06:55'+time_offset*3600;
   aPriceClose[150] = 1.33096;

   // ========== 151 ===== 414 ==========
   aType[151] = OP_SELL;
   aSymbol[151] = "EURUSD";
   aLots[151] = 1.0;
   aDateOpen[151] = D'2011.11.28 02:01:19'+time_offset*3600;
   aPriceOpen[151] = 1.33159;
   aDateClose[151] = D'2011.11.28 03:20:34'+time_offset*3600;
   aPriceClose[151] = 1.33097;

   // ========== 152 ===== 412 ==========
   aType[152] = OP_SELL;
   aSymbol[152] = "EURUSD";
   aLots[152] = 1.0;
   aDateOpen[152] = D'2011.11.28 04:15:44'+time_offset*3600;
   aPriceOpen[152] = 1.3278;
   aDateClose[152] = D'2011.11.28 05:53:47'+time_offset*3600;
   aPriceClose[152] = 1.33028;

   // ========== 153 ===== 400 ==========
   aType[153] = OP_SELL;
   aSymbol[153] = "EURUSD";
   aLots[153] = 1.0;
   aDateOpen[153] = D'2011.11.29 08:02:11'+time_offset*3600;
   aPriceOpen[153] = 1.33325;
   aDateClose[153] = D'2011.11.29 08:17:05'+time_offset*3600;
   aPriceClose[153] = 1.33303;

   // ========== 154 ===== 399 ==========
   aType[154] = OP_SELL;
   aSymbol[154] = "EURUSD";
   aLots[154] = 1.0;
   aDateOpen[154] = D'2011.11.29 08:40:51'+time_offset*3600;
   aPriceOpen[154] = 1.33246;
   aDateClose[154] = D'2011.11.29 08:51:19'+time_offset*3600;
   aPriceClose[154] = 1.33227;

   // ========== 155 ===== 398 ==========
   aType[155] = OP_BUY;
   aSymbol[155] = "EURUSD";
   aLots[155] = 1.0;
   aDateOpen[155] = D'2011.11.29 10:14:21'+time_offset*3600;
   aPriceOpen[155] = 1.33866;
   aDateClose[155] = D'2011.11.29 10:15:43'+time_offset*3600;
   aPriceClose[155] = 1.33976;

   // ========== 156 ===== 397 ==========
   aType[156] = OP_BUY;
   aSymbol[156] = "EURUSD";
   aLots[156] = 1.0;
   aDateOpen[156] = D'2011.11.29 11:23:59'+time_offset*3600;
   aPriceOpen[156] = 1.34017;
   aDateClose[156] = D'2011.11.29 11:43:32'+time_offset*3600;
   aPriceClose[156] = 1.33882;

   // ========== 157 ===== 396 ==========
   aType[157] = OP_SELL;
   aSymbol[157] = "EURUSD";
   aLots[157] = 1.0;
   aDateOpen[157] = D'2011.11.30 06:57:02'+time_offset*3600;
   aPriceOpen[157] = 1.33015;
   aDateClose[157] = D'2011.11.30 07:04:56'+time_offset*3600;
   aPriceClose[157] = 1.32952;

   // ========== 158 ===== 395 ==========
   aType[158] = OP_SELL;
   aSymbol[158] = "EURUSD";
   aLots[158] = 1.0;
   aDateOpen[158] = D'2011.11.30 07:16:09'+time_offset*3600;
   aPriceOpen[158] = 1.32662;
   aDateClose[158] = D'2011.11.30 09:08:19'+time_offset*3600;
   aPriceClose[158] = 1.32906;

   // ========== 159 ===== 394 ==========
   aType[159] = OP_SELL;
   aSymbol[159] = "EURUSD";
   aLots[159] = 1.0;
   aDateOpen[159] = D'2011.11.30 07:17:31'+time_offset*3600;
   aPriceOpen[159] = 1.32669;
   aDateClose[159] = D'2011.11.30 09:08:23'+time_offset*3600;
   aPriceClose[159] = 1.32908;

   // ========== 160 ===== 393 ==========
   aType[160] = OP_SELL;
   aSymbol[160] = "EURUSD";
   aLots[160] = 1.0;
   aDateOpen[160] = D'2011.11.30 07:18:22'+time_offset*3600;
   aPriceOpen[160] = 1.32632;
   aDateClose[160] = D'2011.11.30 09:08:27'+time_offset*3600;
   aPriceClose[160] = 1.32906;

   // ========== 161 ===== 392 ==========
   aType[161] = OP_SELL;
   aSymbol[161] = "EURUSD";
   aLots[161] = 1.0;
   aDateOpen[161] = D'2011.11.30 07:20:09'+time_offset*3600;
   aPriceOpen[161] = 1.32623;
   aDateClose[161] = D'2011.11.30 09:08:30'+time_offset*3600;
   aPriceClose[161] = 1.32915;

   // ========== 162 ===== 389 ==========
   aType[162] = OP_BUY;
   aSymbol[162] = "EURUSD";
   aLots[162] = 1.0;
   aDateOpen[162] = D'2011.11.30 13:12:16'+time_offset*3600;
   aPriceOpen[162] = 1.34301;
   aDateClose[162] = D'2011.12.01 02:39:25'+time_offset*3600;
   aPriceClose[162] = 1.34357;

   // ========== 163 ===== 388 ==========
   aType[163] = OP_BUY;
   aSymbol[163] = "EURUSD";
   aLots[163] = 1.0;
   aDateOpen[163] = D'2011.11.30 13:23:20'+time_offset*3600;
   aPriceOpen[163] = 1.34261;
   aDateClose[163] = D'2011.12.01 02:39:33'+time_offset*3600;
   aPriceClose[163] = 1.34365;

   // ========== 164 ===== 391 ==========
   aType[164] = OP_BUY;
   aSymbol[164] = "EURUSD";
   aLots[164] = 1.0;
   aDateOpen[164] = D'2011.11.30 14:03:12'+time_offset*3600;
   aPriceOpen[164] = 1.35103;
   aDateClose[164] = D'2011.11.30 14:06:48'+time_offset*3600;
   aPriceClose[164] = 1.35127;

   // ========== 165 ===== 390 ==========
   aType[165] = OP_BUY;
   aSymbol[165] = "EURUSD";
   aLots[165] = 1.0;
   aDateOpen[165] = D'2011.11.30 14:10:09'+time_offset*3600;
   aPriceOpen[165] = 1.34987;
   aDateClose[165] = D'2011.11.30 14:16:43'+time_offset*3600;
   aPriceClose[165] = 1.35062;

   // ========== 166 ===== 383 ==========
   aType[166] = OP_BUY;
   aSymbol[166] = "EURUSD";
   aLots[166] = 1.0;
   aDateOpen[166] = D'2011.11.30 14:23:38'+time_offset*3600;
   aPriceOpen[166] = 1.34938;
   aDateClose[166] = D'2011.12.01 09:49:46'+time_offset*3600;
   aPriceClose[166] = 1.34855;

   // ========== 167 ===== 384 ==========
   aType[167] = OP_BUY;
   aSymbol[167] = "EURUSD";
   aLots[167] = 1.0;
   aDateOpen[167] = D'2011.11.30 14:32:49'+time_offset*3600;
   aPriceOpen[167] = 1.3481;
   aDateClose[167] = D'2011.12.01 09:41:38'+time_offset*3600;
   aPriceClose[167] = 1.34705;

   // ========== 168 ===== 385 ==========
   aType[168] = OP_BUY;
   aSymbol[168] = "EURUSD";
   aLots[168] = 1.0;
   aDateOpen[168] = D'2011.12.01 09:31:02'+time_offset*3600;
   aPriceOpen[168] = 1.3471;
   aDateClose[168] = D'2011.12.01 09:38:17'+time_offset*3600;
   aPriceClose[168] = 1.3471;

   // ========== 169 ===== 382 ==========
   aType[169] = OP_BUY;
   aSymbol[169] = "EURUSD";
   aLots[169] = 1.0;
   aDateOpen[169] = D'2011.12.01 13:18:40'+time_offset*3600;
   aPriceOpen[169] = 1.35094;
   aDateClose[169] = D'2011.12.01 13:22:30'+time_offset*3600;
   aPriceClose[169] = 1.35146;

   // ========== 170 ===== 381 ==========
   aType[170] = OP_SELL;
   aSymbol[170] = "EURUSD";
   aLots[170] = 1.0;
   aDateOpen[170] = D'2011.12.01 15:33:46'+time_offset*3600;
   aPriceOpen[170] = 1.34851;
   aDateClose[170] = D'2011.12.01 15:35:56'+time_offset*3600;
   aPriceClose[170] = 1.34745;

   // ========== 171 ===== 380 ==========
   aType[171] = OP_SELL;
   aSymbol[171] = "EURUSD";
   aLots[171] = 1.0;
   aDateOpen[171] = D'2011.12.01 16:08:07'+time_offset*3600;
   aPriceOpen[171] = 1.34753;
   aDateClose[171] = D'2011.12.01 16:18:11'+time_offset*3600;
   aPriceClose[171] = 1.34672;

   // ========== 172 ===== 379 ==========
   aType[172] = OP_BUY;
   aSymbol[172] = "EURUSD";
   aLots[172] = 1.0;
   aDateOpen[172] = D'2011.12.02 08:00:36'+time_offset*3600;
   aPriceOpen[172] = 1.34842;
   aDateClose[172] = D'2011.12.02 08:06:07'+time_offset*3600;
   aPriceClose[172] = 1.34857;

   // ========== 173 ===== 376 ==========
   aType[173] = OP_BUY;
   aSymbol[173] = "EURUSD";
   aLots[173] = 1.0;
   aDateOpen[173] = D'2011.12.02 09:18:30'+time_offset*3600;
   aPriceOpen[173] = 1.34918;
   aDateClose[173] = D'2011.12.02 09:35:11'+time_offset*3600;
   aPriceClose[173] = 1.34793;

   // ========== 174 ===== 368 ==========
   aType[174] = OP_BUY;
   aSymbol[174] = "EURUSD";
   aLots[174] = 1.0;
   aDateOpen[174] = D'2011.12.02 12:38:55'+time_offset*3600;
   aPriceOpen[174] = 1.35351;
   aDateClose[174] = D'2011.12.02 13:36:47'+time_offset*3600;
   aPriceClose[174] = 1.34997;

   // ========== 175 ===== 369 ==========
   aType[175] = OP_BUY;
   aSymbol[175] = "EURUSD";
   aLots[175] = 1.0;
   aDateOpen[175] = D'2011.12.02 12:39:37'+time_offset*3600;
   aPriceOpen[175] = 1.35317;
   aDateClose[175] = D'2011.12.02 13:36:43'+time_offset*3600;
   aPriceClose[175] = 1.34998;

   // ========== 176 ===== 370 ==========
   aType[176] = OP_BUY;
   aSymbol[176] = "EURUSD";
   aLots[176] = 1.0;
   aDateOpen[176] = D'2011.12.02 13:19:59'+time_offset*3600;
   aPriceOpen[176] = 1.35219;
   aDateClose[176] = D'2011.12.02 13:36:31'+time_offset*3600;
   aPriceClose[176] = 1.34991;

   // ========== 177 ===== 371 ==========
   aType[177] = OP_BUY;
   aSymbol[177] = "EURUSD";
   aLots[177] = 1.0;
   aDateOpen[177] = D'2011.12.02 13:20:23'+time_offset*3600;
   aPriceOpen[177] = 1.35242;
   aDateClose[177] = D'2011.12.02 13:36:26'+time_offset*3600;
   aPriceClose[177] = 1.34994;

   // ========== 178 ===== 362 ==========
   aType[178] = OP_SELL;
   aSymbol[178] = "EURUSD";
   aLots[178] = 1.0;
   aDateOpen[178] = D'2011.12.06 07:14:26'+time_offset*3600;
   aPriceOpen[178] = 1.3354;
   aDateClose[178] = D'2011.12.06 07:24:34'+time_offset*3600;
   aPriceClose[178] = 1.33527;

   // ========== 179 ===== 363 ==========
   aType[179] = OP_SELL;
   aSymbol[179] = "EURUSD";
   aLots[179] = 1.0;
   aDateOpen[179] = D'2011.12.06 07:15:03'+time_offset*3600;
   aPriceOpen[179] = 1.33581;
   aDateClose[179] = D'2011.12.06 07:24:29'+time_offset*3600;
   aPriceClose[179] = 1.33534;

   // ========== 180 ===== 360 ==========
   aType[180] = OP_SELL;
   aSymbol[180] = "EURUSD";
   aLots[180] = 1.0;
   aDateOpen[180] = D'2011.12.06 07:34:11'+time_offset*3600;
   aPriceOpen[180] = 1.3342;
   aDateClose[180] = D'2011.12.06 08:19:40'+time_offset*3600;
   aPriceClose[180] = 1.33549;

   // ========== 181 ===== 361 ==========
   aType[181] = OP_SELL;
   aSymbol[181] = "EURUSD";
   aLots[181] = 1.0;
   aDateOpen[181] = D'2011.12.06 07:40:41'+time_offset*3600;
   aPriceOpen[181] = 1.33471;
   aDateClose[181] = D'2011.12.06 08:09:53'+time_offset*3600;
   aPriceClose[181] = 1.33426;

   // ========== 182 ===== 350 ==========
   aType[182] = OP_BUY;
   aSymbol[182] = "EURUSD";
   aLots[182] = 1.0;
   aDateOpen[182] = D'2011.12.08 12:59:21'+time_offset*3600;
   aPriceOpen[182] = 1.34195;
   aDateClose[182] = D'2011.12.08 13:58:08'+time_offset*3600;
   aPriceClose[182] = 1.338;

   // ========== 183 ===== 336 ==========
   aType[183] = OP_BUY;
   aSymbol[183] = "EURUSD";
   aLots[183] = 1.0;
   aDateOpen[183] = D'2011.12.14 12:15:11'+time_offset*3600;
   aPriceOpen[183] = 1.30042;
   aDateClose[183] = D'2011.12.15 06:48:12'+time_offset*3600;
   aPriceClose[183] = 1.29885;

   // ========== 184 ===== 320 ==========
   aType[184] = OP_SELL;
   aSymbol[184] = "EURUSD";
   aLots[184] = 1.0;
   aDateOpen[184] = D'2011.12.23 13:15:33'+time_offset*3600;
   aPriceOpen[184] = 1.30568;
   aDateClose[184] = D'2011.12.23 14:11:34'+time_offset*3600;
   aPriceClose[184] = 1.30483;

   // ========== 185 ===== 316 ==========
   aType[185] = OP_SELL;
   aSymbol[185] = "EURUSD";
   aLots[185] = 1.0;
   aDateOpen[185] = D'2011.12.29 17:03:13'+time_offset*3600;
   aPriceOpen[185] = 1.2955;
   aDateClose[185] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPriceClose[185] = 1.2905;

   // ========== 186 ===== 317 ==========
   aType[186] = OP_SELL;
   aSymbol[186] = "EURUSD";
   aLots[186] = 1.0;
   aDateOpen[186] = D'2011.12.29 17:03:43'+time_offset*3600;
   aPriceOpen[186] = 1.29541;
   aDateClose[186] = D'2011.12.30 08:43:04'+time_offset*3600;
   aPriceClose[186] = 1.2905;

   // ========== 187 ===== 318 ==========
   aType[187] = OP_SELL;
   aSymbol[187] = "EURUSD";
   aLots[187] = 1.0;
   aDateOpen[187] = D'2011.12.29 21:16:01'+time_offset*3600;
   aPriceOpen[187] = 1.29602;
   aDateClose[187] = D'2011.12.29 23:15:20'+time_offset*3600;
   aPriceClose[187] = 1.29543;

   // ========== 188 ===== 319 ==========
   aType[188] = OP_SELL;
   aSymbol[188] = "EURUSD";
   aLots[188] = 1.0;
   aDateOpen[188] = D'2011.12.29 22:10:50'+time_offset*3600;
   aPriceOpen[188] = 1.2959;
   aDateClose[188] = D'2011.12.29 23:15:17'+time_offset*3600;
   aPriceClose[188] = 1.29543;

   // ========== 189 ===== 314 ==========
   aType[189] = OP_SELL;
   aSymbol[189] = "EURUSD";
   aLots[189] = 1.0;
   aDateOpen[189] = D'2011.12.30 00:05:32'+time_offset*3600;
   aPriceOpen[189] = 1.29517;
   aDateClose[189] = D'2011.12.30 11:50:41'+time_offset*3600;
   aPriceClose[189] = 1.2933;

   // ========== 190 ===== 315 ==========
   aType[190] = OP_SELL;
   aSymbol[190] = "EURUSD";
   aLots[190] = 1.0;
   aDateOpen[190] = D'2011.12.30 00:50:58'+time_offset*3600;
   aPriceOpen[190] = 1.29537;
   aDateClose[190] = D'2011.12.30 11:44:43'+time_offset*3600;
   aPriceClose[190] = 1.2927;

   // ========== 191 ===== 297 ==========
   aType[191] = OP_BUY;
   aSymbol[191] = "EURUSD";
   aLots[191] = 1.0;
   aDateOpen[191] = D'2012.01.04 08:09:40'+time_offset*3600;
   aPriceOpen[191] = 1.30631;
   aDateClose[191] = D'2012.01.04 08:55:59'+time_offset*3600;
   aPriceClose[191] = 1.30357;

   // ========== 192 ===== 298 ==========
   aType[192] = OP_BUY;
   aSymbol[192] = "EURUSD";
   aLots[192] = 1.0;
   aDateOpen[192] = D'2012.01.04 08:12:40'+time_offset*3600;
   aPriceOpen[192] = 1.3064;
   aDateClose[192] = D'2012.01.04 08:55:56'+time_offset*3600;
   aPriceClose[192] = 1.30352;

   // ========== 193 ===== 299 ==========
   aType[193] = OP_BUY;
   aSymbol[193] = "EURUSD";
   aLots[193] = 1.0;
   aDateOpen[193] = D'2012.01.04 08:25:34'+time_offset*3600;
   aPriceOpen[193] = 1.30623;
   aDateClose[193] = D'2012.01.04 08:55:52'+time_offset*3600;
   aPriceClose[193] = 1.30351;

   // ========== 194 ===== 300 ==========
   aType[194] = OP_BUY;
   aSymbol[194] = "EURUSD";
   aLots[194] = 1.0;
   aDateOpen[194] = D'2012.01.04 08:26:52'+time_offset*3600;
   aPriceOpen[194] = 1.30614;
   aDateClose[194] = D'2012.01.04 08:55:49'+time_offset*3600;
   aPriceClose[194] = 1.30353;

   // ========== 195 ===== 288 ==========
   aType[195] = OP_SELL;
   aSymbol[195] = "EURUSD";
   aLots[195] = 1.0;
   aDateOpen[195] = D'2012.01.09 08:35:37'+time_offset*3600;
   aPriceOpen[195] = 1.2764;
   aDateClose[195] = D'2012.01.11 10:32:41'+time_offset*3600;
   aPriceClose[195] = 1.27542;

   // ========== 196 ===== 289 ==========
   aType[196] = OP_SELL;
   aSymbol[196] = "EURUSD";
   aLots[196] = 1.0;
   aDateOpen[196] = D'2012.01.09 08:36:19'+time_offset*3600;
   aPriceOpen[196] = 1.2767;
   aDateClose[196] = D'2012.01.11 10:31:57'+time_offset*3600;
   aPriceClose[196] = 1.27544;

   // ========== 197 ===== 290 ==========
   aType[197] = OP_SELL;
   aSymbol[197] = "EURUSD";
   aLots[197] = 1.0;
   aDateOpen[197] = D'2012.01.09 08:37:06'+time_offset*3600;
   aPriceOpen[197] = 1.2769;
   aDateClose[197] = D'2012.01.11 04:57:48'+time_offset*3600;
   aPriceClose[197] = 1.27442;

   // ========== 198 ===== 291 ==========
   aType[198] = OP_SELL;
   aSymbol[198] = "EURUSD";
   aLots[198] = 1.0;
   aDateOpen[198] = D'2012.01.09 08:37:56'+time_offset*3600;
   aPriceOpen[198] = 1.27655;
   aDateClose[198] = D'2012.01.11 04:57:44'+time_offset*3600;
   aPriceClose[198] = 1.27445;

   // ========== 199 ===== 283 ==========
   aType[199] = OP_SELL;
   aSymbol[199] = "EURUSD";
   aLots[199] = 1.0;
   aDateOpen[199] = D'2012.01.13 08:21:43'+time_offset*3600;
   aPriceOpen[199] = 1.28644;
   aDateClose[199] = D'2012.01.13 09:24:49'+time_offset*3600;
   aPriceClose[199] = 1.28388;

   // ========== 200 ===== 279 ==========
   aType[200] = OP_BUY;
   aSymbol[200] = "EURUSD";
   aLots[200] = 1.0;
   aDateOpen[200] = D'2012.01.13 14:09:03'+time_offset*3600;
   aPriceOpen[200] = 1.27199;
   aDateClose[200] = D'2012.01.13 20:36:21'+time_offset*3600;
   aPriceClose[200] = 1.26764;

   // ========== 201 ===== 281 ==========
   aType[201] = OP_BUY;
   aSymbol[201] = "EURUSD";
   aLots[201] = 1.0;
   aDateOpen[201] = D'2012.01.13 14:10:42'+time_offset*3600;
   aPriceOpen[201] = 1.27127;
   aDateClose[201] = D'2012.01.13 20:35:10'+time_offset*3600;
   aPriceClose[201] = 1.26769;

   // ========== 202 ===== 282 ==========
   aType[202] = OP_BUY;
   aSymbol[202] = "EURUSD";
   aLots[202] = 1.0;
   aDateOpen[202] = D'2012.01.13 14:11:50'+time_offset*3600;
   aPriceOpen[202] = 1.27047;
   aDateClose[202] = D'2012.01.13 20:35:04'+time_offset*3600;
   aPriceClose[202] = 1.26769;

   // ========== 203 ===== 280 ==========
   aType[203] = OP_BUY;
   aSymbol[203] = "EURUSD";
   aLots[203] = 1.0;
   aDateOpen[203] = D'2012.01.13 14:51:43'+time_offset*3600;
   aPriceOpen[203] = 1.2683;
   aDateClose[203] = D'2012.01.13 20:36:12'+time_offset*3600;
   aPriceClose[203] = 1.26769;

   // ========== 204 ===== 278 ==========
   aType[204] = OP_SELL;
   aSymbol[204] = "EURUSD";
   aLots[204] = 1.0;
   aDateOpen[204] = D'2012.01.17 02:49:50'+time_offset*3600;
   aPriceOpen[204] = 1.2725;
   aDateClose[204] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPriceClose[204] = 1.272;

   // ========== 205 ===== 277 ==========
   aType[205] = OP_SELL;
   aSymbol[205] = "EURUSD";
   aLots[205] = 1.0;
   aDateOpen[205] = D'2012.01.17 02:52:42'+time_offset*3600;
   aPriceOpen[205] = 1.27297;
   aDateClose[205] = D'2012.01.17 14:27:36'+time_offset*3600;
   aPriceClose[205] = 1.272;

   // ========== 206 ===== 275 ==========
   aType[206] = OP_SELL;
   aSymbol[206] = "EURUSD";
   aLots[206] = 1.0;
   aDateOpen[206] = D'2012.01.17 03:05:47'+time_offset*3600;
   aPriceOpen[206] = 1.27285;
   aDateClose[206] = D'2012.01.17 14:41:53'+time_offset*3600;
   aPriceClose[206] = 1.27187;

   // ========== 207 ===== 276 ==========
   aType[207] = OP_SELL;
   aSymbol[207] = "EURUSD";
   aLots[207] = 1.0;
   aDateOpen[207] = D'2012.01.17 03:10:56'+time_offset*3600;
   aPriceOpen[207] = 1.27314;
   aDateClose[207] = D'2012.01.17 14:41:49'+time_offset*3600;
   aPriceClose[207] = 1.27189;

   // ========== 208 ===== 271 ==========
   aType[208] = OP_SELL;
   aSymbol[208] = "EURUSD";
   aLots[208] = 1.0;
   aDateOpen[208] = D'2012.01.18 22:53:44'+time_offset*3600;
   aPriceOpen[208] = 1.2852;
   aDateClose[208] = D'2012.01.20 14:16:02'+time_offset*3600;
   aPriceClose[208] = 1.2924;

   // ========== 209 ===== 272 ==========
   aType[209] = OP_SELL;
   aSymbol[209] = "EURUSD";
   aLots[209] = 1.0;
   aDateOpen[209] = D'2012.01.19 03:29:19'+time_offset*3600;
   aPriceOpen[209] = 1.28729;
   aDateClose[209] = D'2012.01.20 14:15:58'+time_offset*3600;
   aPriceClose[209] = 1.29239;

   // ========== 210 ===== 273 ==========
   aType[210] = OP_SELL;
   aSymbol[210] = "EURUSD";
   aLots[210] = 1.0;
   aDateOpen[210] = D'2012.01.19 12:38:47'+time_offset*3600;
   aPriceOpen[210] = 1.29076;
   aDateClose[210] = D'2012.01.20 14:12:39'+time_offset*3600;
   aPriceClose[210] = 1.29181;

   // ========== 211 ===== 274 ==========
   aType[211] = OP_SELL;
   aSymbol[211] = "EURUSD";
   aLots[211] = 1.0;
   aDateOpen[211] = D'2012.01.19 12:53:16'+time_offset*3600;
   aPriceOpen[211] = 1.2925;
   aDateClose[211] = D'2012.01.20 14:12:35'+time_offset*3600;
   aPriceClose[211] = 1.29178;

   // ========== 212 ===== 267 ==========
   aType[212] = OP_SELL;
   aSymbol[212] = "EURUSD";
   aLots[212] = 1.0;
   aDateOpen[212] = D'2012.01.23 10:56:31'+time_offset*3600;
   aPriceOpen[212] = 1.29703;
   aDateClose[212] = D'2012.01.24 09:09:38'+time_offset*3600;
   aPriceClose[212] = 1.30424;

   // ========== 213 ===== 268 ==========
   aType[213] = OP_SELL;
   aSymbol[213] = "EURUSD";
   aLots[213] = 1.0;
   aDateOpen[213] = D'2012.01.23 10:58:12'+time_offset*3600;
   aPriceOpen[213] = 1.29716;
   aDateClose[213] = D'2012.01.24 09:09:35'+time_offset*3600;
   aPriceClose[213] = 1.30428;

   // ========== 214 ===== 269 ==========
   aType[214] = OP_SELL;
   aSymbol[214] = "EURUSD";
   aLots[214] = 1.0;
   aDateOpen[214] = D'2012.01.23 10:59:32'+time_offset*3600;
   aPriceOpen[214] = 1.29754;
   aDateClose[214] = D'2012.01.24 09:09:24'+time_offset*3600;
   aPriceClose[214] = 1.30468;

   // ========== 215 ===== 270 ==========
   aType[215] = OP_SELL;
   aSymbol[215] = "EURUSD";
   aLots[215] = 1.0;
   aDateOpen[215] = D'2012.01.23 11:00:35'+time_offset*3600;
   aPriceOpen[215] = 1.2977;
   aDateClose[215] = D'2012.01.24 09:09:20'+time_offset*3600;
   aPriceClose[215] = 1.30472;

   // ========== 216 ===== 255 ==========
   aType[216] = OP_BUY;
   aSymbol[216] = "EURUSD";
   aLots[216] = 1.0;
   aDateOpen[216] = D'2012.01.27 00:16:31'+time_offset*3600;
   aPriceOpen[216] = 1.30887;
   aDateClose[216] = D'2012.01.27 10:05:37'+time_offset*3600;
   aPriceClose[216] = 1.314;

   // ========== 217 ===== 257 ==========
   aType[217] = OP_BUY;
   aSymbol[217] = "EURUSD";
   aLots[217] = 1.0;
   aDateOpen[217] = D'2012.01.27 00:25:37'+time_offset*3600;
   aPriceOpen[217] = 1.30859;
   aDateClose[217] = D'2012.01.27 07:01:49'+time_offset*3600;
   aPriceClose[217] = 1.31081;

   // ========== 218 ===== 256 ==========
   aType[218] = OP_BUY;
   aSymbol[218] = "EURUSD";
   aLots[218] = 1.0;
   aDateOpen[218] = D'2012.01.27 00:26:14'+time_offset*3600;
   aPriceOpen[218] = 1.3083;
   aDateClose[218] = D'2012.01.27 09:57:03'+time_offset*3600;
   aPriceClose[218] = 1.31266;

   // ========== 219 ===== 258 ==========
   aType[219] = OP_BUY;
   aSymbol[219] = "EURUSD";
   aLots[219] = 1.0;
   aDateOpen[219] = D'2012.01.27 00:27:36'+time_offset*3600;
   aPriceOpen[219] = 1.30836;
   aDateClose[219] = D'2012.01.27 07:01:01'+time_offset*3600;
   aPriceClose[219] = 1.3109;

   // ========== 220 ===== 251 ==========
   aType[220] = OP_SELL;
   aSymbol[220] = "EURUSD";
   aLots[220] = 1.0;
   aDateOpen[220] = D'2012.01.31 10:25:28'+time_offset*3600;
   aPriceOpen[220] = 1.31826;
   aDateClose[220] = D'2012.01.31 13:09:27'+time_offset*3600;
   aPriceClose[220] = 1.31756;

   // ========== 221 ===== 245 ==========
   aType[221] = OP_BUY;
   aSymbol[221] = "EURUSD";
   aLots[221] = 1.0;
   aDateOpen[221] = D'2012.02.09 13:16:59'+time_offset*3600;
   aPriceOpen[221] = 1.32964;
   aDateClose[221] = D'2012.02.09 13:40:09'+time_offset*3600;
   aPriceClose[221] = 1.32588;

   // ========== 222 ===== 236 ==========
   aType[222] = OP_BUY;
   aSymbol[222] = "EURUSD";
   aLots[222] = 1.0;
   aDateOpen[222] = D'2012.02.16 07:01:48'+time_offset*3600;
   aPriceOpen[222] = 1.29987;
   aDateClose[222] = D'2012.02.16 15:05:31'+time_offset*3600;
   aPriceClose[222] = 1.30392;

   // ========== 223 ===== 235 ==========
   aType[223] = OP_SELL;
   aSymbol[223] = "EURUSD";
   aLots[223] = 1.0;
   aDateOpen[223] = D'2012.02.17 13:39:16'+time_offset*3600;
   aPriceOpen[223] = 1.31728;
   aDateClose[223] = D'2012.02.17 17:54:00'+time_offset*3600;
   aPriceClose[223] = 1.31541;

   // ========== 224 ===== 232 ==========
   aType[224] = OP_SELL;
   aSymbol[224] = "EURUSD";
   aLots[224] = 1.0;
   aDateOpen[224] = D'2012.02.19 22:00:08'+time_offset*3600;
   aPriceOpen[224] = 1.31771;
   aDateClose[224] = D'2012.02.21 02:51:59'+time_offset*3600;
   aPriceClose[224] = 1.32536;

   // ========== 225 ===== 233 ==========
   aType[225] = OP_SELL;
   aSymbol[225] = "EURUSD";
   aLots[225] = 1.0;
   aDateOpen[225] = D'2012.02.20 11:53:56'+time_offset*3600;
   aPriceOpen[225] = 1.32682;
   aDateClose[225] = D'2012.02.21 02:51:08'+time_offset*3600;
   aPriceClose[225] = 1.32473;

   // ========== 226 ===== 234 ==========
   aType[226] = OP_SELL;
   aSymbol[226] = "EURUSD";
   aLots[226] = 1.0;
   aDateOpen[226] = D'2012.02.20 11:54:53'+time_offset*3600;
   aPriceOpen[226] = 1.3268;
   aDateClose[226] = D'2012.02.20 23:59:27'+time_offset*3600;
   aPriceClose[226] = 1.32067;

   // ========== 227 ===== 230 ==========
   aType[227] = OP_BUY;
   aSymbol[227] = "EURUSD";
   aLots[227] = 1.0;
   aDateOpen[227] = D'2012.02.21 03:12:35'+time_offset*3600;
   aPriceOpen[227] = 1.32911;
   aDateClose[227] = D'2012.02.21 07:23:00'+time_offset*3600;
   aPriceClose[227] = 1.32525;

   // ========== 228 ===== 225 ==========
   aType[228] = OP_SELL;
   aSymbol[228] = "EURUSD";
   aLots[228] = 1.0;
   aDateOpen[228] = D'2012.02.24 12:00:46'+time_offset*3600;
   aPriceOpen[228] = 1.34119;
   aDateClose[228] = D'2012.02.27 10:25:26'+time_offset*3600;
   aPriceClose[228] = 1.34146;

   // ========== 229 ===== 226 ==========
   aType[229] = OP_SELL;
   aSymbol[229] = "EURUSD";
   aLots[229] = 1.0;
   aDateOpen[229] = D'2012.02.24 18:49:15'+time_offset*3600;
   aPriceOpen[229] = 1.34649;
   aDateClose[229] = D'2012.02.27 10:21:19'+time_offset*3600;
   aPriceClose[229] = 1.34194;

   // ========== 230 ===== 224 ==========
   aType[230] = OP_BUY;
   aSymbol[230] = "EURUSD";
   aLots[230] = 1.0;
   aDateOpen[230] = D'2012.02.27 12:30:14'+time_offset*3600;
   aPriceOpen[230] = 1.33922;
   aDateClose[230] = D'2012.02.27 15:45:05'+time_offset*3600;
   aPriceClose[230] = 1.3413;

   // ========== 231 ===== 220 ==========
   aType[231] = OP_BUY;
   aSymbol[231] = "EURUSD";
   aLots[231] = 1.0;
   aDateOpen[231] = D'2012.03.01 14:00:11'+time_offset*3600;
   aPriceOpen[231] = 1.32927;
   aDateClose[231] = D'2012.03.01 20:17:22'+time_offset*3600;
   aPriceClose[231] = 1.33134;

   // ========== 232 ===== 216 ==========
   aType[232] = OP_BUY;
   aSymbol[232] = "EURUSD";
   aLots[232] = 1.0;
   aDateOpen[232] = D'2012.03.02 15:04:10'+time_offset*3600;
   aPriceOpen[232] = 1.319;
   aDateClose[232] = D'2012.03.05 07:08:44'+time_offset*3600;
   aPriceClose[232] = 1.32026;

   // ========== 233 ===== 213 ==========
   aType[233] = OP_BUY;
   aSymbol[233] = "EURUSD";
   aLots[233] = 1.0;
   aDateOpen[233] = D'2012.03.05 09:09:03'+time_offset*3600;
   aPriceOpen[233] = 1.31746;
   aDateClose[233] = D'2012.03.05 12:31:54'+time_offset*3600;
   aPriceClose[233] = 1.32024;

   // ========== 234 ===== 208 ==========
   aType[234] = OP_SELL;
   aSymbol[234] = "EURUSD";
   aLots[234] = 1.0;
   aDateOpen[234] = D'2012.03.08 09:33:01'+time_offset*3600;
   aPriceOpen[234] = 1.32003;
   aDateClose[234] = D'2012.03.09 08:01:28'+time_offset*3600;
   aPriceClose[234] = 1.32198;

   // ========== 235 ===== 209 ==========
   aType[235] = OP_SELL;
   aSymbol[235] = "EURUSD";
   aLots[235] = 1.0;
   aDateOpen[235] = D'2012.03.08 11:50:14'+time_offset*3600;
   aPriceOpen[235] = 1.32362;
   aDateClose[235] = D'2012.03.09 07:53:29'+time_offset*3600;
   aPriceClose[235] = 1.32237;

   // ========== 236 ===== 210 ==========
   aType[236] = OP_SELL;
   aSymbol[236] = "EURUSD";
   aLots[236] = 1.0;
   aDateOpen[236] = D'2012.03.08 12:16:30'+time_offset*3600;
   aPriceOpen[236] = 1.32441;
   aDateClose[236] = D'2012.03.09 06:29:10'+time_offset*3600;
   aPriceClose[236] = 1.32354;

   // ========== 237 ===== 206 ==========
   aType[237] = OP_BUY;
   aSymbol[237] = "EURUSD";
   aLots[237] = 1.0;
   aDateOpen[237] = D'2012.03.09 13:51:54'+time_offset*3600;
   aPriceOpen[237] = 1.31397;
   aDateClose[237] = D'2012.03.12 01:27:28'+time_offset*3600;
   aPriceClose[237] = 1.30869;

   // ========== 238 ===== 204 ==========
   aType[238] = OP_SELL;
   aSymbol[238] = "EURUSD";
   aLots[238] = 1.0;
   aDateOpen[238] = D'2012.03.14 05:49:42'+time_offset*3600;
   aPriceOpen[238] = 1.30523;
   aDateClose[238] = D'2012.03.14 11:01:29'+time_offset*3600;
   aPriceClose[238] = 1.308;

   // ========== 239 ===== 199 ==========
   aType[239] = OP_BUY;
   aSymbol[239] = "EURUSD";
   aLots[239] = 1.0;
   aDateOpen[239] = D'2012.03.16 10:53:03'+time_offset*3600;
   aPriceOpen[239] = 1.30557;
   aDateClose[239] = D'2012.03.16 11:07:08'+time_offset*3600;
   aPriceClose[239] = 1.30668;

   // ========== 240 ===== 197 ==========
   aType[240] = OP_SELL;
   aSymbol[240] = "EURUSD";
   aLots[240] = 1.0;
   aDateOpen[240] = D'2012.03.21 15:05:20'+time_offset*3600;
   aPriceOpen[240] = 1.31889;
   aDateClose[240] = D'2012.03.21 16:09:44'+time_offset*3600;
   aPriceClose[240] = 1.32019;

   // ========== 241 ===== 196 ==========
   aType[241] = OP_SELL;
   aSymbol[241] = "EURUSD";
   aLots[241] = 1.0;
   aDateOpen[241] = D'2012.03.22 08:31:49'+time_offset*3600;
   aPriceOpen[241] = 1.31624;
   aDateClose[241] = D'2012.03.22 16:01:45'+time_offset*3600;
   aPriceClose[241] = 1.32;

   // ========== 242 ===== 195 ==========
   aType[242] = OP_BUY;
   aSymbol[242] = "EURUSD";
   aLots[242] = 1.0;
   aDateOpen[242] = D'2012.03.23 09:23:51'+time_offset*3600;
   aPriceOpen[242] = 1.32677;
   aDateClose[242] = D'2012.03.26 06:29:41'+time_offset*3600;
   aPriceClose[242] = 1.32538;

   // ========== 243 ===== 193 ==========
   aType[243] = OP_SELL;
   aSymbol[243] = "EURUSD";
   aLots[243] = 1.0;
   aDateOpen[243] = D'2012.03.26 08:42:33'+time_offset*3600;
   aPriceOpen[243] = 1.32075;
   aDateClose[243] = D'2012.03.26 11:08:16'+time_offset*3600;
   aPriceClose[243] = 1.3247;

   // ========== 244 ===== 189 ==========
   aType[244] = OP_BUY;
   aSymbol[244] = "EURUSD";
   aLots[244] = 1.0;
   aDateOpen[244] = D'2012.03.30 00:45:25'+time_offset*3600;
   aPriceOpen[244] = 1.33334;
   aDateClose[244] = D'2012.03.30 13:00:53'+time_offset*3600;
   aPriceClose[244] = 1.33386;

   // ========== 245 ===== 188 ==========
   aType[245] = OP_BUY;
   aSymbol[245] = "EURUSD";
   aLots[245] = 1.0;
   aDateOpen[245] = D'2012.04.02 07:40:06'+time_offset*3600;
   aPriceOpen[245] = 1.33683;
   aDateClose[245] = D'2012.04.02 12:07:35'+time_offset*3600;
   aPriceClose[245] = 1.332;

   // ========== 246 ===== 186 ==========
   aType[246] = OP_SELL;
   aSymbol[246] = "EURUSD";
   aLots[246] = 1.0;
   aDateOpen[246] = D'2012.04.03 22:49:35'+time_offset*3600;
   aPriceOpen[246] = 1.32233;
   aDateClose[246] = D'2012.04.04 11:12:18'+time_offset*3600;
   aPriceClose[246] = 1.31589;

   // ========== 247 ===== 184 ==========
   aType[247] = OP_BUY;
   aSymbol[247] = "EURUSD";
   aLots[247] = 1.0;
   aDateOpen[247] = D'2012.04.05 09:32:41'+time_offset*3600;
   aPriceOpen[247] = 1.3091;
   aDateClose[247] = D'2012.04.06 12:32:21'+time_offset*3600;
   aPriceClose[247] = 1.31;

   // ========== 248 ===== 185 ==========
   aType[248] = OP_BUY;
   aSymbol[248] = "EURUSD";
   aLots[248] = 1.0;
   aDateOpen[248] = D'2012.04.05 10:06:50'+time_offset*3600;
   aPriceOpen[248] = 1.30621;
   aDateClose[248] = D'2012.04.06 06:11:25'+time_offset*3600;
   aPriceClose[248] = 1.30726;

   // ========== 249 ===== 175 ==========
   aType[249] = OP_SELL;
   aSymbol[249] = "EURUSD";
   aLots[249] = 1.0;
   aDateOpen[249] = D'2012.04.16 20:49:47'+time_offset*3600;
   aPriceOpen[249] = 1.31418;
   aDateClose[249] = D'2012.04.17 06:31:58'+time_offset*3600;
   aPriceClose[249] = 1.30987;

   // ========== 250 ===== 171 ==========
   aType[250] = OP_BUY;
   aSymbol[250] = "EURUSD";
   aLots[250] = 1.0;
   aDateOpen[250] = D'2012.04.20 05:48:38'+time_offset*3600;
   aPriceOpen[250] = 1.31651;
   aDateClose[250] = D'2012.04.20 06:44:47'+time_offset*3600;
   aPriceClose[250] = 1.31456;

   // ========== 251 ===== 169 ==========
   aType[251] = OP_BUY;
   aSymbol[251] = "EURUSD";
   aLots[251] = 1.0;
   aDateOpen[251] = D'2012.04.20 08:01:17'+time_offset*3600;
   aPriceOpen[251] = 1.31763;
   aDateClose[251] = D'2012.04.20 09:23:02'+time_offset*3600;
   aPriceClose[251] = 1.31566;

   // ========== 252 ===== 170 ==========
   aType[252] = OP_BUY;
   aSymbol[252] = "EURUSD";
   aLots[252] = 1.0;
   aDateOpen[252] = D'2012.04.20 08:04:07'+time_offset*3600;
   aPriceOpen[252] = 1.31673;
   aDateClose[252] = D'2012.04.20 09:05:50'+time_offset*3600;
   aPriceClose[252] = 1.31525;

   // ========== 253 ===== 164 ==========
   aType[253] = OP_SELL;
   aSymbol[253] = "EURUSD";
   aLots[253] = 1.0;
   aDateOpen[253] = D'2012.04.25 11:33:31'+time_offset*3600;
   aPriceOpen[253] = 1.32038;
   aDateClose[253] = D'2012.04.25 16:33:07'+time_offset*3600;
   aPriceClose[253] = 1.31997;

   // ========== 254 ===== 156 ==========
   aType[254] = OP_SELL;
   aSymbol[254] = "EURUSD";
   aLots[254] = 1.0;
   aDateOpen[254] = D'2012.05.02 07:43:22'+time_offset*3600;
   aPriceOpen[254] = 1.32039;
   aDateClose[254] = D'2012.05.02 09:26:39'+time_offset*3600;
   aPriceClose[254] = 1.3143;

   // ========== 255 ===== 154 ==========
   aType[255] = OP_SELL;
   aSymbol[255] = "EURUSD";
   aLots[255] = 1.0;
   aDateOpen[255] = D'2012.05.02 07:45:13'+time_offset*3600;
   aPriceOpen[255] = 1.31933;
   aDateClose[255] = D'2012.05.03 05:18:01'+time_offset*3600;
   aPriceClose[255] = 1.31469;

   // ========== 256 ===== 155 ==========
   aType[256] = OP_SELL;
   aSymbol[256] = "EURUSD";
   aLots[256] = 1.0;
   aDateOpen[256] = D'2012.05.02 14:20:35'+time_offset*3600;
   aPriceOpen[256] = 1.31526;
   aDateClose[256] = D'2012.05.03 02:10:23'+time_offset*3600;
   aPriceClose[256] = 1.31391;

   // ========== 257 ===== 153 ==========
   aType[257] = OP_SELL;
   aSymbol[257] = "EURUSD";
   aLots[257] = 1.0;
   aDateOpen[257] = D'2012.05.04 15:23:57'+time_offset*3600;
   aPriceOpen[257] = 1.31025;
   aDateClose[257] = D'2012.05.04 15:45:56'+time_offset*3600;
   aPriceClose[257] = 1.30894;

   // ========== 258 ===== 147 ==========
   aType[258] = OP_SELL;
   aSymbol[258] = "EURUSD";
   aLots[258] = 1.0;
   aDateOpen[258] = D'2012.05.07 13:20:18'+time_offset*3600;
   aPriceOpen[258] = 1.30453;
   aDateClose[258] = D'2012.05.08 03:20:06'+time_offset*3600;
   aPriceClose[258] = 1.30314;

   // ========== 259 ===== 149 ==========
   aType[259] = OP_SELL;
   aSymbol[259] = "EURUSD";
   aLots[259] = 1.0;
   aDateOpen[259] = D'2012.05.07 13:27:55'+time_offset*3600;
   aPriceOpen[259] = 1.3054;
   aDateClose[259] = D'2012.05.07 13:55:57'+time_offset*3600;
   aPriceClose[259] = 1.30445;

   // ========== 260 ===== 118 ==========
   aType[260] = OP_SELL;
   aSymbol[260] = "EURUSD";
   aLots[260] = 1.0;
   aDateOpen[260] = D'2012.05.20 21:02:19'+time_offset*3600;
   aPriceOpen[260] = 1.27653;
   aDateClose[260] = D'2012.05.21 11:44:32'+time_offset*3600;
   aPriceClose[260] = 1.2765;

   // ========== 261 ===== 119 ==========
   aType[261] = OP_SELL;
   aSymbol[261] = "EURUSD";
   aLots[261] = 1.0;
   aDateOpen[261] = D'2012.05.21 01:36:59'+time_offset*3600;
   aPriceOpen[261] = 1.28085;
   aDateClose[261] = D'2012.05.21 03:40:47'+time_offset*3600;
   aPriceClose[261] = 1.27951;

   // ========== 262 ===== 116 ==========
   aType[262] = OP_SELL;
   aSymbol[262] = "EURUSD";
   aLots[262] = 1.0;
   aDateOpen[262] = D'2012.05.22 09:05:51'+time_offset*3600;
   aPriceOpen[262] = 1.27602;
   aDateClose[262] = D'2012.05.22 09:39:51'+time_offset*3600;
   aPriceClose[262] = 1.27579;

   // ========== 263 ===== 113 ==========
   aType[263] = OP_BUY;
   aSymbol[263] = "EURUSD";
   aLots[263] = 1.0;
   aDateOpen[263] = D'2012.05.22 21:31:35'+time_offset*3600;
   aPriceOpen[263] = 1.26777;
   aDateClose[263] = D'2012.05.23 12:36:08'+time_offset*3600;
   aPriceClose[263] = 1.2654;

   // ========== 264 ===== 114 ==========
   aType[264] = OP_BUY;
   aSymbol[264] = "EURUSD";
   aLots[264] = 1.0;
   aDateOpen[264] = D'2012.05.23 00:23:25'+time_offset*3600;
   aPriceOpen[264] = 1.26611;
   aDateClose[264] = D'2012.05.23 12:34:22'+time_offset*3600;
   aPriceClose[264] = 1.26574;

   // ========== 265 ===== 112 ==========
   aType[265] = OP_SELL;
   aSymbol[265] = "EURUSD";
   aLots[265] = 1.0;
   aDateOpen[265] = D'2012.05.24 07:44:54'+time_offset*3600;
   aPriceOpen[265] = 1.25449;
   aDateClose[265] = D'2012.05.24 07:57:48'+time_offset*3600;
   aPriceClose[265] = 1.25419;

   // ========== 266 ===== 110 ==========
   aType[266] = OP_BUY;
   aSymbol[266] = "EURUSD";
   aLots[266] = 1.0;
   aDateOpen[266] = D'2012.05.24 19:15:40'+time_offset*3600;
   aPriceOpen[266] = 1.25256;
   aDateClose[266] = D'2012.05.24 19:31:19'+time_offset*3600;
   aPriceClose[266] = 1.25412;

   // ========== 267 ===== 109 ==========
   aType[267] = OP_SELL;
   aSymbol[267] = "EURUSD";
   aLots[267] = 1.0;
   aDateOpen[267] = D'2012.05.25 12:29:41'+time_offset*3600;
   aPriceOpen[267] = 1.25233;
   aDateClose[267] = D'2012.05.25 12:36:14'+time_offset*3600;
   aPriceClose[267] = 1.25088;

   // ========== 268 ===== 107 ==========
   aType[268] = OP_SELL;
   aSymbol[268] = "EURUSD";
   aLots[268] = 1.0;
   aDateOpen[268] = D'2012.05.28 03:00:43'+time_offset*3600;
   aPriceOpen[268] = 1.25898;
   aDateClose[268] = D'2012.05.28 08:08:20'+time_offset*3600;
   aPriceClose[268] = 1.25752;

   // ========== 269 ===== 108 ==========
   aType[269] = OP_SELL;
   aSymbol[269] = "EURUSD";
   aLots[269] = 1.0;
   aDateOpen[269] = D'2012.05.28 05:43:29'+time_offset*3600;
   aPriceOpen[269] = 1.2603;
   aDateClose[269] = D'2012.05.28 06:05:45'+time_offset*3600;
   aPriceClose[269] = 1.25967;

   // ========== 270 ===== 105 ==========
   aType[270] = OP_BUY;
   aSymbol[270] = "EURUSD";
   aLots[270] = 1.0;
   aDateOpen[270] = D'2012.05.29 07:05:08'+time_offset*3600;
   aPriceOpen[270] = 1.25619;
   aDateClose[270] = D'2012.05.29 09:14:52'+time_offset*3600;
   aPriceClose[270] = 1.25606;

   // ========== 271 ===== 104 ==========
   aType[271] = OP_SELL;
   aSymbol[271] = "EURUSD";
   aLots[271] = 1.0;
   aDateOpen[271] = D'2012.05.29 11:45:06'+time_offset*3600;
   aPriceOpen[271] = 1.25215;
   aDateClose[271] = D'2012.05.29 12:09:08'+time_offset*3600;
   aPriceClose[271] = 1.25212;

   // ========== 272 ===== 103 ==========
   aType[272] = OP_BUY;
   aSymbol[272] = "EURUSD";
   aLots[272] = 1.0;
   aDateOpen[272] = D'2012.05.30 01:38:54'+time_offset*3600;
   aPriceOpen[272] = 1.24657;
   aDateClose[272] = D'2012.05.30 06:31:35'+time_offset*3600;
   aPriceClose[272] = 1.24722;

   // ========== 273 ===== 97 ==========
   aType[273] = OP_BUY;
   aSymbol[273] = "EURUSD";
   aLots[273] = 1.0;
   aDateOpen[273] = D'2012.05.30 07:58:08'+time_offset*3600;
   aPriceOpen[273] = 1.24584;
   aDateClose[273] = D'2012.05.31 09:09:40'+time_offset*3600;
   aPriceClose[273] = 1.24203;

   // ========== 274 ===== 98 ==========
   aType[274] = OP_BUY;
   aSymbol[274] = "EURUSD";
   aLots[274] = 1.0;
   aDateOpen[274] = D'2012.05.30 09:12:22'+time_offset*3600;
   aPriceOpen[274] = 1.24416;
   aDateClose[274] = D'2012.05.31 08:41:47'+time_offset*3600;
   aPriceClose[274] = 1.24146;

   // ========== 275 ===== 100 ==========
   aType[275] = OP_BUY;
   aSymbol[275] = "EURUSD";
   aLots[275] = 1.0;
   aDateOpen[275] = D'2012.05.30 20:26:56'+time_offset*3600;
   aPriceOpen[275] = 1.23676;
   aDateClose[275] = D'2012.05.31 03:25:20'+time_offset*3600;
   aPriceClose[275] = 1.23741;

   // ========== 276 ===== 94 ==========
   aType[276] = OP_BUY;
   aSymbol[276] = "EURUSD";
   aLots[276] = 1.0;
   aDateOpen[276] = D'2012.06.01 00:56:46'+time_offset*3600;
   aPriceOpen[276] = 1.23448;
   aDateClose[276] = D'2012.06.01 13:28:27'+time_offset*3600;
   aPriceClose[276] = 1.24001;

   // ========== 277 ===== 93 ==========
   aType[277] = OP_BUY;
   aSymbol[277] = "EURUSD";
   aLots[277] = 1.0;
   aDateOpen[277] = D'2012.06.01 12:15:31'+time_offset*3600;
   aPriceOpen[277] = 1.23229;
   aDateClose[277] = D'2012.06.01 13:32:16'+time_offset*3600;
   aPriceClose[277] = 1.24112;

   // ========== 278 ===== 95 ==========
   aType[278] = OP_BUY;
   aSymbol[278] = "EURUSD";
   aLots[278] = 1.0;
   aDateOpen[278] = D'2012.06.01 12:31:23'+time_offset*3600;
   aPriceOpen[278] = 1.22984;
   aDateClose[278] = D'2012.06.01 13:27:29'+time_offset*3600;
   aPriceClose[278] = 1.23929;

   // ========== 279 ===== 91 ==========
   aType[279] = OP_BUY;
   aSymbol[279] = "EURUSD";
   aLots[279] = 1.0;
   aDateOpen[279] = D'2012.06.01 13:52:13'+time_offset*3600;
   aPriceOpen[279] = 1.241;
   aDateClose[279] = D'2012.06.01 14:10:18'+time_offset*3600;
   aPriceClose[279] = 1.24259;

   // ========== 280 ===== 92 ==========
   aType[280] = OP_BUY;
   aSymbol[280] = "EURUSD";
   aLots[280] = 1.0;
   aDateOpen[280] = D'2012.06.01 13:57:47'+time_offset*3600;
   aPriceOpen[280] = 1.23946;
   aDateClose[280] = D'2012.06.01 14:01:03'+time_offset*3600;
   aPriceClose[280] = 1.24158;

   // ========== 281 ===== 90 ==========
   aType[281] = OP_BUY;
   aSymbol[281] = "EURUSD";
   aLots[281] = 1.0;
   aDateOpen[281] = D'2012.06.01 14:59:27'+time_offset*3600;
   aPriceOpen[281] = 1.2365;
   aDateClose[281] = D'2012.06.01 15:38:57'+time_offset*3600;
   aPriceClose[281] = 1.23826;

   // ========== 282 ===== 89 ==========
   aType[282] = OP_SELL;
   aSymbol[282] = "EURUSD";
   aLots[282] = 1.0;
   aDateOpen[282] = D'2012.06.04 13:38:33'+time_offset*3600;
   aPriceOpen[282] = 1.24951;
   aDateClose[282] = D'2012.06.04 13:43:44'+time_offset*3600;
   aPriceClose[282] = 1.2487;

   // ========== 283 ===== 87 ==========
   aType[283] = OP_SELL;
   aSymbol[283] = "EURUSD";
   aLots[283] = 1.0;
   aDateOpen[283] = D'2012.06.04 14:07:54'+time_offset*3600;
   aPriceOpen[283] = 1.24906;
   aDateClose[283] = D'2012.06.05 06:49:41'+time_offset*3600;
   aPriceClose[283] = 1.24951;

   // ========== 284 ===== 88 ==========
   aType[284] = OP_SELL;
   aSymbol[284] = "EURUSD";
   aLots[284] = 1.0;
   aDateOpen[284] = D'2012.06.05 00:07:06'+time_offset*3600;
   aPriceOpen[284] = 1.25357;
   aDateClose[284] = D'2012.06.05 06:41:33'+time_offset*3600;
   aPriceClose[284] = 1.24994;

   // ========== 285 ===== 83 ==========
   aType[285] = OP_SELL;
   aSymbol[285] = "EURUSD";
   aLots[285] = 1.0;
   aDateOpen[285] = D'2012.06.07 11:27:24'+time_offset*3600;
   aPriceOpen[285] = 1.25859;
   aDateClose[285] = D'2012.06.07 14:19:56'+time_offset*3600;
   aPriceClose[285] = 1.25629;

   // ========== 286 ===== 76 ==========
   aType[286] = OP_SELL;
   aSymbol[286] = "EURUSD";
   aLots[286] = 1.0;
   aDateOpen[286] = D'2012.06.10 21:39:35'+time_offset*3600;
   aPriceOpen[286] = 1.266;
   aDateClose[286] = D'2012.06.11 07:25:10'+time_offset*3600;
   aPriceClose[286] = 1.26194;

   // ========== 287 ===== 78 ==========
   aType[287] = OP_SELL;
   aSymbol[287] = "EURUSD";
   aLots[287] = 1.0;
   aDateOpen[287] = D'2012.06.11 05:37:38'+time_offset*3600;
   aPriceOpen[287] = 1.26445;
   aDateClose[287] = D'2012.06.11 06:16:35'+time_offset*3600;
   aPriceClose[287] = 1.26286;

   // ========== 288 ===== 74 ==========
   aType[288] = OP_BUY;
   aSymbol[288] = "EURUSD";
   aLots[288] = 1.0;
   aDateOpen[288] = D'2012.06.11 21:08:52'+time_offset*3600;
   aPriceOpen[288] = 1.24746;
   aDateClose[288] = D'2012.06.11 23:56:05'+time_offset*3600;
   aPriceClose[288] = 1.24765;

   // ========== 289 ===== 75 ==========
   aType[289] = OP_BUY;
   aSymbol[289] = "EURUSD";
   aLots[289] = 1.0;
   aDateOpen[289] = D'2012.06.11 22:10:31'+time_offset*3600;
   aPriceOpen[289] = 1.24644;
   aDateClose[289] = D'2012.06.11 22:40:17'+time_offset*3600;
   aPriceClose[289] = 1.24709;

   // ========== 290 ===== 73 ==========
   aType[290] = OP_SELL;
   aSymbol[290] = "EURUSD";
   aLots[290] = 1.0;
   aDateOpen[290] = D'2012.06.12 14:08:29'+time_offset*3600;
   aPriceOpen[290] = 1.24568;
   aDateClose[290] = D'2012.06.12 15:13:52'+time_offset*3600;
   aPriceClose[290] = 1.24784;

   // ========== 291 ===== 72 ==========
   aType[291] = OP_SELL;
   aSymbol[291] = "EURUSD";
   aLots[291] = 1.0;
   aDateOpen[291] = D'2012.06.13 11:50:20'+time_offset*3600;
   aPriceOpen[291] = 1.25363;
   aDateClose[291] = D'2012.06.13 13:41:03'+time_offset*3600;
   aPriceClose[291] = 1.25241;

   // ========== 292 ===== 71 ==========
   aType[292] = OP_SELL;
   aSymbol[292] = "EURUSD";
   aLots[292] = 1.0;
   aDateOpen[292] = D'2012.06.13 12:46:13'+time_offset*3600;
   aPriceOpen[292] = 1.25378;
   aDateClose[292] = D'2012.06.13 13:48:38'+time_offset*3600;
   aPriceClose[292] = 1.25278;

   // ========== 293 ===== 70 ==========
   aType[293] = OP_SELL;
   aSymbol[293] = "EURUSD";
   aLots[293] = 1.0;
   aDateOpen[293] = D'2012.06.13 15:37:00'+time_offset*3600;
   aPriceOpen[293] = 1.26009;
   aDateClose[293] = D'2012.06.13 15:51:49'+time_offset*3600;
   aPriceClose[293] = 1.25936;

   // ========== 294 ===== 68 ==========
   aType[294] = OP_SELL;
   aSymbol[294] = "EURUSD";
   aLots[294] = 1.0;
   aDateOpen[294] = D'2012.06.14 08:53:48'+time_offset*3600;
   aPriceOpen[294] = 1.2546;
   aDateClose[294] = D'2012.06.14 10:16:49'+time_offset*3600;
   aPriceClose[294] = 1.25653;

   // ========== 295 ===== 67 ==========
   aType[295] = OP_SELL;
   aSymbol[295] = "EURUSD";
   aLots[295] = 1.0;
   aDateOpen[295] = D'2012.06.14 21:38:46'+time_offset*3600;
   aPriceOpen[295] = 1.26284;
   aDateClose[295] = D'2012.06.15 00:49:11'+time_offset*3600;
   aPriceClose[295] = 1.26163;

   // ========== 296 ===== 66 ==========
   aType[296] = OP_SELL;
   aSymbol[296] = "EURUSD";
   aLots[296] = 1.0;
   aDateOpen[296] = D'2012.06.15 03:44:01'+time_offset*3600;
   aPriceOpen[296] = 1.2639;
   aDateClose[296] = D'2012.06.15 07:28:35'+time_offset*3600;
   aPriceClose[296] = 1.26256;

   // ========== 297 ===== 62 ==========
   aType[297] = OP_BUY;
   aSymbol[297] = "EURUSD";
   aLots[297] = 1.0;
   aDateOpen[297] = D'2012.06.18 12:38:43'+time_offset*3600;
   aPriceOpen[297] = 1.26066;
   aDateClose[297] = D'2012.06.18 14:23:10'+time_offset*3600;
   aPriceClose[297] = 1.26009;

   // ========== 298 ===== 57 ==========
   aType[298] = OP_SELL;
   aSymbol[298] = "EURUSD";
   aLots[298] = 1.0;
   aDateOpen[298] = D'2012.06.21 18:07:48'+time_offset*3600;
   aPriceOpen[298] = 1.25646;
   aDateClose[298] = D'2012.06.21 18:16:12'+time_offset*3600;
   aPriceClose[298] = 1.25611;

   // ========== 299 ===== 56 ==========
   aType[299] = OP_SELL;
   aSymbol[299] = "EURUSD";
   aLots[299] = 1.0;
   aDateOpen[299] = D'2012.06.22 10:34:45'+time_offset*3600;
   aPriceOpen[299] = 1.25537;
   aDateClose[299] = D'2012.06.25 05:39:23'+time_offset*3600;
   aPriceClose[299] = 1.25267;

   // ========== 300 ===== 55 ==========
   aType[300] = OP_SELL;
   aSymbol[300] = "EURUSD";
   aLots[300] = 1.0;
   aDateOpen[300] = D'2012.06.25 06:37:55'+time_offset*3600;
   aPriceOpen[300] = 1.24993;
   aDateClose[300] = D'2012.06.25 09:21:34'+time_offset*3600;
   aPriceClose[300] = 1.2493;

   // ========== 301 ===== 54 ==========
   aType[301] = OP_SELL;
   aSymbol[301] = "EURUSD";
   aLots[301] = 1.0;
   aDateOpen[301] = D'2012.06.25 06:40:47'+time_offset*3600;
   aPriceOpen[301] = 1.25058;
   aDateClose[301] = D'2012.06.25 09:25:01'+time_offset*3600;
   aPriceClose[301] = 1.24917;

   // ========== 302 ===== 52 ==========
   aType[302] = OP_SELL;
   aSymbol[302] = "EURUSD";
   aLots[302] = 1.0;
   aDateOpen[302] = D'2012.06.26 08:49:15'+time_offset*3600;
   aPriceOpen[302] = 1.2488;
   aDateClose[302] = D'2012.06.26 09:41:18'+time_offset*3600;
   aPriceClose[302] = 1.24981;

   // ========== 303 ===== 51 ==========
   aType[303] = OP_SELL;
   aSymbol[303] = "EURUSD";
   aLots[303] = 1.0;
   aDateOpen[303] = D'2012.06.26 12:18:26'+time_offset*3600;
   aPriceOpen[303] = 1.24614;
   aDateClose[303] = D'2012.06.26 12:53:23'+time_offset*3600;
   aPriceClose[303] = 1.24726;

   // ========== 304 ===== 48 ==========
   aType[304] = OP_SELL;
   aSymbol[304] = "EURUSD";
   aLots[304] = 1.0;
   aDateOpen[304] = D'2012.06.28 08:55:50'+time_offset*3600;
   aPriceOpen[304] = 1.24262;
   aDateClose[304] = D'2012.06.29 02:49:21'+time_offset*3600;
   aPriceClose[304] = 1.24704;

   // ========== 305 ===== 49 ==========
   aType[305] = OP_SELL;
   aSymbol[305] = "EURUSD";
   aLots[305] = 1.0;
   aDateOpen[305] = D'2012.06.28 09:07:06'+time_offset*3600;
   aPriceOpen[305] = 1.24323;
   aDateClose[305] = D'2012.06.29 02:49:17'+time_offset*3600;
   aPriceClose[305] = 1.24716;

   // ========== 306 ===== 50 ==========
   aType[306] = OP_SELL;
   aSymbol[306] = "EURUSD";
   aLots[306] = 1.0;
   aDateOpen[306] = D'2012.06.28 11:28:22'+time_offset*3600;
   aPriceOpen[306] = 1.24486;
   aDateClose[306] = D'2012.06.28 11:55:52'+time_offset*3600;
   aPriceClose[306] = 1.24314;

   // ========== 307 ===== 47 ==========
   aType[307] = OP_SELL;
   aSymbol[307] = "EURUSD";
   aLots[307] = 1.0;
   aDateOpen[307] = D'2012.06.29 03:02:51'+time_offset*3600;
   aPriceOpen[307] = 1.26047;
   aDateClose[307] = D'2012.06.29 03:03:40'+time_offset*3600;
   aPriceClose[307] = 1.2585;

   // ========== 308 ===== 46 ==========
   aType[308] = OP_BUY;
   aSymbol[308] = "EURUSD";
   aLots[308] = 1.0;
   aDateOpen[308] = D'2012.07.02 17:34:16'+time_offset*3600;
   aPriceOpen[308] = 1.25851;
   aDateClose[308] = D'2012.07.03 04:07:13'+time_offset*3600;
   aPriceClose[308] = 1.26018;

   // ========== 309 ===== 38 ==========
   aType[309] = OP_BUY;
   aSymbol[309] = "EURUSD";
   aLots[309] = 1.0;
   aDateOpen[309] = D'2012.07.06 07:02:45'+time_offset*3600;
   aPriceOpen[309] = 1.23711;
   aDateClose[309] = D'2012.07.06 08:00:08'+time_offset*3600;
   aPriceClose[309] = 1.2383;

   // ========== 310 ===== 36 ==========
   aType[310] = OP_BUY;
   aSymbol[310] = "EURUSD";
   aLots[310] = 1.0;
   aDateOpen[310] = D'2012.07.06 12:47:21'+time_offset*3600;
   aPriceOpen[310] = 1.23545;
   aDateClose[310] = D'2012.07.09 20:32:29'+time_offset*3600;
   aPriceClose[310] = 1.23193;

   // ========== 311 ===== 35 ==========
   aType[311] = OP_SELL;
   aSymbol[311] = "EURUSD";
   aLots[311] = 1.0;
   aDateOpen[311] = D'2012.07.09 20:32:34'+time_offset*3600;
   aPriceOpen[311] = 1.23192;
   aDateClose[311] = D'2012.07.10 00:55:35'+time_offset*3600;
   aPriceClose[311] = 1.2299;

   // ========== 312 ===== 30 ==========
   aType[312] = OP_BUY;
   aSymbol[312] = "EURUSD";
   aLots[312] = 1.0;
   aDateOpen[312] = D'2012.07.12 07:19:27'+time_offset*3600;
   aPriceOpen[312] = 1.22236;
   aDateClose[312] = D'2012.07.13 14:01:30'+time_offset*3600;
   aPriceClose[312] = 1.22336;

   // ========== 313 ===== 31 ==========
   aType[313] = OP_BUY;
   aSymbol[313] = "EURUSD";
   aLots[313] = 1.0;
   aDateOpen[313] = D'2012.07.12 10:18:38'+time_offset*3600;
   aPriceOpen[313] = 1.22008;
   aDateClose[313] = D'2012.07.13 03:32:35'+time_offset*3600;
   aPriceClose[313] = 1.22061;

   // ========== 314 ===== 28 ==========
   aType[314] = OP_SELL;
   aSymbol[314] = "EURUSD";
   aLots[314] = 1.0;
   aDateOpen[314] = D'2012.07.16 12:03:37'+time_offset*3600;
   aPriceOpen[314] = 1.2186;
   aDateClose[314] = D'2012.07.16 12:15:35'+time_offset*3600;
   aPriceClose[314] = 1.2179;

   // ========== 315 ===== 27 ==========
   aType[315] = OP_BUY;
   aSymbol[315] = "EURUSD";
   aLots[315] = 1.0;
   aDateOpen[315] = D'2012.07.17 14:33:18'+time_offset*3600;
   aPriceOpen[315] = 1.22127;
   aDateClose[315] = D'2012.07.17 15:04:11'+time_offset*3600;
   aPriceClose[315] = 1.22193;

   // ========== 316 ===== 26 ==========
   aType[316] = OP_SELL;
   aSymbol[316] = "EURUSD";
   aLots[316] = 1.0;
   aDateOpen[316] = D'2012.07.18 10:00:10'+time_offset*3600;
   aPriceOpen[316] = 1.22333;
   aDateClose[316] = D'2012.07.18 13:11:18'+time_offset*3600;
   aPriceClose[316] = 1.22222;

   // ========== 317 ===== 14 ==========
   aType[317] = OP_BUY;
   aSymbol[317] = "EURUSD";
   aLots[317] = 1.0;
   aDateOpen[317] = D'2012.08.02 11:52:16'+time_offset*3600;
   aPriceOpen[317] = 1.22935;
   aDateClose[317] = D'2012.08.02 12:02:39'+time_offset*3600;
   aPriceClose[317] = 1.2312;

   // ========== 318 ===== 7 ==========
   aType[318] = OP_SELL;
   aSymbol[318] = "EURUSD";
   aLots[318] = 1.0;
   aDateOpen[318] = D'2012.08.02 18:27:57'+time_offset*3600;
   aPriceOpen[318] = 1.21686;
   aDateClose[318] = D'2012.08.03 12:08:59'+time_offset*3600;
   aPriceClose[318] = 1.22499;

   // ========== 319 ===== 8 ==========
   aType[319] = OP_SELL;
   aSymbol[319] = "EURUSD";
   aLots[319] = 1.0;
   aDateOpen[319] = D'2012.08.03 07:34:24'+time_offset*3600;
   aPriceOpen[319] = 1.22034;
   aDateClose[319] = D'2012.08.03 12:07:01'+time_offset*3600;
   aPriceClose[319] = 1.22524;

   // ========== 320 ===== 9 ==========
   aType[320] = OP_SELL;
   aSymbol[320] = "EURUSD";
   aLots[320] = 1.0;
   aDateOpen[320] = D'2012.08.03 09:25:37'+time_offset*3600;
   aPriceOpen[320] = 1.22205;
   aDateClose[320] = D'2012.08.03 12:06:44'+time_offset*3600;
   aPriceClose[320] = 1.22516;

   // ========== 321 ===== 10 ==========
   aType[321] = OP_SELL;
   aSymbol[321] = "EURUSD";
   aLots[321] = 1.0;
   aDateOpen[321] = D'2012.08.03 09:27:06'+time_offset*3600;
   aPriceOpen[321] = 1.22294;
   aDateClose[321] = D'2012.08.03 12:06:39'+time_offset*3600;
   aPriceClose[321] = 1.22532;

   // ========== 322 ===== 2 ==========
   aType[322] = OP_SELL;
   aSymbol[322] = "EURUSD";
   aLots[322] = 1.0;
   aDateOpen[322] = D'2012.08.03 14:30:51'+time_offset*3600;
   aPriceOpen[322] = 1.23408;
   aDateClose[322] = D'2012.08.06 07:39:13'+time_offset*3600;
   aPriceClose[322] = 1.2356;

   // ========== 323 ===== 3 ==========
   aType[323] = OP_SELL;
   aSymbol[323] = "EURUSD";
   aLots[323] = 1.0;
   aDateOpen[323] = D'2012.08.03 15:06:12'+time_offset*3600;
   aPriceOpen[323] = 1.23447;
   aDateClose[323] = D'2012.08.06 07:22:13'+time_offset*3600;
   aPriceClose[323] = 1.23653;

   // ========== 324 ===== 4 ==========
   aType[324] = OP_SELL;
   aSymbol[324] = "EURUSD";
   aLots[324] = 1.0;
   aDateOpen[324] = D'2012.08.03 15:14:01'+time_offset*3600;
   aPriceOpen[324] = 1.23541;
   aDateClose[324] = D'2012.08.06 07:04:25'+time_offset*3600;
   aPriceClose[324] = 1.23689;

   // ========== 325 ===== 5 ==========
   aType[325] = OP_SELL;
   aSymbol[325] = "EURUSD";
   aLots[325] = 1.0;
   aDateOpen[325] = D'2012.08.03 15:19:08'+time_offset*3600;
   aPriceOpen[325] = 1.23645;
   aDateClose[325] = D'2012.08.06 07:04:21'+time_offset*3600;
   aPriceClose[325] = 1.23689;
}
