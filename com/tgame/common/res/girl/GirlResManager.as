package com.tgame.common.res.girl
{
   public class GirlResManager
   {
      
      private static var girlResContainer:Object = new Object();
      
      public function GirlResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:int = 0;
         var _loc4_:GirlRes = null;
         var _loc5_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc5_ in _loc2_.meiren_models.meiren_model)
         {
            _loc4_ = new GirlRes();
            _loc4_.id_kind = _loc5_[_loc3_].@id;
            _loc4_.id_ico = _loc5_[_loc3_].@headicon_id;
            _loc4_.id_m = _loc5_[_loc3_].@avatar_id;
            _loc4_.name_color = _loc5_[_loc3_].@color;
            _loc4_.zizhi = _loc5_[_loc3_].@zizhi;
            _loc4_.get_need_meiren_id = _loc5_[_loc3_].@get_need_meiren_id;
            _loc4_.get_need_grade = _loc5_[_loc3_].@get_need_grade;
            _loc4_.get_need_goods = _loc5_[_loc3_].@get_need_goods;
            _loc4_.get_need_copper = _loc5_[_loc3_].@get_need_copper;
            _loc4_.get_need_yuanbao = _loc5_[_loc3_].@get_need_yuanbao;
            _loc4_.skill = _loc5_[_loc3_].@skill;
            _loc4_.hp = _loc5_[_loc3_].@hp;
            _loc4_.attack = _loc5_[_loc3_].@attack;
            _loc4_.crt = _loc5_[_loc3_].@crt;
            _loc4_.dodge = _loc5_[_loc3_].@dodge;
            _loc4_.attack_interval = _loc5_[_loc3_].@atkspeed;
            _loc4_.isopen = _loc5_[_loc3_].@isopen;
            _loc4_.name = String(_loc5_[_loc3_].name).split("_")[0];
            _loc4_.desc = String(_loc5_[_loc3_].desc).split("_")[0];
            girlResContainer[_loc4_.id_kind] = _loc4_;
         }
      }
      
      public static function getGirlRes(param1:int) : GirlRes
      {
         return girlResContainer[param1];
      }
   }
}

