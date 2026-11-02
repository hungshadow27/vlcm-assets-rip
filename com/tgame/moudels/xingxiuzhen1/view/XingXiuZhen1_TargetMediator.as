package com.tgame.moudels.xingxiuzhen1.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xingxiuzhen1.model.XingXiuZhen1_MsgSenderProxy;
   import com.tgame.moudels.xingxiuzhen1.model.info.XingXiuZhen1Vo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XingXiuZhen1_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "XingXiuZhen1_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XingXiuZhen1_MsgSenderProxy;
      
      public function XingXiuZhen1_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XingXiuZhen1_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XingXiuZhen1_MsgSenderProxy.NAME) as XingXiuZhen1_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XINGXIUZHEN1,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XINGXIUZHEN1,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_82221([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:XingXiuZhen1Vo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXingXiuZhen1();
         this.targetArrtibutePlane.setXingXiuZhen1Init(param2);
         this.targetArrtibutePlane.setXingXiuZhen1EnableFun();
         this.targetArrtibutePlane.set_XingXiuZhen1(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

