package com.tgame.moudels.tulongdao.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tulongdao.model.TuLongDao_MsgSenderProxy;
   import com.tgame.moudels.tulongdao.model.info.TuLongDaoVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TuLongDao_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "TuLongDao_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var vo:TuLongDaoVO;
      
      private var _senderProxy:TuLongDao_MsgSenderProxy;
      
      public function TuLongDao_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TuLongDao_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TuLongDao_MsgSenderProxy.NAME) as TuLongDao_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.TULONGDAO,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.TULONGDAO,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_74751(GameInstance.lookPlayerID);
      }
      
      public function upDataTuLongDaoPanel(param1:TuLongDaoVO) : void
      {
         this.vo = param1;
         this.targetArrtibutePlane.showTuLongDao();
         this.targetArrtibutePlane.initializateTuLongDao(this.vo);
         this.targetArrtibutePlane.setTuLongDaoEnabledFun();
      }
   }
}

