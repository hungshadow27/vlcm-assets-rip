package com.tgame.moudels.xiakexing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiakexing.model.XiaKeXing_MsgSenderProxy;
   import com.tgame.moudels.xiakexing.model.info.XiaKeXingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiaKeXing_TargetMediator extends Mediator
   {
      
      public static const NAME:String = "XiaKeXing_TargetMediator";
      
      private var lookPlayerID:int;
      
      private var curZF:int;
      
      private var _senderProxy:XiaKeXing_MsgSenderProxy;
      
      public function XiaKeXing_TargetMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiaKeXing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiaKeXing_MsgSenderProxy.NAME) as XiaKeXing_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XIAKEXING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XIAKEXING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_73561([GameInstance.lookPlayerID,0]);
      }
      
      public function setPanel(param1:int, param2:XiaKeXingVO, param3:Array) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXiaKeXing();
         this.targetArrtibutePlane.setXiaKeXingInit(param2,param3);
         this.targetArrtibutePlane.setXiaKeXingEnableFun();
      }
   }
}

