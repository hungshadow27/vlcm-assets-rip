package com.tgame.moudels.task.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.task.model.Task_MsgSenderProxy;
   import com.tgame.moudels.task.model.Task_TaskProxy;
   import com.tgame.shell.view.components.CycTaskPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Task_AcceptCycTaskPlaneMediator extends Mediator
   {
      
      public static const NAME:String = "Task_AcceptCycTaskPlaneMediator";
      
      public var taskID:int = 0;
      
      private var _msgSenderProxy:Task_MsgSenderProxy;
      
      private var _taskProxy:Task_TaskProxy;
      
      public function Task_AcceptCycTaskPlaneMediator()
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
      
      protected function get acceptCycTaskPanel() : CycTaskPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.acceptCycTaskPanel);
         }
         return viewComponent as CycTaskPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc3_:Array = null;
         var _loc2_:Object = param1.getBody();
         var _loc4_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(CycTaskPanel,function():void
         {
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_DIMINUTIONBTN_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_DIMINUTION_OK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_UPGRADEBTN_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_UPGRADE_OK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_MALLBTN_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.addEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK,acceptCycTaskPanelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CycTaskPanel,function():void
         {
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_DIMINUTIONBTN_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_DIMINUTION_OK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_UPGRADEBTN_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_UPGRADE_OK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_MALLBTN_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK,acceptCycTaskPanelHandle);
            acceptCycTaskPanel.removeEventListener(CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK,acceptCycTaskPanelHandle);
         });
      }
      
      private function acceptCycTaskPanelHandle(param1:Event) : void
      {
         var _loc3_:BaseEvent = null;
         var _loc4_:Object = null;
         var _loc5_:Array = null;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case CycTaskPanel.UI_CYCLETASK_DIMINUTIONBTN_CLICK:
               this.acceptCycTaskPanel.showDiminutionTip(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SSFEL_ID) > 0);
               break;
            case CycTaskPanel.UI_CYCLETASK_DIMINUTION_OK:
               this.msgSenderProxy.send_20005(this.taskID);
               break;
            case CycTaskPanel.UI_CYCLETASK_UPGRADEBTN_CLICK:
               this.acceptCycTaskPanel.showUpgradeTip(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SSFEL_ID) > 0);
               break;
            case CycTaskPanel.UI_CYCLETASK_UPGRADE_OK:
               this.msgSenderProxy.send_20007(this.taskID);
               break;
            case CycTaskPanel.UI_CYCLETASK_MALLBTN_CLICK:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[SpecialGoodsID.SSFEL_ID,0]);
               break;
            case CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_CLICK:
               this.acceptCycTaskPanel.showOKTip(GameInstance.mainCharData.goodsInfo.getGoodsNumByID(SpecialGoodsID.SSFEL_ID,true) >= 5);
               break;
            case CycTaskPanel.UI_CYCLETASK_ZHIJIEWANCHENG_OKBTN_CLICK:
               this.msgSenderProxy.send_10263([this.taskID,-1,0]);
         }
      }
      
      public function showCycPlane(param1:int, param2:int) : void
      {
         this.taskID = param1;
         this.acceptCycTaskPanel.setTask(param1,param2);
         if(!Fun.isVisible(GameInstance.uiInstance._acceptCycTaskPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MAINCHAR_ACCEPT_CYC_TASK_ATTRIBUTE_PLANE);
         }
      }
   }
}

