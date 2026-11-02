package com.tgame.moudels.twitchGift.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.common.res.lan.LanResManager;
   import com.tgame.common.staticdata.NpcFunctionType;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.GiftCardPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CardNumGift_Mediator extends Mediator
   {
      
      public static const NAME:String = "CardNumGift_Mediator";
      
      private var _card:String;
      
      private var _sender:TwitchGift_MsgSendProxy;
      
      public function CardNumGift_Mediator()
      {
         super(NAME);
      }
      
      protected function get giftCardPanel() : GiftCardPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance._giftCardPanel);
         }
         return viewComponent as GiftCardPanel;
      }
      
      private function get sender() : TwitchGift_MsgSendProxy
      {
         if(this._sender == null)
         {
            this._sender = facade.retrieveProxy(TwitchGift_MsgSendProxy.NAME) as TwitchGift_MsgSendProxy;
         }
         return this._sender;
      }
      
      override public function onRegister() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(GiftCardPanel,function():void
         {
            giftCardPanel.addEventListener(GiftCardPanel.UI_GIFTCARD_GET,uiHandler);
            giftCardPanel.addEventListener(GiftCardPanel.UI_GIFTCARD_NO_CHECK,uiHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(GiftCardPanel,function():void
         {
            giftCardPanel.removeEventListener(GiftCardPanel.UI_GIFTCARD_GET,uiHandler);
            giftCardPanel.removeEventListener(GiftCardPanel.UI_GIFTCARD_NO_CHECK,uiHandler);
         });
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TwitchGift_ApplicationFacade.NPC_REQ_FUNCTION];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.NPC_REQ_FUNCTION:
               _loc3_ = _loc2_ as int;
               if(_loc3_ == NpcFunctionType.GIFT_CARD)
               {
                  if(!Fun.isVisible(this.giftCardPanel))
                  {
                     PipeManager.sendMsg(PipeConstants.SHOW_GIFT_CARD_PANEL);
                  }
               }
         }
      }
      
      private function uiHandler(param1:Event = null) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case GiftCardPanel.UI_GIFTCARD_GET:
               this.sender.send_53103(this._card);
               break;
            case GiftCardPanel.UI_GIFTCARD_NO_CHECK:
               this._card = _loc3_.data.toString();
               this.sender.send_53101(this._card);
         }
      }
      
      public function setGiftInfo(param1:Object) : void
      {
         var _loc2_:String = LanResManager.getLanTextWords(CardNumGift_Mediator,"兑换金钱信息",[param1.copper,param1.lijin,param1.yuanbao]);
         this.giftCardPanel.setItem(_loc2_,param1.goodsArr);
      }
      
      public function reset() : void
      {
         this._card = "";
         if(Fun.isVisible(this.giftCardPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_GIFT_CARD_PANEL);
         }
         this.giftCardPanel.reset();
         var _loc1_:String = LanResManager.getLanCommonTextWords("恭喜您兑换礼品成功");
         NoticeManager.notify(NoticeManager.FOOT,_loc1_);
         NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,_loc1_);
      }
   }
}

