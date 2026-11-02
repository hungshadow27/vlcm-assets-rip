package com.tgame.moudels.yanXingZhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yanXingZhen.model.YanXingZhen_MsgSenderProxy;
   import com.tgame.moudels.yanXingZhen.model.info.YanXingZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YanXingZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "YanXingZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:YanXingZhen_MsgSenderProxy;
      
      public function YanXingZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : YanXingZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YanXingZhen_MsgSenderProxy.NAME) as YanXingZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.YANXINGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YANXINGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70801([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:YanXingZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYanXingZhen();
         this.targetArrtibutePlane.setYanXingZhenInitialize(param2);
         this.targetArrtibutePlane.setYanXingZhenEnableFun();
         this.targetArrtibutePlane.setYanXingZhenPingBi(param2.isShow);
      }
   }
}

