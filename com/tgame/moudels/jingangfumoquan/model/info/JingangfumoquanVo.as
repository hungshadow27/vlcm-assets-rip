package com.tgame.moudels.jingangfumoquan.model.info
{
   import com.tgame.common.vo.item.Skill;
   
   public class JingangfumoquanVo
   {
      
      public var nowID:int;
      
      public var nowLookingID:int;
      
      public var nowLookingName:String = "";
      
      public var miaoshu:String;
      
      public var jbShuxingStr:String;
      
      public var tsShuxingStr:String;
      
      public var skill:Skill;
      
      public var isTeXiao:Boolean;
      
      public function JingangfumoquanVo()
      {
         super();
      }
   }
}

