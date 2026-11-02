package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   import flash.geom.Point;
   
   public class NpcFunctionType
   {
      
      private static var valueName:Array;
      
      public static const TASK:int = 1;
      
      public static const DEAL:int = 2;
      
      public static const PARTY:int = 3;
      
      public static const RELATION:int = 4;
      
      public static const FUSE:int = 5;
      
      public static const STRONG:int = 6;
      
      public static const TRANSPORT:int = 7;
      
      public static const DEPOT:int = 8;
      
      public static const ROUP:int = 9;
      
      public static const PET:int = 10;
      
      public static const PLOY:int = 11;
      
      public static const HELP:int = 12;
      
      public static const REPAIR:int = 13;
      
      public static const AWARD_EXP:int = 14;
      
      public static const XIDIAN:int = 15;
      
      public static const INSTANCE:int = 16;
      
      public static const COLLECT:int = 17;
      
      public static const SQUIRREL:int = 18;
      
      public static const STONE:int = 19;
      
      public static const AMULT:int = 20;
      
      public static const SHEN_LONG_AMULT:int = 21;
      
      public static const TO_CANGLONGTAN:int = 22;
      
      public static const ZHAN_WEI_KE_HUA:int = 23;
      
      public static const LINGQU_MIZONG:int = 24;
      
      public static const JIHUO_ANQI_YINCANG:int = 25;
      
      public static const TO_LUNJIANTAI:int = 27;
      
      public static const GIFT_CARD:int = 28;
      
      public static const TO_KUAFU_LUNJIANTAI:int = 29;
      
      public static const LUNJIAN_MALL:int = 30;
      
      public static const CHEGNZHAN_MALL:int = 31;
      
      public static const XIAN_TIAN_WU_JING:int = 32;
      
      public static const SI_LIN_ZHEN_YIN_CHANG_SHU_XING:int = 33;
      
      public static const ORANGE_EQUIP:int = 34;
      
      public static const CHANGE_SUPER_MOUNT:int = 35;
      
      public static const JINGYANHE_HECHENG:int = 36;
      
      public static const GUMU_MISHI:int = 37;
      
      public static const TO_XIANGYANGCHENG:int = 38;
      
      public static const TO_YUANYUESHANZHUANG:int = 39;
      
      public static const SHEN_LONG_HU_SHEN_FU_DA_KONG:int = 40;
      
      public static const JIHUO_ROUTIJINSHEN:int = 41;
      
      public static const BIWUDAHUI_SHUOMING:int = 42;
      
      public static const BIWUDAHUI_BAOMING:int = 43;
      
      public static const TO_WANBAOGE:int = 44;
      
      public static const BAOSHI_JIANSHANG_YAZHU:int = 45;
      
      public static const BAOSHI_JIANSHANG_GUIZE:int = 46;
      
      public static const KOREA_HEFU_BUCHANG:int = 47;
      
      public static const CHANGE_MOSHOU_BY_CRASH:int = 48;
      
      public static const HUI_ZHANG_HE_CHENG:int = 49;
      
      public static const MALL_JI_FEN:int = 50;
      
      public static const XIANGYANGZHANCHANG_SHUOMING:int = 51;
      
      public static const JOIN_KUAFU_ZHANCHANG_BY_NPC:int = 52;
      
      public static const JIHUO_DONGXIAO_YINGCANG:int = 53;
      
      public static const JINRU_KUAFU_LEITAI:int = 54;
      
      public static const JINRU_KUAFULEITAI_GUIZHE_WANFA:int = 55;
      
      public static const CISHA_SHUOMING:int = 56;
      
      public static const CISHA_DIXIAQIANZHUANG:int = 57;
      
      public static const AOJIAN_DUANZAO:int = 58;
      
      public static const TIANFU_SUIPIAN_HECHENG:int = 59;
      
      public static const GANJIANGMOYE_DUANZAO:int = 60;
      
      public static const SHENDIAOXIALV_START:int = 61;
      
      public static const FENGZHENGJIE_XUNZHANGDUIHUAN:int = 1008;
      
      public static const YUENAN_ZENGSONGTANGGUO:int = 1009;
      
      public static const RENAME_PANEL:int = 1007;
      
      public static const EQUIP_PARTY_CHANGE:int = 62;
      
      public static const QINGRENJIE_WOYAOSONGHUA:int = 63;
      
      public static const QINGRENJIE_CHAKANSONGHUABANG:int = 64;
      
      public static const FENGZHENGJIE_ZENGSONG:int = 65;
      
      public static const FENGLEISHOU_DUIHUAN:int = 66;
      
      public static const SHENGXIAOSHENQI_DUANZAO:int = 67;
      
      public static const TUNVLANG_DUIHUAN:int = 1001;
      
      public static const CHONGZHI_DUIHUAN:int = 1002;
      
      public static const AOJIAN_BIRTHDAY:int = 1003;
      
      public static const AOJIAN_CHRISTMAS:int = 1004;
      
      public static const AOJIAN_XINIANZHUFU:int = 1005;
      
      public static const AOJIAN_XINNIANXUYUAN:int = 1006;
      
      public static const SHIJIEBEI:int = 1010;
      
      public static const AOJIANSUIPIANHECHENG_YUENAN:int = 1011;
      
      public static const GOOD_DELETE_YUENAN:int = 1014;
      
      public static const YUENAN_HUANGUAYI:int = 1012;
      
      public static const YUENAN_HUANLIBAO:int = 1013;
      
      public static const YUENAN_ZENGSONGFENGDENG:int = 1015;
      
      public static const YUENAN_ZHONGQIU_SONGCHAPING:int = 1016;
      
      public static const YUENAN_ZHONGQIU_LINGJIANG:int = 1017;
      
      public static const YUENAN_SHANGJIAOLAZHU:int = 1018;
      
      public static const YUENAN_SANNIANJIANGLI:int = 1019;
      
      public static const YUENAN_CHRISTMAS_GIFT1:int = 1020;
      
      public static const YUENAN_CHRISTMAS_GIFT2:int = 1021;
      
      public static const YUENAN_CHRISTMAS_GIFT:int = 1022;
      
      public static const YUENAN_ZHIZUOZONGZI:int = 1023;
      
      public static const YUENAN_ZHIZUOZONGZISHUOMING:int = 1034;
      
      public static const YUENAN_AIQINGYONGJIU:int = 1025;
      
      public static const YUENAN_AIQINGTIANMI:int = 1026;
      
      public static const YUENAN_TIANMICHENGHAO:int = 1027;
      
      public static const YUENAN_SONGHUAHUODONG:int = 1024;
      
      public static const YUENAN_XITONGZHUFU:int = 1032;
      
      public static const YUENAN_PENGYOUZHUFU:int = 1033;
      
      public static const YUENAN_CHUNJIELIBAO:int = 1028;
      
      public static const YUENAN_CHONGZHILINGJIANG:int = 1029;
      
      public static const YUENAN_GOUMAIDAOJU:int = 1030;
      
      public static const YUENAN_DUIHUANLIBAO:int = 1031;
      
      public static const YUENAN_DUILIANSHUOMING:int = 1036;
      
      public static const YUENAN_YANGSHUOMING:int = 1037;
      
      public static const YUENAN_WEIGUIJUBAO:int = 1039;
      
      public static const YUENAN_JINXIANG:int = 1040;
      
      public static const YUANXIAOJIE_CHOUJIANG:int = 1041;
      
      public static const YUENAN_HECHENGFANGUO:int = 1042;
      
      public static const YUENAN_SHANGJIAOFANGUO:int = 1043;
      
      public static const YUENAN_JIANZHUZHUI:int = 1044;
      
      public static const YUENAN_ZHUZHUIDUIHUAN:int = 1045;
      
      public static const YUENAN_TIJIAOMIKZUQIU:int = 1047;
      
      public static const YUENAN_TIJIAOSHIZI:int = 1049;
      
      public static const YUENAN_DUANWUJIEYANHUI:int = 1050;
      
      public static const YUENAN_ZHAISHUIGUO:int = 1051;
      
      public static const YUENAN_GANENJIJIE:int = 1052;
      
      public static const YUENAN_SHANGXIANGQIFU:int = 1053;
      
      public static const YUENAN_JIAOMEIGUI:int = 1054;
      
      public static const YUENAN_GOUMAICHAHUA:int = 1055;
      
      public static const YUENAN_SONGHUAZHIEN:int = 1056;
      
      public static const YUENAN_GUOQINGLIBAO:int = 1057;
      
      public static const YUENAN_GUOQINGCANZHUO:int = 1058;
      
      public static const YUENAN_TIJIAODENGMI:int = 1059;
      
      public static const YUENAN_TIJIAOYUTU:int = 1060;
      
      public static const YUENAN_SHENGDANCANZHUO2015:int = 1061;
      
      public static const YUENAN_2016YUANDAN:int = 1062;
      
      public static const YUENAN_2016XINNIANCANZHUO:int = 1063;
      
      public static const YUENAN_HESUIGUO:int = 1064;
      
      public static const YUENAN_HOUNIANCHENGHAO:int = 1065;
      
      public static const YUENAN_HOUNIANZHUFU:int = 1066;
      
      public static const YUENAN_MEIHUAZHUFU:int = 1067;
      
      public static const YUENAN_TAOHUAZHUFU:int = 1068;
      
      public static const YUENAN_ZHUAYUSHUOMING:int = 1069;
      
      public static const YUENAN_ZHUAYUHUODONG:int = 1070;
      
      public static const YUENAN_2016GUOQING:int = 1071;
      
      public static const YUENAN_2016JIEJILIANGCAO:int = 1072;
      
      public static const YUENAN_2016CAISETANGGUO:int = 1073;
      
      public static const YUENAN_2016ERTONGJIECHENGHAO:int = 1074;
      
      public static const YUENAN_2016MENGZHUZHUFU:int = 1075;
      
      public static const YUENAN_2016JINQIANSHU:int = 1076;
      
      public static const YUENAN_2016GUOQINGZENGSONGWUPIN:int = 1077;
      
      public static const YUENAN_2016GUOQINGLIBAO:int = 1078;
      
      public static const YUENAN_2016GUOQINGYAN:int = 1079;
      
      public static const YUENAN_20160921MIANFEIHUODONG:int = 1080;
      
      public static const YUENAN_20160921MIANFEIHUODONGPAIHANG:int = 1081;
      
      public static const YUENAN_20161026KUAILECANZHUO:int = 1082;
      
      public static const YUENAN_20161207XIAOHUISHENQI:int = 1083;
      
      public static const YUENAN_20161220SHENGDANZHUOZI:int = 1084;
      
      public static const YUENAN_2017XINNIANCHENGHAO:int = 1085;
      
      public static const YUENAN_2017ZHUFU:int = 1086;
      
      public static const YUENAN_2017YINSHOUTAO:int = 1087;
      
      public static const YUENAN_2017JUEQINGDAN:int = 1088;
      
      public static const YUENAN_2017YANHUIZHUO:int = 1089;
      
      public static const YUENAN_2017DUIHUANDAMOCAILIAO:int = 1090;
      
      public static const YUENAN_2017LINGQUXUEMOZHANCHANGLING:int = 1091;
      
      public static const YUENAN_2017LINGQUTIANMODAN:int = 1092;
      
      public static const YUENAN_2017HUADENGLINGJIANG_DONG:int = 1093;
      
      public static const YUENAN_2017HUADENGLINGJIANG_XI:int = 1094;
      
      public static const YUENAN_2017HUADENGLINGJIANG_NAN:int = 1095;
      
      public static const YUENAN_2017HUADENGLINGJIANG_BEI:int = 1096;
      
      public static const YUENAN_2017SHENGRIDANGAO:int = 1097;
      
      public static const YUENAN_2017HUANHUASHENGDANZUOQI:int = 1098;
      
      public static const YUENAN_2017SHENGDANLIBAO:int = 1099;
      
      public static const YUENAN_2018SHENGXIAOYANG:int = 1100;
      
      public static const YUENAN_2018WUXUNIAN:int = 1101;
      
      public static const YUENAN_20187SHENGXIAOMA:int = 1102;
      
      public static const YUENAN_2018SHENGXIAOHU:int = 1103;
      
      public static const YUENAN_KUAILECANZHUO:int = 1104;
      
      public static const YUENAN_SHUIGUOZHI:int = 1105;
      
      public static const YUENAN_SHUIGUOPAN:int = 1106;
      
      public static const YUENAN_SHUIGUOLAN:int = 1107;
      
      public static const YUENAN_SHENMIBAOXIANG:int = 1108;
      
      public static const YUENAN_NANDEMISHU:int = 1109;
      
      public static const YUENAN_YULANXUYUAN:int = 1110;
      
      public static const YUENAN_YULANZENGSONG:int = 1111;
      
      public static const YUENAN_YULANCHENGHAO:int = 1112;
      
      public static const YUENAN_YULANWAIZHUANG:int = 1113;
      
      public static const YUENAN_LINGQUHUADENG:int = 1114;
      
      public static const YUENAN_20180903MIANFEILINGQU:int = 1115;
      
      public static const YUENAN_20180903500YUANBAOLINGQU:int = 1116;
      
      public static const YUENAN_20180918YUEBINGGOUMAI:int = 1117;
      
      public static const YUENAN_20180918TUANYUANCHENGHAO:int = 1118;
      
      public static const YUENAN_20180918ZHONGQIUSHIZHUANG:int = 1119;
      
      public static const YUENAN_20180918SHANGYUEHUODONG:int = 1120;
      
      public static const YUENAN_20180918ZHONGQIUMIANFEILIBAO:int = 1121;
      
      public static const YUENAN_20181010JINGJIUMINGZHU:int = 1122;
      
      public static const YUENAN_20181010JIANGHUFULI:int = 1123;
      
      public static const YUENAN_20181010XINSHOULINGJIANG:int = 1124;
      
      public static const YUENAN_20181010YINGXIONGJIANGLI:int = 1125;
      
      public static const YUENAN_20181010DUANLIANLIWU:int = 1126;
      
      public static const YUENAN_20181106QINIANKUAILE:int = 1127;
      
      public static const YUENAN_20181106SHENGRIKUAILE:int = 1128;
      
      public static const YUENAN_20181106JIXIANGLIWU:int = 1129;
      
      public static const YUENAN_20181106BAOWUJINGLIAN:int = 1130;
      
      public static const YUENAN_20181106JIPINLIBAO:int = 1131;
      
      public static const YUENAN_20181106TEBIEBANBENZENGSONG:int = 1132;
      
      public static const YUENAN_NPCFUNCTIONTYPE01:int = 1133;
      
      public static const YUENAN_NPCFUNCTIONTYPE02:int = 1134;
      
      public static const YUENAN_NPCFUNCTIONTYPE03:int = 1135;
      
      public static const YUENAN_NPCFUNCTIONTYPE04:int = 1136;
      
      public static const YUENAN_NPCFUNCTIONTYPE05:int = 1137;
      
      public static const YUENAN_NPCFUNCTIONTYPE06:int = 1138;
      
      public static const YUENAN_NPCFUNCTIONTYPE07:int = 1139;
      
      public static const YUENAN_NPCFUNCTIONTYPE08:int = 1140;
      
      public static const YUENAN_NPCFUNCTIONTYPE09:int = 1141;
      
      public static const YUENAN_NPCFUNCTIONTYPE10:int = 1142;
      
      public static const YUENAN_NPCFUNCTIONTYPE11:int = 1143;
      
      public static const YUENAN_NPCFUNCTIONTYPE12:int = 1144;
      
      public static const YUENAN_NPCFUNCTIONTYPE15:int = 1145;
      
      public static const YUENAN_NPCFUNCTIONTYPE16:int = 1146;
      
      public static const YUENAN_NPCFUNCTIONTYPE17:int = 1147;
      
      public static const YUENAN_NPCFUNCTIONTYPE18:int = 1148;
      
      public static const YUENAN_NPCFUNCTIONTYPE19:int = 1149;
      
      public static const YUENAN_NPCFUNCTIONTYPE20:int = 1150;
      
      public static const YUENAN_NPCFUNCTIONTYPE21:int = 1151;
      
      public static const YUENAN_NPCFUNCTIONTYPE22:int = 1152;
      
      public static const YUENAN_NPCFUNCTIONTYPE23:int = 1153;
      
      public static const YUENAN_NPCFUNCTIONTYPE24:int = 1154;
      
      public static const YUENAN_NPCFUNCTIONTYPE25:int = 1155;
      
      public static const YUENAN_NPCFUNCTIONTYPE26:int = 1156;
      
      public static const YUENAN_NPCFUNCTIONTYPE27:int = 1157;
      
      public static const YUENAN_NPCFUNCTIONTYPE28:int = 1158;
      
      public static const YUENAN_NPCFUNCTIONTYPE29:int = 1159;
      
      public static const YUENAN_NPCFUNCTIONTYPE30:int = 1160;
      
      public static const YUENAN_NPCFUNCTIONTYPE31:int = 1161;
      
      public static const YUENAN_NPCFUNCTIONTYPE32:int = 1162;
      
      public static const YUENAN_NPCFUNCTIONTYPE33:int = 1163;
      
      public static const YUENAN_NPCFUNCTIONTYPE34:int = 1164;
      
      public static const YUENAN_NPCFUNCTIONTYPE35:int = 1165;
      
      public static const YUENAN_NPCFUNCTIONTYPE36:int = 1166;
      
      public static const YUENAN_NPCFUNCTIONTYPE37:int = 1167;
      
      public static const YUENAN_NPCFUNCTIONTYPE38:int = 1168;
      
      public static const YUENAN_NPCFUNCTIONTYPE39:int = 1169;
      
      public static const YUENAN_NPCFUNCTIONTYPE40:int = 1170;
      
      public static const YUENAN_NPCFUNCTIONTYPE41:int = 1171;
      
      public static const YUENAN_NPCFUNCTIONTYPE42:int = 1172;
      
      public static const YUENAN_NPCFUNCTIONTYPE43:int = 1173;
      
      public static const YUENAN_NPCFUNCTIONTYPE44:int = 1174;
      
      public static const YUENAN_NPCFUNCTIONTYPE45:int = 1175;
      
      public static const YUENAN_NPCFUNCTIONTYPE46:int = 1176;
      
      public static const YUENAN_NPCFUNCTIONTYPE47:int = 1177;
      
      public static const YUENAN_NPCFUNCTIONTYPE48:int = 1178;
      
      public static const PAODAN_FANWEI:Point = new Point(500,600);
      
      public function NpcFunctionType()
      {
         super();
      }
      
      public static function init() : void
      {
         valueName = [[NpcFunctionType.TASK,LanResManager.getLanCommonTextWords("任务相关")],[NpcFunctionType.DEAL,LanResManager.getLanCommonTextWords("物品交易")],[NpcFunctionType.PARTY,LanResManager.getLanCommonTextWords("帮　　会")],[NpcFunctionType.RELATION,LanResManager.getLanCommonTextWords("关　　系")],[NpcFunctionType.FUSE,LanResManager.getLanCommonTextWords("合　　成")],[NpcFunctionType.STRONG,LanResManager.getLanCommonTextWords("升级强化与属性重置")],[NpcFunctionType.TRANSPORT,LanResManager.getLanCommonTextWords("传　　送")],[NpcFunctionType.DEPOT,LanResManager.getLanCommonTextWords("仓　　库")],[NpcFunctionType.ROUP,LanResManager.getLanCommonTextWords("拍　　卖")],[NpcFunctionType.PET,LanResManager.getLanCommonTextWords("宠　　物")],[NpcFunctionType.PLOY,LanResManager.getLanCommonTextWords("活　　动")],[NpcFunctionType.HELP,LanResManager.getLanCommonTextWords("询　　问")],[NpcFunctionType.REPAIR,LanResManager.getLanCommonTextWords("修　　理")],[NpcFunctionType.AWARD_EXP,LanResManager.getLanCommonTextWords("领取奖励经验")],[NpcFunctionType.XIDIAN,LanResManager
         .getLanCommonTextWords("洗　　点")],[NpcFunctionType.INSTANCE,LanResManager.getLanCommonTextWords("副    本")],[NpcFunctionType.COLLECT,LanResManager.getLanCommonTextWords("古玩收集")],[NpcFunctionType.SQUIRREL,LanResManager.getLanCommonTextWords("松子戏")],[NpcFunctionType.STONE,LanResManager.getLanCommonTextWords("宝石工艺")],[NpcFunctionType.TUNVLANG_DUIHUAN,LanResManager.getLanCommonTextWords("兔女郎兑换")],[NpcFunctionType.CHONGZHI_DUIHUAN,LanResManager.getLanCommonTextWords("限时大奖兑换")],[NpcFunctionType.AMULT,LanResManager.getLanCommonTextWords("护身符舍利子炼制")],[NpcFunctionType.SHEN_LONG_AMULT,LanResManager.getLanCommonTextWords("炼制终极【神龙护身符】")],[NpcFunctionType.TO_CANGLONGTAN,LanResManager.getLanCommonTextWords("传入攻城战地图：藏龙潭")],[NpcFunctionType.ZHAN_WEI_KE_HUA,LanResManager.getLanCommonTextWords("属性精炼与战纹刻画")],[NpcFunctionType.LINGQU_MIZONG,LanResManager.getLanCommonTextWords("领取迷踪阵通关经验奖励")],[NpcFunctionType.JIHUO_ANQI_YINCANG,LanResManager.getLanCommonTextWords("激活暗器隐藏属性")],[NpcFunctionType.TO_LUNJIANTAI,LanResManager
         .getLanCommonTextWords("传入：论剑台")],[NpcFunctionType.GIFT_CARD,LanResManager.getLanCommonTextWords("使用礼品卡兑换礼品")],[NpcFunctionType.TO_KUAFU_LUNJIANTAI,LanResManager.getLanCommonTextWords("传入：跨服论剑台")],[NpcFunctionType.LUNJIAN_MALL,LanResManager.getLanCommonTextWords("论剑声望商店购物")],[NpcFunctionType.CHEGNZHAN_MALL,LanResManager.getLanCommonTextWords("城战声望商店购物")],[NpcFunctionType.XIAN_TIAN_WU_JING,LanResManager.getLanCommonTextWords("激活先天武境隐藏属性")],[NpcFunctionType.SI_LIN_ZHEN_YIN_CHANG_SHU_XING,LanResManager.getLanCommonTextWords("激活四灵阵隐藏属性")],[NpcFunctionType.ORANGE_EQUIP,LanResManager.getLanCommonTextWords("传说装备属性洗练")],[NpcFunctionType.CHANGE_SUPER_MOUNT,LanResManager.getLanCommonTextWords("四圣兽交换")],[NpcFunctionType.JINGYANHE_HECHENG,LanResManager.getLanCommonTextWords("经验盒合成")],[NpcFunctionType.GUMU_MISHI,LanResManager.getLanCommonTextWords("古墓密室")],[NpcFunctionType.TO_XIANGYANGCHENG,LanResManager.getLanCommonTextWords("襄阳城")],[NpcFunctionType.TO_YUANYUESHANZHUANG,LanResManager.getLanCommonTextWords("圆月山庄")]
         ,[NpcFunctionType.SHEN_LONG_HU_SHEN_FU_DA_KONG,LanResManager.getLanCommonTextWords("神龙护身符打孔")],[NpcFunctionType.JIHUO_ROUTIJINSHEN,LanResManager.getLanCommonTextWords("激活肉体金身")],[NpcFunctionType.BIWUDAHUI_SHUOMING,LanResManager.getLanCommonTextWords("比武大会规则及流程")],[NpcFunctionType.BIWUDAHUI_BAOMING,LanResManager.getLanCommonTextWords("比武大会报名")],[NpcFunctionType.TO_WANBAOGE,LanResManager.getLanCommonTextWords("进入万宝阁")],[NpcFunctionType.BAOSHI_JIANSHANG_YAZHU,LanResManager.getLanCommonTextWords("开始鉴赏宝石")],[NpcFunctionType.BAOSHI_JIANSHANG_GUIZE,LanResManager.getLanCommonTextWords("鉴赏规则介绍")],[NpcFunctionType.CHANGE_MOSHOU_BY_CRASH,LanResManager.getLanCommonTextWords("兽魂碎片进阶")],[NpcFunctionType.HUI_ZHANG_HE_CHENG,LanResManager.getLanCommonTextWords("徽章打造合成")],[NpcFunctionType.MALL_JI_FEN,LanResManager.getLanCommonTextWords("战场积分兑换奖励")],[NpcFunctionType.XIANGYANGZHANCHANG_SHUOMING,LanResManager.getLanCommonTextWords("襄阳战场说明")],[NpcFunctionType.JOIN_KUAFU_ZHANCHANG_BY_NPC,LanResManager.getLanCommonTextWords("报名参加跨服襄阳战场")]
         ,[NpcFunctionType.JIHUO_DONGXIAO_YINGCANG,LanResManager.getLanCommonTextWords("激活洞箫隐藏属性")],[NpcFunctionType.JINRU_KUAFU_LEITAI,LanResManager.getLanCommonTextWords("进入跨服擂台")],[NpcFunctionType.JINRU_KUAFULEITAI_GUIZHE_WANFA,LanResManager.getLanCommonTextWords("跨服擂台规则及玩法")],[NpcFunctionType.CISHA_SHUOMING,LanResManager.getLanCommonTextWords("刺杀说明")],[NpcFunctionType.CISHA_DIXIAQIANZHUANG,LanResManager.getLanCommonTextWords("地下钱庄")],[NpcFunctionType.AOJIAN_DUANZAO,LanResManager.getLanCommonTextWords("锻造傲剑")],[NpcFunctionType.AOJIAN_BIRTHDAY,LanResManager.getLanCommonTextWords("庆祝傲剑生日，为傲剑祝福！")],[NpcFunctionType.AOJIAN_CHRISTMAS,LanResManager.getLanCommonTextWords("圣诞快乐！")],[NpcFunctionType.AOJIAN_XINNIANXUYUAN,LanResManager.getLanCommonTextWords("新年许愿")],[NpcFunctionType.AOJIAN_XINIANZHUFU,LanResManager.getLanCommonTextWords("新年祝福")],[NpcFunctionType.FENGZHENGJIE_XUNZHANGDUIHUAN,LanResManager.getLanCommonTextWords("风筝节勋章兑换")],[NpcFunctionType.RENAME_PANEL,LanResManager.getLanCommonTextWords("更名卡")]
         ,[NpcFunctionType.YUENAN_ZENGSONGTANGGUO,LanResManager.getLanCommonTextWords("赠送糖果")],[NpcFunctionType.SHIJIEBEI,LanResManager.getLanCommonTextWords("赠送足球")],[NpcFunctionType.AOJIANSUIPIANHECHENG_YUENAN,LanResManager.getLanCommonTextWords("傲剑碎片兑换")],[NpcFunctionType.GOOD_DELETE_YUENAN,LanResManager.getLanCommonTextWords("物品销毁")],[NpcFunctionType.YUENAN_HUANGUAYI,LanResManager.getLanCommonTextWords("兑换挂衣")],[NpcFunctionType.YUENAN_HUANLIBAO,LanResManager.getLanCommonTextWords("兑换礼包")],[NpcFunctionType.YUENAN_ZENGSONGFENGDENG,LanResManager.getLanCommonTextWords("赠送风灯")],[NpcFunctionType.YUENAN_ZHONGQIU_SONGCHAPING,LanResManager.getLanCommonTextWords("送茶望月")],[NpcFunctionType.YUENAN_ZHONGQIU_LINGJIANG,LanResManager.getLanCommonTextWords("中秋领奖")],[NpcFunctionType.EQUIP_PARTY_CHANGE,LanResManager.getLanCommonTextWords("装备门派转换")],[NpcFunctionType.GANJIANGMOYE_DUANZAO,LanResManager.getLanCommonTextWords("锻造干将莫邪")],[NpcFunctionType.SHENDIAOXIALV_START,LanResManager.getLanCommonTextWords("侠侣情缘活动")]
         ,[NpcFunctionType.TIANFU_SUIPIAN_HECHENG,LanResManager.getLanCommonTextWords("碎片合成")],[NpcFunctionType.QINGRENJIE_WOYAOSONGHUA,LanResManager.getLanCommonTextWords("我要送花")],[NpcFunctionType.FENGZHENGJIE_ZENGSONG,LanResManager.getLanCommonTextWords("赠送风筝")],[NpcFunctionType.QINGRENJIE_CHAKANSONGHUABANG,LanResManager.getLanCommonTextWords("查看人气榜")],[NpcFunctionType.SHENGXIAOSHENQI_DUANZAO,LanResManager.getLanCommonTextWords("锻造生肖神器")],[NpcFunctionType.QINGRENJIE_CHAKANSONGHUABANG,LanResManager.getLanCommonTextWords("查看人气榜")],[NpcFunctionType.FENGLEISHOU_DUIHUAN,LanResManager.getLanCommonTextWords("风雷兽兑换")],[NpcFunctionType.YUENAN_SHANGJIAOLAZHU,LanResManager.getLanCommonTextWords("上交蜡烛")],[NpcFunctionType.YUENAN_SANNIANJIANGLI,LanResManager.getLanCommonTextWords("三年奖励")],[NpcFunctionType.YUENAN_CHRISTMAS_GIFT1,LanResManager.getLanCommonTextWords("赠送帽子")],[NpcFunctionType.YUENAN_CHRISTMAS_GIFT2,LanResManager.getLanCommonTextWords("圣诞领奖")],[NpcFunctionType.YUENAN_CHRISTMAS_GIFT,LanResManager
         .getLanCommonTextWords("赠送圣诞支")],[NpcFunctionType.YUENAN_ZHIZUOZONGZI,LanResManager.getLanCommonTextWords("制作粽子")],[NpcFunctionType.YUENAN_ZHIZUOZONGZISHUOMING,LanResManager.getLanCommonTextWords("制作粽子说明")],[NpcFunctionType.YUENAN_AIQINGYONGJIU,LanResManager.getLanCommonTextWords("爱情永久")],[NpcFunctionType.YUENAN_AIQINGTIANMI,LanResManager.getLanCommonTextWords("爱情甜蜜")],[NpcFunctionType.YUENAN_TIANMICHENGHAO,LanResManager.getLanCommonTextWords("甜蜜称号")],[NpcFunctionType.YUENAN_SONGHUAHUODONG,LanResManager.getLanCommonTextWords("送花活动")],[NpcFunctionType.YUENAN_XITONGZHUFU,LanResManager.getLanCommonTextWords("系统祝福")],[NpcFunctionType.YUENAN_PENGYOUZHUFU,LanResManager.getLanCommonTextWords("朋友祝福")],[NpcFunctionType.YUENAN_CHUNJIELIBAO,LanResManager.getLanCommonTextWords("春节礼包")],[NpcFunctionType.YUENAN_CHONGZHILINGJIANG,LanResManager.getLanCommonTextWords("充值领取")],[NpcFunctionType.YUENAN_GOUMAIDAOJU,LanResManager.getLanCommonTextWords("购买道具")],[NpcFunctionType.YUENAN_DUIHUANLIBAO,LanResManager
         .getLanCommonTextWords("对换礼包")],[NpcFunctionType.YUENAN_DUILIANSHUOMING,LanResManager.getLanCommonTextWords("对联说明")],[NpcFunctionType.YUENAN_YANGSHUOMING,LanResManager.getLanCommonTextWords("羊年说明")],[NpcFunctionType.YUENAN_WEIGUIJUBAO,LanResManager.getLanCommonTextWords("违规举报")],[NpcFunctionType.YUANXIAOJIE_CHOUJIANG,LanResManager.getLanCommonTextWords("元宵节抽奖")],[NpcFunctionType.YUENAN_HECHENGFANGUO,LanResManager.getLanCommonTextWords("合成饭锅")],[NpcFunctionType.YUENAN_SHANGJIAOFANGUO,LanResManager.getLanCommonTextWords("上交饭锅")],[NpcFunctionType.YUENAN_JIANZHUZHUI,LanResManager.getLanCommonTextWords("捡拾竹椎")],[NpcFunctionType.YUENAN_ZHUZHUIDUIHUAN,LanResManager.getLanCommonTextWords("竹椎兑换")],[NpcFunctionType.YUENAN_TIJIAOMIKZUQIU,LanResManager.getLanCommonTextWords("提交MIK足球")],[NpcFunctionType.YUENAN_TIJIAOSHIZI,LanResManager.getLanCommonTextWords("提交狮子")],[NpcFunctionType.YUENAN_DUANWUJIEYANHUI,LanResManager.getLanCommonTextWords("端午节宴会")],[NpcFunctionType.YUENAN_ZHAISHUIGUO,LanResManager
         .getLanCommonTextWords("采摘水果")],[NpcFunctionType.YUENAN_GANENJIJIE,LanResManager.getLanCommonTextWords("感恩季节")],[NpcFunctionType.YUENAN_SHANGXIANGQIFU,LanResManager.getLanCommonTextWords("上香祈福")],[NpcFunctionType.YUENAN_JIAOMEIGUI,LanResManager.getLanCommonTextWords("交玫瑰花")],[NpcFunctionType.YUENAN_GOUMAICHAHUA,LanResManager.getLanCommonTextWords("购买插花")],[NpcFunctionType.YUENAN_SONGHUAZHIEN,LanResManager.getLanCommonTextWords("送花知恩")],[NpcFunctionType.YUENAN_GUOQINGLIBAO,LanResManager.getLanCommonTextWords("国庆礼包")],[NpcFunctionType.YUENAN_GUOQINGCANZHUO,LanResManager.getLanCommonTextWords("国庆餐桌")],[NpcFunctionType.YUENAN_TIJIAODENGMI,LanResManager.getLanCommonTextWords("提交灯谜")],[NpcFunctionType.YUENAN_TIJIAOYUTU,LanResManager.getLanCommonTextWords("提交玉兔")],[NpcFunctionType.YUENAN_SHENGDANCANZHUO2015,LanResManager.getLanCommonTextWords("圣诞餐桌")],[NpcFunctionType.YUENAN_2016YUANDAN,LanResManager.getLanCommonTextWords("元旦领奖")],[NpcFunctionType.YUENAN_2016XINNIANCANZHUO,LanResManager.getLanCommonTextWords("新年餐桌")]
         ,[NpcFunctionType.YUENAN_HESUIGUO,LanResManager.getLanCommonTextWords("领取贺岁果")],[NpcFunctionType.YUENAN_HOUNIANCHENGHAO,LanResManager.getLanCommonTextWords("猴年称号")],[NpcFunctionType.YUENAN_HOUNIANZHUFU,LanResManager.getLanCommonTextWords("猴年祝福")],[NpcFunctionType.YUENAN_MEIHUAZHUFU,LanResManager.getLanCommonTextWords("梅花祝福")],[NpcFunctionType.YUENAN_TAOHUAZHUFU,LanResManager.getLanCommonTextWords("桃花祝福")],[NpcFunctionType.YUENAN_ZHUAYUSHUOMING,LanResManager.getLanCommonTextWords("抓鱼说明")],[NpcFunctionType.YUENAN_ZHUAYUHUODONG,LanResManager.getLanCommonTextWords("抓捕大鱼")],[NpcFunctionType.YUENAN_JINXIANG,LanResManager.getLanCommonTextWords("进香")],[NpcFunctionType.YUENAN_2016GUOQING,LanResManager.getLanCommonTextWords("参加")],[NpcFunctionType.YUENAN_2016JIEJILIANGCAO,LanResManager.getLanCommonTextWords("接济粮草")],[NpcFunctionType.YUENAN_2016CAISETANGGUO,LanResManager.getLanCommonTextWords("儿童节活动")],[NpcFunctionType.YUENAN_2016ERTONGJIECHENGHAO,LanResManager.getLanCommonTextWords("儿童节称号")],[NpcFunctionType
         .YUENAN_2016MENGZHUZHUFU,LanResManager.getLanCommonTextWords("盟主祝福")],[NpcFunctionType.YUENAN_2016JINQIANSHU,LanResManager.getLanCommonTextWords("金钱树")],[NpcFunctionType.YUENAN_2016GUOQINGZENGSONGWUPIN,LanResManager.getLanCommonTextWords("国庆赠送物品")],[NpcFunctionType.YUENAN_2016GUOQINGLIBAO,LanResManager.getLanCommonTextWords("2016国庆礼包")],[NpcFunctionType.YUENAN_2016GUOQINGYAN,LanResManager.getLanCommonTextWords("国庆盛宴")],[NpcFunctionType.YUENAN_20160921MIANFEIHUODONG,LanResManager.getLanCommonTextWords("器材提交")],[NpcFunctionType.YUENAN_20160921MIANFEIHUODONGPAIHANG,LanResManager.getLanCommonTextWords("器材排行")],[NpcFunctionType.YUENAN_20161207XIAOHUISHENQI,LanResManager.getLanCommonTextWords("销毁神器")],[NpcFunctionType.YUENAN_20161220SHENGDANZHUOZI,LanResManager.getLanCommonTextWords("圣诞桌子")],[NpcFunctionType.YUENAN_2017XINNIANCHENGHAO,LanResManager.getLanCommonTextWords("丁酉新年称号")],[NpcFunctionType.YUENAN_2017ZHUFU,LanResManager.getLanCommonTextWords("2017祝福")],[NpcFunctionType.YUENAN_2017YINSHOUTAO
         ,LanResManager.getLanCommonTextWords("提交银手套")],[NpcFunctionType.YUENAN_2017JUEQINGDAN,LanResManager.getLanCommonTextWords("提交绝情丹")],[NpcFunctionType.YUENAN_2017YANHUIZHUO,LanResManager.getLanCommonTextWords("宴会桌")],[NpcFunctionType.YUENAN_2017DUIHUANDAMOCAILIAO,LanResManager.getLanCommonTextWords("兑换打磨材料")],[NpcFunctionType.YUENAN_2017LINGQUXUEMOZHANCHANGLING,LanResManager.getLanCommonTextWords("领取魔血战场令")],[NpcFunctionType.YUENAN_2017LINGQUTIANMODAN,LanResManager.getLanCommonTextWords("使用天魔丹")],[NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_DONG,LanResManager.getLanCommonTextWords("中秋领奖东")],[NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_XI,LanResManager.getLanCommonTextWords("中秋领奖西")],[NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_NAN,LanResManager.getLanCommonTextWords("中秋领奖南")],[NpcFunctionType.YUENAN_2017HUADENGLINGJIANG_BEI,LanResManager.getLanCommonTextWords("中秋领奖北")],[NpcFunctionType.YUENAN_2017SHENGRIDANGAO,LanResManager.getLanCommonTextWords("生日蛋糕")],[NpcFunctionType.YUENAN_2017HUANHUASHENGDANZUOQI
         ,LanResManager.getLanCommonTextWords("幻化圣诞坐骑")],[NpcFunctionType.YUENAN_2017SHENGDANLIBAO,LanResManager.getLanCommonTextWords("2017圣诞礼包")],[NpcFunctionType.YUENAN_2018SHENGXIAOYANG,LanResManager.getLanCommonTextWords("2018生肖羊")],[NpcFunctionType.YUENAN_2018WUXUNIAN,LanResManager.getLanCommonTextWords("2018戊戌年")],[NpcFunctionType.YUENAN_20187SHENGXIAOMA,LanResManager.getLanCommonTextWords("2018生肖马")],[NpcFunctionType.YUENAN_2018SHENGXIAOHU,LanResManager.getLanCommonTextWords("2018生肖虎")],[NpcFunctionType.YUENAN_KUAILECANZHUO,LanResManager.getLanCommonTextWords("快乐餐桌")],[NpcFunctionType.YUENAN_SHUIGUOZHI,LanResManager.getLanCommonTextWords("兑换水果汁")],[NpcFunctionType.YUENAN_SHUIGUOPAN,LanResManager.getLanCommonTextWords("兑换水果盘")],[NpcFunctionType.YUENAN_SHUIGUOLAN,LanResManager.getLanCommonTextWords("兑换水果篮")],[NpcFunctionType.YUENAN_SHENMIBAOXIANG,LanResManager.getLanCommonTextWords("领取新物品神秘宝箱")],[NpcFunctionType.YUENAN_NANDEMISHU,LanResManager.getLanCommonTextWords("领取新物品难得秘书")],[NpcFunctionType
         .YUENAN_YULANXUYUAN,LanResManager.getLanCommonTextWords("盂兰许愿")],[NpcFunctionType.YUENAN_YULANZENGSONG,LanResManager.getLanCommonTextWords("盂兰赠送")],[NpcFunctionType.YUENAN_YULANCHENGHAO,LanResManager.getLanCommonTextWords("盂兰称号")],[NpcFunctionType.YUENAN_YULANWAIZHUANG,LanResManager.getLanCommonTextWords("盂兰外装")],[NpcFunctionType.YUENAN_LINGQUHUADENG,LanResManager.getLanCommonTextWords("领取花灯")],[NpcFunctionType.YUENAN_20180903MIANFEILINGQU,LanResManager.getLanCommonTextWords("20180903免费领取")],[NpcFunctionType.YUENAN_20180903500YUANBAOLINGQU,LanResManager.getLanCommonTextWords("20180903500元宝领取")],[NpcFunctionType.YUENAN_20180918YUEBINGGOUMAI,LanResManager.getLanCommonTextWords("购买中秋饼")],[NpcFunctionType.YUENAN_20180918TUANYUANCHENGHAO,LanResManager.getLanCommonTextWords("团员称号")],[NpcFunctionType.YUENAN_20180918ZHONGQIUSHIZHUANG,LanResManager.getLanCommonTextWords("中秋时装")],[NpcFunctionType.YUENAN_20180918SHANGYUEHUODONG,LanResManager.getLanCommonTextWords("赏月活动")],[NpcFunctionType.YUENAN_20180918ZHONGQIUMIANFEILIBAO
         ,LanResManager.getLanCommonTextWords("中秋免费礼包")],[NpcFunctionType.YUENAN_20181010JINGJIUMINGZHU,LanResManager.getLanCommonTextWords("敬酒明主")],[NpcFunctionType.YUENAN_20181010JIANGHUFULI,LanResManager.getLanCommonTextWords("江湖福利")],[NpcFunctionType.YUENAN_20181010XINSHOULINGJIANG,LanResManager.getLanCommonTextWords("新手领奖")],[NpcFunctionType.YUENAN_20181010YINGXIONGJIANGLI,LanResManager.getLanCommonTextWords("英雄奖励")],[NpcFunctionType.YUENAN_20181010DUANLIANLIWU,LanResManager.getLanCommonTextWords("锻炼礼物")],[NpcFunctionType.YUENAN_20181106QINIANKUAILE,LanResManager.getLanCommonTextWords("七年奖励")],[NpcFunctionType.YUENAN_20181106SHENGRIKUAILE,LanResManager.getLanCommonTextWords("生日快乐")],[NpcFunctionType.YUENAN_20181106JIXIANGLIWU,LanResManager.getLanCommonTextWords("吉祥礼物")],[NpcFunctionType.YUENAN_20181106BAOWUJINGLIAN,LanResManager.getLanCommonTextWords("宝物精炼")],[NpcFunctionType.YUENAN_20181106JIPINLIBAO,LanResManager.getLanCommonTextWords("极品礼包")],[NpcFunctionType.YUENAN_20181106TEBIEBANBENZENGSONG
         ,LanResManager.getLanCommonTextWords("特别版本赠送")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE01,LanResManager.getLanCommonTextWords("20181218宝物精炼")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE02,LanResManager.getLanCommonTextWords("20181218极品礼包")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE03,LanResManager.getLanCommonTextWords("20181218版本赠送")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE04,LanResManager.getLanCommonTextWords("2018圣诞礼物")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE05,LanResManager.getLanCommonTextWords("20181225礼包1")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE06,LanResManager.getLanCommonTextWords("20181225礼包2")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE07,LanResManager.getLanCommonTextWords("20181225礼包3")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE08,LanResManager.getLanCommonTextWords("20181225礼包4")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE09,LanResManager.getLanCommonTextWords("我想煮1个粽子")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE10,LanResManager.getLanCommonTextWords("我想煮10个粽子")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE11
         ,LanResManager.getLanCommonTextWords("我想煮50个粽子")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE12,LanResManager.getLanCommonTextWords("我想买特别粽子价格1000元宝")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE15,LanResManager.getLanCommonTextWords("放花灯1")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE16,LanResManager.getLanCommonTextWords("放花灯2")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE17,LanResManager.getLanCommonTextWords("放花灯3")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE18,LanResManager.getLanCommonTextWords("放花灯4")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE19,LanResManager.getLanCommonTextWords("放花灯5")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE20,LanResManager.getLanCommonTextWords("领取八年快乐礼包")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE21,LanResManager.getLanCommonTextWords("八年感恩")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE22,LanResManager.getLanCommonTextWords("八年幸运")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE23,LanResManager.getLanCommonTextWords("2019年圣诞节快乐")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE24,LanResManager.getLanCommonTextWords("领取2019年圣诞礼物")]
         ,[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE25,LanResManager.getLanCommonTextWords("幸运圣诞节")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE26,LanResManager.getLanCommonTextWords("年底祝福")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE27,"01/01/2020"],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE28,LanResManager.getLanCommonTextWords("新年大吉")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE29,LanResManager.getLanCommonTextWords("新年如意（灵兽）")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE30,LanResManager.getLanCommonTextWords("新年大吉（灵兽）")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE31,LanResManager.getLanCommonTextWords("抓禄迎春")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE32,LanResManager.getLanCommonTextWords("祝春如意")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE33,LanResManager.getLanCommonTextWords("领取傲剑9周年礼品码")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE34,LanResManager.getLanCommonTextWords("兑换神鹿护魂章（神）")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE35,LanResManager.getLanCommonTextWords("2022圣诞节快乐")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE36,LanResManager
         .getLanCommonTextWords("领取2022圣诞礼物")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE37,LanResManager.getLanCommonTextWords("2022圣诞节幸运")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE38,LanResManager.getLanCommonTextWords("装备还原")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE39,LanResManager.getLanCommonTextWords("十二周年领取")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE40,LanResManager.getLanCommonTextWords("十二周年兑换1")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE41,LanResManager.getLanCommonTextWords("十二周年兑换2")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE42,LanResManager.getLanCommonTextWords("精英累充1000元宝")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE43,LanResManager.getLanCommonTextWords("累充10000元宝将获得武林传奇")],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE44,"Đổi Rượu Đào Hoa (V693)"],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE45,"Nhận Nguyên Liệu: Tích lũy nạp 100 vàng nhận 1 Thịt Mỡ (200 lần)"],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE46,"Bánh Chưng Nguyên Đán: 88 Lá + 88 Gạo + 88 Dây  +88 Đậu (66 lần)"],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE47
         ,"Bánh Chưng Đặc Biệt: 88 Lá + 88 Gạo + 88 Dây  +88 Đậu + 6 Thịt (26 lần)"],[NpcFunctionType.YUENAN_NPCFUNCTIONTYPE48,"Bánh Chưng Hảo Hạng: 88 Lá + 88 Gạo + 88 Dây  +88 Đậu + 6 Thịt + 2 Hạt Sen (8 lần)"]];
      }
      
      public static function getNameByValue(param1:int) : String
      {
         var _loc2_:Array = null;
         for each(_loc2_ in valueName)
         {
            if(_loc2_[0] == param1)
            {
               return _loc2_[1];
            }
         }
         return "";
      }
      
      public static function getValueByName(param1:String) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in valueName)
         {
            if(_loc2_[1] == param1)
            {
               return _loc2_[0];
            }
         }
         return -1;
      }
      
      public static function getNameArrByValueArr(param1:Array) : Array
      {
         var _loc4_:int = 0;
         var _loc2_:Array = [];
         var _loc3_:String = "";
         for each(_loc4_ in param1)
         {
            _loc3_ = getNameByValue(_loc4_);
            if(_loc3_ != "")
            {
               _loc2_[_loc2_.length] = _loc3_;
            }
         }
         return _loc2_;
      }
   }
}

