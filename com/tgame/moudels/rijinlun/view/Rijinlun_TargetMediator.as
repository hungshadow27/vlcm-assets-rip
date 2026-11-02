package com.tgame.moudels.rijinlun.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.rijinlun.model.Rijinlun_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Rijinlun_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "Rijinlun_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:Rijinlun_MsgSenderProxy;
      
      public function Rijinlun_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Rijinlun_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Rijinlun_MsgSenderProxy.NAME) as Rijinlun_MsgSenderProxy;
         }
         return this._msgSenderProxy;
      }
      
      protected function get targetArrtibutePlane() : TargetAttribute
      {
         if(viewComponent == null)
         {
            setViewComponent(GameInstance.uiInstance.targetAttribute);
         }
         return viewComponent as TargetAttribute;
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.RIJINLUN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.RIJINLUN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_74321([GameInstance.lookPlayerID,0]);
      }
      
      public function setRijinlun(param1:int, param2:int, param3:int, param4:String, param5:String, param6:String, param7:int, param8:String) : void
      {
         this.targetArrtibutePlane.setRijinlunInitialize(param1,param2,param3,param4,param5,param6,param7,param8);
         this.targetArrtibutePlane.showRijinlun();
      }
   }
}

