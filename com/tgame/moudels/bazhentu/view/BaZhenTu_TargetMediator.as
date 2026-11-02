package com.tgame.moudels.bazhentu.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.bazhentu.model.BaZhenTu_MsgSenderProxy;
   import com.tgame.moudels.bazhentu.model.info.BaZhenTuVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BaZhenTu_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "BaZhenTu_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:BaZhenTu_MsgSenderProxy;
      
      public function BaZhenTu_TargetMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : BaZhenTu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BaZhenTu_MsgSenderProxy.NAME) as BaZhenTu_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.BAZHENTU,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.BAZHENTU,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73061([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:BaZhenTuVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showBaZhenTu();
         this.targetArrtibutePlane.setBaZhenTuInit(param2);
         this.targetArrtibutePlane.setBaZhenTuEnableFun();
         this.targetArrtibutePlane.set_BaZhenTu(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

