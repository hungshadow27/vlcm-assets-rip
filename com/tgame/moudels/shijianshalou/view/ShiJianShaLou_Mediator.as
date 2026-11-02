package com.tgame.moudels.shijianshalou.view
{
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shijianshalou.ShiJianShalou_ApplicationFacade;
   import com.tgame.moudels.shijianshalou.model.ShiJianShaLou_MsgSendProxy;
   import com.tgame.shell.view.components.ShiJianShaLou;
   import com.zcp.common.utils.Fun;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiJianShaLou_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShiJianShaLou_Mediator";
      
      public var isJDreturn:Boolean = false;
      
      private var _senderProxy:ShiJianShaLou_MsgSendProxy;
      
      public function ShiJianShaLou_Mediator()
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ShiJianShalou_ApplicationFacade.SHOW_SHIJIANSHALOU_PANEL,ShiJianShalou_ApplicationFacade.GET_SHIJIANSHALOU_PANEL];
      }
      
      private function get senderProxy() : ShiJianShaLou_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ShiJianShaLou_MsgSendProxy.NAME) as ShiJianShaLou_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         switch(param1.getName())
         {
            case ShiJianShalou_ApplicationFacade.SHOW_SHIJIANSHALOU_PANEL:
               this.senderProxy.send_82211();
               break;
            case ShiJianShalou_ApplicationFacade.GET_SHIJIANSHALOU_PANEL:
               this.senderProxy.send_82213();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : ShiJianShaLou
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shijianshalouPanel);
         }
         return viewComponent as ShiJianShaLou;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShiJianShaLou,function():void
         {
            panel.addEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.addEventListener(ShiJianShaLou.UI_SHIJIANSHALOU,onHandle);
            panel.addEventListener(ShiJianShaLou.UI_SHIJIANSHALOU_LINGQU_CLICK,onHandle);
            panel.addEventListener(ShiJianShaLou.UI_SHIJIANSHALOU_SHENGJI_CLICK,onHandle);
            panel.addEventListener(ShiJianShaLou.UI_SHIJIANSHALOU_YANGCHENG_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShiJianShaLou,function():void
         {
            panel.removeEventListener(Event.REMOVED_FROM_STAGE,onHandle);
            panel.removeEventListener(ShiJianShaLou.UI_SHIJIANSHALOU,onHandle);
            panel.removeEventListener(ShiJianShaLou.UI_SHIJIANSHALOU_LINGQU_CLICK,onHandle);
            panel.removeEventListener(ShiJianShaLou.UI_SHIJIANSHALOU_SHENGJI_CLICK,onHandle);
            panel.removeEventListener(ShiJianShaLou.UI_SHIJIANSHALOU_YANGCHENG_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case Event.REMOVED_FROM_STAGE:
               break;
            case ShiJianShaLou.UI_SHIJIANSHALOU_LINGQU_CLICK:
               this.senderProxy.send_81127();
               break;
            case ShiJianShaLou.UI_SHIJIANSHALOU_SHENGJI_CLICK:
               this.senderProxy.send_81125();
               break;
            case ShiJianShaLou.UI_SHIJIANSHALOU_YANGCHENG_CLICK:
               this.senderProxy.send_81133(param1.data as int);
         }
      }
      
      public function setPanel(param1:int, param2:int, param3:String, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int, param10:int, param11:Boolean, param12:int) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            this.panel.x = (GameConfig.sceneWidth - this.panel.width) / 2;
            this.panel.y = (GameConfig.sceneHeight - this.panel.height) / 2;
            GameInstance.uiInstance.uiContainer.addChild(this.panel);
         }
         this.panel.setPanel(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11,param12);
      }
   }
}

