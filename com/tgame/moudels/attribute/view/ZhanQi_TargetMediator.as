package com.tgame.moudels.attribute.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ZhanQi_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "ZhanQi_TargetMediator";
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      private var _attribute_TargetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      public function ZhanQi_TargetMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : Attribute_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Attribute_MsgSenderProxy.NAME) as Attribute_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      protected function get targetCharArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      private function get attribute_TargetCharAttributePlaneMediator() : Attribute_TargetCharAttributePlaneMediator
      {
         if(this._attribute_TargetCharAttributePlaneMediator == null)
         {
            this._attribute_TargetCharAttributePlaneMediator = facade.retrieveMediator(Attribute_TargetCharAttributePlaneMediator.NAME) as Attribute_TargetCharAttributePlaneMediator;
         }
         return this._attribute_TargetCharAttributePlaneMediator;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GETZHANQI,targetCharArrtibutePlaneBtnEvent);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GETZHANQI,targetCharArrtibutePlaneBtnEvent);
         });
      }
      
      private function targetCharArrtibutePlaneBtnEvent(param1:*) : void
      {
         switch(param1.type)
         {
            case TargetAttribute.GETZHANQI:
               if(GameInstance.lookPlayerID == -1)
               {
                  return;
               }
               this.setShowItem(this.attribute_TargetCharAttributePlaneMediator._target.goodsInfo.goodsBagArr);
               this.targetCharArrtibutePlane.showZhanQi();
               this.setTotalZhanQi();
               this.senderProxy.send_57501(GameInstance.lookPlayerID);
         }
      }
      
      public function setShowItem(param1:Array) : void
      {
         this.targetCharArrtibutePlane.setZhanqiItems(param1);
      }
      
      public function setTotalZhanQi() : void
      {
         this.targetCharArrtibutePlane.setTotalZhanQi(GameState.dictTargetStatus[40626]);
      }
      
      public function isHuanZ(param1:Boolean) : void
      {
         this.targetCharArrtibutePlane.setZhanQiHuanZ(param1);
      }
   }
}

