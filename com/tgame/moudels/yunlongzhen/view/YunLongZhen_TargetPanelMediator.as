package com.tgame.moudels.yunlongzhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yunlongzhen.model.YunLongZhen_MsgSenderProxy;
   import com.tgame.moudels.yunlongzhen.model.info.YunLongZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YunLongZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "YunLongZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:YunLongZhen_MsgSenderProxy;
      
      public function YunLongZhen_TargetPanelMediator()
      {
         super(NAME);
      }
      
      private function get senderProxy() : YunLongZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YunLongZhen_MsgSenderProxy.NAME) as YunLongZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.YUNLONGZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YUNLONGZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_71151([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:YunLongZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYunLongZhen();
         this.targetArrtibutePlane.setYunLongZhenInitialize(param2);
         this.targetArrtibutePlane.setYunLongZhenEnableFun();
         this.targetArrtibutePlane.setYunLongZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.set_YunLongZhen(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

