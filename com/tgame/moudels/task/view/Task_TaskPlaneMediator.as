package com.tgame.moudels.task.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.common.res.activity.ActivityRes;
   import com.tgame.common.res.activity.ActivityResManager;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NewPlayerGuideStaticFun;
   import com.tgame.common.staticdata.NewPlayerGuideType;
   import com.tgame.common.staticdata.SettingKey;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.task.Task_ApplicationFacade;
   import com.tgame.moudels.task.model.Task_MsgSenderProxy;
   import com.tgame.moudels.task.model.Task_TaskProxy;
   import com.tgame.shell.view.components.CycTaskPanel;
   import com.tgame.shell.view.components.TaskPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Task_TaskPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Task_TaskPlaneMediator";
      
      private var _onlyShowAcceptableActivity:Boolean = true;
      
      private var _msgSenderProxy:Task_MsgSenderProxy;
      
      private var _taskProxy:Task_TaskProxy;
      
      public function Task_TaskPlaneMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Task_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Task_MsgSenderProxy.NAME) as Task_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function get taskProxy() : Task_TaskProxy
      {
         if(this._taskProxy == null)
         {
            this._taskProxy = facade.retrieveProxy(Task_TaskProxy.NAME) as Task_TaskProxy;
         }
         return this._taskProxy;
      }
      
      protected function get taskPanel() : TaskPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.taskPanel);
         }
         return viewComponent as TaskPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Task_ApplicationFacade.TASK_UPDATE_TASKLIST,Task_ApplicationFacade.DROP_TASK];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case Task_ApplicationFacade.TASK_UPDATE_TASKLIST:
               _loc3_ = _loc2_ as Array;
               if(GameState.taskPlaneTabStatus == 1)
               {
                  this.taskPanel.showAcceptedTask(_loc3_[0]);
                  this.taskPanel.setTaskCount(GameInstance.mainCharData.taskInfo.getTasksNum());
                  this.taskPanel.setIsShowTaskTrackPanel(GameState.taskTrackerPlaneTabStatus != 0);
               }
               else if(GameState.taskPlaneTabStatus == 2)
               {
                  this.taskPanel.showAcceptableTask(_loc3_[1]);
                  this.taskPanel.setTaskCount(GameInstance.mainCharData.taskInfo.getTasksNum());
                  this.taskPanel.setIsShowTaskTrackPanel(GameState.taskTrackerPlaneTabStatus != 0);
               }
               break;
            case Task_ApplicationFacade.DROP_TASK:
               _loc4_ = _loc2_ as int;
               this.msgSenderProxy.send_10265(_loc4_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TaskPanel,function():void
         {
            taskPanel.addEventListener(Event.REMOVED_FROM_STAGE,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_ACCEPTEDTASK_SHOW,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_ACCEPTABLETASK_SHOW,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_ACTIVE_SHOW,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_IS_SHOW_TASKTRACKPANEL,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_TASK_CANCEL,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_ACTIVE_MY_JOIN_ABLE_IS_SHOW,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.UI_TASKPANEL_TASK_LIST,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.RESET_TASK_NANDU,taskPanelHandle);
            taskPanel.addEventListener(TaskPanel.RESET_TASK_JIANGLI,taskPanelHandle);
            taskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK,taskPanelHandle);
            taskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK1,taskPanelHandle);
            taskPanel.addEventListener(FCloseEvent.CLOSE,taskPanelClose);
            taskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_MALLBTN_CLICK,taskPanelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TaskPanel,function():void
         {
            taskPanel.removeEventListener(Event.REMOVED_FROM_STAGE,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_ACCEPTEDTASK_SHOW,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_ACCEPTABLETASK_SHOW,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_ACTIVE_SHOW,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_IS_SHOW_TASKTRACKPANEL,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_TASK_CANCEL,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_ACTIVE_MY_JOIN_ABLE_IS_SHOW,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.UI_TASKPANEL_TASK_LIST,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.RESET_TASK_NANDU,taskPanelHandle);
            taskPanel.removeEventListener(TaskPanel.RESET_TASK_JIANGLI,taskPanelHandle);
            taskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK,taskPanelHandle);
            taskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK1,taskPanelHandle);
            taskPanel.removeEventListener(FCloseEvent.CLOSE,taskPanelClose);
            taskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_MALLBTN_CLICK,taskPanelHandle);
         });
      }
      
      private function taskPanelClose(param1:FCloseEvent) : void
      {
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide6);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide7);
         NewPlayerGuideStaticFun.closeNewPlayerGuide(NewPlayerGuideType.Guide8);
      }
      
      private function taskPanelHandle(param1:Event) : void
      {
         var evt:BaseEvent = null;
         var data:Object = null;
         var arr:Array = null;
         var isShow:Boolean = false;
         var id:int = 0;
         var r:Array = null;
         var e:Event = param1;
         var type:String = e.type;
         switch(type)
         {
            case Event.REMOVED_FROM_STAGE:
               GameState.taskPlaneTabStatus = 0;
               break;
            case TaskPanel.UI_TASKPANEL_ACCEPTEDTASK_SHOW:
               GameState.taskPlaneTabStatus = 1;
               TaskTracker.updateTaskUI(true,false,false,false);
               break;
            case TaskPanel.UI_TASKPANEL_ACCEPTABLETASK_SHOW:
               GameState.taskPlaneTabStatus = 2;
               NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide8);
               TaskTracker.updateTaskUI(true,false,false,false);
               break;
            case TaskPanel.UI_TASKPANEL_ACTIVE_SHOW:
               GameState.taskPlaneTabStatus = 3;
               this.showActivity(this._onlyShowAcceptableActivity);
               break;
            case TaskPanel.UI_TASKPANEL_IS_SHOW_TASKTRACKPANEL:
               evt = e as BaseEvent;
               data = evt.data;
               isShow = data as Boolean;
               PipeManager.sendMsg(PipeConstants.SETTING_DATA,[SettingKey.K4,!isShow]);
               break;
            case TaskPanel.UI_TASKPANEL_TASK_CANCEL:
               evt = e as BaseEvent;
               data = evt.data;
               this.msgSenderProxy.send_10265(data as int);
               break;
            case TaskPanel.UI_TASKPANEL_ACTIVE_MY_JOIN_ABLE_IS_SHOW:
               evt = e as BaseEvent;
               data = evt.data;
               this._onlyShowAcceptableActivity = data as Boolean;
               this.showActivity(this._onlyShowAcceptableActivity);
               break;
            case TaskPanel.UI_TASKPANEL_TASK_LIST:
               evt = e as BaseEvent;
               id = evt.data as int;
               r = TaskManager.checkHandInTask(id);
               if(r[0] == 0)
               {
                  NewPlayerGuideStaticFun.addAndShowOneNewPlayerGuide(NewPlayerGuideType.Guide6);
               }
               break;
            case TaskPanel.RESET_TASK_NANDU:
               evt = e as BaseEvent;
               id = evt.data as int;
               GameInstance.uiInstance.acceptCycTaskPanel.showDiminutionTip(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SSFEL_ID) > 0,function():void
               {
                  msgSenderProxy.send_20005(id);
               },GameInstance.uiInstance.taskPanel);
               break;
            case TaskPanel.RESET_TASK_JIANGLI:
               evt = e as BaseEvent;
               id = evt.data as int;
               GameInstance.uiInstance.acceptCycTaskPanel.showUpgradeTip(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SSFEL_ID) > 0,function():void
               {
                  msgSenderProxy.send_20007(id);
               },GameInstance.uiInstance.taskPanel);
               break;
            case CycTaskPanel.UI_CYCLETASK_MALLBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.SSFEL_ID,0]);
               break;
            case CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK:
               GameInstance.uiInstance.acceptCycTaskPanel.showOKTip(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SSFEL_ID,true) >= 5,GameInstance.uiInstance.taskPanel);
               break;
            case CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK1:
               evt = e as BaseEvent;
               id = evt.data as int;
               this.msgSenderProxy.send_10263([id,-1,0]);
         }
      }
      
      public function showActivity(param1:Boolean = false) : void
      {
         var _loc2_:Array = null;
         var _loc4_:String = null;
         var _loc5_:XML = null;
         var _loc6_:ActivityRes = null;
         if(param1)
         {
            _loc2_ = ActivityResManager.getAcceptableActivityResList();
         }
         else
         {
            _loc2_ = ActivityResManager.getActivityResList();
         }
         var _loc3_:XML = <node label="root"/>;
         if(_loc2_.length > 0)
         {
            _loc4_ = LanResManager.getLanTextWords(this,"最新活动",[_loc2_.length]);
            _loc5_ = <node label="" showLabel={_loc4_}/>;
            _loc3_.appendChild(_loc5_);
            for each(_loc6_ in _loc2_)
            {
               _loc4_ = _loc6_.name;
               _loc5_.appendChild(<node label={_loc6_.id} showLabel={_loc4_} state="1"/>);
            }
         }
         this.taskPanel.showActive(_loc3_);
         this.taskPanel.setIsShowMyJoinableActive(this._onlyShowAcceptableActivity);
      }
      
      public function showAcceptedTaskPanel() : void
      {
         this.taskPanel.showAcceptedTaskPanel();
      }
      
      public function showAcceptableTaskPanel() : void
      {
         this.taskPanel.showAcceptableTaskPanel();
      }
      
      public function showTaskByID(param1:int) : void
      {
         GameInstance.uiInstance.acceptCycTaskPanel.setTaskID(param1);
         this.taskPanel.showTaskByID(param1);
      }
   }
}

