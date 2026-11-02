package com.tgame.moudels.tunShiTianDi.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tunShiTianDi.model.TunShiTianDi_MsgSenderProxy;
   import com.tgame.moudels.tunShiTianDi.view.info.ShuXingJiaChen;
   import com.tgame.shell.view.components.tunshitiandi.TunShiTianDi_ZhenRongPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TunShiTianZhenRong_Mediator extends Mediator
   {
      
      public static const NAME:String = "TunShiTianZhenRong_Mediator";
      
      private var _senderProxy:TunShiTianDi_MsgSenderProxy;
      
      public function TunShiTianZhenRong_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function onRemove() : void
      {
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         var _loc3_:String = param1.getName();
         switch(0)
         {
         }
      }
      
      public function get panel() : TunShiTianDi_ZhenRongPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.tunShiTianDiXuanZhenRong);
         }
         return viewComponent as TunShiTianDi_ZhenRongPanel;
      }
      
      private function get senderProxy() : TunShiTianDi_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TunShiTianDi_MsgSenderProxy.NAME) as TunShiTianDi_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TunShiTianDi_ZhenRongPanel,function():void
         {
            panel.addEventListener(TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_XUANZE_CLICK,panelHandle);
            panel.addEventListener(TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_SHUXING_CLICK,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TunShiTianDi_ZhenRongPanel,function():void
         {
            panel.removeEventListener(TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_XUANZE_CLICK,panelHandle);
            panel.removeEventListener(TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_SHUXING_CLICK,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_XUANZE_CLICK:
               this.senderProxy.send_73973(_loc2_.data);
               break;
            case TunShiTianDi_ZhenRongPanel.SHOW_TUNSHITIANDI_SHUXING_CLICK:
               this.senderProxy.send_73975(_loc2_.data);
         }
      }
      
      public function setPanel(param1:Boolean, param2:Boolean, param3:int, param4:Array) : void
      {
         if(param1)
         {
            if(!Fun.isVisible(this.panel))
            {
               this.panel.x = GameConfig.sceneWidth / 2 - this.panel.width / 2;
               this.panel.y = GameConfig.sceneHeight / 2 - this.panel.height / 2;
               GameInstance.uiInstance.uiContainer.addChild(this.panel);
            }
            this.panel.setinitilizeUI(param2,param3,param4);
         }
         else if(Fun.isVisible(this.panel))
         {
            this.panel.parent.removeChild(this.panel);
         }
      }
      
      public function setAddValue(param1:ShuXingJiaChen) : void
      {
         this.panel.setAddValue(param1);
      }
   }
}

