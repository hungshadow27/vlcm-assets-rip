package com.tgame.moudels.changshengjue.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.changshengjue.model.ChangShengJue_MsgSenderProxy;
   import com.tgame.moudels.changshengjue.model.info.ChangShengJueVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class ChangShengJue_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "ChangShengJue_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:ChangShengJue_MsgSenderProxy;
      
      public function ChangShengJue_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : ChangShengJue_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(ChangShengJue_MsgSenderProxy.NAME) as ChangShengJue_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.CHANGSHENGJUE,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.CHANGSHENGJUE,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73151([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:ChangShengJueVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showchangshengjue();
         this.targetArrtibutePlane.setChangShengJueInit(param2);
         this.targetArrtibutePlane.setChangShengJueEnableFun();
         this.targetArrtibutePlane.set_ChangShengJue(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

