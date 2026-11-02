package com.tgame.moudels.bangpairongyutarget.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.bangpairongyutarget.model.BangPaiRongYuTarget_MsgSenderProxy;
   import com.tgame.shell.view.components.party.BangPaiRongYuTargetPanel;
   import com.zcp.common.events.BaseEvent;
   import flash.events.Event;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BangPaiRongYuTarget_Mediator extends Mediator
   {
      
      public static const NAME:String = "BangPaiRongYuTarget_Mediator";
      
      private var _senderProxy:BangPaiRongYuTarget_MsgSenderProxy;
      
      public function BangPaiRongYuTarget_Mediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : BangPaiRongYuTarget_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BangPaiRongYuTarget_MsgSenderProxy.NAME) as BangPaiRongYuTarget_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get panel() : BangPaiRongYuTargetPanel
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.rongYuTargetPanel);
         }
         return viewComponent as BangPaiRongYuTargetPanel;
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
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(BangPaiRongYuTargetPanel,function():void
         {
            panel.addEventListener(Event.ADDED_TO_STAGE,handler);
            panel.addEventListener(BangPaiRongYuTargetPanel.UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK,handler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(BangPaiRongYuTargetPanel,function():void
         {
            panel.removeEventListener(BangPaiRongYuTargetPanel.UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK,handler);
         });
      }
      
      private function handler(param1:Event) : void
      {
         var _loc2_:BaseEvent = null;
         var _loc3_:Array = null;
         _loc2_ = param1 as BaseEvent;
         switch(param1.type)
         {
            case Event.ADDED_TO_STAGE:
               break;
            case BangPaiRongYuTargetPanel.UI_PARTYFLAGPANEL_RONGYU_CHENGCHI_CLICK:
               _loc3_ = _loc2_.data as Array;
               this.senderProxy.send_71023(_loc3_);
         }
      }
      
      public function chengchixinxi(param1:Object) : void
      {
         GameInstance.uiInstance.banghuiInfoPanel.setChengchi(param1);
      }
   }
}

