package com.tgame.moudels.kongmingquan.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.kongmingquan.model.KongMingQuan_MsgSenderProxy;
   import com.tgame.moudels.kongmingquan.model.info.KongMingQuanVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class KongMingQuan_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "KongMingQuan_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:KongMingQuan_MsgSenderProxy;
      
      public function KongMingQuan_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : KongMingQuan_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(KongMingQuan_MsgSenderProxy.NAME) as KongMingQuan_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.KONGMINGQUAN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.KONGMINGQUAN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_74341([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:KongMingQuanVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showKongMingQuan();
         this.targetArrtibutePlane.setKongMingQuanInit(param2);
         this.targetArrtibutePlane.setKongMingQuanEnableFun();
      }
   }
}

