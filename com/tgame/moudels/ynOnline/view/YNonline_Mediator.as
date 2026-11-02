package com.tgame.moudels.ynOnline.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynOnline.YNonline_ApplicationFacade;
   import com.tgame.moudels.ynOnline.model.YNonline_MsgSendProxy;
   import com.tgame.shell.view.components.YNOnLinePanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNonline_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNonline_Mediator";
      
      private var _senderProxy:YNonline_MsgSendProxy;
      
      public function YNonline_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNonline_ApplicationFacade.REQUEST_YUENANONLINE_PANEL];
      }
      
      private function get senderProxy() : YNonline_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNonline_MsgSendProxy.NAME) as YNonline_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNonline_ApplicationFacade.REQUEST_YUENANONLINE_PANEL:
               this.senderProxy.send_74271();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNOnLinePanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynonlinePanel);
         }
         return viewComponent as YNOnLinePanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNOnLinePanel,function():void
         {
            panel.addEventListener(YNOnLinePanel.UI_YNONLINE_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNOnLinePanel,function():void
         {
            panel.removeEventListener(YNOnLinePanel.UI_YNONLINE_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNOnLinePanel.UI_YNONLINE_CLICK:
               this.senderProxy.send_74273(param1.data);
         }
      }
      
      public function setData(param1:String, param2:int, param3:Array, param4:String) : void
      {
         if(!Fun.isVisible(this.panel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENANONLINEPANEL);
         }
         this.panel.setData(param1,param2,param3,param4);
      }
   }
}

