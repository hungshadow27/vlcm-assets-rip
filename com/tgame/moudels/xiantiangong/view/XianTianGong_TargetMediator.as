package com.tgame.moudels.xiantiangong.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiantiangong.model.XianTianGong_MsgSenderProxy;
   import com.tgame.moudels.xiantiangong.model.info.XianTianGongVo;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XianTianGong_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "XianTianGong_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XianTianGong_MsgSenderProxy;
      
      public function XianTianGong_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XianTianGong_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XianTianGong_MsgSenderProxy.NAME) as XianTianGong_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XIANTIANGONG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XIANTIANGONG,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71201([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:XianTianGongVo) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXianTianGong();
         this.targetArrtibutePlane.setXianTianGongInit(param2);
         this.targetArrtibutePlane.setXianTianGongEnableFun();
         this.targetArrtibutePlane.set_XianTianGong(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

