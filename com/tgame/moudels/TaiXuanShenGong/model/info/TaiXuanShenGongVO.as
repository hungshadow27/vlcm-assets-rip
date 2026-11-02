package com.tgame.moudels.TaiXuanShenGong.model.info
{
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.item.Skill;
   
   public class TaiXuanShenGongVO
   {
      
      public var miaoshu:String;
      
      public var act:int;
      
      public var def:int;
      
      public var hp:int;
      
      public var mp:int;
      
      public var cp:int;
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var isKnow:Boolean = false;
      
      public var otherSkillNameArr:Array = [];
      
      public var jihuoJindu:int;
      
      public var addJihuoGongji:int;
      
      public var addJihuoFangyu:int;
      
      public var addJihuoShengming:int;
      
      public var dingJi:Boolean;
      
      public var isZuoQi:Boolean;
      
      public function TaiXuanShenGongVO()
      {
         super();
      }
      
      public function getSkillAddStr() : String
      {
         var _loc3_:Skill = null;
         if(!this.otherSkillNameArr)
         {
            return "";
         }
         var _loc1_:String = "";
         var _loc2_:int = 0;
         while(_loc2_ < this.otherSkillNameArr.length)
         {
            _loc3_ = this.otherSkillNameArr[_loc2_][0] as Skill;
            _loc1_ += _loc3_.res.name + "：+" + this.otherSkillNameArr[_loc2_][1] + LanResManager.getLanCommonTextWords("层") + ";";
            _loc2_++;
         }
         return _loc1_;
      }
   }
}

