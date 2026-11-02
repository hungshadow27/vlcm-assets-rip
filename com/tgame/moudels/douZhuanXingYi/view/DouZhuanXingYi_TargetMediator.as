package com.tgame.moudels.douZhuanXingYi.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.douZhuanXingYi.model.DouZhuanXingYi_MsgSenderProxy;
   import com.tgame.moudels.douZhuanXingYi.model.info.DouZhuanXingYiVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class DouZhuanXingYi_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "DouZhuanXingYi_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:DouZhuanXingYi_MsgSenderProxy;
      
      public function DouZhuanXingYi_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : DouZhuanXingYi_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(DouZhuanXingYi_MsgSenderProxy.NAME) as DouZhuanXingYi_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.DOUZHUANXINGYI,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.DOUZHUANXINGYI,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_61301([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:DouZhuanXingYiVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showDouZhuanXingYi();
         this.targetArrtibutePlane.setDouZhuanXingYiInit(param2);
         this.targetArrtibutePlane.setDouZhuanXingYiEnableFun();
         var _loc3_:Array = [];
         this.targetArrtibutePlane.setDouzhuangxingyiZhuangbei(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

