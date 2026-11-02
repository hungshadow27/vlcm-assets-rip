package com.tgame.moudels.shiJieBei.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shiJieBei.model.ShiJieBei_MsgSenderProxy;
   import com.tgame.moudels.shiJieBei.model.info.ShiJieBeiVO;
   import com.tgame.shell.view.components.shiJieBei.ShiJieBeiPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShiJieBei_Mediator extends Mediator
   {
      
      public static const NAME:String = "ShiJieBei_Mediator";
      
      private var _msgSenderProxy:ShiJieBei_MsgSenderProxy;
      
      public function ShiJieBei_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : ShiJieBei_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ShiJieBei_MsgSenderProxy.NAME) as ShiJieBei_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get panel() : ShiJieBeiPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.shiJieBeiPanel);
         }
         return viewComponent as ShiJieBeiPanel;
      }
      
      override public function listNotificationInterests() : Array
      {
         return [];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(ShiJieBeiPanel,function():void
         {
            panel.addEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHOW_GUANJUNJINGCAI,panelHandle);
            panel.addEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHOW_SHENGFUJINGCAI,panelHandle);
            panel.addEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_OK,panelHandle);
            panel.addEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_LINGQU,panelHandle);
            panel.addEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_XIAZHU_XIAZHU,panelHandle);
            panel.addEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_LINGJIANG,panelHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(ShiJieBeiPanel,function():void
         {
            panel.removeEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHOW_GUANJUNJINGCAI,panelHandle);
            panel.removeEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHOW_SHENGFUJINGCAI,panelHandle);
            panel.removeEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_OK,panelHandle);
            panel.removeEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_LINGQU,panelHandle);
            panel.removeEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_XIAZHU_XIAZHU,panelHandle);
            panel.removeEventListener(ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_LINGJIANG,panelHandle);
         });
      }
      
      private function panelHandle(param1:Event) : void
      {
         var _loc2_:String = param1.type;
         var _loc3_:Object = (param1 as BaseEvent).data;
         switch(_loc2_)
         {
            case ShiJieBeiPanel.UI_SHIJIEBEI_SHOW_GUANJUNJINGCAI:
               this.msgSenderProxy.send_73801();
               break;
            case ShiJieBeiPanel.UI_SHIJIEBEI_SHOW_SHENGFUJINGCAI:
               this.msgSenderProxy.send_73811();
               break;
            case ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_OK:
               this.msgSenderProxy.send_73813(_loc3_ as Array);
               break;
            case ShiJieBeiPanel.UI_SHIJIEBEI_SHENGFUJINGCAI_XIAZHU_LINGQU:
               this.msgSenderProxy.send_73815(_loc3_ as int);
               break;
            case ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_XIAZHU_XIAZHU:
               this.msgSenderProxy.send_73803(_loc3_ as Array);
               break;
            case ShiJieBeiPanel.UI_SHIJIEBEI_GUANJUNJINGCAI_LINGJIANG:
               this.msgSenderProxy.send_73805();
         }
      }
      
      public function setJiangCaiPanel(param1:Array) : void
      {
         this.panel.setJiangCaiPanel(param1);
      }
      
      public function setGuanJunPanel(param1:ShiJieBeiVO) : void
      {
         this.panel.setGuanJunPanel(param1);
      }
   }
}

