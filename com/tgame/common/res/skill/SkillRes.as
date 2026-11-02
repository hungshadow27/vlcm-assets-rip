package com.tgame.common.res.skill
{
   import com.tgame.common.res.BaseResID;
   import com.tgame.common.res.goods.GoodsRes;
   import com.tgame.common.res.goods.GoodsResManager;
   
   public class SkillRes extends BaseResID
   {
      
      public var name:String;
      
      public var coolingtime:int;
      
      public var iscommon_cd:String;
      
      public var depletion_parameter:int;
      
      public var depletion_value:int;
      
      public var distance:int;
      
      public var useway:int;
      
      public var target:int;
      
      public var effect_ids:String;
      
      public var isgeneral:int;
      
      public var position:int;
      
      public var char_level:int;
      
      public var popsinger:int;
      
      public var desc:String;
      
      public var grade_limit:int;
      
      public var skilltype:int;
      
      public var trigger_probability:int;
      
      public var public_time:int;
      
      public var public_type:int;
      
      public var shortType:int;
      
      public var wugong_type:int;
      
      public var source:String;
      
      public var learningBook:int;
      
      public var showOrder:int;
      
      public var is_zuhe:int;
      
      public var bangGong:int;
      
      public var mount_use_tuijian:int;
      
      public function SkillRes()
      {
         super();
      }
      
      public function getMijiName() : String
      {
         var _loc1_:GoodsRes = GoodsResManager.getGoodsRes(this.learningBook);
         if(!_loc1_)
         {
            return "";
         }
         return _loc1_.name;
      }
   }
}

