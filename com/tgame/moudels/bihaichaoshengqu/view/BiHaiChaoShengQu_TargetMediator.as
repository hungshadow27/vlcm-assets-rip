package com.tgame.moudels.bihaichaoshengqu.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.bihaichaoshengqu.model.BiHaiChaoShengQu_MsgSenderProxy;
   import com.tgame.moudels.bihaichaoshengqu.model.info.BiHaiChaoShengQuVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class BiHaiChaoShengQu_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "BiHaiChaoShengQu_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:BiHaiChaoShengQu_MsgSenderProxy;
      
      public function BiHaiChaoShengQu_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : BiHaiChaoShengQu_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(BiHaiChaoShengQu_MsgSenderProxy.NAME) as BiHaiChaoShengQu_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.BIHAICHAOSHENGQU,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.BIHAICHAOSHENGQU,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70151([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:BiHaiChaoShengQuVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showBiHaiChaoShengQu();
         this.targetArrtibutePlane.setBiHaiChaoShengQuInit(param2);
         this.targetArrtibutePlane.setBiHaiChaoShengQuEnableFun();
         this.targetArrtibutePlane.set_BiHaiChaoShengQu(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

