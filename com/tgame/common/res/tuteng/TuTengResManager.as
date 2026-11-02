package com.tgame.common.res.tuteng
{
   public class TuTengResManager
   {
      
      private static var tutengResContainer:Object = new Object();
      
      public function TuTengResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:TuTengRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.totems.totem)
         {
            _loc3_ = new TuTengRes();
            _loc3_.id = _loc4_.@id;
            _loc3_.name = _loc4_.name;
            tutengResContainer[_loc3_.id] = _loc3_;
         }
      }
      
      public static function getTuTeng(param1:int) : TuTengRes
      {
         return tutengResContainer[param1];
      }
   }
}

