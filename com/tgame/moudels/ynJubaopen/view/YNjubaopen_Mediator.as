package com.tgame.moudels.ynJubaopen.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.ynJubaopen.YNjubaopen_ApplicationFacade;
   import com.tgame.moudels.ynJubaopen.model.YNjubaopen_MsgSendProxy;
   import com.tgame.shell.view.components.YNjubaopenPanel;
   import com.zcp.common.utils.Fun;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YNjubaopen_Mediator extends Mediator
   {
      
      public static const NAME:String = "YNjubaopen_Mediator";
      
      private var _senderProxy:YNjubaopen_MsgSendProxy;
      
      public function YNjubaopen_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [YNjubaopen_ApplicationFacade.REQUEST_YUENANJUBAOPEN_PANEL];
      }
      
      private function get senderProxy() : YNjubaopen_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YNjubaopen_MsgSendProxy.NAME) as YNjubaopen_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case YNjubaopen_ApplicationFacade.REQUEST_YUENANJUBAOPEN_PANEL:
               this.senderProxy.send_73601(_loc2_);
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : YNjubaopenPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ynjubaopenPanel);
         }
         return viewComponent as YNjubaopenPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(YNjubaopenPanel,function():void
         {
            panel.addEventListener(YNjubaopenPanel.UI_INPUTYUANBAO_CLICK,onHandle);
            panel.addEventListener(YNjubaopenPanel.UI_GETJINPIAO_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(YNjubaopenPanel,function():void
         {
            panel.removeEventListener(YNjubaopenPanel.UI_INPUTYUANBAO_CLICK,onHandle);
            panel.removeEventListener(YNjubaopenPanel.UI_GETJINPIAO_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case YNjubaopenPanel.UI_INPUTYUANBAO_CLICK:
               this.senderProxy.send_73605(param1.data);
               break;
            case YNjubaopenPanel.UI_GETJINPIAO_CLICK:
               this.senderProxy.send_73607(param1.data);
         }
      }
      
      public function setPanelData(param1:int, param2:String, param3:String, param4:int, param5:Array) : void
      {
         if(!Fun.isVisible(GameInstance.uiInstance.ynjubaopenPanel))
         {
            PipeManager.sendMsg(PipeConstants.SHOW_YUENANJUBAOPEN_PANEL);
         }
         this.panel.setData(param1,param2,param3,param4,param5);
         this.panel.setType(param1);
      }
   }
}

