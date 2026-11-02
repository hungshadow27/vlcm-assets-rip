package com.tgame.moudels.pangxiezhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.pangxiezhen.model.PangXieZhen_MsgSenderProxy;
   import com.tgame.moudels.pangxiezhen.model.info.PangXieZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class PangXieZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "PangXieZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:PangXieZhen_MsgSenderProxy;
      
      public function PangXieZhen_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : PangXieZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(PangXieZhen_MsgSenderProxy.NAME) as PangXieZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.PANGXIEZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.PANGXIEZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71251([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:PangXieZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showPangXieZhen();
         this.targetArrtibutePlane.setPangXieZhenInitialize(param2);
         this.targetArrtibutePlane.setPangXieZhenEnableFun();
         this.targetArrtibutePlane.setPangXieZhenPingBi(param2.isShow);
      }
   }
}

