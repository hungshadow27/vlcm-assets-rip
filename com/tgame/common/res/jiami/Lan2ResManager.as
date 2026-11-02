package com.tgame.common.res.jiami
{
   public class Lan2ResManager
   {
      
      private static var girlResContainer:String = new String();
      
      public function Lan2ResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         girlResContainer = _loc2_.ceshiStr.@str;
      }
      
      public static function getGirlRes() : String
      {
         return girlResContainer;
      }
   }
}

