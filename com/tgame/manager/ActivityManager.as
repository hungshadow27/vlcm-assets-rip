package com.tgame.manager
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.activity.ActivityRes;
   import com.tgame.common.res.activity.ActivityResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.vo.character.Player;
   
   public class ActivityManager
   {
      
      public function ActivityManager()
      {
         super();
      }
      
      public static function checkAcceptableActivity(param1:int) : Array
      {
         var _loc4_:Player = null;
         var _loc2_:Array = [1,""];
         var _loc3_:ActivityRes = ActivityResManager.getActivityRes(param1);
         if(_loc3_)
         {
            _loc4_ = GameInstance.mainCharData;
            if(_loc4_.attributeInfo.lv < _loc3_.minLevel)
            {
               return [0,LanResManager.getLanCommonTextWords("等级不够")];
            }
            if(_loc4_.teamInfo.teamCount < _loc3_.minTeamPlayerNum)
            {
               return [0,LanResManager.getLanCommonTextWords("组队人数不够")];
            }
         }
         else
         {
            _loc2_ = [0,LanResManager.getLanCommonTextWords("该活动不存在")];
         }
         return _loc2_;
      }
   }
}

