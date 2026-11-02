package com.tgame.moudels.yuLiZhen.view
{
   import com.tgame.common.GameInstance;
   import com.tgame.common.GameState;
   import com.tgame.manager.UIEventsRegisterManager;
   import com.tgame.moudels.yuLiZhen.model.YuLiZhen_MsgSenderProxy;
   import com.tgame.moudels.yuLiZhen.model.info.YuLiZhenVO;
   import com.tgame.shell.view.components.TargetAttribute;
   import com.zcp.common.events.BaseEvent;
   import org.puremvc.as3.multicore.interfaces.INotification;
   import org.puremvc.as3.multicore.patterns.mediator.Mediator;
   
   public class YuLiZhen_TargetPanelMediator extends Mediator
   {
      
      public static const NAME:String = "YuLiZhen_TargetPanelMediator";
      
      private var lookPlayerID:int;
      
      private var _senderProxy:YuLiZhen_MsgSenderProxy;
      
      public function YuLiZhen_TargetPanelMediator(param1:String = null, param2:Object = null)
      {
         super(NAME);
      }
      
      private function get senderProxy() : YuLiZhen_MsgSenderProxy
      {
         if(this._senderProxy == null)
         {
            this._senderProxy = facade.retrieveProxy(YuLiZhen_MsgSenderProxy.NAME) as YuLiZhen_MsgSenderProxy;
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
            targetArrtibutePlane.addEventListener(TargetAttribute.YULIZHEN,tragetAttributeHandler);
         });
         UIEventsRegisterManager.addUIRemovedEvent(TargetAttribute,function():void
         {
            targetArrtibutePlane.removeEventListener(TargetAttribute.YULIZHEN,tragetAttributeHandler);
         });
      }
      
      private function tragetAttributeHandler(param1:BaseEvent) : void
      {
         this.lookPlayerID = GameInstance.lookPlayerID;
         this.senderProxy.send_70251([GameInstance.lookPlayerID,0]);
      }
      
      public function upDataPanel(param1:int, param2:YuLiZhenVO) : void
      {
         if(this.lookPlayerID != param1)
         {
            return;
         }
         this.targetArrtibutePlane.showYuLiZhen();
         this.targetArrtibutePlane.setYuLiZhenInitialize(param2);
         this.targetArrtibutePlane.setYuLiZhenEnableFun();
         this.targetArrtibutePlane.setYuLiZhenPingBi(param2.isShow);
         this.targetArrtibutePlane.setYuLiJiHuo(GameState.dictTargetStatus[40751]);
      }
   }
}

