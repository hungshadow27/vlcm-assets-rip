package com.tgame.common.res.anqi
{
   public class AnqiResManager
   {
      
      private static var anqiResContainer:Object = new Object();
      
      public function AnqiResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:AnQiRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.hidden_weaponss.hidden_weapons)
         {
            _loc3_ = new AnQiRes();
            _loc3_.id = _loc4_.@id;
            _loc3_.name = _loc4_.name;
            _loc3_.grade = _loc4_.@grade;
            _loc3_.xiu_grade = _loc4_.@xiu_grade;
            _loc3_.mastery = _loc4_.@mastery;
            _loc3_.method = _loc4_.method;
            _loc3_.spcialDesc = _loc4_.spcial_desc;
            _loc3_.spcialType = _loc4_.@spcial_type;
            _loc3_.attackDis = _loc4_.@attack_dis;
            _loc3_.tribLv = _loc4_.@trib_lv;
            _loc3_.attackTargets = _loc4_.@attack_targets;
            _loc3_.upgradeTribLv = _loc4_.@upgrade_trib_lv;
            _loc3_.upgradeNeedCopper = _loc4_.@upgrade_need_copper;
            _loc3_.upgradeNeedZhenqi = _loc4_.@upgrade_need_zhenqi;
            _loc3_.upgradeNeedGoods = _loc4_.@upgrade_need_goods;
            _loc3_.upgradeMinCnt = _loc4_.@upgrade_min_cnt;
            _loc3_.upgradeMaxCnt = _loc4_.@upgrade_max_cnt;
            _loc3_.hidden_weaponscol = _loc4_.@hidden_weaponscol;
            _loc3_.skillID = _loc4_.@skill_id;
            anqiResContainer[_loc3_.id] = _loc3_;
         }
      }
      
      public static function getAnQiRes(param1:int) : AnQiRes
      {
         return anqiResContainer[param1];
      }
      
      public static function getAnqiArray() : Array
      {
         var _loc2_:AnQiRes = null;
         var _loc1_:Array = [];
         var _loc3_:String = "";
         var _loc4_:String = "";
         for each(_loc2_ in anqiResContainer)
         {
            _loc3_ = _loc2_.name;
            if(_loc3_ != _loc4_)
            {
               _loc1_.push(_loc2_);
               _loc4_ = _loc3_;
            }
         }
         return _loc1_;
      }
      
      public static function getNextAnqiRes(param1:int) : AnQiRes
      {
         var _loc4_:AnQiRes = null;
         var _loc2_:AnQiRes = getAnQiRes(param1);
         var _loc3_:int = _loc2_.grade + 1;
         for each(_loc4_ in anqiResContainer)
         {
            if(_loc3_ == _loc4_.grade)
            {
               return _loc4_;
            }
         }
         return null;
      }
   }
}

