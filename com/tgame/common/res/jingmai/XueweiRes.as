package com.tgame.common.res.jingmai
{
   import com.tgame.common.res.lan.LanResManager;
   
   public class XueweiRes
   {
      
      public var f_id:int;
      
      public var f_name:String;
      
      public var f_hp_add:int;
      
      public var f_mp_add:int;
      
      public var f_sp_add:int;
      
      public var f_attack_add:int;
      
      public var f_defence_add:int;
      
      public var f_dodge_add:int;
      
      public var f_crt_add:int;
      
      public var f_need_zhenqi:int;
      
      public var f_odds:int;
      
      public var f_goodmodel_id:int;
      
      public var f_goodmodel_count:int;
      
      public function XueweiRes()
      {
         super();
      }
      
      public function get jingmaiID() : int
      {
         return Math.floor(this.f_id / 100);
      }
      
      public function get addStr() : String
      {
         var _loc1_:String = LanResManager.getLanCommonTextWords("血|蓝|体|攻|防|闪|暴");
         var _loc2_:Array = _loc1_.split("|");
         var _loc3_:Array = [];
         if(this.f_hp_add > 0)
         {
            _loc3_.push(_loc2_[0] + "+" + this.f_hp_add);
         }
         if(this.f_mp_add > 0)
         {
            _loc3_.push(_loc2_[1] + "+" + this.f_mp_add);
         }
         if(this.f_sp_add > 0)
         {
            _loc3_.push(_loc2_[2] + "+" + this.f_sp_add);
         }
         if(this.f_attack_add > 0)
         {
            _loc3_.push(_loc2_[3] + "+" + this.f_attack_add);
         }
         if(this.f_defence_add > 0)
         {
            _loc3_.push(_loc2_[4] + "+" + this.f_defence_add);
         }
         if(this.f_dodge_add > 0)
         {
            _loc3_.push(_loc2_[5] + "+" + this.f_dodge_add);
         }
         if(this.f_crt_add > 0)
         {
            _loc3_.push(_loc2_[6] + "+" + this.f_crt_add);
         }
         return _loc3_.join(",");
      }
   }
}

