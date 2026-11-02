package com.tgame.moudels.fengyangzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fengyangzhen.model.FengYangZhen_MsgSenderProxy;
   import com.tgame.moudels.fengyangzhen.model.info.FengYangZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FengYangZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "FengYangZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:FengYangZhen_MsgSenderProxy;
      
      public function FengYangZhen_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : FengYangZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(FengYangZhen_MsgSenderProxy.NAME) as FengYangZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.FENGYANGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.FENGYANGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71751([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:FengYangZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showFengYangZhen();
         this.targetArrtibutePlane.setFengYangZhenInitialize(param2);
         this.targetArrtibutePlane.setFengYangZhenEnableFun();
         this.targetArrtibutePlane.setFengYangZhenPingBi(param2.isShow);
      }
   }
}

