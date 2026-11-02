package com.tgame.moudels.dizaizhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.dizaizhen.model.DiZaiZhen_MsgSenderProxy;
   import com.tgame.moudels.dizaizhen.model.info.DiZaiZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DiZaiZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "DiZaiZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:DiZaiZhen_MsgSenderProxy;
      
      public function DiZaiZhen_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : DiZaiZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DiZaiZhen_MsgSenderProxy.NAME) as DiZaiZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.DIZAIZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.DIZAIZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71701([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:DiZaiZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showDiZaiZhen();
         this.targetArrtibutePlane.setDiZaiZhenInitialize(param2);
         this.targetArrtibutePlane.setDiZaiZhenEnableFun();
         this.targetArrtibutePlane.setDiZaiZhenPingBi(param2.isShow);
      }
   }
}

