package com.tgame.common.res.goods
{
   import com.tgame.common.res.BaseResID;
   import com.tgame.common.staticdata.DrugsKind;
   
   public class GoodsRes extends BaseResID
   {
      
      public var name:String;
      
      public var desc:String;
      
      public var use_desc:String;
      
      public var popsinger:int;
      
      public var kind:int;
      
      public var binding:int;
      
      public var discard:int;
      
      public var repeat:int;
      
      public var goods_str_id:String;
      
      public var sound:String;
      
      public var use_sound:String;
      
      public var use_image:int;
      
      public var buy_price:int;
      
      public var sale_price:int;
      
      public var attack:int;
      
      public var defence:int;
      
      public var crt:int;
      
      public var dodge:int;
      
      public var atk_coldtime:int;
      
      public var move_speed:int;
      
      public var hp:int;
      
      public var mp:int;
      
      public var sp:int;
      
      public var grade_probability:int;
      
      public var grade_min:int;
      
      public var grade_max:int;
      
      public var flop_probability:int;
      
      public var born_probability:int;
      
      public var bron_max:int;
      
      public var bron_min:int;
      
      public var attack_probability:int;
      
      public var attack_min:int;
      
      public var attack_max:int;
      
      public var defence_probability:int;
      
      public var defence_min:int;
      
      public var defence_max:int;
      
      public var crt_probability:int;
      
      public var crt_min:int;
      
      public var crt_max:int;
      
      public var dodge_probability:int;
      
      public var dodge_min:int;
      
      public var dodge_max:int;
      
      public var atk_coldtime_probability:int;
      
      public var atk_coldtime_min:int;
      
      public var atk_coldtime_max:int;
      
      public var move_speed_probability:int;
      
      public var move_speed_min:int;
      
      public var move_speed_max:int;
      
      public var hp_probability:int;
      
      public var hp_min:int;
      
      public var hp_max:int;
      
      public var mp_probability:int;
      
      public var mp_min:int;
      
      public var mp_max:int;
      
      public var sp_probability:int;
      
      public var sp_min:int;
      
      public var sp_max:int;
      
      public var position:int;
      
      public var insert_limited:String;
      
      public var shape:String;
      
      public var durability:int;
      
      public var repair_money:int;
      
      public var limit_grade:int;
      
      public var attack_addpoint:int;
      
      public var defence_addpoint:int;
      
      public var light_addpoint:int;
      
      public var strong_addpoint:int;
      
      public var hole_ceiling:int;
      
      public var zhenqi:int;
      
      public var experience:int;
      
      public var prestige:int;
      
      public var resume_hp:int;
      
      public var resume_mp:int;
      
      public var resume_sp:int;
      
      public var exception:int;
      
      public var coolingtime:int;
      
      public var public_time:int;
      
      public var public_type:int;
      
      public var gems_type:int;
      
      public var gems_value:Number;
      
      public var skill:String;
      
      public var task:String;
      
      public var scriptclass:String;
      
      public var scriptclassparam:String;
      
      public var grade:int;
      
      public var drug_type:int;
      
      public var drug_buff_time:int;
      
      public var drug_value:int;
      
      public var prestige_limit:int;
      
      public var sendAnnouncement:int;
      
      public var log:int;
      
      public var born_ico:int;
      
      public var born_color_grade:int;
      
      public var is_sale:int;
      
      public var sale_is_ui:int;
      
      public var f_discard_is_ui:int;
      
      public var upgrade:String;
      
      public var menuShengji:Boolean = false;
      
      public var menuXiangqian:Boolean = false;
      
      public var menuXiangqianSkill:Boolean = false;
      
      public var menuQianghua:Boolean = false;
      
      public var xunZhangXiLian:Boolean = false;
      
      public var duoXuanQiangHua:Boolean = false;
      
      public var menuJinHua:Boolean = false;
      
      public var menuShiSHiKaiFeng:Boolean = false;
      
      public var menuFenjieYN:Boolean = false;
      
      public var donghua_tupian:int = 0;
      
      public function GoodsRes()
      {
         super();
      }
      
      public function chaiFen(param1:String) : void
      {
         if(param1 == "")
         {
            return;
         }
         var _loc2_:Array = param1.split(",");
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_.length)
         {
            if(_loc2_[_loc3_] == 1)
            {
               this.menuShengji = true;
            }
            if(_loc2_[_loc3_] == 2)
            {
               this.menuXiangqian = true;
            }
            if(_loc2_[_loc3_] == 3)
            {
               this.menuXiangqianSkill = true;
            }
            if(_loc2_[_loc3_] == 4)
            {
               this.menuQianghua = true;
            }
            if(_loc2_[_loc3_] == 5)
            {
               this.xunZhangXiLian = true;
            }
            if(_loc2_[_loc3_] == 6)
            {
               this.duoXuanQiangHua = true;
            }
            if(_loc2_[_loc3_] == 7)
            {
               this.menuJinHua = true;
            }
            if(_loc2_[_loc3_] == 8)
            {
               this.menuShiSHiKaiFeng = true;
            }
            if(_loc2_[_loc3_] == 100)
            {
               this.menuFenjieYN = true;
            }
            _loc3_++;
         }
      }
      
      public function get drug_kind() : int
      {
         if(id_kind >= 30100 && id_kind <= 30199)
         {
            return DrugsKind.HP;
         }
         if(id_kind >= 30200 && id_kind <= 30299)
         {
            return DrugsKind.MP;
         }
         if(id_kind >= 30300 && id_kind <= 30399)
         {
            return DrugsKind.SP;
         }
         return -1;
      }
   }
}

