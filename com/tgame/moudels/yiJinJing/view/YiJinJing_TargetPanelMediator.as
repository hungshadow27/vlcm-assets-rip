package com.tgame.moudels.yiJinJing.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yiJinJing.model.YiJinJing_MsgSenderProxy;
   import com.tgame.moudels.yiJinJing.model.info.YiJinJingVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YiJinJing_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "YiJinJing_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:YiJinJing_MsgSenderProxy;
      
      public function YiJinJing_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : YiJinJing_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YiJinJing_MsgSenderProxy.NAME) as YiJinJing_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.YIJINJING,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YIJINJING,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_51957(GameInstance.lookPlayerID);
      }
      
      public function upDataPanel(param1:int, param2:YiJinJingVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYiJinJing();
         this.targetArrtibutePlane.setYiJinJingEnabledFunJ();
         this.targetArrtibutePlane.initilizeYiJinJingUI(param2);
         this.targetArrtibutePlane.set_YiJinJing(GameInstance.lookPlayerData.goodsInfo.goodsBagArr);
      }
   }
}

