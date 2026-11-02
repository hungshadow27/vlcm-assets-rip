package com.tgame.moudels.fuWenKeHua.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.fuWenKeHua.model.FuWenKeHua_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class FuWenKeHua_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "FuWenKeHua_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:FuWenKeHua_MsgSenderProxy;
      
      public function FuWenKeHua_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : FuWenKeHua_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(FuWenKeHua_MsgSenderProxy.NAME) as FuWenKeHua_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.FUWENKEHUA,tragetAttributeHandler);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK,tragetAttributeHandler);
            targetArrtibutePlane.addEventListener(TargetAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.FUWENKEHUA,tragetAttributeHandler);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK,tragetAttributeHandler);
            targetArrtibutePlane.removeEventListener(TargetAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         var _loc2_:BaseEvent = param1 as BaseEvent;
         switch(param1.type)
         {
            case TargetAttribute.FUWENKEHUA:
               this.senderProxy.send_78421([GameInstance.lookPlayerID,0]);
               break;
            case TargetAttribute.UI_FUWENKEHUA_PAGE_CLICK:
               this.senderProxy.send_78421([GameInstance.lookPlayerID,_loc2_.data as int]);
               break;
            case TargetAttribute.UI_FUWENKEHUA_FUWENXINXI_CLICK:
               this.senderProxy.send_78423([GameInstance.lookPlayerID,_loc2_.data as int]);
         }
      }
      
      public function upDataPanel(param1:int, param2:int, param3:int, param4:Array, param5:int, param6:int, param7:int) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showFuWenKeHua();
         this.targetArrtibutePlane.initFuWenKeHuaPanel(param2,param3,param4,param5,param6,param7);
         this.targetArrtibutePlane.setFuWenKeHuaEnableFun();
      }
      
      public function setFuWenData(param1:int, param2:int, param3:String, param4:String, param5:int, param6:Boolean, param7:Boolean, param8:int, param9:int = 0) : void
      {
         this.targetArrtibutePlane.setFuWenData(param1,param2,param3,param4,param5,param6,param7,param8,param9);
      }
   }
}

