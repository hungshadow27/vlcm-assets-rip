package com.tgame.moudels.feast.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.feast.model.Feast_MsgSenderProxy;
   import com.tgame.shell.view.components.MarriageWeddingPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FeastMarriageWedding_Mediator extends Mediator
   {
      
      public static const NAME:String = "FeastMarriageWedding_Mediator";
      
      private var _msgSenderProxy:Feast_MsgSenderProxy;
      
      public function FeastMarriageWedding_Mediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Feast_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Feast_MsgSenderProxy.NAME) as Feast_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get marriageWeddingPanel() : MarriageWeddingPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.marriageWeddingPanel);
         }
         return viewComponent as MarriageWeddingPanel;
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
         UIEventsRegisterManager.addUIRegisterEvent(MarriageWeddingPanel,function():void
         {
            marriageWeddingPanel.addEventListener(MarriageWeddingPanel.UI_MARRIAGE_WEDDING_APPLY,initEventsListener);
         });
         UIEventsRegisterManager.addUIRemovedEvent(MarriageWeddingPanel,function():void
         {
            marriageWeddingPanel.removeEventListener(MarriageWeddingPanel.UI_MARRIAGE_WEDDING_APPLY,initEventsListener);
         });
      }
      
      private function initEventsListener(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         switch(param1.type)
         {
            case MarriageWeddingPanel.UI_MARRIAGE_WEDDING_APPLY:
               _loc2_ = param1 as BaseEvent;
               this.msgSenderProxy.send_52249(_loc2_.data as int);
         }
      }
   }
}

