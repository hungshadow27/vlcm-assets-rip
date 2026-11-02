package com.tgame.common.res.skill
{
   public class SkillResManager
   {
      
      private static var skillContainer:Object = new Object();
      
      private static var effectContainer:Object = new Object();
      
      public function SkillResManager()
      {
         super();
      }
      
      public static function parseSkillRes(param1:String) : void
      {
         var skillRes:SkillRes = null;
         var xml:XML = null;
         var obj:String = param1;
         var skillXML:XML = XML(obj);
         for each(xml in skillXML.s)
         {
            skillRes = new SkillRes();
            with(skillRes)
            {
               
               id_kind = xml.@i;
               id_ico = xml.@a;
               id_ico_big = xml.@g;
               id_e0 = xml.@x || 0;
               id_e1 = xml.@y || 0;
               id_e2 = xml.@z || 0;
               id_sound_skill = xml.@s || 0;
               name = xml.n;
               coolingtime = xml.@j || 0;
               iscommon_cd = xml.@c || 0;
               depletion_parameter = xml.@p || 0;
               depletion_value = xml.@f || 0;
               distance = xml.@d || 0;
               useway = xml.@u;
               target = xml.@r;
               effect_ids = xml.@e;
               isgeneral = xml.@k || 0;
               position = xml.@o;
               char_level = xml.@l || 0;
               popsinger = xml.@n || 0;
               desc = xml.d;
               grade_limit = xml.@q || 0;
               skilltype = xml.@m || 0;
               trigger_probability = xml.@tp;
               public_type = xml.@cy || 0;
               public_time = xml.@ci || 0;
               shortType = xml.@t;
               wugong_type = xml.@w || 0;
               source = xml.s || "";
               learningBook = xml.@b || 0;
               showOrder = xml.@so || 0;
               is_zuhe = xml.@iz || 0;
               bangGong = xml.@bg || 0;
               mount_use_tuijian = xml.@lt || 0;
            }
            skillContainer[skillRes.id_kind] = skillRes;
         }
      }
      
      public static function parseSkillEffectRes(param1:String) : void
      {
         var buffRes:BuffRes = null;
         var xml:XML = null;
         var obj:String = param1;
         var skillEffectXML:XML = XML(obj);
         for each(xml in skillEffectXML.s)
         {
            buffRes = new BuffRes();
            with(buffRes)
            {
               
               id_kind = xml.@i;
               name = xml.n;
               target = xml.@target;
               user_scope = xml.@u != undefined ? xml.@u : 1;
               scope_radius = xml.@s || 0;
               use_limit = xml.@l != undefined ? xml.@l : 1;
               aoe_type = xml.@a != undefined ? xml.@a : 1;
               hurt_consideration_way = xml.@h;
               type = xml.@t;
               hurt_value = xml.@v || 0;
               duration = xml.@d;
               pre_duration = xml.@p || 0;
               effect_repeat_option = xml.@o;
               effect_repeat_count = xml.@c;
               special_effect_change = xml.@g || 0;
               effect_repeat_type = xml.@e || 0;
               desc = xml.d;
               hurt_adds = xml.@r || 0;
               percent = xml.@w;
               type_pn = xml.@x;
               jitui_distance = xml.@j || 0;
               id_ico = xml.@z;
               id_e = xml.@y || 0;
               buff_flag = xml.@f || 0;
               desc_short = xml.c || desc;
               res_type = xml.@res_type;
               res_ids = xml.@res_ids;
            }
            effectContainer[buffRes.id_kind] = buffRes;
         }
      }
      
      public static function getSkillRes(param1:int) : SkillRes
      {
         return skillContainer[param1];
      }
      
      public static function getBuffRes(param1:int) : BuffRes
      {
         return effectContainer[param1];
      }
      
      public static function getMountSkillResArr() : Array
      {
         var _loc1_:SkillRes = null;
         var _loc2_:Array = [];
         for each(_loc1_ in skillContainer)
         {
            if(Boolean(_loc1_) && _loc1_.skilltype == 1)
            {
               _loc2_.push(_loc1_);
            }
         }
         _loc2_.sortOn("id_kind",Array.NUMERIC);
         return _loc2_;
      }
   }
}

