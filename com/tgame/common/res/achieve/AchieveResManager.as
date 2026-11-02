package com.tgame.common.res.achieve
{
   public class AchieveResManager
   {
      
      private static var achieveResContainer:Object = new Object();
      
      public function AchieveResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:XML = null;
         var _loc4_:AchieveRes = null;
         var _loc2_:XML = XML(param1);
         for each(_loc3_ in _loc2_.achieves.achieve)
         {
            _loc4_ = new AchieveRes();
            _loc4_.id = _loc3_.@id;
            _loc4_.name = _loc3_.name;
            _loc4_.kind = _loc3_.@kind;
            _loc4_.beizhu = _loc3_.beizhu;
            _loc4_.desc = _loc3_.desc;
            _loc4_.goods_id = _loc3_.@good_id;
            _loc4_.ico = _loc3_.@ico;
            _loc4_.isnotice = _loc3_.@isnotice;
            _loc4_.title = _loc3_.title;
            _loc4_.child_kind = _loc3_.@child_kind;
            _loc4_.point = _loc3_.@point;
            _loc4_.achieve_count = _loc3_.@achieve_count;
            achieveResContainer[_loc4_.id] = _loc4_;
         }
      }
      
      public static function getAchieveRes(param1:int) : AchieveRes
      {
         return achieveResContainer[param1];
      }
      
      public static function getAchieveResListByKind(param1:int) : Array
      {
         var _loc3_:AchieveRes = null;
         var _loc2_:Array = [];
         for each(_loc3_ in achieveResContainer)
         {
            if(_loc3_.kind == param1)
            {
               _loc2_.push(_loc3_);
            }
         }
         return _loc2_;
      }
   }
}

