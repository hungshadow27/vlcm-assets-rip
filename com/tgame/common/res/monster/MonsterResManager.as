package com.tgame.common.res.monster
{
   public class MonsterResManager
   {
      
      private static var monsterResContainer:Object = new Object();
      
      public function MonsterResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc6_:MonsterRes = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         var _loc4_:XMLList = _loc2_.children();
         var _loc5_:int = _loc4_.length();
         var _loc7_:Array = [];
         _loc3_ = 0;
         while(_loc3_ < _loc5_)
         {
            _loc6_ = new MonsterRes();
            _loc6_.Hp_max = int(_loc4_[_loc3_].@hp) || 0;
            _loc6_.Mp_max = int(_loc4_[_loc3_].@mp) || 0;
            _loc6_.id_kind = _loc4_[_loc3_].@id;
            _loc6_.id_ico = _loc4_[_loc3_].@h;
            _loc6_.id_m = int(_loc4_[_loc3_].@a) || 0;
            _loc6_.id_sound_char_attack = int(_loc4_[_loc3_].@aa) || 0;
            _loc6_.id_sound_char_injured = int(_loc4_[_loc3_].@ha) || 0;
            _loc6_.id_sound_char_death = int(_loc4_[_loc3_].@da) || 0;
            _loc6_.name = String(_loc4_[_loc3_].n).split("_")[0];
            _loc6_.type = _loc4_[_loc3_].@t;
            _loc6_.talks = String(_loc4_[_loc3_].s).split(";");
            monsterResContainer[_loc6_.id_kind] = _loc6_;
            _loc3_++;
         }
      }
      
      public static function getMonsterRes(param1:int) : MonsterRes
      {
         return monsterResContainer[param1];
      }
   }
}

