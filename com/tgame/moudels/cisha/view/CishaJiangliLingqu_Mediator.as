package com.tgame.moudels.cisha.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.cisha.model.CiSha_MsgSenderProxy;
   import com.tgame.shell.view.components.cisha.CishaJiangliPanel;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class CishaJiangliLingqu_Mediator extends Mediator
   {
      
      public static const NAME:String = "CishaJiangliLingqu_Mediator";
      
      private var _msgSenderProxy:CiSha_MsgSenderProxy;
      
      public function CishaJiangliLingqu_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME,param2);
      }
      
      protected function get ciShaOK_Panel() : CishaJiangliPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.ciShaJiangliPanel);
         }
         return viewComponent as CishaJiangliPanel;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
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
         UIEventsRegisterManager.addUIRegisterEvent(CishaJiangliPanel,function():void
         {
            ciShaOK_Panel.addEventListener(Event.ADDED_TO_STAGE,ciShaOKHandle);
            ciShaOK_Panel.addEventListener(CishaJiangliPanel.UI_CISHAOK_PANEL_LINGQU,ciShaOKHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(CishaJiangliPanel,function():void
         {
            ciShaOK_Panel.removeEventListener(Event.ADDED_TO_STAGE,ciShaOKHandle);
            ciShaOK_Panel.removeEventListener(CishaJiangliPanel.UI_CISHAOK_PANEL_LINGQU,ciShaOKHandle);
         });
      }
      
      private function ciShaOKHandle(param1:*) : void
      {
         var _loc2_:String = param1.type;
         switch(_loc2_)
         {
            case Event.ADDED_TO_STAGE:
               this.msgSenderProxy.send_57451(0);
               break;
            case CishaJiangliPanel.UI_CISHAOK_PANEL_LINGQU:
               this.msgSenderProxy.send_57453();
         }
      }
      
      public function setNum(param1:*) : void
      {
         this.ciShaOK_Panel.setJiangliNum(param1);
      }
   }
}

