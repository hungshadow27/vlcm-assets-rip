package com.tgame.moudels.aojianfeisheng.view
{
   import com.tgame.PipeConstants;
   import com.tgame.common.GameInstance;
   import com.tgame.manager.PipeManager;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.aojianfeisheng.AoJianFeiSheng_ApplicationFacade;
   import com.tgame.moudels.aojianfeisheng.model.AoJianFeiSheng_MsgSendProxy;
   import com.tgame.shell.view.components.aojianfeisheng.AoJianFeiShengPanel;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class AoJianFeiSheng_Mediator extends Mediator
   {
      
      public static const NAME:String = "AoJianFeiSheng_Mediator";
      
      private var _senderProxy:AoJianFeiSheng_MsgSendProxy;
      
      public function AoJianFeiSheng_Mediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      override public function listNotificationInterests() : Array
      {
         return [AoJianFeiSheng_ApplicationFacade.GET_AOJIANFEISHENG_PANEL];
      }
      
      private function get senderProxy() : AoJianFeiSheng_MsgSendProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(AoJianFeiSheng_MsgSendProxy.NAME) as AoJianFeiSheng_MsgSendProxy;
         }
         return this._senderProxy;
      }
      
      override public function handleNotification(param1:INotification) : void
      {
         var _loc2_:Object = param1.getBody();
         switch(param1.getName())
         {
            case AoJianFeiSheng_ApplicationFacade.GET_AOJIANFEISHENG_PANEL:
               this.senderProxy.send_80981();
         }
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      public function get panel() : AoJianFeiShengPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.aojianfeishengPanel);
         }
         return viewComponent as AoJianFeiShengPanel;
      }
      
      public function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(AoJianFeiShengPanel,function():void
         {
            panel.addEventListener(AoJianFeiShengPanel.AOJIANFEISHENG_LINGQU_CLICK,onHandle);
         });
         UIEventsRegisterManager.addUIRemovedEvent(AoJianFeiShengPanel,function():void
         {
            panel.removeEventListener(AoJianFeiShengPanel.AOJIANFEISHENG_LINGQU_CLICK,onHandle);
         });
      }
      
      private function onHandle(param1:*) : void
      {
         switch(param1.type)
         {
            case AoJianFeiShengPanel.AOJIANFEISHENG_LINGQU_CLICK:
               this.senderProxy.send_80983(param1.data as int);
         }
      }
      
      public function setAoJianFeiShengData(param1:Array, param2:Array, param3:Object) : void
      {
         PipeManager.sendMsg(PipeConstants.SHOW_AOJIANFEISHENG_PANEL);
         this.panel.setAoJianFeiShengData(param1,param2,param3);
      }
   }
}

