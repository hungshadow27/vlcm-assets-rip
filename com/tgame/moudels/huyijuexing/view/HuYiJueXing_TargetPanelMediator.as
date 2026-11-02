package com.tgame.moudels.huyijuexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.huyijuexing.model.HuYiJueXing_MsgSenderProxy;
   import com.tgame.moudels.huyijuexing.model.info.HuYiJueXingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuYiJueXing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "HuYiJueXing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:HuYiJueXing_MsgSenderProxy;
      
      public function HuYiJueXing_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : HuYiJueXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HuYiJueXing_MsgSenderProxy.NAME) as HuYiJueXing_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.HUYIJUEXING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.HUYIJUEXING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71401([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:HuYiJueXingVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showHuYiJueXing();
         this.targetArrtibutePlane.setHuYiJueXingInit(param2);
         this.targetArrtibutePlane.setHuYiJueXingEnableFun();
      }
   }
}

