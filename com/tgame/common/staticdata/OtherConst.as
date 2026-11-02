package com.tgame.common.staticdata
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.jiami.Lan2ResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Skill;
   import com.tgame.manager.PipeManager;
   import com.zcp.common.utils.Fun;
   import flash.display.DisplayObject;
   
   public class OtherConst
   {
      
      public static const CESHI:String = Lan2ResManager.getGirlRes();
      
      public static const XIANGYANGCHENG_MAP_ID:int = 20002;
      
      public static const KUAFULUNJIANTAI_MAP_ID:int = 20197;
      
      public static const VS3V3_QIANGQI_MAP_ID:int = 20215;
      
      public static const VS3V3_PK_MAP_ID:int = 20222;
      
      public static const BAITUOSHANXIA_MAP_ID:int = 20280;
      
      public static const FUQIJINGJICHANG_MAP_ID:int = 20274;
      
      public static const ZUNRONGWANBAOGE_MAP_ID:int = 20286;
      
      public static const TUNSHITIANDI_MAP_ID:int = 20299;
      
      public static const MINI_MAP_REFRESH_TIME:int = 2000;
      
      public static const MINI_MAP_MAP_REFRESH_TIME:int = 2000;
      
      public static const XINGYUNJING_JILV:Number = 3;
      
      public static const MAX_ZHENQI:int = 10000;
      
      public static const MAX_ZHENQI_100:int = 20000;
      
      public static const MAX_JINGMAI:int = 8;
      
      public static const MAX_XUEWEI:int = 172;
      
      public static const YOUYONG_SUDU:int = 150;
      
      public static const JUMP_USE_TILI:int = 20;
      
      public static const JUMP_MAX_DIS:int = 500;
      
      public static const DEFAULT_SKILL_ID:int = 50000;
      
      public static const YN_SKILL_ID_ARR:Array = [80200243,80200244];
      
      public static const YN_SKILL_ID_ARR_LIULONGZHUANGBEI:Array = [80200280,80200281,80200282,80200283,80200284,80200285,80200294];
      
      public static const XIANGLONG_SKILL_ID_1:int = 80001;
      
      public static const XIANGLONG_SKILL_ID_2:int = 80002;
      
      public static const XIANGLONG_SKILL_ID_3:int = 80003;
      
      public static const YIJINJING_SKILL_ID:int = 90001;
      
      public static const SHENZHAOJING_SKILL_ID:int = 99201;
      
      public static const ANQIKAIFENG_SKILL_ID:int = 2029;
      
      public static const XUEMOFUTI_SKILL_ID:int = 200132;
      
      public static const JINCHANTUOQIAO_SKILL_ID:int = 80200140;
      
      public static const ZHENWUQIJIEZHEN_SKILL_ID:int = 200143;
      
      public static const HANBINGZHANG_SKILL_ID:int = 200363;
      
      public static const JINGANGFUMOQUAN_SKILL_ID:int = 200148;
      
      public static const JINGANGFUMOQUAN_DINGJI_SKILL_ID:int = 200205;
      
      public static const JINGANGFUMOQUAN_YINCANG_SKILL_ID:int = 200245;
      
      public static const LONGZHUA_SKILL_ID:int = 200157;
      
      public static const LONGZHUA_QIANGHUA_SKILL_ID:int = 200167;
      
      public static const XIAOYAOYUFENG_SKILL_ID:int = 200158;
      
      public static const TAIYUANJING_SKILL_ID:int = 200230;
      
      public static const ZHANLONGJUE_SKILL_ID:int = 200494;
      
      public static const ZHANLONGJUE_SKILL_ID1:int = 200812;
      
      public static const ZHANLONGJUE_SKILL_ID2:int = 200813;
      
      public static const ZHANLONGJUE_SKILL_ID3:int = 200814;
      
      public static const ZHANLONGJUE_SKILL_ID4:int = 200815;
      
      public static const GUIZHUA_SKILL_ID4:int = 80200301;
      
      public static const GUIZHUA_SKILL_ID5:int = 80200302;
      
      public static const GUIZHUA_SKILL_ID6:int = 80200303;
      
      public static const GUIZHUA_SKILL_ID7:int = 200942;
      
      public static const GUIZHUA_SKILL_ID8:int = 200943;
      
      public static const YIHUAJIEMU_SKILL_ID:int = 200436;
      
      public static const DINGCHANJUE_SKILL_ID:int = 200210;
      
      public static const MOLINGZHIYUAN_SKILL_ID:int = 200368;
      
      public static const SIWANGJINWU_SKILL_ID:int = 200360;
      
      public static const HUANGJINYINZHE_SKILL_ID:int = 200361;
      
      public static const XUANYUANGUPAO_SKILL_ID:int = 200340;
      
      public static const QUANSHENCHUDONG_SKILL_ID:int = 200341;
      
      public static const CIYUANYICHU_SKILL_ID:int = 200332;
      
      public static const KUNSHOUYUCHANG_SKILL_ID:int = 200369;
      
      public static const SHENJIANZHONG_SKILL_ID:int = 200328;
      
      public static const JIANJI_SKILL_ID:int = 200333;
      
      public static const QIANLIZHIWAI_SKILL_ID:int = 200259;
      
      public static const XIDUNIZHUANJIUYIN_SKILL_ID:int = 200255;
      
      public static const JIANTIFENGYIN_SKILL_ID:int = 200323;
      
      public static const FOGUANGPUZHAO_SKILL_ID:int = 200316;
      
      public static const BUSIJINSHEN_SKILL_ID:int = 200256;
      
      public static const ZIFUDONGTIAN_SKILL_ID:int = 200249;
      
      public static const TAOHUAHUTI_SKILL_ID:int = 200246;
      
      public static const KUNXIANSHU_SKILL_ID:int = 200244;
      
      public static const HUANYINGFENSHEN_SKILL_ID:int = 200236;
      
      public static const GUIYINGXIANZHONG_SKILL_ID:int = 200227;
      
      public static const JUEQINGMIJI_SKILL_ID:int = 200275;
      
      public static const ZIJINQIANKUN_SKILL_ID:int = 200276;
      
      public static const MEIRENJI_SKILL_ID:int = 200277;
      
      public static const LINGHUHUANHUA_SKILL_ID:int = 200234;
      
      public static const JINJIAZHANCHE_SKILL_ID:int = 200359;
      
      public static const TIANYUYANMENG_SKILL_ID:int = 200248;
      
      public static const HUANGJINGONGCHENGNU_SKILL_ID:int = 200354;
      
      public static const ZHAOFENGYINDIE_SKILL_ID:int = 200364;
      
      public static const DIANLAO_SKILL_ID:int = 200365;
      
      public static const KAITIAN_SKILL_ID:int = 200358;
      
      public static const SIWANGXUANYAN_SKILL_ID:int = 200221;
      
      public static const SHENXINGBAIBIAN_SKILL_ID:int = 200193;
      
      public static const SHENXINGBAIBIAN_SKILL_DINGJI_ID:int = 200194;
      
      public static const WUXINGQUAN_HUHESHUANGXING_SKILL_ID:int = 200197;
      
      public static const JINGANGFUMOJU_BUFF_ID:int = 200188;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_1:int = 97001;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_2:int = 97002;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_3:int = 97003;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_4:int = 97004;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_5:int = 97005;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_6:int = 97006;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_7:int = 97007;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_8:int = 97008;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_9:int = 97009;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_10:int = 97010;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_11:int = 97011;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_12:int = 97012;
      
      public static const LIUMAISHNEJIAN_SKILL_ID_13:int = 97013;
      
      public static const FABAOHULU_SKILL_ID:int = 200242;
      
      public static const YUCHANDU_SKILL_ID:int = 200118;
      
      public static const XIANGLONGPAOXIAO_SKILL_ID:int = 80004;
      
      public static const JINGMAINILIU_SKILL_ID:int = 200133;
      
      public static const DEFAULT_SKILL_DISTANCE:int = 75;
      
      public static const MOUNT_JUMP_SPEED:int = 320;
      
      public static const SKILL_HITBACK_SPEED:int = 500;
      
      public static const SKILL_HITBACK_DIS:int = 120;
      
      public static const SILINGZHEN_DEPTH:int = -1001;
      
      public static const LIANZHAN_DEPTH:int = -1000;
      
      public static const EQUIP_UPDATA_USE_LOAD_BUFF_TIME:int = 5000;
      
      public static const NEXT_ITEM_ROLE_ID:int = -800;
      
      public static const VIP_BUFF_ID:int = 1300;
      
      public static const PROTECT_BUFF_ID:int = 80001;
      
      public static const KANQI_BUFF_ID:int = 80002;
      
      public static const HUQI_BUFF_ID:int = 80003;
      
      public static const SHOUHU_BUFF_ID:int = 6003;
      
      public static const YLZR_BUFF_ID:int = 4200;
      
      public static const RONGYUBAOJI_BUFF_ID:int = 200135;
      
      public static const RONGYUHUANZHUANG_BUFF_ID:int = 200442;
      
      public static const HUANGJINLONGLINJIA_BUFF_ID:int = 200705;
      
      public static const TUNTIANMIEDI_BUFF_ID:int = 203739;
      
      public static const HUXIAOSHANLIN_BUFF_ID:int = 200399;
      
      public static const DAGOUBANG_BUFF_ID:int = 200538;
      
      public static const LINGHUHUANHUA_BUFF_ID:int = 201344;
      
      public static const XIDUNIZHUANJIUYIN_BUFF_ID:int = 201994;
      
      public static const RONGYAOZHIGUANG_BUFF_ID:int = 200453;
      
      public static const BIWUZHAOQIN_BUFF_ID:int = 200187;
      
      public static const XUEMOFUTI_BUFF_ID:int = 200144;
      
      public static const EMOZHISHOU_BUFF_ID:int = 202431;
      
      public static const HUANGZHEZHIYI_BUFF_ID:int = 200420;
      
      public static const KUNXIANSHENG_BUFF_ID:int = 200152;
      
      public static const JINCHANTUOQIAN_BUFF_ID:int = 200154;
      
      public static const HUANYINGFENSHEN_BUFF_ID:int = 201423;
      
      public static const SHENLONGBAIWEI_BUFF_ID:int = 200165;
      
      public static const ZIJINHULU_BUFF_ID:int = 200866;
      
      public static const WANFAZIZAI_BUFF_ID:int = 201058;
      
      public static const DUNYINGWUZONG_BUFF_ID:int = 200958;
      
      public static const YANYUELINGYU_YINSHEN_BUFF_ID:int = 201029;
      
      public static const WEIZHENSHANHE_BUFF_ID:int = 200352;
      
      public static const ZHUMOZHANG_BUFF_ARR:Array = [80200221,80200222,80200223,80200224];
      
      public static const YNSHENJIANGJI_BUFF_ID:int = 80200230;
      
      public static const YNBAILONGJIANG_BUFF_ID:int = 80200243;
      
      public static const YNYINGXIONG_BUFF_ID:int = 80200264;
      
      public static const YNTIANWANG_BUFF_ID:int = 80200265;
      
      public static const SHUFUJUZHEN_BUFF_ID:int = 200673;
      
      public static const QIANKUNJUZHEN_BUFF_ID:int = 201440;
      
      public static const QICAICHUANQI_BUFF_ID:int = 200743;
      
      public static const CIKETAOZHUANG_BUFF_ID:int = 201446;
      
      public static const HUANGCHENGSHOUWEI_BUFF_ID:int = 202090;
      
      public static const ZIJINYUPAO_BUFF_ID:int = 200965;
      
      public static const POJIXIEJIA_XINSHOUHUANZHUANG_ID:int = 200974;
      
      public static const SIWANGSHALOU_BUFF_ID:int = 200691;
      
      public static const LUOYINGBINFEN_BUFF_ID:int = 200726;
      
      public static const RULAISHENZHANG_BUFF_ID:int = 200663;
      
      public static const ZIQIDONGLAI_BUFF_ID:int = 200513;
      
      public static const SKILL_HEBI:int = 6004;
      
      public static const SKILL_PUDUCIHANG:int = 52007;
      
      public static const SKILL_GEKONGDUQI:int = 52006;
      
      public static const SKILL_WUSHENLINTI:int = 52009;
      
      public static const SKILL_ZHANYIJIANG:int = 52008;
      
      public static const SKILL_HUISHENG:int = 55005;
      
      public static const SKILL_HUIFU:int = 55007;
      
      public static const SKILL_HUICHUN:int = 55006;
      
      public static const BUFF_DAZUO:int = 100001;
      
      public static const BUFF_SHUANGXIU:int = 100002;
      
      public static const BUFF_LIAOSHANG:int = 100003;
      
      public static const BUFF_BEILIAOSHANG:int = 100004;
      
      public static const BUFF_LONGLIN:int = 1501;
      
      public static const BUFF_LIANTIJINDAN:int = 1502;
      
      public static const BUFF_CJMHPTK:int = 1604;
      
      public static const BUFF_RSTIZFSJ:int = 1502;
      
      public static const BUFF_BOWARROW_DAN:int = 1504;
      
      public static const BUFF_YI_JING_JING:int = 9242;
      
      public static const BUFF_BOWARROW_BOOK:int = 1505;
      
      public static const BUFF_BOWARROW_LEVEL:int = 1506;
      
      public static const BUFF_BOWARROW_LONGJIN:int = 1610;
      
      public static const BUFF_NITA_BLESS:int = 1603;
      
      public static const BUFF_SQUIRREL:int = 1503;
      
      public static const BUFF_BOWARROW:int = 1504;
      
      public static const BUFF_SEVEN_BOWARROW_FREE_GET_SKILL_BOOK:int = 1505;
      
      public static const BUFF_YANGTIANMIJI:int = 1605;
      
      public static const BUFF_BA_GUA_ZHANG:int = 9241;
      
      public static const BANGQI_ADD:String = "BANGQI_ADD";
      
      public static const BANGQI_REMOVE:String = "BANGQI_REMOVE";
      
      public static const BANGQI_ALL_REMOVE:String = "BANGQI_ALL_REMOVE";
      
      public static const SHENLONGZHIREN_ADD:String = "SHENLONGZHIREN_ADD";
      
      public static const SHENLONGZHIREN_REMOVE:String = "SHENLONGZHIREN_REMOVE";
      
      public static const NB_ZHUANGBEI_ADD:String = "SHENLONGZHIREN_ADD";
      
      public static const NB_ZHUANGBEI_REMOVE:String = "SHENLONGZHIREN_REMOVE";
      
      public static const PAODAN_NUPAO:int = 501;
      
      public static const PAODAN_HUOPAO:int = 502;
      
      public static const XIUQIU_ADD:String = "XIUQIU_ADD";
      
      public static const XIUQIU_REMOVE:String = "XIUQIU_REMOVE";
      
      public static const NB_ZHUANGBEI_ADD3V3:String = "NB_ZHUANGBEI_ADD3V3";
      
      public static const NB_ZHUANGBEI_REMOVE3V3:String = "NB_ZHUANGBEI_REMOVE3V3";
      
      public static const RING_ONMOUNT_OFFSET_Y:int = -18;
      
      public static const isShowEquipUpdataHelpPanelID:int = 0;
      
      public static const isShowEquipReplayLeverHelpPanelID:int = 1;
      
      public static const isShowEquipReplayPropertiesHelpPanelID:int = 2;
      
      public static const isShowEquipAddPropertiesHelpPanelID:int = 3;
      
      public static const isShowEquipReplayPropertiesValueHelpPanelID:int = 4;
      
      public static const isShowEquipZhanWenHelpPanelID:int = 5;
      
      public static const SISHENSHOU_70015:int = 70015;
      
      public static const SISHENSHOU_70013:int = 70013;
      
      public static const SISHENSHOU_70014:int = 70012;
      
      public static const SISHENSHOU_70012:int = 70014;
      
      public static const SISHENSHOU_200112:int = 200112;
      
      public static const SISHENSHOU_200110:int = 200110;
      
      public static const SISHENSHOU_200109:int = 200109;
      
      public static const SISHENSHOU_200111:int = 200111;
      
      private static var isShowEquipHelpObj:Object = {};
      
      public static const TASK_ID_ANQI:int = 508;
      
      public static const TASK_ID_GONGJIAN:int = 509;
      
      public static const TASK_ID_DANTIAN:int = 510;
      
      public static const SKILL_ID_LINGBOWEIBU:int = 58007;
      
      public static const SKILL_ID_RUHUTIANYI:int = 200155;
      
      public static const SKILL_ID_PUDUCIHANG:int = 52007;
      
      public static const SKILL_ID_RULAISHENZHANG:int = 200208;
      
      public static const RANK_KUAFU_ID:int = 100;
      
      public static const RANK_KUAFU_3V3:int = 101;
      
      public static const RANK_KUAFU_BIWUDAHUI:int = 120;
      
      public static const RANK_KUAPINGTAI_BIWUDAHUI:int = 125;
      
      public static const YABIAO_BEGIN_NPC:int = 131;
      
      public static var huBiaoLineId:Array = [20005,20013,20015];
      
      public static var xunzhangJieshu:int = 1;
      
      public static var zhanqiJieshu:int = 1;
      
      public static var xunzhang_zhanqi_duanzao:int = 1;
      
      public static var xuanyuanjian:int = 19;
      
      public static var yuenanteshuxuznhang:int = 9;
      
      public static var zhuangbei_dakong:int = 1;
      
      public static var xunzhang_dakong:int = 0;
      
      public static var pkModeArr:Array = [0,1,2,3];
      
      public static var yichu_kewen:int = 0;
      
      public static var mount_add_count:int = 0;
      
      public static var removeXunzhangDuanzao:Array = [728005];
      
      public static var jianArr:Array = [];
      
      public static const JIUYINSHENZHUA_TYPE:String = "bloodcontainer.shenzhua";
      
      public static const XUEDAO_MC_TYPE:String = "bloodcontainer.xuedao";
      
      public static const HUAKUANG_TYPE:String = "bloodcontainer.flower";
      
      public static const LIPAO_TYPE:String = "bloodcontainer.yanhua";
      
      public static const DUOMINGSHISANJIAN_MC_TYPE:String = "bloodcontainer.shisanjian";
      
      public static const QIUYUAN_HAOJIAO:int = 1320;
      
      public static const JINGONG_HAOJIAO:int = 1321;
      
      public static const CIKE_HEADIMG_ID_0:int = 7211;
      
      public static const CIKE_HEADIMG_ID_1:int = 7213;
      
      public static const XUEQIU_SKILL_ID:int = 724236;
      
      public static const HUANHUAWULONG_SKILL_ID:int = 80200284;
      
      public static const SKILL_ID_MOZHUXUEDAO:int = 200175;
      
      public static var baishiNum:int = 0;
      
      public static const SHENGSIFUZHOU_SHENG_BUFF_ID:int = 200528;
      
      public static const SHENGSIFUZHOU_SI_BUFF_ID:int = 200529;
      
      public static const ZHENLONGQI_HEI_BUFF_ID:int = 201080;
      
      public static const ZHENLONGQI_HEI:int = 10649;
      
      public static const ZHENLONGQI_BAI_BUFF_ID:int = 201081;
      
      public static const ZHENLONGQI_BAI:int = 10648;
      
      public static const YN_CHENGFA_BUFF_ID:int = 722760;
      
      public static const WANZHONGZHUMU_BUFF_ID:int = 200624;
      
      public static const HUANYINGXIADAO_BUFF_ID:int = 200652;
      
      public static const ZHENGGUZHIXIN_BUFF_ID:int = 200804;
      
      public static const ZHENGGUBIAOQING_BUFF_ID:int = 200803;
      
      public static const YNTIANMAJIAN_BUFF_ID:int = 80200325;
      
      public static const YNXIONGJIJIAN_BUFF_ID:int = 80200339;
      
      public static const YNXUANBINGBIANXUEREN_BUFF_ID:int = 80200412;
      
      public static const YN_LIULONGZHUANGBEI_SKILL_ARR:Array = [80200280,80200281,80200282,80200283,80200284,80200285,80200294];
      
      public static const YN_DIANFENGSHOU_BUFFTYPE_ARR:Array = [7020,7021,7022,7023,7024,7025,7027,7028,7029];
      
      public static var texiaoBoolean:Boolean = false;
      
      public static const MENPAIJUEXUE_01:int = 201068;
      
      public static const MENPAIJUEXUE_02:int = 201069;
      
      public static const MENPAIJUEXUE_03:int = 201070;
      
      public static const MENPAIJUEXUE_04:int = 201071;
      
      public static const MENPAIJUEXUE_05:int = 201072;
      
      public static const MENPAINEIFA_01:int = 201074;
      
      public static const MENPAINEIFA_02:int = 201075;
      
      public static const MENPAINEIFA_03:int = 201076;
      
      public static const MENPAINEIFA_04:int = 201077;
      
      public static const MENPAINEIFA_05:int = 201078;
      
      public static const TULONGDAO_1_BUFF_ID:int = 204661;
      
      public static const TULONGDAO_2_BUFF_ID:int = 204662;
      
      public static const TULONGDAO_3_BUFF_ID:int = 204663;
      
      public static const TULONGDAO_4_BUFF_ID:int = 204664;
      
      public static const TULONGDAO_5_BUFF_ID:int = 204876;
      
      public function OtherConst()
      {
         super();
      }
      
      public static function getPingTaiById(param1:int) : String
      {
         switch(param1)
         {
            case 1:
               return "5ding";
            case 2:
               return "Game2";
            case 3:
               return "牛A";
            case 5:
               return "Game5";
            case 6:
               return "聚游";
            case 7:
               return "3722";
            case 8:
               return "西游";
            case 9:
               return "游戏多";
            case 10:
               return "侠客";
            case 11:
               return "3663";
            case 12:
               return "7711";
            case 13:
               return "真武";
            case 15:
               return "573";
            case 16:
               return "爱游戏";
            case 18:
               return "牛A-绿色版";
            case 21:
               return "新加坡";
            case 22:
               return "新加坡-绿色版";
            case 101:
               return "韩国";
            case 102:
               return "泰国";
            case 103:
               return "马来西亚";
            case 104:
               return "昆仑台湾";
            case 105:
               return "日本";
            case 106:
               return LanResManager.getLanCommonTextWords("越南");
            case 107:
               return "韩国-低付费";
            case 108:
               return LanResManager.getLanCommonTextWords("越南-绿色版");
            case 109:
               return "泰国2";
            case 110:
               return LanResManager.getLanCommonTextWords("越南szm");
            case 111:
               return LanResManager.getLanCommonTextWords("越南zp");
            case 112:
               return LanResManager.getLanCommonTextWords("越南yahoo");
            case 113:
               return "土耳其";
            case 99999:
               return "内网";
            default:
               return "";
         }
      }
      
      public static function isDanTianSkill(param1:int) : Boolean
      {
         if(param1 >= 58001 && param1 <= 58008)
         {
            return true;
         }
         return false;
      }
      
      public static function getBiYiShuangFeiSkill() : Skill
      {
         var _loc2_:int = 0;
         var _loc3_:Skill = null;
         var _loc1_:Object = GameInstance.mainCharData.skillInfo.skillObj;
         for each(_loc3_ in _loc1_)
         {
            if(Boolean(_loc3_) && Boolean(_loc3_.isLearn) && (_loc3_.id >= 6101 && _loc3_.id <= 6107))
            {
               return _loc3_;
            }
         }
         return null;
      }
      
      public static function isMouseMoney(param1:int) : Boolean
      {
         if(param1 >= 5001 && param1 <= 5013)
         {
            return true;
         }
         return false;
      }
      
      public static function isLianZhanBuff(param1:int) : Boolean
      {
         if(param1 >= 60001 && param1 <= 60007)
         {
            return true;
         }
         return false;
      }
      
      public static function isAnqiSkill(param1:int) : Boolean
      {
         if(param1 >= 2001 && param1 <= 5006)
         {
            return true;
         }
         return false;
      }
      
      public static function isMonsterSKill(param1:int) : Boolean
      {
         if(param1 != OtherConst.DEFAULT_SKILL_ID && param1 != 70001 && param1 != 70002 && param1 != 70003 && param1 != 61011 && param1 != 61012 && param1 != 61013 && param1 != 61021 && param1 != 61022 && param1 != 61023 && param1 != 61031 && param1 != 61032 && param1 != 61033 && param1 != 61041 && param1 != 61042 && param1 != 61043)
         {
            return true;
         }
         return false;
      }
      
      public static function isBanghuiBuff(param1:int) : Boolean
      {
         if(param1 == 3001 || param1 == 3002 || param1 == 3003 || param1 == 3101 || param1 == 3102 || param1 == 3103)
         {
            return true;
         }
         return false;
      }
      
      public static function isMenPai2JiNeng(param1:int) : Boolean
      {
         if(param1 == 51012 || param1 == 51022 || param1 == 51032 || param1 == 51042 || param1 == 51052 || param1 == 51062)
         {
            return true;
         }
         return false;
      }
      
      public static function closePanel(param1:DisplayObject) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(param1 == GameInstance.uiInstance._jinChuiZiPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._jinChuiZiPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._tutengShuxingTihuankaPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._shuXingDaZaoKaPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._qianChuiBaiLianPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._sixStoneToSevenStonePanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._stoneOptionSmallPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._stonePanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._equipPuddingPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._itemSynthesizePanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._amuletPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._sheliziEnchasePanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._shenLongPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._equipPuddingTwoPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._equipUpdataTypePanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._depot || param1 == GameInstance.uiInstance._mainCharShop || param1 == GameInstance.uiInstance._npcShopPanel || param1 == GameInstance.uiInstance._tradePanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._hushenfuXiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUSHEN_XILIAN_PANEL);
            }
         }
         if(param1 == GameInstance.uiInstance._hushenfuXiLianPanel)
         {
            if(Fun.isVisible(GameInstance.uiInstance._jinChuiZiPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_JIN_CHUI_ZI_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._chuanShuoZhuangBeiDaZaoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ORANGE_EQUIP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tutengShuxingTihuankaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TU_TENG_CADE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shuXingDaZaoKaPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHUXINGDAZAOKA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_PUDDING_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._itemSynthesizePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ITEM_SYNTHESIZE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._depot))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_DEPOT_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._mainCharShop))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._npcShopPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_NPC_SHOP_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._tradePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_TRADE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._amuletPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sheliziEnchasePanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_AMULT_ADD_SHELIZI);
            }
            if(Fun.isVisible(GameInstance.uiInstance._shenLongPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SHEN_LONG_AMULT);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipPuddingTwoPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_ZHAN_WEN_KE_HUA_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._equipUpdataTypePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_EQUIP_UPDATA_TYPE_PANEL);
            }
            if(Fun.isVisible(GameInstance.uiInstance._stoneOptionSmallPanel))
            {
               PipeManager.sendMsg(PipeConstants.CLOSE_EASY_STONE_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._sixStoneToSevenStonePanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_SIX_STONE_TO_SEVEN_STONE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._qianChuiBaiLianPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_QIAN_CHUI_BAI_LIAN_PLANE);
            }
            if(Fun.isVisible(GameInstance.uiInstance._huizhangDazaoHechengPanel))
            {
               PipeManager.sendMsg(PipeConstants.SHOW_HUIZHANG_PANEL);
            }
         }
      }
   }
}

