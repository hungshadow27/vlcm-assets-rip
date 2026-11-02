package com.tgame.moudels.qingdieshuangren.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.qingdieshuangren.model.QingDieShuangRen_MsgSenderProxy;
   import com.tgame.moudels.qingdieshuangren.model.info.QingDieShuangRenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class QingDieShuangRen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "QingDieShuangRen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var vo:QingDieShuangRenVO;
      
      private var _senderProxy:QingDieShuangRen_MsgSenderProxy;
      
      public function QingDieShuangRen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : QingDieShuangRen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(QingDieShuangRen_MsgSenderProxy.NAME) as QingDieShuangRen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.QINGDIESHUANGREN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.QINGDIESHUANGREN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_79531([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataQingDieShuangRenPanel(param1:QingDieShuangRenVO) : void
      {
         this.vo = param1;
         this.targetArrtibutePlane.showQingDieShuangRen();
         this.targetArrtibutePlane.initializateQingDieShuangRen(this.vo);
         this.targetArrtibutePlane.setQingDieShuangRenEnabledFun();
      }
   }
}

