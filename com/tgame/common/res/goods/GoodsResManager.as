package com.tgame.common.res.goods
{
   public class GoodsResManager
   {
      
      private static var goodsResContainer:Object = new Object();
      
      public function GoodsResManager()
      {
         super();
      }
      
      public static function parseRes(param1:String) : void
      {
         var _loc3_:GoodsRes = null;
         var _loc4_:XML = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.g)
         {
            _loc3_ = new GoodsRes();
            _loc3_.id_kind = _loc4_.@id;
            _loc3_.id_ico = _loc4_.@i;
            _loc3_.id_ico_big = _loc4_.@bi;
            _loc3_.id_m = _loc4_.@ai;
            _loc3_.id_bag = _loc4_.@de;
            _loc3_.id_sound_goods_down = _loc4_.@s;
            _loc3_.id_sound_goods_pickUp = _loc4_.@s;
            _loc3_.id_sound_goods_use = _loc4_.@us;
            _loc3_.coolingtime = _loc4_.@ct;
            _loc3_.public_type = _loc4_.@ctt;
            _loc3_.public_time = _loc4_.@cc;
            _loc3_.name = String(_loc4_.na).split("_")[0];
            _loc3_.desc = _loc4_.des;
            _loc3_.use_desc = _loc4_.ud;
            _loc3_.popsinger = _loc4_.@p;
            _loc3_.sound = _loc4_.@sound;
            _loc3_.use_sound = _loc4_.@us;
            _loc3_.use_image = _loc4_.@ui;
            _loc3_.kind = _loc4_.@k;
            _loc3_.discard = _loc4_.@d;
            _loc3_.log = _loc4_.@l;
            _loc3_.repeat = _loc4_.@r;
            _loc3_.buy_price = _loc4_.@bp;
            _loc3_.sale_price = _loc4_.@sp;
            _loc3_.attack = _loc4_.@a;
            _loc3_.attack_min = _loc4_.@attack_min;
            _loc3_.attack_max = _loc4_.@attack_max;
            _loc3_.crt = _loc4_.@c;
            _loc3_.dodge = _loc4_.@dg;
            _loc3_.atk_coldtime = _loc4_.@aa;
            _loc3_.move_speed = _loc4_.@ms;
            _loc3_.hp = _loc4_.@h;
            _loc3_.mp = _loc4_.@m;
            _loc3_.sp = _loc4_.@sp;
            _loc3_.grade = _loc4_.@g;
            _loc3_.binding = _loc4_.@b;
            _loc3_.born_probability = _loc4_.@bornProbability;
            _loc3_.bron_max = _loc4_.@bronMax;
            _loc3_.defence_probability = _loc4_.@defenceProbability;
            _loc3_.defence_min = _loc4_.@defenceMin;
            _loc3_.defence_max = _loc4_.@defenceMax;
            _loc3_.crt_probability = _loc4_.@crtProbability;
            _loc3_.crt_min = _loc4_.@crtMin;
            _loc3_.crt_max = _loc4_.@crtMax;
            _loc3_.dodge_probability = _loc4_.@dodgeProbability;
            _loc3_.dodge_min = _loc4_.@dodgeMin;
            _loc3_.dodge_max = _loc4_.@dodgeMax;
            _loc3_.atk_coldtime_probability = _loc4_.@atkColdtimeProbability;
            _loc3_.atk_coldtime_min = _loc4_.@atkColdtimeMin;
            _loc3_.atk_coldtime_max = _loc4_.@atkColdtimeMax;
            _loc3_.move_speed_probability = _loc4_.@moveSpeedProbability;
            _loc3_.move_speed_min = _loc4_.@moveSpeedMin;
            _loc3_.hp_probability = _loc4_.@hpProbability;
            _loc3_.move_speed_max = _loc4_.@moveSpeedMax;
            _loc3_.hp_min = _loc4_.@hpMin;
            _loc3_.hp_max = _loc4_.@hpMax;
            _loc3_.mp_probability = _loc4_.@mpProbability;
            _loc3_.mp_min = _loc4_.@mpMin;
            _loc3_.mp_max = _loc4_.@mpMax;
            _loc3_.sp_probability = _loc4_.@spProbability;
            _loc3_.sp_min = _loc4_.@spMin;
            _loc3_.sp_max = _loc4_.@spMax;
            _loc3_.position = _loc4_.@po;
            _loc3_.insert_limited = _loc4_.@insert_limited;
            _loc3_.shape = _loc4_.@shape;
            _loc3_.durability = _loc4_.@du;
            _loc3_.repair_money = _loc4_.@re;
            _loc3_.limit_grade = _loc4_.@li;
            _loc3_.attack_addpoint = _loc4_.@at;
            _loc3_.flop_probability = _loc4_.@flopProbability;
            _loc3_.light_addpoint = _loc4_.@la;
            _loc3_.strong_addpoint = _loc4_.@st;
            _loc3_.gems_type = _loc4_.@gt;
            _loc3_.gems_value = _loc4_.@gv;
            _loc3_.skill = _loc4_.@sk;
            _loc3_.task = _loc4_.@t;
            _loc3_.drug_type = _loc4_.@dt;
            _loc3_.drug_buff_time = _loc4_.@drug_buff_time;
            _loc3_.drug_value = _loc4_.@dv;
            _loc3_.prestige_limit = _loc4_.@pr;
            _loc3_.sendAnnouncement = _loc4_.@sa;
            _loc3_.born_ico = _loc4_.@bo;
            _loc3_.born_color_grade = _loc4_.@bc;
            _loc3_.is_sale = _loc4_.@il;
            _loc3_.sale_is_ui = _loc4_.@si;
            _loc3_.f_discard_is_ui = _loc4_.@dii;
            _loc3_.upgrade = _loc4_.@u;
            _loc3_.chaiFen(_loc3_.upgrade);
            _loc3_.donghua_tupian = _loc4_.@dtt;
            goodsResContainer[_loc3_.id_kind] = _loc3_;
         }
      }
      
      public static function getGoodsRes(param1:int) : GoodsRes
      {
         return goodsResContainer[param1];
      }
   }
}

