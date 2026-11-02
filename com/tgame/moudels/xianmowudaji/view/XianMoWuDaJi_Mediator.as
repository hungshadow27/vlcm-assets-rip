package com.tgame.moudels.xianmowudaji.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xianmowudaji.XianMoWuDaJi_ApplicationFacade;
   import com.tgame.moudels.xianmowudaji.model.XianMoWuDaJi_MsgSendProxy;
   import com.tgame.shell.view.components.xianmozhilu.XianMoWuDaJiPanel;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XianMoWuDaJi_Mediator extends Mediator
   {
      
      public static const NAME:String = "XianMoWuDaJi_Mediator";
      
      private var _senderProxy:XianMoWuDaJi_MsgSendProxy;
      
      public function XianMoWuDaJi_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [XianMoWuDaJi_ApplicationFacade.GET_XIANMOWUDAJI];
      }
      
      private function get senderProxy() : XianMoWuDaJi_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XianMoWuDaJi_MsgSendProxy.NAME) as XianMoWuDaJi_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case XianMoWuDaJi_ApplicationFacade.GET_XIANMOWUDAJI:
               this.senderProxy.send_80951();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : XianMoWuDaJiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xianmowudajiPanel);
         }
         return viewComponent as XianMoWuDaJiPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(XianMoWuDaJiPanel,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIULIAN,onHandle);
            panel.addEventListener(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIDIAN,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(XianMoWuDaJiPanel,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIULIAN,onHandle);
            panel.removeEventListener(XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIDIAN,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIULIAN:
               this.senderProxy.send_80953(param1.data as int);
               break;
            case XianMoWuDaJiPanel.UI_XIANMOWUDAJI_XIDIAN:
               this.senderProxy.send_80955(param1.data as int);
         }
      }
      
      public function setPanel(param1:Array, param2:Array, param3:int, param4:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - 588) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setPanel(param1,param2,param3,param4);
      }
   }
}

