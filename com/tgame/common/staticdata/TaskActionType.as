package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class TaskActionType
   {
      
      public static const ZUDUI:int = 1;
      
      public static const TIANJIAHAOYOU:int = 2;
      
      public static const SHIYONGLABA:int = 3;
      
      public static const ZHUANGBEIWUPIN:int = 4;
      
      public static const SYHFLDJ:int = 5;
      
      public static const DAOJUHECHENG:int = 6;
      
      public static const BAOSHIXIANGQIAN:int = 7;
      
      public static const ZHUANGBEIXIULI:int = 8;
      
      public static const MAIRUDAOJU:int = 9;
      
      public static const MAICHUDAOJU:int = 10;
      
      public static const MIJISHENGJI:int = 11;
      
      public static const KUAIJIELAN:int = 12;
      
      private static var valueName:Array = [[ZUDUI,"组队"],[TIANJIAHAOYOU,"添加好友"],[SHIYONGLABA,"使用喇叭"],[ZHUANGBEIWUPIN,"装备物品"],[SYHFLDJ,"使用道具"],[DAOJUHECHENG,"道具合成"],[BAOSHIXIANGQIAN,"宝石镶嵌"],[ZHUANGBEIXIULI,"装备修理"],[MAIRUDAOJU,"买入道具"],[MAICHUDAOJU,"卖出道具"],[MIJISHENGJI,"秘籍升级"],[KUAIJIELAN,"快捷栏"]];
      
      public function TaskActionType()
      {
         super();
      }
      
      public static function init() : void
      {
         valueName = [[ZUDUI,LanResManager.getLanCommonTextWords("组队")],[TIANJIAHAOYOU,LanResManager.getLanCommonTextWords("添加好友")],[SHIYONGLABA,LanResManager.getLanCommonTextWords("使用喇叭")],[ZHUANGBEIWUPIN,LanResManager.getLanCommonTextWords("装备物品")],[SYHFLDJ,LanResManager.getLanCommonTextWords("使用道具")],[DAOJUHECHENG,LanResManager.getLanCommonTextWords("道具合成")],[BAOSHIXIANGQIAN,LanResManager.getLanCommonTextWords("宝石镶嵌")],[ZHUANGBEIXIULI,LanResManager.getLanCommonTextWords("装备修理")],[MAIRUDAOJU,LanResManager.getLanCommonTextWords("买入道具")],[MAICHUDAOJU,LanResManager.getLanCommonTextWords("卖出道具")],[MIJISHENGJI,LanResManager.getLanCommonTextWords("秘籍升级")],[KUAIJIELAN,LanResManager.getLanCommonTextWords("快捷栏")]];
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
   }
}

