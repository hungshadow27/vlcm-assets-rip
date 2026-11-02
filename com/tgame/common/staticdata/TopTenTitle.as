package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class TopTenTitle
   {
      
      private static var topTenArr:Array = ["无称号","十大高手","十大富豪","十大神骑","十大杀神","十大侠士","十大魔头","武术宗师","经脉通玄","传说中人","十大刺客"];
      
      public static const Top_Ten_GaoShou:int = 1;
      
      public static const Top_Ten_MONEY:int = 2;
      
      public static const Top_Ten_Mount:int = 3;
      
      public static const Top_Ten_LianZhan:int = 4;
      
      public static const Top_Ten_KillBoss:int = 5;
      
      public static const Top_Ten_MoTou:int = 6;
      
      public static const Top_Ten_KongFu:int = 7;
      
      public static const Top_Ten_JingMai:int = 8;
      
      public static const Top_Ten_ChuanShuoRen:int = 9;
      
      public static const Top_Ten_CiKe:int = 10;
      
      public function TopTenTitle()
      {
         super();
      }
      
      public static function init() : void
      {
         topTenArr = [LanResManager.getLanCommonTextWords("无称号"),LanResManager.getLanCommonTextWords("十大高手"),LanResManager.getLanCommonTextWords("十大富豪"),LanResManager.getLanCommonTextWords("十大神骑"),LanResManager.getLanCommonTextWords("十大杀神"),LanResManager.getLanCommonTextWords("十大侠士"),LanResManager.getLanCommonTextWords("十大魔头"),LanResManager.getLanCommonTextWords("武术宗师"),LanResManager.getLanCommonTextWords("经脉通玄"),LanResManager.getLanCommonTextWords("传说中人"),LanResManager.getLanCommonTextWords("十大刺客")];
      }
      
      public static function getTopTenTitle(param1:int) : String
      {
         return topTenArr[param1];
      }
      
      public static function getTopTenID(param1:String) : int
      {
         return topTenArr.indexOf(param1);
      }
   }
}

