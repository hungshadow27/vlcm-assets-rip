package com.tgame.moudels.refreshPoint.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.vo.item.Goods;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.refreshPoint.model.RefreshPoint_MsgSendProxy;
   import com.tgame.shell.view.components.RefreshPointPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class RefreshPoint_RefreshPointMediator extends Mediator
   {
      
      public static const NAME:String = "RefreshPoint_RefreshPointMediator";
      
      private var pointData:Array;
      
      private var tempActPoint:int;
      
      private var tempDefPoint:int;
      
      private var tempFlyPoint:int;
      
      private var tempStoPoint:int;
      
      private var _msgSenderProxy:RefreshPoint_MsgSendProxy;
      
      public function RefreshPoint_RefreshPointMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get refreshPointPanel() : RefreshPointPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.refreshPointPanel);
         }
         return viewComponent as RefreshPointPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(RefreshPointPanel,function():void
         {
            refreshPointPanel.addEventListener(Event.ADDED_TO_STAGE,handle);
            refreshPointPanel.addEventListener(RefreshPointPanel.UI_REFRESHPOINTPANEL_OK,handle);
            refreshPointPanel.addEventListener(RefreshPointPanel.UI_REFRESHPOINTPANEL_SART,handle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(RefreshPointPanel,function():void
         {
            refreshPointPanel.removeEventListener(Event.ADDED_TO_STAGE,handle);
            refreshPointPanel.removeEventListener(RefreshPointPanel.UI_REFRESHPOINTPANEL_OK,handle);
            refreshPointPanel.removeEventListener(RefreshPointPanel.UI_REFRESHPOINTPANEL_SART,handle);
         });
      }
      
      private function handle(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Goods = null;
         var _loc4_:int = 0;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               if(this.tempActPoint != GameInstance.mainCharData.attributeInfo.points_attack || this.tempDefPoint != GameInstance.mainCharData.attributeInfo.points_defence || this.tempFlyPoint != GameInstance.mainCharData.attributeInfo.points_fly || this.tempStoPoint != GameInstance.mainCharData.attributeInfo.points_stong)
               {
                  this.refreshPointPanel.setPoint(GameInstance.mainCharData.attributeInfo.points_attack,GameInstance.mainCharData.attributeInfo.points_defence,GameInstance.mainCharData.attributeInfo.points_fly,GameInstance.mainCharData.attributeInfo.points_stong);
                  this.tempActPoint = GameInstance.mainCharData.attributeInfo.points_attack;
                  this.tempDefPoint = GameInstance.mainCharData.attributeInfo.points_defence;
                  this.tempFlyPoint = GameInstance.mainCharData.attributeInfo.points_fly;
                  this.tempStoPoint = GameInstance.mainCharData.attributeInfo.points_stong;
               }
               break;
            case RefreshPointPanel.UI_REFRESHPOINTPANEL_OK:
               this.msgSenderProxy.send_49991(this.pointData);
               PipeManager.sendMsg(PipeConstants.SHOW_REFRESHPOINT_PLANE);
               break;
            case RefreshPointPanel.UI_REFRESHPOINTPANEL_SART:
               _loc2_ = param1 as BaseEvent;
               this.pointData = _loc2_.data as Array;
               if(GameInstance.mainCharData.attributeInfo.lv <= 30)
               {
                  this.msgSenderProxy.send_49991(this.pointData);
                  PipeManager.sendMsg(PipeConstants.SHOW_REFRESHPOINT_PLANE);
               }
               else
               {
                  _loc3_ = GameInstance.mainCharData.goodsInfo.getFaceGoodsByID(SpecialGoodsID.XISUIDAN_ID,true);
                  _loc4_ = this.pointData[0] + this.pointData[1] + this.pointData[2] + this.pointData[3];
                  this.refreshPointPanel.showValidateWindow(this.pointData[0],this.pointData[1],this.pointData[2],this.pointData[3],_loc4_,_loc4_);
               }
         }
      }
      
      private function get msgSenderProxy() : RefreshPoint_MsgSendProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(RefreshPoint_MsgSendProxy.NAME) as RefreshPoint_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
   }
}

