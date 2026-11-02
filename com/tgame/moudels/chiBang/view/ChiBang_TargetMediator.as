package com.tgame.moudels.chiBang.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.chiBang.model.ChiBang_MsgSenderProxy;
   import com.tgame.moudels.chiBang.model.info.ChiBangVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChiBang_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "ChiBang_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:ChiBang_MsgSenderProxy;
      
      public function ChiBang_TargetMediator()
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : ChiBang_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(ChiBang_MsgSenderProxy.NAME) as ChiBang_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.CHIBANG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.CHIBANG,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_61701([GameInstance.lookPlayerID,0]);
      }
      
      public function setChiBang(param1:ChiBangVo) : void
      {
         this.targetArrtibutePlane.showChiBang();
         this.targetArrtibutePlane.setYunInitializeChiBang(param1);
         this.targetArrtibutePlane.setChiBangEnabledFun();
         this.targetArrtibutePlane.setChiBangJiHuo(GameState.dictTargetStatus[40702]);
      }
   }
}

