package com.tgame.moudels.feast.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.feast.model.Feast_MsgSenderProxy;
   import com.tgame.shell.view.components.MarriageGiveCashGiftPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FeastMarriageGiveCashGift_Mediator extends Mediator
   {
      
      public static const NAME:String = "FeastMarriageGiveCashGift_Mediator";
      
      public var _songHongbaoHunyanID:int = 0;
      
      private var _msgSenderProxy:Feast_MsgSenderProxy;
      
      public function FeastMarriageGiveCashGift_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Feast_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Feast_MsgSenderProxy.NAME) as Feast_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get marriageGiveCashGiftPanel() : MarriageGiveCashGiftPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.marriageGiveCashGiftPanel);
         }
         return viewComponent as MarriageGiveCashGiftPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(MarriageGiveCashGiftPanel,function():void
         {
            marriageGiveCashGiftPanel.addEventListener(MarriageGiveCashGiftPanel.UI_MARRIAGE_GIVE_CASH_GIFT_GIVE,initEventsListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MarriageGiveCashGiftPanel,function():void
         {
            marriageGiveCashGiftPanel.removeEventListener(MarriageGiveCashGiftPanel.UI_MARRIAGE_GIVE_CASH_GIFT_GIVE,initEventsListener);
         });
      }
      
      private function initEventsListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:int = 0;
         switch(param1.type)
         {
            case MarriageGiveCashGiftPanel.UI_MARRIAGE_GIVE_CASH_GIFT_GIVE:
               _loc2_ = param1 as BaseEvent;
               _loc3_ = _loc2_.data as int;
               if(_loc3_ > 900000000)
               {
                  _loc3_ = 900000000;
                  if(this._songHongbaoHunyanID > 0)
                  {
                     this.msgSenderProxy.send_52255([this._songHongbaoHunyanID,_loc3_]);
                     this.closePanelHandler();
                  }
               }
               else if(this._songHongbaoHunyanID > 0)
               {
                  this.msgSenderProxy.send_52255([this._songHongbaoHunyanID,_loc3_]);
                  this.closePanelHandler();
               }
         }
      }
      
      public function updateUI(param1:int, param2:String, param3:int, param4:int, param5:Number) : void
      {
         this.closePanelHandler();
         this._songHongbaoHunyanID = param1;
         this.marriageGiveCashGiftPanel.setName(param2);
         this.marriageGiveCashGiftPanel.setCash(param3);
         this.marriageGiveCashGiftPanel.setGiftCount(param5);
         if(param4 == 1)
         {
            this.marriageGiveCashGiftPanel.setAvatar(1);
         }
         else if(param4 == 2)
         {
            this.marriageGiveCashGiftPanel.setAvatar(2);
         }
         else
         {
            this.marriageGiveCashGiftPanel.setAvatar(3);
         }
         PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE);
      }
      
      private function closePanelHandler() : void
      {
         if(Fun.isVisible(GameInstance.uiInstance._marriageGiveCashGiftPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_GIVE_CASH_GIFT_PLANE);
         }
         if(Fun.isVisible(GameInstance.uiInstance._marriageDinePanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_MARRIAGE_DINE_PLANE);
         }
      }
   }
}

