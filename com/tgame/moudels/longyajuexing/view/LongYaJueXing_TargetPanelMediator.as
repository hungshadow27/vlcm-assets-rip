package com.tgame.moudels.longyajuexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.longyajuexing.model.LongYaJueXing_MsgSenderProxy;
   import com.tgame.moudels.longyajuexing.model.info.LongYaJueXingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LongYaJueXing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "LongYaJueXing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:LongYaJueXing_MsgSenderProxy;
      
      public function LongYaJueXing_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : LongYaJueXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(LongYaJueXing_MsgSenderProxy.NAME) as LongYaJueXing_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
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
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.LONGYAJUEXING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.LONGYAJUEXING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71901([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:LongYaJueXingVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showLongYaJueXing();
         this.targetArrtibutePlane.setLongYaJueXingInit(param2);
         this.targetArrtibutePlane.setLongYaJueXingEnableFun();
      }
   }
}

