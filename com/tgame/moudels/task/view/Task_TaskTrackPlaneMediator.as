package com.tgame.moudels.task.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.TaskTracker;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.task.Task_ApplicationFacade;
   import com.tgame.shell.view.components.MainUI;
   import com.tgame.shell.view.components.task.TaskTrackPan;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Task_TaskTrackPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Task_TaskTrackPlaneMediator";
      
      private var _taskPanelMediator:Task_TaskPlaneMediator;
      
      public function Task_TaskTrackPlaneMediator()
      {
         super(NAME);
      }
      
      private function get taskPanelMediator() : Task_TaskPlaneMediator
      {
         if(this._taskPanelMediator == null)
         {
            this._taskPanelMediator = facade.retrieveMediator(Task_TaskPlaneMediator.NAME) as Task_TaskPlaneMediator;
         }
         return this._taskPanelMediator;
      }
      
      protected function get trackPlane() : TaskTrackPan
      {
         var _loc1_:TaskTrackPan = null;
         if(viewComponent == null)
         {
            _loc1_ = new TaskTrackPan();
            UIEventsRegisterManager.registerUI(_loc1_,TaskTrackPan);
            setViewComponent(_loc1_);
            this.mainUI.setTrack(_loc1_);
         }
         return viewComponent as TaskTrackPan;
      }
      
      protected function get mainUI() : MainUI
      {
         return GameInstance.uiInstance.mainUI;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [Task_ApplicationFacade.TASK_UPDATE_TASKTRACKER];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case Task_ApplicationFacade.TASK_UPDATE_TASKTRACKER:
               _loc3_ = _loc2_ as Array;
               if(GameState.taskTrackerPlaneTabStatus == 1)
               {
                  this.setTrackData(_loc3_[0],1);
               }
               else if(GameState.taskTrackerPlaneTabStatus == 2)
               {
                  this.setTrackData(_loc3_[1],2);
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MainUI,function():void
         {
            mainUI.addEventListener(Event.REMOVED_FROM_STAGE,taskPanelHandle);
            mainUI.addEventListener(MainUI.TASK_TRACK_ACCEPTEDLIST_CLICK,taskPanelHandle);
            mainUI.addEventListener(MainUI.TASK_TRACK_ACCEPTABLELIST_CLICK,taskPanelHandle);
            mainUI.addEventListener(MainUI.TASK_TRACK_CHENGJIU_CLICK,taskPanelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MainUI,function():void
         {
            mainUI.removeEventListener(Event.REMOVED_FROM_STAGE,taskPanelHandle);
            mainUI.removeEventListener(MainUI.TASK_TRACK_ACCEPTEDLIST_CLICK,taskPanelHandle);
            mainUI.removeEventListener(MainUI.TASK_TRACK_ACCEPTABLELIST_CLICK,taskPanelHandle);
            mainUI.removeEventListener(MainUI.TASK_TRACK_CHENGJIU_CLICK,taskPanelHandle);
         });
         UIEventsRegisterManager.addUIRegisterEvent(TaskTrackPan,function():void
         {
            trackPlane.addEventListener(TaskTrackPan.RESET_TASK,taskTrackPanelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TaskTrackPan,function():void
         {
            trackPlane.removeEventListener(TaskTrackPan.RESET_TASK,taskTrackPanelHandle);
         });
      }
      
      private function taskPanelHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.REMOVED_FROM_STAGE:
               GameState.taskTrackerPlaneTabStatus = 0;
               break;
            case MainUI.TASK_TRACK_ACCEPTEDLIST_CLICK:
               GameState.taskTrackerPlaneTabStatus = 1;
               TaskTracker.updateTaskUI(false,true,false,false);
               break;
            case MainUI.TASK_TRACK_ACCEPTABLELIST_CLICK:
               GameState.taskTrackerPlaneTabStatus = 2;
               TaskTracker.updateTaskUI(false,true,false,false);
               break;
            case MainUI.TASK_TRACK_CHENGJIU_CLICK:
               if(!Fun.isVisible(GameInstance.uiInstance._achievePanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_CHENGJIU_PANEL,[0,""]);
               }
         }
      }
      
      private function taskTrackPanelHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case TaskTrackPan.RESET_TASK:
               _loc3_ = param1 as BaseEvent;
               _loc4_ = _loc3_.data;
               if(!Fun.isVisible(GameInstance.uiInstance._taskPanel))
               {
                  PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_TASK_ATTRIBUTE_PLANE);
               }
               this.taskPanelMediator.showAcceptedTaskPanel();
               this.taskPanelMediator.showTaskByID(int(_loc4_));
         }
      }
      
      public function setTrackData(param1:Array, param2:int) : void
      {
         this.trackPlane.setData(param1,param2);
         this.mainUI.setTrack(this.trackPlane);
      }
   }
}

