package com.tgame.moudels.jueZhanGuangMingDing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.jueZhanGuangMingDing.model.JueZhanGuangMingDing_MsgSenderProxy;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class JueZhanGuangMingDing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "JueZhanGuangMingDing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:JueZhanGuangMingDing_MsgSenderProxy;
      
      public function JueZhanGuangMingDing_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : JueZhanGuangMingDing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(JueZhanGuangMingDing_MsgSenderProxy.NAME) as JueZhanGuangMingDing_MsgSenderProxy;
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
      }
      
      override public function onRegister() : void
      {
         this.initEvents();
      }
      
      private function initEvents() : void
      {
         UIEventsRegisterManager.addUIRegisterEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.addEventListener(TargetAttribute.JUEZHANGUANGMINGDING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.JUEZHANGUANGMINGDING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70701(GameInstance.lookPlayerID);
      }
      
      public function upDataPanel(param1:int, param2:Object) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showJueZhanGuangMingDing();
         this.targetArrtibutePlane.setJueZhanGuangMingDingInit(param2);
         this.targetArrtibutePlane.setJueZhanGuangMingDingEnableFun();
         this.targetArrtibutePlane.set_JueZhanGuangMingDing(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

