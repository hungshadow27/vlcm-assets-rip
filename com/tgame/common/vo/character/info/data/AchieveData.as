package com.tgame.common.vo.character.info.data
{
   import com.tgame.common.res.achieve.AchieveRes;
   import com.tgame.common.res.achieve.AchieveResManager;
   
   public class AchieveData
   {
      
      public var id:int = 0;
      
      public var progress:Number = 0;
      
      public function AchieveData()
      {
         super();
      }
      
      public function get achieveRes() : AchieveRes
      {
         return AchieveResManager.getAchieveRes(this.id);
      }
   }
}

