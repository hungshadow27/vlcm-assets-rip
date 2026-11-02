package com.tgame.moudels.tulongdao.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tulongdao.TuLongDao_ApplicationFacade;
   import com.tgame.moudels.tulongdao.model.TuLongDao_MsgSenderProxy;
   import com.tgame.shell.view.components.TuLongFuBenPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TuLongDaoFuBen_Mediator extends Mediator
   {
      
      public static const NAME:String = "TuLongDaoFuBen_Mediator";
      
      private var _senderProxy:TuLongDao_MsgSenderProxy;
      
      public function TuLongDaoFuBen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TuLongDao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TuLongDao_MsgSenderProxy.NAME) as TuLongDao_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : TuLongFuBenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tuLongFuBenPanel);
         }
         return viewComponent as TuLongFuBenPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [TuLongDao_ApplicationFacade.SEND_XIANJING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = null;
         var _loc3_:Array = null;
         var _loc4_:int = 0;
         _loc2_ = param1.getBody();
         switch(param1.getName())
         {
            case TuLongDao_ApplicationFacade.SEND_XIANJING:
               _loc3_ = (_loc2_ as String).split(",");
               _loc4_ = 0;
               while(_loc4_ < _loc3_.length)
               {
                  this.senderProxy.send_71053(parseInt(_loc3_[_loc4_]));
                  _loc4_++;
               }
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TuLongFuBenPanel,function():void
         {
         });
         UIEventsRegisterManager.addUIRemovedEvent(TuLongFuBenPanel,function():void
         {
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         var _loc3_:String = param1.type;
         switch(0)
         {
         }
      }
      
      public function showPanel(param1:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
            this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
            this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
         }
         this.panel.setText(param1);
      }
      
      public function closePanel() : void
      {
         if(this.panel.parent != null)
         {
            this.panel.parent.removeChild(this.panel);
         }
      }
   }
}

