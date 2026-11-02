package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class PartyType
   {
      
      public static var NONE:int = 0;
      
      public static var SHAOLINPAI:int = 1;
      
      public static var QUANZHENJIAO:int = 2;
      
      public static var GUMUPAI:int = 3;
      
      public static var TAOHUADAO:int = 4;
      
      public static var BAITUOSHAN:int = 5;
      
      public static var MINGJIAO:int = 6;
      
      public static var ZICUANGMENPAI_NAN:int = 7;
      
      public static var ZICUANGMENPAI_NAN1:int = 8;
      
      public static var ZICUANGMENPAI_NV:int = 9;
      
      public static var ZICUANGMENPAI_NV1:int = 10;
      
      private static var mapping:Array = [[NONE,"无"],[SHAOLINPAI,"少林派"],[QUANZHENJIAO,"全真教"],[GUMUPAI,"古墓派"],[TAOHUADAO,"桃花岛"],[BAITUOSHAN,"白驼山"],[MINGJIAO,"明教"],[ZICUANGMENPAI_NAN,"自创门派"],[ZICUANGMENPAI_NAN1,"自创门派"],[ZICUANGMENPAI_NV,"自创门派"],[ZICUANGMENPAI_NV1,"自创门派"]];
      
      public function PartyType()
      {
         super();
      }
      
      public static function init() : void
      {
         mapping = [[NONE,LanResManager.getLanCommonTextWords("无")],[SHAOLINPAI,LanResManager.getLanCommonTextWords("少林派")],[QUANZHENJIAO,LanResManager.getLanCommonTextWords("全真教")],[GUMUPAI,LanResManager.getLanCommonTextWords("古墓派")],[TAOHUADAO,LanResManager.getLanCommonTextWords("桃花岛")],[BAITUOSHAN,LanResManager.getLanCommonTextWords("白驼山")],[MINGJIAO,LanResManager.getLanCommonTextWords("明教")],[ZICUANGMENPAI_NAN,LanResManager.getLanCommonTextWords("自创门派")],[ZICUANGMENPAI_NAN1,LanResManager.getLanCommonTextWords("自创门派")],[ZICUANGMENPAI_NV,LanResManager.getLanCommonTextWords("自创门派")],[ZICUANGMENPAI_NV1,LanResManager.getLanCommonTextWords("自创门派")]];
      }
      
      public static function getName(param1:int, param2:String = "") : String
      {
         var _loc3_:Array = null;
         for each(_loc3_ in mapping)
         {
            if(_loc3_[0] == param1)
            {
               return _loc3_[1].toString().split("").join(param2);
            }
         }
         return "";
      }
      
      public static function getID(param1:String) : int
      {
         var _loc2_:Array = null;
         for each(_loc2_ in mapping)
         {
            if(param1 == _loc2_[1])
            {
               return _loc2_[0];
            }
         }
         return 0;
      }
      
      public static function getSexByParty(param1:int) : int
      {
         var _loc2_:int = 0;
         if(param1 == PartyType.SHAOLINPAI || param1 == PartyType.QUANZHENJIAO || param1 == PartyType.MINGJIAO || param1 == PartyType.NONE || param1 == PartyType.ZICUANGMENPAI_NAN || param1 == PartyType.ZICUANGMENPAI_NAN1)
         {
            _loc2_ = 1;
         }
         else
         {
            _loc2_ = 0;
         }
         return _loc2_;
      }
   }
}

