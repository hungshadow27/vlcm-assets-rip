package com.tgame.moudels.twitchGift.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.staticdata.SpecialGoodsID;
   import com.tgame.common.ui.componets.POPWindowManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.twitchGift.TwitchGift_ApplicationFacade;
   import com.tgame.moudels.twitchGift.model.TwitchGift_MsgSendProxy;
   import com.tgame.shell.view.components.YuanPanGiftPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YuanPanGift_Mediator extends Mediator
   {
      
      public static const NAME:String = "YuanPanGift_Mediator";
      
      public var goodsId:int;
      
      private var _msgSenderProxy:TwitchGift_MsgSendProxy;
      
      public function YuanPanGift_Mediator()
      {
         super(NAME);
      }
      
      protected function get panel() : YuanPanGiftPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yuanPanGiftPanel);
         }
         return viewComponent as YuanPanGiftPanel;
      }
      
      private function get msgSenderProxy() : TwitchGift_MsgSendProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(TwitchGift_MsgSendProxy.NAME) as TwitchGift_MsgSendProxy;
         }
         return this._msgSenderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TwitchGift_ApplicationFacade.SHOW_YUANPAN_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case TwitchGift_ApplicationFacade.SHOW_YUANPAN_PANEL:
               this.goodsId = _loc2_ as int;
               this.showPanel(this.goodsId);
         }
      }
      
      public function showPanel(param1:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            POPWindowManager.showWindow(this.panel);
         }
         if(param1 == SpecialGoodsID.XUANZHUANSHI)
         {
            this.panel.setType(0);
         }
         else if(param1 == SpecialGoodsID.XUANZHUANSHI2)
         {
            this.panel.setType(1);
         }
         else if(param1 == SpecialGoodsID.QUANXIN_XUANZHUANSHI2)
         {
            this.panel.setType(1);
         }
         else if(param1 == SpecialGoodsID.YNWANGZHEZHUANPAN)
         {
            this.panel.setType(0);
         }
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YuanPanGiftPanel,function():void
         {
            panel.addEventListener(YuanPanGiftPanel.ZHUANPAN_KAISHI_BTN_CLICK,handel);
            panel.addEventListener(YuanPanGiftPanel.ZHUANPAN_LINGJIANG_BTN_CLICK,handel);
            panel.addEventListener(YuanPanGiftPanel.ZHUANPAN_AGAIN_BTN_CLICK,handel);
            panel.addEventListener(FCloseEvent.CLOSE,closePanel);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YuanPanGiftPanel,function():void
         {
            panel.removeEventListener(YuanPanGiftPanel.ZHUANPAN_KAISHI_BTN_CLICK,handel);
            panel.removeEventListener(YuanPanGiftPanel.ZHUANPAN_LINGJIANG_BTN_CLICK,handel);
            panel.removeEventListener(YuanPanGiftPanel.ZHUANPAN_AGAIN_BTN_CLICK,handel);
            panel.removeEventListener(FCloseEvent.CLOSE,closePanel);
         });
      }
      
      private function handel(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case YuanPanGiftPanel.ZHUANPAN_KAISHI_BTN_CLICK:
               this.msgSenderProxy.send_60143([this.goodsId,0]);
               break;
            case YuanPanGiftPanel.ZHUANPAN_LINGJIANG_BTN_CLICK:
               this.msgSenderProxy.send_60145(this.goodsId);
               break;
            case YuanPanGiftPanel.ZHUANPAN_AGAIN_BTN_CLICK:
               this.msgSenderProxy.send_60143([this.goodsId,1]);
         }
      }
      
      public function setData(param1:int, param2:Array, param3:Boolean, param4:int, param5:int) : void
      {
         this.goodsId = param1;
         this.panel.setGoods(param2);
         this.panel.setTitle(param1,param2);
         this.panel.setData(param3,param4,param5);
      }
      
      public function setResult(param1:int, param2:int, param3:int) : void
      {
         this.goodsId = param1;
         this.panel.setTurn(param2);
      }
      
      public function getGoods(param1:int, param2:int) : void
      {
         POPWindowManager.closeWindow();
         this.panel.onTurnOver(param1);
      }
      
      public function closePanel(param1:FCloseEvent) : void
      {
         POPWindowManager.closeWindow();
      }
   }
}

