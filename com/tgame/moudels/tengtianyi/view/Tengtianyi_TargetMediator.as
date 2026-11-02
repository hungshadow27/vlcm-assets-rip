package com.tgame.moudels.tengtianyi.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tengtianyi.model.Tengtianyi_MsgSenderProxy;
   import com.tgame.moudels.tengtianyi.model.info.TengtianyiVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Tengtianyi_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "Tengtianyi_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:Tengtianyi_MsgSenderProxy;
      
      public function Tengtianyi_TargetMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : Tengtianyi_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(Tengtianyi_MsgSenderProxy.NAME) as Tengtianyi_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.TENGTIANYI,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.TENGTIANYI,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_81681([GameInstance.lookPlayerID,0]);
      }
      
      public function setTengtianyi(param1:TengtianyiVo) : void
      {
         this.targetArrtibutePlane.showTengtianyi();
         this.targetArrtibutePlane.setYunInitializeTengtianyi(param1);
         this.targetArrtibutePlane.setTengtianyiEnabledFun();
      }
   }
}

