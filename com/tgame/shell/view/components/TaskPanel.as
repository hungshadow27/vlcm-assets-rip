package com.tgame.shell.view.components
{
   import com.fireice.button.FButton;
   import com.fireice.checkBox.FCheckBox;
   import com.fireice.event.FCloseEvent;
   import com.fireice.panel.FPanel;
   import com.fireice.tabBar.FTabBar;
   import com.fireice.text.FLabel;
   import com.tgame.common.res.lan.*;
   import com.tgame.common.ui.componets.*;
   import com.tgame.shell.view.components.task.AcceptableTaskList;
   import com.zcp.common.events.BaseEvent;
   import flash.display.Bitmap;
   import flash.events.MouseEvent;
   
   public class TaskPanel extends FPanel
   {
      
      public static const UI_TASKPANEL_ACCEPTABLETASK_SHOW:String = "UI_TASKPANEL_ACCEPTABLETASK_SHOW";
      
      public static const UI_TASKPANEL_ACCEPTEDTASK_SHOW:String = "UI_TASKPANEL_ACCEPTEDTASK_SHOW";
      
      public static const UI_TASKPANEL_ACTIVE_SHOW:String = "UI_TASKPANEL_ACTIVE_SHOW";
      
      public static const UI_TASKPANEL_TASK_LIST:String = "UI_TASKPANEL_TASK_LIST";
      
      public static const UI_TASKPANEL_IS_SHOW_TASKTRACKPANEL:String = "UI_TASKPANEL_IS_SHOW_TASKTRACKPANEL";
      
      public static const UI_TASKPANEL_TASK_CANCEL:String = "UI_TASKPANEL_TASK_CANCEL";
      
      public static const UI_TASKPANEL_ACTIVE_MY_JOIN_ABLE_IS_SHOW:String = "UI_TASKPANEL_ACTIVE_MY_JOIN_ABLE_IS_SHOW";
      
      public static const RESET_TASK_NANDU:String = "RESET_TASK_NANDU";
      
      public static const RESET_TASK_JIANGLI:String = "RESET_TASK_JIANGLI";
      
      private var tabBar:FTabBar;
      
      public var acceptedTask:AcceptableTaskList;
      
      private var acceptableTask:AcceptableTaskList;
      
      private var active:AcceptableTaskList;
      
      private var checkBox:FCheckBox;
      
      private var checkLabel:FLabel;
      
      private var taskCount:FLabel;
      
      public function TaskPanel()
      {
         var v:Vector.<Bitmap>;
         super();
         skin = "panel_btn";
         dragAble = true;
         this.showCloseButton = true;
         width = 506;
         height = 351;
         this.titleText = LanResManager.getLanCommonTextWords("任务列表");
         addEventListener(FCloseEvent.CLOSE,this.onClose);
         this.acceptedTask = new AcceptableTaskList();
         this.acceptedTask.type = AcceptableTaskList.UI_TASK_TASK_ACCEPTED;
         this.acceptedTask.$parent = this;
         addChild(this.acceptedTask);
         this.acceptedTask.visible = false;
         this.acceptedTask.x = 10;
         this.acceptedTask.y = 22;
         this.acceptableTask = new AcceptableTaskList();
         this.acceptableTask.$parent = this;
         this.acceptableTask.type = AcceptableTaskList.UI_TASK_TASK_ACCEPTABLE;
         addChild(this.acceptableTask);
         this.acceptableTask.visible = false;
         this.acceptableTask.x = 10;
         this.acceptableTask.y = 22;
         this.acceptableTask.visible = false;
         this.active = new AcceptableTaskList();
         this.active.$parent = this;
         this.active.type = AcceptableTaskList.UI_TASK_ACTIVE;
         addChild(this.active);
         this.active.visible = false;
         this.active.x = 10;
         this.active.y = 22;
         this.active.visible = false;
         v = new Vector.<Bitmap>();
         v.push(this.acceptedTask.bgImg);
         v.push(this.acceptableTask.bgImg);
         v.push(this.active.bgImg);
         this.DynamicManageImages = v;
         this.tabBar = new FTabBar();
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("已接任务"),this.onTabClick);
         this.tabBar.addButton(LanResManager.getLanCommonTextWords("可接任务"),this.onTabClick);
         addChildAt(this.tabBar,0);
         this.tabBar.x = 10;
         this.tabBar.y = 2;
         this.checkBox = new FCheckBox();
         addChild(this.checkBox);
         this.checkBox.x = 7;
         this.checkBox.y = 287;
         this.checkBox.selectState = true;
         this.checkBox.addEventListener(MouseEvent.CLICK,this.onCheck);
         this.checkLabel = new FLabel();
         with(this.checkLabel)
         {
            x = 29;
            y = 287;
            textColor = StaticValue.ORANGE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("在主操作界面同时显示任务追踪界面");
         }
         addChild(this.checkLabel);
         this.taskCount = new FLabel();
         with(this.taskCount)
         {
            x = 232;
            y = 287;
            textColor = StaticValue.WHITE;
            filters = StaticValue.filter;
            text = LanResManager.getLanCommonTextWords("任务数量") + "  5/30";
         }
         addChild(this.taskCount);
      }
      
      private function onTabClick(param1:MouseEvent) : void
      {
         switch((param1.target as FButton).label)
         {
            case LanResManager.getLanCommonTextWords("已接任务"):
               dispatchEvent(new BaseEvent(UI_TASKPANEL_ACCEPTEDTASK_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("可接任务"):
               dispatchEvent(new BaseEvent(UI_TASKPANEL_ACCEPTABLETASK_SHOW));
               break;
            case LanResManager.getLanCommonTextWords("活动列表"):
               dispatchEvent(new BaseEvent(UI_TASKPANEL_ACTIVE_SHOW));
         }
      }
      
      private function onCheck(param1:MouseEvent) : void
      {
         switch(this.tabBar.currentLabel)
         {
            case LanResManager.getLanCommonTextWords("可接任务"):
            case LanResManager.getLanCommonTextWords("已接任务"):
               dispatchEvent(new BaseEvent(UI_TASKPANEL_IS_SHOW_TASKTRACKPANEL,"",this.checkBox.selectState));
               break;
            case LanResManager.getLanCommonTextWords("活动列表"):
               dispatchEvent(new BaseEvent(UI_TASKPANEL_ACTIVE_MY_JOIN_ABLE_IS_SHOW,"",this.checkBox.selectState));
         }
      }
      
      private function onClose(param1:FCloseEvent) : void
      {
         if(parent != null)
         {
            parent.removeChild(this);
         }
      }
      
      public function showAcceptedTask(param1:XML) : void
      {
         this.acceptedTask.visible = true;
         this.acceptableTask.visible = false;
         this.active.visible = false;
         this.acceptedTask.dataProvider = param1;
         this.checkLabel.text = LanResManager.getLanCommonTextWords("在主操作界面同时显示任务追踪界面");
         this.taskCount.visible = true;
      }
      
      public function setIsShowTaskTrackPanel(param1:Boolean) : void
      {
         this.checkBox.selectState = param1;
      }
      
      public function setTaskCount(param1:int) : void
      {
         this.taskCount.text = LanResManager.getLanCommonTextWords("任务数量") + "  " + param1 + "/30";
      }
      
      public function showAcceptableTask(param1:XML) : void
      {
         this.acceptedTask.visible = false;
         this.acceptableTask.visible = true;
         this.active.visible = false;
         this.acceptableTask.dataProvider = param1;
         this.checkLabel.text = LanResManager.getLanCommonTextWords("在主操作界面同时显示任务追踪界面");
         this.taskCount.visible = true;
      }
      
      public function showActive(param1:XML) : void
      {
         this.acceptedTask.visible = false;
         this.acceptableTask.visible = false;
         this.active.visible = true;
         this.active.dataProvider = param1;
         this.checkLabel.text = LanResManager.getLanCommonTextWords("只显示我可以参与的活动");
         this.taskCount.visible = false;
      }
      
      public function setIsShowMyJoinableActive(param1:Boolean) : void
      {
         this.checkBox.selectState = param1;
      }
      
      public function showAcceptedTaskPanel() : void
      {
         if(this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("已接任务"))
         {
            return;
         }
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("已接任务"));
         dispatchEvent(new BaseEvent(UI_TASKPANEL_ACCEPTEDTASK_SHOW));
      }
      
      public function showAcceptableTaskPanel() : void
      {
         if(this.tabBar.currentLabel == LanResManager.getLanCommonTextWords("可接任务"))
         {
            return;
         }
         this.tabBar.setCurrentButtonByLabel(LanResManager.getLanCommonTextWords("可接任务"));
         dispatchEvent(new BaseEvent(UI_TASKPANEL_ACCEPTABLETASK_SHOW));
      }
      
      public function showTaskByID(param1:int) : void
      {
         this.acceptedTask.showTaskByID(param1.toString());
      }
   }
}

