package com.tgame.moudels.tianMenZhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianMenZhen.model.TianMenZhen_MsgSenderProxy;
   import com.tgame.moudels.tianMenZhen.model.info.TianMenZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianMenZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "TianMenZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:TianMenZhen_MsgSenderProxy;
      
      public function TianMenZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianMenZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianMenZhen_MsgSenderProxy.NAME) as TianMenZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.TIANMENZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.TIANMENZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70101([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:TianMenZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showTianMenZhen();
         this.targetArrtibutePlane.setTianMenZhenInitialize(param2);
         this.targetArrtibutePlane.setTianMenZhenEnableFun();
         this.targetArrtibutePlane.setTianMenZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.set_TianMenZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

