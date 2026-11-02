package com.tgame.moudels.emozhiyi.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.emozhiyi.model.EMoZhiYi_MsgSenderProxy;
   import com.tgame.moudels.emozhiyi.model.info.EMoZhiYiVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class EMoZhiYi_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "EMoZhiYi_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _msgSenderProxy:EMoZhiYi_MsgSenderProxy;
      
      public function EMoZhiYi_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get msgSenderProxy() : EMoZhiYi_MsgSenderProxy
      {
         if(!this._msgSenderProxy)
         {
            this._msgSenderProxy = facade.retrieveProxy(EMoZhiYi_MsgSenderProxy.NAME) as EMoZhiYi_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.EMOZHIYI,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.EMOZHIYI,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.msgSenderProxy.send_70501([GameInstance.lookPlayerID,0]);
      }
      
      public function setEMoZhiYi(param1:EMoZhiYiVo) : void
      {
         this.targetArrtibutePlane.showEMoZhiYi();
         this.targetArrtibutePlane.setYunInitializeEMoZhiYi(param1);
         this.targetArrtibutePlane.setEMoZhiYiEnabledFun();
      }
   }
}

