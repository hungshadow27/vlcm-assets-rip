package com.tgame.moudels.cisha.view
{
   import com.fireice.event.FCloseEvent;
   import com.tgame.common.GameInstance;
   import com.tgame.common.ui.componets.LoadBuffer;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cisha.CiSha_ApplicationFacade;
   import com.tgame.moudels.cisha.model.CiSha_MsgSenderProxy;
   import com.tgame.shell.view.components.cisha.FuChouOKPanel;
   import com.zcp.common.events.BaseEvent;
   import com.zcp.common.timer.vo.TimerData;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FuChouOKPanel_Mediator extends Mediator
   {
      
      public static const NAME:String = "FuChouOKPanel_Mediator";
      
      private var loaderBuff:LoadBuffer;
      
      private var _timerData:TimerData;
      
      private var _curMsgType:int;
      
      private var listSelectID:int = 0;
      
      private var nowPanel:String = "";
      
      private var goodId:int = 0;
      
      private var _msgSenderProxy:CiSha_MsgSenderProxy;
      
      public function FuChouOKPanel_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get fuChouOK_Panel() : FuChouOKPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.fuChouOKPanel);
         }
         return viewComponent as FuChouOKPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      override public function listNotificationInterests() : Array
      {
         return [CiSha_ApplicationFacade.SHOW_FUCHOU_OK_PANEL,CiSha_ApplicationFacade.CISHA_SHUOMING];
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case CiSha_ApplicationFacade.SHOW_FUCHOU_OK_PANEL:
               this.msgSenderProxy.send_57451(1);
               break;
            case CiSha_ApplicationFacade.CISHA_SHUOMING:
               this.fuChouOK_Panel.addCishaShuomingPanel(_loc2_ as int);
         }
      }
      
      private function get msgSenderProxy() : CiSha_MsgSenderProxy
      {
         if(this._msgSenderProxy == null)
         {
            this._msgSenderProxy = facade.retrieveProxy(CiSha_MsgSenderProxy.NAME) as CiSha_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(FuChouOKPanel,function():void
         {
            fuChouOK_Panel.addEventListener(Event.ADDED_TO_STAGE,fuChouOKHandle);
            fuChouOK_Panel.addEventListener(FuChouOKPanel.UI_FUCHOUOK_PANEL_LINGQU,fuChouOKHandle);
            fuChouOK_Panel.addEventListener(FuChouOKPanel.UI_FUCHOUOK_PANEL_REFRESH,fuChouOKHandle);
            fuChouOK_Panel.addEventListener(FCloseEvent.CLOSE,panelClose);
         });
         UIEventsRegisterManager.addUIRemovedEvent(FuChouOKPanel,function():void
         {
            fuChouOK_Panel.removeEventListener(Event.ADDED_TO_STAGE,fuChouOKHandle);
            fuChouOK_Panel.removeEventListener(FuChouOKPanel.UI_FUCHOUOK_PANEL_LINGQU,fuChouOKHandle);
            fuChouOK_Panel.removeEventListener(FuChouOKPanel.UI_FUCHOUOK_PANEL_REFRESH,fuChouOKHandle);
            fuChouOK_Panel.removeEventListener(FCloseEvent.CLOSE,panelClose);
         });
      }
      
      private function fuChouOKHandle(param1:*) : void
      {
         var _loc3_:int = 0;
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case FuChouOKPanel.UI_FUCHOUOK_PANEL_LINGQU:
               _loc3_ = int((param1 as BaseEvent).data);
               this.msgSenderProxy.send_57455(_loc3_);
               break;
            case FuChouOKPanel.UI_FUCHOUOK_PANEL_REFRESH:
               this.msgSenderProxy.send_57451(2);
         }
      }
      
      public function refreshPanel(param1:Array) : void
      {
         this.fuChouOK_Panel.initGoodsList(param1);
      }
      
      private function panelClose(param1:FCloseEvent = null) : void
      {
      }
   }
}

