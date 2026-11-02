package com.tgame.moudels.xiaoyaoyufeng.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.xiaoyaoyufeng.model.XiaoYaoYuFeng_MsgSenderProxy;
   import com.tgame.moudels.xiaoyaoyufeng.model.info.XiaoYaoYuFengVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class XiaoYaoYuFeng_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "XiaoYaoYuFeng_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:XiaoYaoYuFeng_MsgSenderProxy;
      
      public function XiaoYaoYuFeng_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : XiaoYaoYuFeng_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(XiaoYaoYuFeng_MsgSenderProxy.NAME) as XiaoYaoYuFeng_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.XIAOYAOYUFENG,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.XIAOYAOYUFENG,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70001([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:XiaoYaoYuFengVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showXiaoYaoYuFeng();
         this.targetArrtibutePlane.setXiaoYaoYuFengInit(param2);
         this.targetArrtibutePlane.setXiaoYaoYuFengEnableFun();
      }
   }
}

