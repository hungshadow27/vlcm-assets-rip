package com.tgame.moudels.hutaozhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.hutaozhen.model.HuTaoZhen_MsgSenderProxy;
   import com.tgame.moudels.hutaozhen.model.info.HuTaoZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class HuTaoZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "HuTaoZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:HuTaoZhen_MsgSenderProxy;
      
      public function HuTaoZhen_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : HuTaoZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(HuTaoZhen_MsgSenderProxy.NAME) as HuTaoZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.HUTAOZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.HUTAOZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71101([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:HuTaoZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showHuTaoZhen();
         this.targetArrtibutePlane.setHuTaoZhenInitialize(param2);
         this.targetArrtibutePlane.setHuTaoZhenEnableFun();
         this.targetArrtibutePlane.setHuTaoZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.set_HuTaoZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

