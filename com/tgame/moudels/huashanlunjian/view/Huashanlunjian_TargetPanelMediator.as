package com.tgame.moudels.huashanlunjian.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.huashanlunjian.model.Huashanlunjian_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class Huashanlunjian_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "Huashanlunjian_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:Huashanlunjian_MsgSenderProxy;
      
      public function Huashanlunjian_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : Huashanlunjian_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(Huashanlunjian_MsgSenderProxy.NAME) as Huashanlunjian_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.HUASHANLUNJIAN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.HUASHANLUNJIAN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_74421([GameInstance.lookPlayerID,0]);
      }
      
      public function setInit(param1:Object, param2:int, param3:int, param4:String, param5:String, param6:String) : void
      {
         GameInstance.uiInstance.targetAttribute.showHuashanlunjian();
         this.targetArrtibutePlane.setHuashanlunjianInit(this.lookPlayerID,param1,param2,param3,param4,param5,param6);
         this.targetArrtibutePlane.setHuashanlunjianEnableFun();
         this.targetArrtibutePlane.set_HuaShanLunJian(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

