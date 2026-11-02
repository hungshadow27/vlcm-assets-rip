package com.tgame.moudels.chiBang.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.NoticeManager;
   import com.tgame.manager.ReloginManager;
   import com.tgame.moudels.chiBang.ChiBang_ApplicationFacade;
   import com.tgame.moudels.chiBang.model.ChiBang_MsgSenderProxy;
   import com.tgame.shell.view.components.XinMo;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XinMo_mediator extends Mediator
   {
      
      public static const NAME:String = "XinMo_mediator";
      
      private var _msgSenderProxy:ChiBang_MsgSenderProxy;
      
      public function XinMo_mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      protected function get panel() : XinMo
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.xinMo);
         }
         return viewComponent as XinMo;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ChiBang_ApplicationFacade.SHOW_XINMO_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ChiBang_ApplicationFacade.SHOW_XINMO_PANEL:
               this.msgSenderProxy.send_61751();
         }
      }
      
      private function get msgSenderProxy() : ChiBang_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiBang_MsgSenderProxy.NAME) as ChiBang_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
      }
      
      private function panelHandle(param1:Event = null) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:String = param1.type;
         switch(0)
         {
         }
      }
      
      public function setInitialize(param1:Array, param2:int) : void
      {
         if(ReloginManager.isInKuafu)
         {
            NoticeManager.notify(NoticeManager.FOOT,"跨服服务器中，禁用此功能");
            NoticeManager.notify(NoticeManager.SYSTEM_RIGHT,"跨服服务器中，禁用此功能");
            return;
         }
         this.panel.x = (GameConfig.sceneWidth - 510) / 2;
         this.panel.y = (GameConfig.sceneHeight - 480) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.panel);
         this.panel.setInitialize(param1,param2);
      }
   }
}

