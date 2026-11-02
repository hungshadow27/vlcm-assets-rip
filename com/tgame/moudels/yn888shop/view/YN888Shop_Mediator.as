package com.tgame.moudels.yn888shop.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yn888shop.YN888Shop_ApplicationFacade;
   import com.tgame.moudels.yn888shop.model.YN888Shop_MsgSendProxy;
   import com.tgame.shell.view.components.yn888ShopPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YN888Shop_Mediator extends Mediator
   {
      
      public static const NAME:String = "YN888Shop_Mediator";
      
      private var _senderProxy:YN888Shop_MsgSendProxy;
      
      public function YN888Shop_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YN888Shop_ApplicationFacade.REFRESH_YUENAN888SHOP];
      }
      
      private function get senderProxy() : YN888Shop_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YN888Shop_MsgSendProxy.NAME) as YN888Shop_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YN888Shop_ApplicationFacade.REFRESH_YUENAN888SHOP:
               this.senderProxy.send_73851(_loc2_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : yn888ShopPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.yn888shopPanel);
         }
         return viewComponent as yn888ShopPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(yn888ShopPanel,function():void
         {
            panel.addEventListener(yn888ShopPanel.UI_REQUEST_YUENAN888SHOP,onHandle);
            panel.addEventListener(yn888ShopPanel.UI_YUENAN888SHOPGOODBUY,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(yn888ShopPanel,function():void
         {
            panel.removeEventListener(yn888ShopPanel.UI_REQUEST_YUENAN888SHOP,onHandle);
            panel.removeEventListener(yn888ShopPanel.UI_YUENAN888SHOPGOODBUY,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case yn888ShopPanel.UI_REQUEST_YUENAN888SHOP:
               this.senderProxy.send_73851(param1.data);
               break;
            case yn888ShopPanel.UI_YUENAN888SHOPGOODBUY:
               PipeManager.sendMsg(PipeConstants.REQUEST_MALL_GOODS_INFO,[param1.data,0]);
         }
      }
      
      public function setData(param1:int, param2:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.yn888shopPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENAN888SHOP);
         }
         this.panel.setData(param1,param2);
      }
   }
}

