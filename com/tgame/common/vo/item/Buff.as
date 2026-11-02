package com.tgame.common.vo.item
{
   import com.tgame.common.res.ResPathManager;
   import com.tgame.common.res.skill.BuffRes;
   import com.tgame.common.res.skill.SkillResManager;
   import com.tgame.common.staticdata.CoolingType;
   import flash.display.Bitmap;
   
   public class Buff extends BaseItem
   {
      
      public var res:BuffRes;
      
      public var esoterica_id:int;
      
      public var skill_type:int;
      
      public var level:int;
      
      public var zhenqi:int;
      
      public var grade:int = 0;
      
      public var nowexp:int = 0;
      
      public var target:int;
      
      public var iscommon:int;
      
      public var isLearn:int;
      
      public var currentCDTotal:int;
      
      public var chuliang:Number;
      
      public var extraTime:int;
      
      public var vipTime:String;
      
      public var miaoShu:String = "";
      
      public function Buff(param1:int, param2:int = 0, param3:int = 0, param4:Number = 0, param5:int = 0, param6:int = 0, param7:int = 0)
      {
         this.isLearn = param7;
         this.level = param5;
         this.zhenqi = param6;
         super(param1,param2,param3,param4);
         this.res = SkillResManager.getBuffRes(param1);
      }
      
      override public function getSmallICO(param1:int = 35, param2:int = 35) : Bitmap
      {
         return ResPathManager.getSmallICO(this.res.id_ico,param1,param2);
      }
      
      override public function getAvatarPath_Buff() : String
      {
         return ResPathManager.getAvatarPath_Effect(ResPathManager.AVATAR_EFFECT,this.res.id_e);
      }
      
      override public function getID() : *
      {
         return this.getType() + "_" + id;
      }
      
      override public function getType() : int
      {
         return CoolingType.BUFF;
      }
      
      override public function getCoolingtime() : int
      {
         if(this.currentCDTotal != -1)
         {
            return this.currentCDTotal;
         }
         return this.res.duration;
      }
      
      override public function getPublicCoolingtime() : int
      {
         return 0;
      }
      
      override public function getPublicCoolingtimeClass() : *
      {
         return 0;
      }
   }
}

