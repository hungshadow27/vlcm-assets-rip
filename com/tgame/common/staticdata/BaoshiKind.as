package com.tgame.common.staticdata
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class BaoshiKind
   {
      
      public function BaoshiKind()
      {
         super();
      }
      
      public static function getTypeName(param1:int, param2:Number) : String
      {
         var _loc3_:String = "";
         var _loc4_:String = "       ";
         switch(param1)
         {
            case 1:
               _loc3_ = LanResManager.getLanCommonTextWords("攻击力") + _loc4_ + "+" + (param2 > 0 ? "" + param2 : -param2 + "%");
               break;
            case 2:
               _loc3_ = LanResManager.getLanCommonTextWords("防御力") + _loc4_ + "+" + (param2 > 0 ? "" + param2 : -param2 + "%");
               break;
            case 3:
               _loc3_ = LanResManager.getLanCommonTextWords("暴击") + _loc4_ + "+" + param2;
               break;
            case 4:
               _loc3_ = LanResManager.getLanCommonTextWords("闪避") + _loc4_ + "+" + param2;
               break;
            case 5:
               _loc3_ = LanResManager.getLanCommonTextWords("生命上限") + _loc4_ + "+" + (param2 > 0 ? "" + param2 : -param2 + "%");
               break;
            case 6:
               _loc3_ = LanResManager.getLanCommonTextWords("体力上限") + _loc4_ + "+" + (param2 > 0 ? "" + param2 : -param2 + "%");
               break;
            case 7:
               _loc3_ = LanResManager.getLanCommonTextWords("内力上限") + _loc4_ + "+" + (param2 > 0 ? "" + param2 : -param2 + "%");
               break;
            case 8:
               _loc3_ = LanResManager.getLanCommonTextWords("攻击速度") + _loc4_ + "+" + param2;
               break;
            case 9:
               _loc3_ = LanResManager.getLanCommonTextWords("移动速度") + _loc4_ + "+" + param2;
               break;
            case 10:
               _loc3_ = LanResManager.getLanCommonTextWords("命中") + _loc4_ + "+" + param2;
               break;
            case 11:
               _loc3_ = LanResManager.getLanCommonTextWords("武功层数") + _loc4_ + "+" + param2;
         }
         return _loc3_;
      }
   }
}

