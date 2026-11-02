package com.tgame.moudels.tianfuzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.tianfuzhen.model.TianFuZhen_MsgSenderProxy;
   import com.tgame.moudels.tianfuzhen.model.info.TianFuZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhenConst;
   import com.tgame.shell.view.components.attribute.tianfuzhen.TianFuZhenTargetController;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class TianFuZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "TianFuZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:TianFuZhen_MsgSenderProxy;
      
      public function TianFuZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : TianFuZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(TianFuZhen_MsgSenderProxy.NAME) as TianFuZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TianFuZhenConst.TARGET_TIANFUZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TianFuZhenConst.TARGET_TIANFUZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71451([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:TianFuZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         TianFuZhenTargetController.instance.showTianFuZhen();
         TianFuZhenTargetController.instance.setTianFuZhenInitialize(param2);
         TianFuZhenTargetController.instance.setTianFuZhenEnableFun();
         TianFuZhenTargetController.instance.setTianFuZhenPingBi(param2.isShow);
      }
   }
}

