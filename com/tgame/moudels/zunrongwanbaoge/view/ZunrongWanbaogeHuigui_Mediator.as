package com.tgame.moudels.zunrongwanbaoge.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameConfig;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.zunrongwanbaoge.ZunrongWanbaoge_ApplicationFacade;
   import com.tgame.moudels.zunrongwanbaoge.model.ZunrongWanbaoge_MsgSenderProxy;
   import com.tgame.shell.view.components.zunrongwanbaoge.WanbaogeRongyaoHuiguiPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZunrongWanbaogeHuigui_Mediator extends Mediator
   {
      
      public static const NAME:String = "ZunrongWanbaogeHuigui_Mediator";
      
      public function ZunrongWanbaogeHuigui_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      private function get wanbaogeHuiguiMsgSenderProxy() : ZunrongWanbaoge_MsgSenderProxy
      {
         return facade.retrieveProxy(ZunrongWanbaoge_MsgSenderProxy.NAME) as ZunrongWanbaoge_MsgSenderProxy;
      }
      
      protected function get wanbaogeHuiguiPanel() : WanbaogeRongyaoHuiguiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.zunrongWanbaogeHuiguiPanel);
         }
         return viewComponent as WanbaogeRongyaoHuiguiPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [ZunrongWanbaoge_ApplicationFacade.SHOW_WANBAOGEHUIGUI_PANEL];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case ZunrongWanbaoge_ApplicationFacade.SHOW_WANBAOGEHUIGUI_PANEL:
               this.wanbaogeHuiguiMsgSenderProxy.send_71821();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(WanbaogeRongyaoHuiguiPanel,function():void
         {
            wanbaogeHuiguiPanel.addEventListener(WanbaogeRongyaoHuiguiPanel.UI_WANGBAOGE_JIFENDUIHUAN_CLICK,onEventHandler);
            wanbaogeHuiguiPanel.addEventListener(WanbaogeRongyaoHuiguiPanel.UI_JINRUWANBAOGE_CLICK,onEventHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(WanbaogeRongyaoHuiguiPanel,function():void
         {
            wanbaogeHuiguiPanel.removeEventListener(WanbaogeRongyaoHuiguiPanel.UI_WANGBAOGE_JIFENDUIHUAN_CLICK,onEventHandler);
            wanbaogeHuiguiPanel.removeEventListener(WanbaogeRongyaoHuiguiPanel.UI_JINRUWANBAOGE_CLICK,onEventHandler);
         });
      }
      
      private function onEventHandler(param1:Event) : void
      {
         var _loc4_:int = 0;
         var _loc2_:String = param1.type;
         var _loc3_:BaseEvent = param1 as BaseEvent;
         switch(_loc2_)
         {
            case WanbaogeRongyaoHuiguiPanel.UI_WANGBAOGE_JIFENDUIHUAN_CLICK:
               PipeManager.sendMsg(PipeConstants.SHOW_XIANSHIDAJIANGDUIHUAN_TYPE,6);
               break;
            case WanbaogeRongyaoHuiguiPanel.UI_JINRUWANBAOGE_CLICK:
               this.wanbaogeHuiguiMsgSenderProxy.send_71823();
         }
      }
      
      public function showWanbaogeHuiguiPanel(param1:Boolean, param2:int) : void
      {
         this.wanbaogeHuiguiPanel.setBtn(param1);
         this.wanbaogeHuiguiPanel.setJifenNum(param2);
         this.wanbaogeHuiguiPanel.x = (GameConfig.sceneWidth - this.wanbaogeHuiguiPanel.width) / 2;
         this.wanbaogeHuiguiPanel.y = (GameConfig.sceneHeight - this.wanbaogeHuiguiPanel.height) / 2;
         GameInstance.uiInstance.uiContainer.addChild(this.wanbaogeHuiguiPanel);
      }
      
      public function removeWanbaogeHuiguiPanel() : void
      {
         if(Boolean(this.wanbaogeHuiguiPanel) && this.wanbaogeHuiguiPanel.parent != null)
         {
            this.wanbaogeHuiguiPanel.parent.removeChild(this.wanbaogeHuiguiPanel);
         }
      }
   }
}

