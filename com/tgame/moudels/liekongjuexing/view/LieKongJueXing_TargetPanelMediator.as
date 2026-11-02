package com.tgame.moudels.liekongjuexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.liekongjuexing.model.LieKongJueXing_MsgSenderProxy;
   import com.tgame.moudels.liekongjuexing.model.info.LieKongJueXingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class LieKongJueXing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "LieKongJueXing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:LieKongJueXing_MsgSenderProxy;
      
      public function LieKongJueXing_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : LieKongJueXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(LieKongJueXing_MsgSenderProxy.NAME) as LieKongJueXing_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.LIEKONGJUEXING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.LIEKONGJUEXING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73731([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:LieKongJueXingVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showLieKongJueXing();
         this.targetArrtibutePlane.setLieKongJueXingInit(param2);
         this.targetArrtibutePlane.setLieKongJueXingEnableFun();
      }
   }
}

