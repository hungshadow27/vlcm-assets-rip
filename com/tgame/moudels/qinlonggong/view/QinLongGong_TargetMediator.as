package com.tgame.moudels.qinlonggong.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qinlonggong.model.QinLongGong_MsgSenderProxy;
   import com.tgame.moudels.qinlonggong.model.info.QinLongGongVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QinLongGong_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "QinLongGong_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:QinLongGong_MsgSenderProxy;
      
      public function QinLongGong_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : QinLongGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QinLongGong_MsgSenderProxy.NAME) as QinLongGong_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.QINLONGGONG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.QINLONGGONG,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_61841([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:QinLongGongVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showQinLongGong();
         this.targetArrtibutePlane.setQinLongGongInit(param2);
         this.targetArrtibutePlane.setQinLongGongEnableFun();
         this.targetArrtibutePlane.qinLongGongJiHuo(GameState.dictTargetStatus[40636]);
         this.targetArrtibutePlane.set_QinLongGong(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

