package com.tgame.moudels.molingzhiyi.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.molingzhiyi.model.MoLingZhiYi_MsgSenderProxy;
   import com.tgame.moudels.molingzhiyi.model.info.MoLingZhiYiVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class MoLingZhiYi_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "MoLingZhiYi_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:MoLingZhiYi_MsgSenderProxy;
      
      public function MoLingZhiYi_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : MoLingZhiYi_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(MoLingZhiYi_MsgSenderProxy.NAME) as MoLingZhiYi_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.MOLINGZHIYI,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.MOLINGZHIYI,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_73581([GameInstance.lookPlayerID,0]);
      }
      
      public function setMoLingZhiYi(param1:MoLingZhiYiVO) : void
      {
         this.targetArrtibutePlane.showMoLingZhiYi();
         this.targetArrtibutePlane.setYunInitializeMoLingZhiYi(param1);
         this.targetArrtibutePlane.setMoLingZhiYiEnabledFun();
      }
   }
}

