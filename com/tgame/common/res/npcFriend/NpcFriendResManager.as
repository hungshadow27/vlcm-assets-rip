package com.tgame.common.res.npcFriend
{
   public class NpcFriendResManager
   {
      
      private static var npcFriendResContainer:Object = new Object();
      
      public function NpcFriendResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc6_:NpcFriendRes = null;
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
            _loc6_ = new NpcFriendRes();
            _loc6_.id_kind = _loc4_[_loc3_].@id;
            _loc6_.name = String(_loc4_[_loc3_].@name).split("_")[0];
            _loc6_.attack_interval = _loc4_[_loc3_].@attack_interval;
            _loc6_.id_ico = _loc4_[_loc3_].@headiconId;
            _loc6_.id_m = _loc4_[_loc3_].@avatarId;
            _loc6_.id_sound_char_attack = _loc4_[_loc3_].@attack_audio;
            _loc6_.id_sound_char_injured = _loc4_[_loc3_].@hurt_audio;
            _loc6_.id_sound_char_death = _loc4_[_loc3_].@die_audio;
            npcFriendResContainer[_loc6_.id_kind] = _loc6_;
            _loc3_++;
         }
      }
      
      public static function getNpcFriendRes(param1:int) : NpcFriendRes
      {
         return npcFriendResContainer[param1];
      }
   }
}

