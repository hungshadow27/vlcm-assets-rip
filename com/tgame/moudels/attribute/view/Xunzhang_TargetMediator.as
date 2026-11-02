package com.tgame.moudels.attribute.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.attribute.model.Attribute_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Xunzhang_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "Xunzhang_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _attribute_TargetCharAttributePlaneMediator:Attribute_TargetCharAttributePlaneMediator;
      
      private var _senderProxy:Attribute_MsgSenderProxy;
      
      public function Xunzhang_TargetMediator()
      {
         super(NAME);
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
      
      private function get senderProxy() : Attribute_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Attribute_MsgSenderProxy.NAME) as Attribute_MsgSenderProxy;
         }
         return this._senderProxy;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.addEventListener(TargetAttribute.GETWULIZHI,targetCharArrtibutePlaneBtnEvent);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetCharArrtibutePlane.removeEventListener(TargetAttribute.GETWULIZHI,targetCharArrtibutePlaneBtnEvent);
         });
      }
      
      private function targetCharArrtibutePlaneBtnEvent(param1:*) : void
      {
         switch(param1.type)
         {
            case TargetAttribute.GETWULIZHI:
               if(GameInstance.lookPlayerID == -1)
               {
                  return;
               }
               this.setShowItem(this.attribute_TargetCharAttributePlaneMediator._target.goodsInfo.goodsBagArr);
               this.lookPlayerID = GameInstance.lookPlayerID;
               this.senderProxy.send_53813(this.lookPlayerID);
               this.targetCharArrtibutePlane.showWulizhi();
         }
      }
      
      public function setShowItem(param1:Array) : void
      {
         this.targetCharArrtibutePlane.setWuliItems(param1);
      }
      
      public function setTotalXunzhang(param1:Boolean, param2:int, param3:int, param4:int, param5:int, param6:int, param7:int, param8:int) : void
      {
         this.targetCharArrtibutePlane.setTotalXunzhang(param1,param2,param3,param4,param5,param6,param7,param8);
      }
      
      public function setXunZhangZuoQi(param1:Boolean) : void
      {
         this.targetCharArrtibutePlane.setXunZhangZuoQi(param1);
      }
   }
}

