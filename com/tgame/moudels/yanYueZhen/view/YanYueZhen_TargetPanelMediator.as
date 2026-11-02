package com.tgame.moudels.yanYueZhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yanYueZhen.model.YanYueZhen_MsgSenderProxy;
   import com.tgame.moudels.yanYueZhen.model.info.YanYueZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YanYueZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "YanYueZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:YanYueZhen_MsgSenderProxy;
      
      public function YanYueZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : YanYueZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YanYueZhen_MsgSenderProxy.NAME) as YanYueZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.YANYUEZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YANYUEZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70351([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:YanYueZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYanYueZhen();
         this.targetArrtibutePlane.setYanYueZhenInitialize(param2);
         this.targetArrtibutePlane.setYanYueZhenEnableFun();
         this.targetArrtibutePlane.setYanYueZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.set_YanYueZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

