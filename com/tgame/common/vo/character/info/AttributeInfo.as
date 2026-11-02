package com.tgame.common.vo.character.info
{
   import com.tgame.common.staticdata.OtherConst;
   import com.tgame.common.staticdata.PartyType;
   
   public class AttributeInfo
   {
      
      public var zhenyingID:int = 0;
      
      public var chengweiID:int = 0;
      
      public var pingtaiID:int = -1;
      
      public var vipLV:int = 0;
      
      public var partyID:int = 0;
      
      public var zuShiParty:String;
      
      public var zuShiName:String;
      
      public var ynPingtai:String;
      
      public var ynServerID:int;
      
      public var ynName:String;
      
      public var prestige_chengzhan:int = 0;
      
      public var prestige_lunjian:int = 0;
      
      public var prestige_shitu:int = 0;
      
      public var zhanchang_jifen:int = 0;
      
      public var spouseID:int = 0;
      
      public var yupeiID:int = 0;
      
      public var showYuPeiGoodsId:int;
      
      public var yuPeiGoodsIDArr:Array = [];
      
      public var spouseName:String = "";
      
      public var prestige_fuQi:int = 0;
      
      public var prestige_fuqijingji:int = 0;
      
      public var prestige_zhizungongxun:int = 0;
      
      public var prestige_shenshengzhandouli:int = 0;
      
      public var prestige_gongXunZhi:int = 0;
      
      public var prestige_jiFenZhi:int = 0;
      
      public var prestige_WuHunZhi:int = 0;
      
      public var lv:int = 1;
      
      public var ap:Number = 0;
      
      public var dp:Number = 0;
      
      public var cp:Number = 0;
      
      public var ev:Number = 0;
      
      public var adx:int = 0;
      
      public var mdx:int = 0;
      
      public var sm:int = 0;
      
      public var nl:int = 0;
      
      public var tl:int = 0;
      
      public var hpNow:Number;
      
      public var hpMax:Number;
      
      public var mpNow:Number;
      
      public var mpMax:Number;
      
      public var ppNow:Number;
      
      public var ppMax:Number;
      
      public var gqNow:int;
      
      public var expNow:Number;
      
      public var expMax:Number;
      
      public var moxueNow:Number;
      
      public var moxueMax:Number;
      
      public var fabaoNow:Number;
      
      public var fabaoMax:Number;
      
      public var lingliNow:Number;
      
      public var lingliMax:Number;
      
      public var wufang:Number;
      
      public var points_attack:Number = 0;
      
      public var points_defence:Number = 0;
      
      public var points_fly:Number = 0;
      
      public var points_stong:Number = 0;
      
      public var points_action:Number = 0;
      
      public var kfNow:Number = 0;
      
      public var kfMax:Number = 0;
      
      public var jmNow:int = 0;
      
      public var jmMax:int = 0;
      
      public var cjNow:int = 0;
      
      public var cjMax:int = 0;
      
      public var dugu_baoji_jianmian:Number;
      
      public var dugu_anqi_jianmian:Number;
      
      public var dugu_anqi_dikang:Number;
      
      public var dugu_gongjian_dikang:Number;
      
      public var dugu_dantian_dikang:Number;
      
      public var add2_bj:Number;
      
      public var add2_aq:Number;
      
      public var add2_daq:Number;
      
      public var add2_dgj:Number;
      
      public var add2_ddt:Number;
      
      public var bagCount:int = 0;
      
      public var depotCount:int = 0;
      
      public var isGM:Boolean = false;
      
      public var headImg:String = "";
      
      public var pkMode:int = 1;
      
      public var maxBackBagNum:uint = 30;
      
      public var isNPCShopOpen:Boolean;
      
      public var btStr:String;
      
      public var isVIP:int;
      
      public var bangqi_suoshuBanghuiID:int;
      
      public var bangqi_tipsArr:Array;
      
      public var bangqi_tipsArr2:Array;
      
      public var hunyan7_ID:int;
      
      public var currentLiantiID:int = 1;
      
      public var currentBaGuaZhangID:int = 1;
      
      public var currentBowLv:int = 0;
      
      public var qixuan1ID:int = 0;
      
      public var qixuan2ID:int = 0;
      
      public var qixuan3ID:int = 0;
      
      public var qixuan4ID:int = 0;
      
      public var qixuan5ID:int = 0;
      
      public var liaoshangStatus:int = 0;
      
      public var sitAvartID:int = 0;
      
      public var silingzhenCount:int = 0;
      
      public var shengsifuCount:int = 0;
      
      public var zhenlongqiHeiCount:int = 0;
      
      public var zhenlongqiBaiCount:int = 0;
      
      public var wuCaiXianZhenCount:int = 0;
      
      public var isJiHuoXianTianWuJing:int;
      
      public var isJiHuoRoutiJinshen:Boolean;
      
      public var useWuhundanCount:int;
      
      public var useTianShengNeiliCount:int;
      
      public var vs3V3Team:int;
      
      public var nameColor:int = 1;
      
      public var isHuXinYaoJiHuo:Boolean;
      
      public var isWuHunShengJiDanJiHuo:Boolean;
      
      public var jinzhongzhaoCount:int;
      
      public var jinzhongzhaoColor:int;
      
      public var xisuijingCount:int;
      
      public var starSta:int;
      
      public var shenNongBaiChaoDanSta:int;
      
      public var statusString:String;
      
      public var niXiStatus:Boolean;
      
      public var lmStatus:Boolean;
      
      public var paihangbangArr:Array = [];
      
      public var paihangbang_xunhuan:String;
      
      public var wuxingZhanyiKaijia:int;
      
      public var qianNengXinFaSta:int;
      
      public var tianFuSta:Boolean;
      
      public var isChenmi:Boolean = true;
      
      public var isXunzhangDakong:Boolean;
      
      public var qmStatus:Boolean;
      
      public var taoZhuang:Boolean;
      
      public var zszlStatus:Boolean;
      
      public var fengHuang:Boolean;
      
      public var isHuoHunDanJiHuo:Boolean;
      
      public var wuHunShenDan:int;
      
      public var isLongHunWuPoJiHuo:Boolean;
      
      public var longHunShenDan:int;
      
      public var isShenFuMiJi:Boolean;
      
      public var xunZhangJingJie:int = 0;
      
      public var isTianmingXunzhang:Boolean = false;
      
      public var isLongwenFuzhou:Boolean = false;
      
      public var isJiDaoQianKunXunZhang:Boolean = false;
      
      public var isWuGenXianZhou:Boolean = false;
      
      public var isDaoGuXianFengXunZhang:Boolean = false;
      
      public var isTianDiRenHe:Boolean = false;
      
      public var isYuanJianLingPo:Boolean = false;
      
      public var isXuanJianLingPo:Boolean = false;
      
      public var shengsifu:int = -1;
      
      public var YNchengfaStatus:int = -1;
      
      public var skillLvStatus:int = -1;
      
      public var isNeitishenqi:Boolean;
      
      public var neitishenqi:int;
      
      public var random1:int;
      
      public var random2:int;
      
      public var random3:String;
      
      public var random_str:String;
      
      public var buffType_9:Boolean = false;
      
      public var isShowNeiGong:Boolean;
      
      public var neiliMax:Number;
      
      public var neiliNow:Number;
      
      public function AttributeInfo()
      {
         super();
      }
      
      public function getPartyName(param1:String = "") : String
      {
         return PartyType.getName(this.partyID,param1);
      }
      
      public function getSex() : int
      {
         return PartyType.getSexByParty(this.partyID);
      }
      
      public function get gqMax() : int
      {
         return this.lv < 100 ? OtherConst.MAX_ZHENQI : OtherConst.MAX_ZHENQI_100;
      }
      
      public function isDeath() : Boolean
      {
         return this.hpNow <= 0;
      }
      
      public function get netBagCount() : int
      {
         var _loc1_:int = this.bagCount;
         if(this.vipLV >= 3)
         {
            _loc1_--;
         }
         if(this.vipLV >= 10)
         {
            _loc1_--;
         }
         return _loc1_;
      }
   }
}

