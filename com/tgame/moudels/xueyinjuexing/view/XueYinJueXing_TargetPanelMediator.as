package com.tgame.moudels.xueyinjuexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xueyinjuexing.model.XueYinJueXing_MsgSenderProxy;
   import com.tgame.moudels.xueyinjuexing.model.info.XueYinJueXingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XueYinJueXing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "XueYinJueXing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XueYinJueXing_MsgSenderProxy;
      
      public function XueYinJueXing_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : XueYinJueXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XueYinJueXing_MsgSenderProxy.NAME) as XueYinJueXing_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XUEYINJUEXING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XUEYINJUEXING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_74371([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:XueYinJueXingVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXueYinJueXing();
         this.targetArrtibutePlane.setXueYinJueXingInit(param2);
         this.targetArrtibutePlane.setXueYinJueXingEnableFun();
         this.targetArrtibutePlane.set_XueYinJueXing(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

