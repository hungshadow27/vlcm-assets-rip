package com.tgame.moudels.task.model
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.res.task.TaskRes;
   import com.tgame.common.res.task.TaskResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.vo.character.info.TaskInfo;
   import com.tgame.common.vo.newPlayerGuide.NewPlayerGuideVO;
   import com.tgame.manager.TaskTracker;
   import com.tgame.shell.view.components.MainUI;
   import org.puremvc.as3.multicore.patterns.proxy.Proxy;
   
   public class Task_TaskProxy extends Proxy
   {
      
      public static const NAME:String = "Task_TaskProxy";
      
      private var _senderProxy:Task_MsgSenderProxy;
      
      public function Task_TaskProxy()
      {
         super(NAME);
      }
      
      protected function get taskInfo() : TaskInfo
      {
         return GameInstance.mainCharData.taskInfo;
      }
      
      private function get senderProxy() : Task_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Task_MsgSenderProxy.NAME) as Task_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      public function init(param1:Array, param2:Array) : void
      {
         var _loc3_:TaskRes = null;
         this.taskInfo.init(param1,param2);
         TaskTracker.updateTaskUI();
         if(param1.length > 0)
         {
            _loc3_ = TaskResManager.getTaskRes(param1[0].taskID);
            if(_loc3_.targetMonster.length > 0)
            {
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide11);
            }
            else if(_loc3_.targetGoods.length > 0)
            {
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide15);
            }
            else
            {
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide4);
            }
            if(_loc3_.name == LanResManager.getLanCommonTextWords("打开心扉"))
            {
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide21);
            }
         }
      }
      
      public function received_AcceptTask(param1:int, param2:int = 0) : void
      {
         this.taskInfo.addTask(param1,param2);
         this.taskInfo.removeEndTask(param1);
         TaskTracker.updateTaskUI();
         var _loc3_:TaskRes = TaskResManager.getTaskRes(param1);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide4);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide11);
         if(_loc3_.targetMonster.length > 0)
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide11);
         }
         else if(_loc3_.targetHorse.length > 0)
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide15);
         }
         else
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide4);
         }
         if(_loc3_.name == LanResManager.getLanCommonTextWords("打开心扉"))
         {
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide21);
         }
         var _loc4_:NewPlayerGuideVO = NewPlayerGuideStaticFun.getNewPlayerGuideVO(NewPlayerGuideType.Guide4);
         if(_loc4_.getIsComplete)
         {
            NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide5);
            NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide5);
         }
         NewPlayerGuideStaticFun.addImageInstanceGuide(MainUI.IMAGE_LEAD_TYPE_APPECTED_NEW_TASK,{
            "taskID":param1,
            "taskName":_loc3_.name
         });
      }
      
      public function received_HandInTask(param1:int, param2:int = 0) : void
      {
         this.taskInfo.addEndTask(param1,param2);
         this.taskInfo.removeTask(param1);
         TaskTracker.updateTaskUI();
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide4);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide11);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide15);
      }
      
      public function received_GaveUpTask(param1:int, param2:int = 0) : void
      {
         if(param2 > 0)
         {
            this.taskInfo.addEndTask(param1,param2);
         }
         this.taskInfo.removeTask(param1);
         TaskTracker.updateTaskUI();
      }
      
      public function removeTaskData(param1:int) : void
      {
         this.taskInfo.removeEndTask(param1);
         this.taskInfo.removeTask(param1);
         TaskTracker.updateTaskUI();
      }
   }
}

