package com.tgame.common.vo.character.info
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.TaskTracker;
   import com.zcp.common.timer.vo.TimerData;
   import com.zcp.manager.TimerManager;
   
   public class YabiaoInfo
   {
      
      public static const NONE:int = 0;
      
      public static const NONE_ACCEPTABLE:int = 1;
      
      public static const HAVE:int = 10;
      
      public static const HAVE_HANDIN:int = 11;
      
      public static const HAVE_TIMEOUT:int = 12;
      
      public static const HAVE_FAIL:int = 13;
      
      public static const SELF_ID:int = -1;
      
      public static const BANGHUI_ID:int = -2;
      
      public static const ACCEPT_NPC_ID:int = 1643;
      
      public var selfYabiaoStatus:int;
      
      public var banghuiYabiaoStatus:int;
      
      private var _leaveTime:Number;
      
      public var yabiaoNpc:int;
      
      private var _timerData:TimerData;
      
      public var updateTime_for_taskList:Function;
      
      public var updateTime_for_taskTracker:Function;
      
      public function YabiaoInfo()
      {
         super();
      }
      
      public function haveSelfYabiao() : Boolean
      {
         return GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE || GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_HANDIN || GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT || GameInstance.mainCharData.yabiaoInfo.selfYabiaoStatus == YabiaoInfo.HAVE_FAIL;
      }
      
      public function haveBanghuiYabiao() : Boolean
      {
         return GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_HANDIN || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_TIMEOUT || GameInstance.mainCharData.yabiaoInfo.banghuiYabiaoStatus == YabiaoInfo.HAVE_FAIL;
      }
      
      public function timeOut() : Boolean
      {
         return this._leaveTime == 0;
      }
      
      public function get leaveTime() : Number
      {
         return this._leaveTime;
      }
      
      public function set leaveTime(param1:Number) : void
      {
         this._leaveTime = param1;
         if(this._timerData)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
         }
         if(this._leaveTime > 0)
         {
            this._timerData = TimerManager.createExactTimer(this._leaveTime,this._leaveTime,0,this.timerHandler,null,1);
         }
      }
      
      private function timerHandler(param1:int) : void
      {
         this._leaveTime = param1;
         if(this._leaveTime < 0)
         {
            this._leaveTime = 0;
         }
         if(this.updateTime_for_taskList != null)
         {
            this.updateTime_for_taskList(this._leaveTime);
         }
         if(this.updateTime_for_taskTracker != null)
         {
            this.updateTime_for_taskTracker(this._leaveTime);
         }
         if(this._leaveTime == 0)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
            this.updateTime_for_taskList = null;
            this.updateTime_for_taskTracker = null;
            TaskTracker.updateTaskUI();
         }
      }
      
      public function destroy() : void
      {
         if(this._timerData)
         {
            TimerManager.deleteTimer(this._timerData);
            this._timerData = null;
         }
         this.updateTime_for_taskList = null;
         this.updateTime_for_taskTracker = null;
      }
   }
}

