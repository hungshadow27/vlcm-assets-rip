package com.tgame.moudels.shenxingbaibian.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.shenxingbaibian.model.ShenXingBaiBian_MsgSenderProxy;
   import com.tgame.moudels.shenxingbaibian.model.info.ShenXingBaiBianVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ShenXingBaiBian_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "ShenXingBaiBian_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:ShenXingBaiBian_MsgSenderProxy;
      
      public function ShenXingBaiBian_TargetMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : ShenXingBaiBian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ShenXingBaiBian_MsgSenderProxy.NAME) as ShenXingBaiBian_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.SHENXINGBAIBIAN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.SHENXINGBAIBIAN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_72321([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:ShenXingBaiBianVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showShenXingBaiBian();
         this.targetArrtibutePlane.setShenXingBaiBianInit(param2);
         this.targetArrtibutePlane.setShenXingBaiBianEnableFun();
      }
   }
}

