package com.tgame.common.res.activity
{
   import com.tgame.common.res.task.vo.TaskTargetData;
   import com.tgame.manager.ActivityManager;
   
   public class ActivityResManager
   {
      
      private static var activityResContainer:Object = new Object();
      
      public function ActivityResManager()
      {
         super();
      }
      
      public static function parseActivityRes(param1:String) : void
      {
         var _loc3_:ActivityRes = null;
         var _loc4_:XML = null;
         var _loc5_:Array = null;
         var _loc6_:Array = null;
         var _loc7_:String = null;
         var _loc8_:String = null;
         var _loc2_:XML = XML(param1);
         if(!_loc2_)
         {
            return;
         }
         for each(_loc4_ in _loc2_.activities.activity)
         {
            _loc3_ = new ActivityRes();
            _loc3_.id = int(Number(_loc4_.@id));
            _loc3_.name = _loc4_.@name;
            _loc3_.des = _loc4_.@des;
            _loc3_.fromTime = _loc4_.@fromTime;
            _loc3_.toTime = _loc4_.@toTime;
            _loc3_.beginNpc = int(Number(_loc4_.@beginNpc));
            _loc3_.minLevel = int(Number(_loc4_.@minLevel));
            _loc3_.minTeamPlayerNum = int(Number(_loc4_.@minTeamPlayerNum));
            _loc3_.prizeAttr = String(_loc4_.@prizeAttr).replace(/\r\n/g,"\n");
            _loc3_.prizeArr = [];
            if(_loc4_.@prizeArr != undefined && _loc4_.@prizeArr != null && _loc4_.@prizeArr != "" && _loc4_.@prizeArr != "null")
            {
               _loc8_ = _loc4_.@prizeArr.replace(/^,(.+)$/,"$1").replace(/^(.+),$/,"$1");
               _loc5_ = _loc8_.split(",");
               for each(_loc7_ in _loc5_)
               {
                  _loc6_ = _loc7_.split("#");
                  _loc3_.prizeArr.push(new TaskTargetData(int(Number(_loc6_[0])),int(Number(_loc6_[1]))));
               }
            }
            activityResContainer[_loc3_.id] = _loc3_;
         }
      }
      
      public static function getActivityRes(param1:int) : ActivityRes
      {
         return activityResContainer[param1];
      }
      
      public static function getActivityResList() : Array
      {
         var _loc2_:ActivityRes = null;
         var _loc1_:Array = [];
         for each(_loc2_ in activityResContainer)
         {
            _loc1_[_loc1_.length] = _loc2_;
         }
         return _loc1_;
      }
      
      public static function getAcceptableActivityResList() : Array
      {
         var _loc2_:ActivityRes = null;
         var _loc1_:Array = [];
         for each(_loc2_ in activityResContainer)
         {
            if(ActivityManager.checkAcceptableActivity(_loc2_.id)[0] == 1)
            {
               _loc1_[_loc1_.length] = _loc2_;
            }
         }
         return _loc1_;
      }
   }
}

